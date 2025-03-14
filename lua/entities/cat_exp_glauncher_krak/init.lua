AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Range = 100
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


function ENT:PhysicsCollide( data, phys )
	
	local e = self.Entity
	local phys = e:GetPhysicsObject()
	phys:EnableMotion(false)
	
	dmg = self.Damage
    local pos = self:GetPos()
    local effectdata = EffectData()
    effectdata:SetStart(pos)
    effectdata:SetOrigin(pos)
    effectdata:SetScale(2)
    util.Effect("cball_explode", effectdata)
    util.Effect("cat_small_explosion", effectdata)
	self:EmitSound("phx/explode0" .. math.random(0, 6) .. ".wav", 100, 2000, 100)
	local effectdata = EffectData()
	effectdata:SetOrigin(self.Entity:GetPos())
	util.Effect("MuzzleEffect", effectdata)

	util.BlastDamage(self, self.Owner, self:GetPos(), self.Range, (self.Damage) )
	self:NextThink( CurTime() + 1 )
	self:Remove()
	self:NextThink(CurTime()+1)

end

function ENT:Think( )
	if self:WaterLevel() > 0 then
		self:Remove()
	end
end