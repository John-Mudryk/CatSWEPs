local AddVel = Vector()
local ang

function EFFECT:Init(data)
	self.WeaponEnt = data:GetEntity()
	if not IsValid(self.WeaponEnt) then return end
	self.Attachment = data:GetAttachment()
	self.Position = self:GetTracerShootPos(data:GetOrigin(), self.WeaponEnt, self.Attachment)

	if IsValid(self.WeaponEnt:GetOwner()) then
		if self.WeaponEnt:GetOwner() == LocalPlayer() then
			if self.WeaponEnt:GetOwner():ShouldDrawLocalPlayer() then
				ang = self.WeaponEnt:GetOwner():EyeAngles()
				ang:Normalize()
				--ang.p = math.max(math.min(ang.p,55),-55)
				self.Forward = ang:Forward()
			else
				self.WeaponEnt = self.WeaponEnt:GetOwner():GetViewModel()
			end
			--ang.p = math.max(math.min(ang.p,55),-55)
		else
			ang = self.WeaponEnt:GetOwner():EyeAngles()
			ang:Normalize()
			self.Forward = ang:Forward()
		end
	end

	self.Forward = self.Forward or data:GetNormal()
	self.Angle = self.Forward:Angle()
	self.Right = self.Angle:Right()
	self.vOffset = self.Position
	local dir = self.Forward
	local ownerent = self.WeaponEnt:GetOwner()

	if not IsValid(ownerent) then
		ownerent = LocalPlayer()
	end

	AddVel = ownerent:GetVelocity()
	AddVel = AddVel * 0.05
	self.vOffset = self.Position
	AddVel = AddVel * 0.05
	local dot = dir:GetNormalized():Dot(GetViewEntity():EyeAngles():Forward())
	local dotang = math.deg(math.acos(math.abs(dot)))
	local halofac = math.Clamp(1 - (dotang / 90), 0, 1)
	local dlight = DynamicLight(ownerent:EntIndex())

	if (dlight) then
		dlight.pos = self.vOffset - ownerent:EyeAngles():Right() * 5 + 1.05 * ownerent:GetVelocity() * FrameTime()
		dlight.r = 255
		dlight.g = 60
		dlight.b = 30
		dlight.brightness = 5
		dlight.Decay = 1000
		dlight.Size = 128
		dlight.DieTime = CurTime() + 0.5
	end

	local emitter = ParticleEmitter(self.vOffset)
	local sparticle = emitter:Add("effects/muzzleflashX_nemole_w", self.vOffset)

	if (sparticle) then
		sparticle:SetVelocity(dir * 4)
		sparticle:SetLifeTime(0)
		sparticle:SetDieTime(0.08)
		sparticle:SetStartAlpha(math.Rand(200, 255))
		sparticle:SetEndAlpha(0)
		--particle:SetStartSize( 8 * (halofac*0.8+0.2), 0, 1)
		--particle:SetEndSize( 0 )
		sparticle:SetStartSize(4 * (halofac * 0.8 + 0.2), 0, 1)
		sparticle:SetEndSize(12 * (halofac * 0.8 + 0.2), 0, 1)
		local r = math.Rand(-10, 10) * 3.14 / 180
		sparticle:SetRoll(r)
		sparticle:SetRollDelta(r / 5)
		sparticle:SetColor(255, 100, 0)
		sparticle:SetLighting(false)
		sparticle.FollowEnt = self.WeaponEnt
		sparticle.Att = self.Attachment
		TFA.Particles.RegisterParticleThink(sparticle, TFA.Particles.FollowMuzzle)
		sparticle:SetPos(vector_origin)
	end

	for _ = 1, 1 do
		local particle = emitter:Add("effects/scotchmuzzleflashw", self.vOffset)

		if (particle) then
			particle:SetVelocity(dir * 4)
			particle:SetLifeTime(0)
			particle:SetDieTime(0.10)
			particle:SetStartAlpha(math.Rand(225, 255))
			particle:SetEndAlpha(0)
			--particle:SetStartSize( 7.5 * (halofac*0.8+0.2), 0, 1)
			--particle:SetEndSize( 0 )
			particle:SetStartSize(6 * (halofac * 0.8 + 0.2), 0, 1)
			particle:SetEndSize(12 * (halofac * 0.8 + 0.2))
			particle:SetRoll(math.rad(math.Rand(0, 360)))
			particle:SetRollDelta(math.rad(math.Rand(-40, 40)))
			particle:SetColor(255, 100, 0)
			particle:SetLighting(false)
			particle.FollowEnt = self.WeaponEnt
			particle.Att = self.Attachment
			TFA.Particles.RegisterParticleThink(particle, TFA.Particles.FollowMuzzle)
		end
	end

	for i = 0, 5 do
		local particle = emitter:Add("particles/flamelet" .. math.random(1, 5), self.vOffset + (dir * 0.6 * i))

		if (particle) then
			particle:SetVelocity((dir * 19 * i) + 1.05 * AddVel)
			particle:SetLifeTime(0)
			particle:SetDieTime(0.075)
			particle:SetStartAlpha(math.Rand(200, 255))
			particle:SetEndAlpha(0)
			--particle:SetStartSize( math.max(5.4 - 0.55 * i,1) )
			--particle:SetEndSize( 0 )
			particle:SetStartSize(math.max(6 - 0.65 * i, 1) * 0.55)
			particle:SetEndSize(math.max(5.4 - 0.55 * i, 1) * 1.25)
			particle:SetRoll(math.rad(math.Rand(0, 360)))
			particle:SetRollDelta(math.rad(math.Rand(-40, 40)))
			particle:SetColor(255, 100, 0)
			particle:SetLighting(false)
			particle.FollowEnt = self.WeaponEnt
			particle.Att = self.Attachment
			TFA.Particles.RegisterParticleThink(particle, TFA.Particles.FollowMuzzle)
			particle:SetPos(vector_origin)
		end
	end

	for _ = 0, 4 do
		local particle = emitter:Add("particles/smokey", self.vOffset + dir * math.Rand(6, 10))

		if (particle) then
			particle:SetVelocity(VectorRand() * 10 + dir * math.Rand(15, 20) + 1.05 * AddVel)
			particle:SetLifeTime(0)
			particle:SetDieTime(math.Rand(0.6, 0.7))
			particle:SetStartAlpha(math.Rand(7, 11))
			particle:SetEndAlpha(0)
			particle:SetStartSize(math.Rand(5, 7))
			particle:SetEndSize(math.Rand(12, 14))
			particle:SetRoll(math.rad(math.Rand(0, 360)))
			particle:SetRollDelta(math.Rand(-0.8, 0.8))
			particle:SetLighting(true)
			particle:SetAirResistance(10)
			particle:SetGravity(Vector(0, 0, 60))
			particle:SetColor(255, 255, 255)
		end
	end

	local sparkcount = math.random(8, 12)

	for _ = 0, sparkcount do
		local particle = emitter:Add("effects/yellowflare", self.Position)

		if (particle) then
			particle:SetVelocity((VectorRand() + Vector(0, 0, 0.3)) * 60 * Vector(0.8, 0.8, 0.6) + dir * math.Rand(80, 120) + 1.15 * AddVel)
			particle:SetLifeTime(0)
			particle:SetDieTime(math.Rand(0.25, 0.4))
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(0)
			particle:SetStartSize(.35)
			particle:SetEndSize(1.15)
			particle:SetRoll(math.rad(math.Rand(0, 360)))
			particle:SetGravity(Vector(0, 0, -50))
			particle:SetAirResistance(40)
			particle:SetStartLength(0.1)
			particle:SetEndLength(0.05)
			particle:SetColor(255, 100, 0)
			particle:SetVelocityScale(true)

			particle:SetThinkFunction(function(pa)
				pa.ranvel = pa.ranvel or VectorRand() * 4
				pa.ranvel.x = math.Approach(pa.ranvel.x, math.Rand(-4, 4), 0.5)
				pa.ranvel.y = math.Approach(pa.ranvel.y, math.Rand(-4, 4), 0.5)
				pa.ranvel.z = math.Approach(pa.ranvel.z, math.Rand(-4, 4), 0.5)
				pa:SetVelocity(pa:GetVelocity() + pa.ranvel * 1.5)
				pa:SetNextThink(CurTime() + 0.01)
			end)

			particle:SetNextThink(CurTime() + 0.01)
		end
	end

	if TFA.GetGasEnabled() then
		for i = 0, 3 do
			local particle = emitter:Add("sprites/heatwave", self.vOffset + (dir * i))

			if (particle) then
				particle:SetVelocity((dir * 25 * i) + 1.05 * AddVel + VectorRand() * 5)
				particle:SetLifeTime(0)
				particle:SetDieTime(math.Rand(0.05, 0.15))
				particle:SetStartAlpha(math.Rand(200, 225))
				particle:SetEndAlpha(0)
				particle:SetStartSize(math.Rand(3, 5))
				particle:SetEndSize(math.Rand(8, 10))
				particle:SetRoll(math.Rand(0, 360))
				particle:SetRollDelta(math.Rand(-2, 2))
				particle:SetAirResistance(5)
				particle:SetGravity(Vector(0, 0, 40))
				particle:SetColor(255, 255, 255)
			end
		end
	end

	emitter:Finish()
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end