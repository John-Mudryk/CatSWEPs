ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Chem Grenade"
ENT.Author = "The Cat"
ENT.Spawnable = false
ENT.AdminSpawnable = true

-- Grenade properties
ENT.Model = "models/muschi/weapons/muschi_grenade_chim.mdl"
ENT.FuseTime = 5
ENT.Damage = 30
ENT.CloudDuration = 60
ENT.MaxCloudRadius = 300
ENT.CloudGrowthTime = 10
ENT.StickOnImpact = false
ENT.IsImpact = false

-- Chem effect properties
ENT.DamageIncreasePerTick = 1 -- Damage increases per tick
ENT.AccuracyReduction = 0.5 -- 50% accuracy reduction
ENT.TickRate = 1 -- Effect applied every second

util.AddNetworkString("StartChemEffect")
util.AddNetworkString("StopChemEffect")

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

local ActiveChemGrenades = {}

function ENT:Initialize()
    self:SetModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_NONE)
    self:SetRenderMode(RENDERMODE_NORMAL)

    self.ChemID = self:EntIndex()
    self.CurrentCloudRadius = 100 -- Initial radius
    self.AffectedEntities = {} -- Track affected entities

    self.DamageIncreasePerTick = self.Damage / 10

    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:SetMass(1)
        phys:Wake()
    end
end

function ENT:PhysicsCollide(data, phys)
    if data.Speed > 60 then
        self:EmitSound("physics/metal/metal_grenade_impact_hard" .. math.random(1, 3) .. ".wav")
    end

    if self.IsImpact and IsValid(self) then
        self:StartChemCloud()
    end

    -- Optional: Stick to surface
    if self.StickOnImpact then
        phys:EnableMotion(false)
        self:SetMoveType(MOVETYPE_NONE)
    end
end

function ENT:Think()
    -- Handle explosion timing
    if self.KaboomTime and CurTime() >= self.KaboomTime then
        self:StartChemCloud()
        self.KaboomTime = nil -- Prevent double-triggering
    end

    -- Water check for auto-removal
    if self:WaterLevel() > 0 then
        local effectdata = EffectData()
        effectdata:SetOrigin(self:GetPos())
        util.Effect("WaterSplash", effectdata)
        self:Remove()
    end
end

-- Wait for ground contact before starting the cloud
function ENT:FreezeOnGround()
    timer.Create("WaitForGround_" .. self:EntIndex(), 0.1, 0, function()
        if not IsValid(self) then
            timer.Remove("WaitForGround_" .. self:EntIndex())
            return
        end

        -- Perform a downward trace to detect the ground
        local trace = util.TraceLine({
            start = self:GetPos(),
            endpos = self:GetPos() - Vector(0, 0, 100),
            filter = self,
            mask = MASK_SOLID
        })

        if trace.Hit then
            -- Set position slightly above the ground to avoid clipping
            self:SetPos(trace.HitPos + Vector(0, 0, 1))

            -- Freeze grenade physics
            local phys = self:GetPhysicsObject()
            if IsValid(phys) then
                phys:EnableMotion(false)
                self:SetMoveType(MOVETYPE_NONE)
            end

            self:TriggerChemEffect(trace.HitPos)
            timer.Remove("WaitForGround_" .. self:EntIndex())
        end
    end)
end

-- Start the chemical cloud effect
function ENT:StartChemCloud()
    if self.ChemStarted then return end
    self.ChemStarted = true

    self.CloudEndTime = CurTime() + self.CloudDuration
    ActiveChemGrenades[self.ChemID] = self

    -- Wait for ground contact before starting the chemical effect
    self:FreezeOnGround()
end

-- Trigger the chemical cloud effect
function ENT:TriggerChemEffect(chemPos)
    self:EmitSound("weapons/smokegrenade/sg_explode.wav", 100, 100)

    net.Start("StartChemEffect")
    net.WriteUInt(self.ChemID, 16)
    net.WriteVector(chemPos)
    net.WriteFloat(self.CloudDuration)
    net.WriteFloat(self.MaxCloudRadius)
    net.Broadcast()

    -- Grow the cloud over time
    timer.Create("ChemGrow_" .. self.ChemID, 0.1, math.ceil(self.CloudGrowthTime / 0.1), function()
        if not IsValid(self) then return end
        local growthRate = self.MaxCloudRadius / (self.CloudGrowthTime / 0.1)
        self.CurrentCloudRadius = math.min(self.CurrentCloudRadius + growthRate, self.MaxCloudRadius)
    end)

    -- Apply damage and effects periodically
    timer.Create("ChemEffect_" .. self.ChemID, self.TickRate, 0, function()
        if not IsValid(self) then return end
        if CurTime() >= self.CloudEndTime then
            self:StopChemEffect()
            self:Remove()
            return
        end
        self:ApplyChemEffects()
    end)
end

-- Apply chemical effects to entities in the cloud
function ENT:ApplyChemEffects()
    for _, ent in pairs(ents.FindInSphere(self:GetPos(), self.CurrentCloudRadius)) do
        if ent:IsPlayer() or ent:IsNPC() then
            -- Initialize entity if it's the first time it's being affected
            if not self.AffectedEntities[ent] then
                self.AffectedEntities[ent] = { time = CurTime(), accumulatedDamage = 0 }
                self:ApplyDebuff(ent)
            end

            -- Calculate total damage (base damage + accumulated over time)
            local data = self.AffectedEntities[ent]
            data.accumulatedDamage = data.accumulatedDamage + self.DamageIncreasePerTick
            local totalDamage = self.Damage + data.accumulatedDamage

            -- Apply the calculated damage
            self:ApplyDamage(ent, totalDamage)
        end
    end

    -- Cleanup entities that left the cloud
    for ent, _ in pairs(self.AffectedEntities) do
        if not IsValid(ent) or ent:GetPos():Distance(self:GetPos()) > self.CurrentCloudRadius then
            self:RemoveDebuff(ent)
            self.AffectedEntities[ent] = nil
        end
    end
end

-- Apply damage over time
function ENT:ApplyDamage(ent, dmgAmount)
    local dmg = DamageInfo()
    dmg:SetDamage(dmgAmount)
    dmg:SetDamageType(DMG_ACID)
    dmg:SetAttacker(IsValid(self:GetOwner()) and self:GetOwner() or self)
    dmg:SetInflictor(self)
    ent:TakeDamageInfo(dmg)

    -- Initialize the entity's data if not set
    local data = self.AffectedEntities[ent]
    data.lastSoundTime = data.lastSoundTime or 0

    -- Define the sound and get its duration
    local soundPath = "ambient/levels/canals/toxic_slime_sizzle3.wav"
    local soundDuration = SoundDuration(soundPath)

    -- Only play the sound if the last one has finished
    if CurTime() >= (data.lastSoundTime + (soundDuration - 0.5)) then
        ent:EmitSound(soundPath, 70, 100)
        data.lastSoundTime = CurTime()
    end
end

-- Apply debuff (accuracy reduction for NPCs, slow for players)
function ENT:ApplyDebuff(ent)
    if ent:IsPlayer() then
        ent:SetWalkSpeed(ent:GetWalkSpeed() * 0.5)
        ent:SetRunSpeed(ent:GetRunSpeed() * 0.5)
    elseif ent:IsNPC() then
        if ent.IsVJBaseSNPC then
            ent.Accuracy = (ent.Accuracy or 1) * self.AccuracyReduction
        else
            ent:SetKeyValue("accuracy", tostring(ent:GetCurrentWeaponProficiency() * self.AccuracyReduction))
        end
    end
end

-- Remove debuff
function ENT:RemoveDebuff(ent)
    if not IsValid(ent) then return end

    if ent:IsPlayer() then
        ent:SetWalkSpeed(200)
        ent:SetRunSpeed(400)
    elseif ent:IsNPC() then
        if ent.IsVJBaseSNPC then
            ent.Accuracy = 1 -- Reset accuracy
        else
            -- Only reset accuracy if the entity and key are valid
            if IsValid(ent:GetActiveWeapon()) then
                ent:SetKeyValue("accuracy", "1")
            end
        end
    end
end


-- Stop the chemical effect
function ENT:StopChemEffect()
    net.Start("StopChemEffect")
    net.WriteUInt(self.ChemID, 16)
    net.Broadcast()

    timer.Remove("ChemEffect_" .. self.ChemID)
    timer.Remove("ChemGrow_" .. self.ChemID)

    -- Clean up affected entities
    for ent in pairs(self.AffectedEntities) do
        self:RemoveDebuff(ent)
    end

    ActiveChemGrenades[self.ChemID] = nil
end

-- Ensure cleanup on removal
function ENT:OnRemove()
    timer.Remove("WaitForGround_" .. self:EntIndex())
    self:StopChemEffect()
end
