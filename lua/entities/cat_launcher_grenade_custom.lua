AddCSLuaFile()
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Spawnable = false


function ENT:Initialize()

	ParticleEffectAttach("smoke_trail", 4, self, 1 )
	self:SetModel( "models/items/ar2_grenade.mdl" )

	--ParticleEffectAttach("none", 4, self, 1 )
	if SERVER then
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetCollisionGroup( COLLISION_GROUP_WEAPON )

		local pObj = self:GetPhysicsObject()
		
		self.Collided = false
		self.Speed = false
		pObj:Wake()
		self:PhysWake()
	end
end

function ENT:Think()
	local curtime = CurTime()

	self:NextThink( curtime )
	if SERVER then

		if self.Speed == false then
			local pObj = self:GetPhysicsObject()
			pObj:SetVelocityInstantaneous( self.MoveDirection * 2000 )
			self.Speed = true
		end

		if self.Collided then
			if curtime > self.FuseStart + self.FuseTime and self.FuseTime ~= 0 then
				self:Explode()
			end
		end
		return true
	end
end

function ENT:Explode()
	if self.Detonated then return end
	if self.GrenadeType == "frag" then 
		local effectData = EffectData()
    		effectData:SetOrigin(self:GetPos())
    		effectData:SetMagnitude(1)
    		effectData:SetScale(1)
    		effectData:SetRadius(200)
    		util.Effect("HelicopterMegaBomb", effectData, true, true)
    		util.Effect("Explosion", effectData, true, true)
		sound.Play( "^wk_explosives/grenade_explosion.wav", self:GetPos(), 100, 100, 1 )
		local dmginfo2 = DamageInfo()
			dmginfo2:SetDamageType( DMG_BLAST ) 
			dmginfo2:SetDamage( 500 )
			dmginfo2:SetAttacker( self.Owner or self )
			dmginfo2:SetInflictor( self )
		util.BlastDamageInfo( dmginfo2, self:GetPos(), 200) 
	elseif self.GrenadeType == "krak" then 
		ParticleEffect( "wk_explosives_grenade_krak", self:GetPos(), Angle( 0, 0, 0) )
		sound.Play( "ambient/explosions/explode_4.wav", self:GetPos(), 100, 140, 0.6 )
		local dmginfo2 = DamageInfo()
			dmginfo2:SetDamageType( DMG_BLAST ) 
			dmginfo2:SetDamage( 1500 )
			dmginfo2:SetAttacker( self.Owner or self )
			dmginfo2:SetInflictor( self )
		util.BlastDamageInfo( dmginfo2, self:GetPos(), 100) 
	elseif self.GrenadeType == "thermo" then 
		ParticleEffect( "wk_explosives_grenade_thermobaric", self:GetPos(), Angle( 0, 0, 0) )
		self:EmitSound("wk_grenade_explosion")
		local dmginfo2 = DamageInfo()
			dmginfo2:SetDamageType( DMG_BLAST ) 
			dmginfo2:SetDamage( 500 )
			dmginfo2:SetAttacker( self.Owner or self )
			dmginfo2:SetInflictor( self )
		util.BlastDamageInfo( dmginfo2, self:GetPos(), 300 ) 
	elseif self.GrenadeType == "plasma" then 
		local effectdata = EffectData()
	    effectdata:SetOrigin( self:GetPos() )
	    self:EmitSound( "plasma_explosion_large" )
	    util.Effect("wh_plasma_hit_large", effectdata)
		util.BlastDamage( self, self.Owner, self:GetPos(), 200, 1500 )
	elseif self.GrenadeType == "flash" then 
		ParticleEffect( "wk_explosives_grenade_flash", self:GetPos(), Angle( 0, 0, 0) )
		sound.Play( "^wk_explosives/grenade_flash.wav", self:GetPos(), 100, 100, 3 )
		local dmginfo2 = DamageInfo()
			dmginfo2:SetDamageType( DMG_PREVENT_PHYSICS_FORCE, DMG_BLAST ) 
			dmginfo2:SetDamage( 30 )
			dmginfo2:SetAttacker( self.Owner or self )
			dmginfo2:SetInflictor( self )
		util.BlastDamageInfo( dmginfo2, self:GetPos(), 300 ) 

		for k, v in pairs(ents.FindInSphere(self:GetPos() + Vector(0,0,10), 300 )) do
			if (v:IsPlayer() and v:Alive()) then
				WKSE.ApplyStatusEffect( {
					Source = self, 
					EffectName = "Flash",
					Target = v, 
					StartTime = CurTime(), 
					Duration = 10,
				} )
			end
		end
	elseif self.GrenadeType == "fire" then 
		ParticleEffect( "WKExplosives.HE.2", self:GetPos(), Angle( 0, 0, 0) )
		sound.Play( "ambient/explosions/explode_9.wav", self:GetPos(), 100, 160, 3 )
		local GrenadeAoE = ents.Create("wk_grenade_aoe")
		local pos = self:GetPos()
			GrenadeAoE:SetPos( pos )
			GrenadeAoE.Owner = self.Owner
			GrenadeAoE.GrenadeType = self.GrenadeType
			GrenadeAoE:Spawn()
			GrenadeAoE:Activate()
	elseif self.GrenadeType == "chem" then 
		ParticleEffect( "WKExplosives.HE.2", self:GetPos(), Angle( 0, 0, 0) )
		sound.Play( "^wk_explosives/grenade_flash.wav", self:GetPos(), 100, 160, 3 )
		local GrenadeAoE = ents.Create("wk_grenade_aoe")
		local pos = self:GetPos()
			GrenadeAoE:SetPos( pos )
			GrenadeAoE.Owner = self.Owner
			GrenadeAoE.GrenadeType = self.GrenadeType
			GrenadeAoE:Spawn()
			GrenadeAoE:Activate()
	elseif self.GrenadeType == "rad" then 
		ParticleEffect( "WKExplosives.HE.2", self:GetPos(), Angle( 0, 0, 0) )
		sound.Play( "^wk_explosives/grenade_flash.wav", self:GetPos(), 100, 160, 3 )
		local GrenadeAoE = ents.Create("wk_grenade_aoe")
		local pos = self:GetPos()
			GrenadeAoE:SetPos( pos )
			GrenadeAoE.Owner = self.Owner
			GrenadeAoE.GrenadeType = self.GrenadeType
			GrenadeAoE:Spawn()
			GrenadeAoE:Activate()
	elseif self.GrenadeType == "smoke" then 
		ParticleEffectAttach("wk_explosives_grenade_smoke", 4, self, 1 )
		
		self.Detonated = true
		
		if SERVER then
			SafeRemoveEntityDelayed(self,20)
		end
	elseif self.GrenadeType == "emp" then 
		ParticleEffect( "wk_explosives_grenade_emp", self:GetPos(), Angle( 0, 0, 0) )
		sound.Play( "^wk_explosives/grenade_emp.wav", self:GetPos(), 90, 180, 1 )
		local dmginfo2 = DamageInfo()
			dmginfo2:SetDamageType( DMG_PREVENT_PHYSICS_FORCE, DMG_DIRECT ) 
			dmginfo2:SetDamage( 10 )
			dmginfo2:SetAttacker( self.Owner or self )
			dmginfo2:SetInflictor( self )
		util.BlastDamageInfo( dmginfo2, self:GetPos(), 300 ) 

		for k, v in pairs(ents.FindInSphere(self:GetPos() + Vector(0,0,10), 100 )) do
			if v:GetClass() == "gmod_sent_vehicle_fphysics_base" then
				if v:EngineActive() then
					v:StopEngine()
				else
			end
		end
	end
end
	if self.GrenadeType ~= "smoke" then self:Remove() end
end

function ENT:PhysicsCollide( data, phys )
	local pObj = self:GetPhysicsObject()

	pObj:AddVelocity( Vector(math.Rand(-30, 30), math.Rand(-30, 30), math.Rand(-30, 30) ) )
	if ( data.Speed > 100 ) then self:EmitSound( Sound( "Flashbang.Bounce" ) ) end

	if self.FuseTime == 0 then
		self:Explode()
	end

	if not self.Collided then
		self.Collided = true
		self.FuseStart = CurTime()
	end
end

sound.Add({
    name = "wk_grenade_explosion",
	channel = CHAN_AUTO,
	volume = 1.0,
	level = {120, 120},
	pitch = { 120, 130 },
	sound = { "wk_explosives/grenade_explosion.wav" }
})
