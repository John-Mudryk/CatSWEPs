AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Psyker Bolt"
ENT.Spawnable = false
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

-- Configurable properties
ENT.Speed = 2000 -- Bolt speed
ENT.Damage = 50 -- Direct hit damage
ENT.Radius = 100 -- Explosion radius
ENT.Lifetime = 5 -- Time before it disappears if it doesn't hit anything

-- Sound paths
local FIRE_SOUND = "weapons/laserrifle/impacts/fx_laser_impact_02.wav"
local IMPACT_SOUND = "weapons/laserrifle/impacts/fx_laser_impact_01.wav"
local LOOP_SOUND = "ambient/machines/combine_shield_touch_loop1.wav"


function ENT:Initialize()
    if SERVER then
        self:SetModel("models/props_phx/misc/egg.mdl") -- Egg model
        self:SetMaterial("models/alyx/emptool_glow") -- glowing effect material
        self:SetColor(Color(120, 0, 255)) -- Psyker purple glow
        self:SetRenderMode(RENDERMODE_TRANSCOLOR) -- Ensures visibility & glow
        self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)

        -- Initialize physics
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
	
	self.Damage = self.Damage or 50 
	
        local phys = self:GetPhysicsObject()
        if IsValid(phys) then
            phys:EnableMotion(true)
            phys:EnableGravity(false) -- No gravity for psyker energy
            phys:EnableDrag(false)
            phys:SetMass(1)
            phys:Wake()
        else
            print("[ERROR] Psyker Bolt Physics Failed to Initialize!")
        end

        self.StartTime = CurTime()
	self:EmitSound(FIRE_SOUND)

        -- Rotate the egg at spawn to face where the player is aiming
        local owner = self:GetOwner()
        if IsValid(owner) then
            local aimAngle = owner:EyeAngles()
            self:SetAngles(aimAngle + Angle(90, 0, 0)) -- Adjust to face forward
        end

        -- Attach a plasma trail
        util.SpriteTrail(self, 0, Color(120, 0, 255, 255), true, 7, 0, 0.4, 0.05, "trails/plasma")

	self.SoundLoop = CreateSound(self, LOOP_SOUND)
    	self.SoundLoop:PlayEx(.25, 100) -- Volume: 1, Pitch: 100
    end
end

function ENT:Think()
    if SERVER and CurTime() - self.StartTime > self.Lifetime then
        self:Explode()
    end
end

function ENT:PhysicsCollide(data, phys)
    if data.HitEntity and (data.HitEntity:IsWorld() or data.HitEntity:IsNPC() or data.HitEntity:IsPlayer()) then
        self:Explode()
    end
end

function ENT:Explode()
    if self.Exploded then return end -- Prevent multiple explosions
    self.Exploded = true

    self:EmitSound(IMPACT_SOUND)
    -- Create explosion effect
    local effect = EffectData()
    effect:SetOrigin(self:GetPos())
    effect:SetRadius(self.Radius)
    util.Effect("psyker_explosion", effect) -- ⚡ Psyker explosion effect

    -- Damage everything in the radius
    local owner = self:GetOwner()
    local hitEntities = ents.FindInSphere(self:GetPos(), self.Radius)
    for _, ent in ipairs(hitEntities) do
        if ent:IsNPC() or (ent:IsPlayer() and ent ~= owner) then
            local dmg = DamageInfo()
            dmg:SetDamage(self.Damage)
            dmg:SetAttacker(owner or self)
            dmg:SetInflictor(self)
            dmg:SetDamageType(DMG_DISSOLVE) -- Psyker warp energy
            ent:TakeDamageInfo(dmg)
        end
    end

    self:Remove()
end

function ENT:OnRemove()
    if self.SoundLoop then
        self.SoundLoop:Stop() -- ✅ Stop travel sound when the bolt is removed
    end
end

if CLIENT then
    function ENT:Draw()
        self:DrawModel() -- Ensures model is always visible
    end
end
