function EFFECT:Init(data)
	local pos = data:GetOrigin()

	-- Flash or red energy burst
	local emitter = ParticleEmitter(pos)
	if not emitter then return end

	for i = 1, 20 do
		local particle = emitter:Add("particle/particle_smokegrenade", pos)
		if particle then
			particle:SetVelocity(VectorRand() * 100)
			particle:SetDieTime(math.Rand(0.5, 1))
			particle:SetStartAlpha(180)
			particle:SetEndAlpha(0)
			particle:SetStartSize(math.Rand(12, 20))
			particle:SetEndSize(math.Rand(30, 45))
			particle:SetRoll(math.Rand(0, 360))
			particle:SetColor(255, 50, 50)
			particle:SetAirResistance(150)
			particle:SetLighting(false)
		end
	end

	emitter:Finish()

	-- Flash of light
	local dlight = DynamicLight(self:EntIndex())
	if dlight then
		dlight.pos = pos
		dlight.r = 255
		dlight.g = 50
		dlight.b = 50
		dlight.brightness = 2
		dlight.Decay = 2000
		dlight.Size = 256
		dlight.DieTime = CurTime() + 0.3
	end

	sound.Play("ambient/explosions/explode_4.wav", pos, 75, 100, 1)
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
