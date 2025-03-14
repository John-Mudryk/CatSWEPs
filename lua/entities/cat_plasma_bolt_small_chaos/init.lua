AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

ENT.Range = 150 -- Default range (overridden if set by weapon)
ENT.Damage = 500 -- Default damage (overridden if set by weapon)

function ENT:Initialize()
    self:SetModel("models/props_junk/watermelon01_chunk02c.mdl") -- Temporary model
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:PhysicsInit(SOLID_VPHYSICS)

    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
        phys:Wake()
        phys:EnableGravity(false) -- Plasma shouldn't be affected by gravity
    end

    -- 🔥 Fix: Ensure projectile inherits weapon damage if set
    self.Damage = self.Damage or 500
    self.Range = self.Range or 150

    -- Initialize the plasma particle effect
    ParticleEffectAttach("plasma_bolt_chaos_small", PATTACH_ABSORIGIN_FOLLOW, self, 0)
end

function ENT:Think()
    -- Ensure the projectile is removed after 10 seconds to prevent lingering
    if self:GetCreationTime() + 10 < CurTime() then
        self:Remove()
    end
end

function ENT:PhysicsCollide(data, phys)
    if self.Exploded then return end -- Prevents multiple explosions

    self.Exploded = true -- Set flag to prevent repeated damage
    local hitPos = data.HitPos

    -- Explosion Damage
    local damage = self.Damage or 1000
    local radius = 75

    util.BlastDamage(self, self.Owner, self:GetPos(), radius, damage)

    -- Apply damage to nearby entities
    local entities = ents.FindInSphere(hitPos, radius)
    for _, ent in pairs(entities) do
        if IsValid(ent) then
            local dmg = DamageInfo()
            dmg:SetDamage(damage)
            dmg:SetAttacker(self:GetOwner())
            dmg:SetInflictor(self)
            dmg:SetDamageType(DMG_SHOCK)
            ent:TakeDamageInfo(dmg)
        end
    end

    -- Explosion Effect
    local effectData = EffectData()
    effectData:SetOrigin(hitPos)
    util.Effect("cat_plasma_explosion_small_chaos", effectData)

    -- Delay Removal to Show Effect, But Prevent Repeated Damage
    timer.Simple(0.1, function()
        if IsValid(self) then
            self:Remove()
        end
    end)
end
