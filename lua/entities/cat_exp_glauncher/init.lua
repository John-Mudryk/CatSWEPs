AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Range = 300
ENT.Damage = 650

function ENT:Initialize()
	self:SetHealth(10)
	self:SetColor(Color(255,255,255,0))
	self:SetModel( "models/items/ar2_grenade.mdl" )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetCollisionGroup( COLLISION_GROUP_NONE )
	if !self.Owner:IsPlayer() then
		self.Owner = self
	else
		self:GetValues()
	end
	local phys = self:GetPhysicsObject()
	phys:Wake()
	self:SetModelScale(2)
	self:Activate()

end

function ENT:GetValues()
-- [ Trigger ]
	self.TimePerTick = 0.8
	self.MaxTicks = 2
end

function ENT:PhysicsCollide(data, phys)
    -- Prevent multiple explosions
    if self.Exploded then return end
    self.Exploded = true

    local pos = self:GetPos()
    local attacker = IsValid(self.Owner) and self.Owner or self
    local inflictor = self

    -- Create Explosion Effects
    local effectdata = EffectData()
    effectdata:SetStart(pos)
    effectdata:SetOrigin(pos)
    effectdata:SetScale(2)
    util.Effect("Explosion", effectdata)
    util.Effect("HelicopterMegaBomb", effectdata)

    -- Explosion Sound
    self:EmitSound("phx/explode0" .. math.random(0, 6) .. ".wav", 100, 100, 1)

    -- Apply Blast Damage with correct attacker and inflictor
    util.BlastDamage(inflictor, attacker, pos, self.Range or 300, self.Damage or 650)

    -- Optional Screen Shake
    local shake = ents.Create("env_shake")
    if IsValid(shake) then
        shake:SetPos(pos)
        shake:SetKeyValue("amplitude", "200")
        shake:SetKeyValue("radius", tostring(self.Range or 300))
        shake:SetKeyValue("duration", "1")
        shake:SetKeyValue("frequency", "255")
        shake:SetKeyValue("spawnflags", "4")
        shake:Spawn()
        shake:Activate()
        shake:Fire("StartShake", "", 0)
    end

    -- Remove grenade entity after a short delay
    timer.Simple(0, function()
        if IsValid(self) then
            self:Remove()
        end
    end)
end

function ENT:Think( )
	if self:WaterLevel() > 0 then
		self:Remove()
	end
end