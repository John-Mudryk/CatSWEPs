ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Krak Grenade"
ENT.Author = "The Cat"
ENT.Spawnable = false
ENT.AdminSpawnable = true

-- Custom grenade properties
ENT.Model = "models/muschi/weapons/muschi_grenade_krak.mdl"
ENT.FuseTime = 5          -- Default fuse time in seconds (modifiable)
ENT.Damage = 2500          -- Blast damage
ENT.Radius = 100          -- Blast radius
ENT.StickOnImpact = true -- Change to true if you want it to stick to surfaces
ENT.IsImpact = false


AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_NONE)
    self:SetHealth(10)

    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:SetMass(1)
        phys:Wake()
    end

    -- Set explosion timer
    timer.Simple(self.FuseTime, function()
        if IsValid(self) then
            self:Explode()
        end
    end)

    self:EmitSound("weapons/pinpull.wav", 75, 100)
end



-- Handle collision behavior
function ENT:PhysicsCollide(data, phys)
    -- Basic bounce sound
    if data.Speed > 60 then
        self:EmitSound("physics/metal/metal_grenade_impact_hard" .. math.random(1, 3) .. ".wav")
    end
    
    -- Impact detonation logic
    if self.IsImpact and IsValid(self) then
        self:Explode()
        return
    end

    -- Stick to surface (optional)
    if self.StickOnImpact then
	self:EmitSound("phx/epicmetal_hard.wav", 75, 100)
        local hitEnt = data.HitEntity

        -- Check if we hit a valid entity (NPC, vehicle, etc.)
        if IsValid(hitEnt) and (hitEnt:IsNPC() or hitEnt:IsPlayer() or hitEnt:IsVehicle() or hitEnt:GetClass() == "prop_physics") then
            -- Parent the grenade to the entity so it follows it
            self:SetParent(hitEnt)

            -- Optional: Set position relative to hit position to avoid clipping
            local localPos = hitEnt:WorldToLocal(self:GetPos())
            self:SetLocalPos(localPos)

            -- Disable motion but allow parenting
            phys:EnableMotion(false)
            self:SetMoveType(MOVETYPE_NONE)
        else
            -- If it's a static surface, just disable motion
            phys:EnableMotion(false)
        end
    end
end


function ENT:Think()
    if self.KaboomTime and CurTime() >= self.KaboomTime then
        self:Explode()
    end

    -- Water detection
    if self:WaterLevel() > 0 then
        local effectdata = EffectData()
        effectdata:SetOrigin(self:GetPos())
        util.Effect("WaterSplash", effectdata)
        self:Remove()
    end
end

-- Explosion function
function ENT:Explode()
    if not IsValid(self) then return end

    local pos = self:GetPos()

    -- Explosion Effects
    local effectdata = EffectData()
    effectdata:SetStart(pos)
    effectdata:SetOrigin(pos)
    effectdata:SetScale(2)
    util.Effect("cball_explode", effectdata)
    util.Effect("cat_small_explosion", effectdata)

    -- Explosion Sound
    self:EmitSound("phx/explode0" .. math.random(0, 6) .. ".wav", 100, 2000, 1)

    local effectdata = EffectData()
	effectdata:SetOrigin(self.Entity:GetPos())
	util.Effect("MuzzleEffect", effectdata)

    -- Apply Blast Damage
    util.BlastDamage(self, self.Owner or self, pos, self.Radius, self.Damage)

    -- Optional Screen Shake
    local shake = ents.Create("env_shake")
    shake:SetPos(pos)
    shake:SetKeyValue("amplitude", "200")
    shake:SetKeyValue("radius", tostring(self.Radius))
    shake:SetKeyValue("duration", "1")
    shake:SetKeyValue("frequency", "255")
    shake:SetKeyValue("spawnflags", "4")
    shake:Spawn()
    shake:Activate()
    shake:Fire("StartShake", "", 0)

    -- Remove grenade entity
    self:Remove()
end
