ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Fire Grenade"
ENT.Author = "The Cat"
ENT.Spawnable = false
ENT.AdminSpawnable = true

-- Grenade properties
ENT.Model = "models/muschi/weapons/muschi_grenade_fire.mdl"
ENT.Damage = 25
ENT.FuseTime = 5
ENT.BurnDuration = 30
ENT.FireRadius = 250
ENT.TickRate = 0.5
ENT.IgniteTime = 10
ENT.StickOnImpact = false
ENT.IsImpact = false
ENT.LoopSound = "ambient/fire/fire_small_loop2.wav"

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

local ActiveFireGrenades = {}

function ENT:Initialize()
    self:SetModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_NONE)
    self:SetRenderMode(RENDERMODE_NORMAL)

    self.FireID = self:EntIndex()

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

    -- Trigger the fire cloud when impact happens
    if self.IsImpact and IsValid(self) then
        self:StartFire()
    end
end


function ENT:Think()
    if self.KaboomTime and CurTime() >= self.KaboomTime then
        self:StartFire()
        self.KaboomTime = nil
    end
end

function ENT:StartFire()
    -- Start fire effect after ground contact
    self:FreezeOnGround()
end

-- Wait for ground contact before starting fire
function ENT:FreezeOnGround()
    timer.Create("WaitForGround_" .. self:EntIndex(), 0.1, 0, function()
        if not IsValid(self) then
            timer.Remove("WaitForGround_" .. self:EntIndex())
            return
        end

        local trace = util.TraceLine({
            start = self:GetPos(),
            endpos = self:GetPos() - Vector(0, 0, 100),
            filter = self,
            mask = MASK_SOLID
        })

        if trace.Hit then
            self:SetPos(trace.HitPos + Vector(0, 0, 1))
            local phys = self:GetPhysicsObject()
            if IsValid(phys) then
                phys:EnableMotion(false)
                self:SetMoveType(MOVETYPE_NONE)
            end
            self:TriggerFireEffect(trace.HitPos)
            timer.Remove("WaitForGround_" .. self:EntIndex())
        end
    end)
end

-- Trigger the fire effect
function ENT:TriggerFireEffect(firePos)
    self:EmitSound("ambient/fire/ignite.wav", 100, 100)
    self:EmitSound(self.LoopSound, 75, 100, 1, CHAN_STATIC)

    self.FireEndTime = CurTime() + self.BurnDuration
    ActiveFireGrenades[self.FireID] = self
    self:SpawnFireEntities(firePos)

    -- Damage and effect logic
    timer.Create("FireEffect_" .. self.FireID, self.TickRate, 0, function()
        if not IsValid(self) then return end
        if CurTime() >= self.FireEndTime then
            self:StopFireEffect()
            self:Remove()
            return
        end
        self:ApplyFireEffects()
    end)
end


-- Spawn env_fire entities to fill the fire radius
function ENT:SpawnFireEntities(centerPos)
    self.Fires = {}
    
    -- Fire configuration
    local fireDensity = 35  -- Higher value = more fire spots
    local gridSpacing = self.FireRadius / math.sqrt(fireDensity)
    local fireSize = "8"  -- Reduced size for shorter flames

    for x = -self.FireRadius, self.FireRadius, gridSpacing do
        for y = -self.FireRadius, self.FireRadius, gridSpacing do
            local offset = Vector(x, y, 0)
            local distance = offset:Length()

            -- Only spawn within the circular radius
            if distance <= self.FireRadius then
                -- Random slight variation to avoid perfect grid look
                local randomOffset = VectorRand() * 15
                local firePos = centerPos + offset + randomOffset

                -- Trace downwards to ensure it's at ground level
                local trace = util.TraceLine({
                    start = firePos + Vector(0, 0, 16),
                    endpos = firePos - Vector(0, 0, 64),
                    filter = self,
                    mask = MASK_SOLID
                })

                if trace.Hit then
                    local groundPos = trace.HitPos + Vector(0, 0, 1)

                    -- Spawn the fire entity
                    local fire = ents.Create("env_fire")
                    if IsValid(fire) then
                        fire:SetPos(groundPos)
                        fire:SetKeyValue("health", tostring(self.BurnDuration)) -- Fire duration
                        fire:SetKeyValue("firesize", fireSize)                  -- Smaller fire size
                        fire:SetKeyValue("spawnflags", "130")                   -- Delete when out and disable smoke
                        fire:Spawn()
                        fire:Activate()
                        fire:Fire("StartFire", "", 0)

                        table.insert(self.Fires, fire)
                    end
                end
            end
        end
    end
end


-- Apply custom burning damage and ignite effect
function ENT:ApplyFireEffects()
    for _, ent in pairs(ents.FindInSphere(self:GetPos(), self.FireRadius)) do
        if ent:IsPlayer() or ent:IsNPC() then
            -- Deal direct fire damage
            local dmg = DamageInfo()
            dmg:SetDamage(self.Damage)
            dmg:SetDamageType(DMG_BURN)
            dmg:SetAttacker(self:GetOwner() or self)
            dmg:SetInflictor(self)
            ent:TakeDamageInfo(dmg)

            -- Ignite the entity for additional burning damage
            if not ent:IsOnFire() then
                ent:Ignite(self.IgniteTime)
            end
	
	    self:EmitSound("player/pl_burnpain2.wav", 50, 100)

            self:MakeNPCAvoid(ent)
        end
    end
end

-- Make NPCs avoid the fire area
function ENT:MakeNPCAvoid(ent)
    if ent:IsNPC() then
        local fleePos = ent:GetPos() + (ent:GetPos() - self:GetPos()):GetNormalized() * 300
        ent:SetLastPosition(fleePos)
        ent:SetSchedule(SCHED_FORCED_GO_RUN)
    end
end

-- Stop fire effect and remove fires
function ENT:StopFireEffect()

    self:StopSound(self.LoopSound)

    for _, fire in ipairs(self.Fires or {}) do
        if IsValid(fire) then
            fire:Fire("Extinguish", "", 0)
            fire:Remove()
        end
    end

    timer.Remove("WaitForGround_" .. self:EntIndex())
    timer.Remove("FireEffect_" .. self.FireID)
    ActiveFireGrenades[self.FireID] = nil
end

-- Cleanup on removal
function ENT:OnRemove()
    timer.Remove("WaitForGround_" .. self:EntIndex())
    self:StopFireEffect()
end
