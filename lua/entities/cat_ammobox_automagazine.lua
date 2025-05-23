
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Auto ammo types magazine"
ENT.Category = "Cat's AMMO"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Class = ""
ENT.MyModel = "models/Items/BoxMRounds.mdl"
ENT.ImpactSound = "Default.ImpactSoft"
ENT.AmmoCount = 3000
ENT.AmmoConsumption = 3000
ENT.AmmoType = "Ear2"
ENT.ShouldDrawShadow = true
ENT.DamageThreshold = 80

ENT.Purpose = "Provide Ammunition"
ENT.Instructions = "Place down and activate to acquire ammunition"

if SERVER then
	AddCSLuaFile()

	function ENT:SpawnFunction(ply, tr, classname)
		if (not tr.Hit) then return end
		local pos = tr.HitPos + tr.HitNormal * 4
		local ent = ents.Create(classname)
		ent:SetPos(pos)
		ent:Spawn()
		ent:Activate()
		ent.Class = classname
		ent.Spawner = ply

		return ent
	end

	function ENT:Initialize()
		local model = self.MyModel
		self.Class = self:GetClass()
		self:SetModel(model)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:DrawShadow(self.ShouldDrawShadow)
		self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
		self:SetUseType(SIMPLE_USE)
		self:SetHealth(self.DamageThreshold)
		self:SetNW2Bool("ShouldRemove", false)
		local phys = self:GetPhysicsObject()

		if (phys:IsValid()) then
			phys:Wake()
		end
	end

	function ENT:PhysicsCollide(data, physobj)
		if (data.Speed > 60 and data.DeltaTime > 0.2) then
			self:EmitSound(self.ImpactSound)
		end
	end

	function ENT:Use(activator, caller)
		local AmmoGive = {
			"cat_custom_autocannon",
			"cat_custom_autogun",
			"cat_custom_autopistol",
			"cat_custom_autorifle",
			"cat_custom_bazooka",
			"cat_custom_bolter",
			"cat_custom_bolterastartes",
			"cat_custom_boltpistol",
			"cat_custom_boltpistolastartes",
			"cat_custom_flamer",
			"cat_custom_galvanic",
			"cat_custom_grenadelauncher",
			"cat_custom_heavybolter",
			"cat_custom_heavybolterastartes",
			"cat_custom_heavystubber",
			"cat_custom_heavystubbertwin",
			"cat_custom_hellgun",
			"cat_custom_hellgunstandard",
			"cat_custom_hellpistol",
			"cat_custom_lascannon",
			"cat_custom_lascarbine",
			"cat_custom_lasgun",
			"cat_custom_laspistol",
			"cat_custom_longlas",
			"cat_custom_meltabomb",
			"cat_custom_melta",
			"cat_custom_multilaser",
			"cat_custom_multimelta",
			"cat_custom_phosphor",
			"cat_custom_plasmacannon",
			"cat_custom_plasmagun",
			"cat_custom_plasmapistol",
			"cat_custom_rippergun",
			"cat_custom_shotgun",
			"cat_custom_sniper",
			"cat_custom_stormbolter",
			"cat_custom_stormbolterastartes",
			"cat_custom_stormbolterterminator",
			"cat_custom_stubber",
			"cat_custom_volleygun",
		}

		if IsValid(activator) and activator:IsPlayer() then
			local Weapon = activator:GetActiveWeapon()
			local AmmoType = Weapon:GetPrimaryAmmoType()
			local AmmoCount = activator:GetAmmoCount(AmmoType)
			local WeaponClass = Weapon:GetClass()
			local ToGive

			if table.HasValue(AmmoGive, WeaponClass) and (Weapon:GetMaxClip1() or 5000) <= AmmoCount + Weapon:Clip1() then 
			    activator:ChatPrint( "You have taken as much as you can" ) 
			   	return 
			end

			if table.HasValue(AmmoGive, WeaponClass) then
				ToGive = Weapon:GetMaxClip1() - (AmmoCount + Weapon:Clip1())
			else
				ToGive = 9999 - (AmmoCount + Weapon:Clip1())
			end

			activator:GiveAmmo(ToGive,AmmoType)
		end
	end

	local bul = {}
	local randvec = Vector(0, 0, 0)
	bul.Tracer = 3
	bul.Num = 1
	bul.TracerName = "Tracer"
	bul.Spread = Vector(0, 0, 0)

	function ENT:Think()
		if self:GetNW2Bool("ShouldRemove", false) then
			self:Remove()

			return false
		end

		if self:Health() <= 0 then
			self:EmitSound(self.ImpactSound)
			local adm = cv_dm:GetInt()
			bul.AmmoType = self.AmmoType
			bul.Damage = self.Damage
			bul.Force = math.Max(self.Damage / 25, 0.1)
			bul.Attacker = self

			if IsValid(self.Attacker) then
				bul.Attacker = self.Attacker
			end

			local upang = self:GetAngles():Up()
			bul.Dir = upang + randvec * 0.75
			local numbuls = math.random(math.Round(self.AmmoCount * 0.25), math.Round(self.AmmoCount * 0.75))
			local i = 1

			if adm == 2 then
				bul.Damage = bul.Damage / 2
			end

			bul.Dir = (upang + randvec * 0.75):GetNormalized()
			bul.Src = self:GetPos()
			self:FireBullets(bul)

			if adm ~= 1 then
				while i <= math.Clamp(numbuls, 1, 35) do
					randvec.x = math.Rand(-1, 1)
					randvec.y = math.Rand(-1, 1)
					randvec.z = math.Rand(-1, 1)
					bul.Dir = (upang + randvec * 0.75):GetNormalized()
					bul.Src = self:GetPos()
					self:FireBullets(bul)
					i = i + 1
				end
			end

			local effectdata = EffectData()
			effectdata:SetOrigin(self:GetPos())
			effectdata:SetMagnitude(0.1)
			effectdata:SetScale(0.5)

			if adm == 1 then
				bul.Damage = bul.Damage * 3 / 4
			end

			if adm > 0 then
				util.BlastDamage(bul.Attacker, bul.Attacker, bul.Src, (bul.Damage * 6 + 128) / 2, bul.Damage * 2)
				util.Effect("Explosion", effectdata)
			end

			if adm ~= 1 then
				util.Effect("cball_explode", effectdata)
			end

			self:SetNW2Bool("ShouldRemove", true)
		end
	end
end

if CLIENT then
	function ENT:Initialize()
		self.Class = self:GetClass()
	end

	function ENT:Draw()
		self:DrawModel()
	end
end
