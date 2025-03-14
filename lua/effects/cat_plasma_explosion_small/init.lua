sound.Add({
	name = "cat_plasma_explosion",
	channel = CHAN_STATIC,
	volume = 5,
	level = 80,
	pitch = 100,
	sound = { "weapons/40watt/plasma.wav", "weapons/40watt/plasma2.wav", "weapons/40watt/plasma3.wav" }
})

function EFFECT:Init(data)
	local vOffset = data:GetOrigin()
	local vScale = math.Clamp(data:GetScale(), 0.5, 1) -- Prevents extreme scaling
	local NumParticles = math.Clamp(15 * vScale, 10, 25) -- Limits particle count
	local emitter = ParticleEmitter(vOffset)

	for i = 0, (NumParticles / 5) do
		local Pos = Vector(math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)):GetNormalized()
		local particle = emitter:Add("particles/smokey", vOffset + Pos * math.Rand(20, 150))
		if (particle) then
			particle:SetVelocity(Pos * math.Rand(50, 100))
			particle:SetLifeTime(0)
			particle:SetDieTime(math.Rand(1, 5))
			particle:SetStartAlpha(math.Rand(200, 255))
			particle:SetEndAlpha(0)
			particle:SetStartSize(math.Clamp(20 * vScale, 5, 100)) -- Limits explosion size
			particle:SetEndSize(math.Clamp(10, 5, 50))
			particle:SetRoll(math.Rand(0, 360))
			particle:SetRollDelta(math.Rand(-0.2, 0.2))
			particle:SetColor(60, 60, 60)
		end
	end

	for i = 0, (NumParticles) do
		local Pos = Vector(math.Rand(-1, 1), math.Rand(-1, 1), 0):GetNormalized()
		local particle = emitter:Add("particles/flamelet" .. math.random(1, 5), vOffset + Pos * math.Rand(75 * vScale, 125 * vScale) + Vector(0, 0, 5))
		if (particle) then
			particle:SetVelocity(Pos * math.Rand(300, 1000))
			particle:SetLifeTime(0)
			particle:SetDieTime(math.Rand(0.2, 1))
			particle:SetStartAlpha(math.Rand(200, 255))
			particle:SetEndAlpha(0)
			particle:SetStartSize(math.Clamp(10 * vScale, 2, 20)) -- Ensures a reasonable size
			particle:SetEndSize(0)
			particle:SetRoll(math.Rand(0, 360))
			particle:SetRollDelta(math.Rand(-2, 2))
			particle:SetColor(2, 105, 255)
		end
	end

	for i = 0, (NumParticles * 2) do
		local Pos = Vector(math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)):GetNormalized()
		local particle = emitter:Add("particles/flamelet" .. math.random(1, 5), vOffset + Pos * math.Rand(1, 25 * vScale))
		if (particle) then
			particle:SetVelocity(Pos + Vector(math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(0, 2)):GetNormalized() * math.Rand(50, 500))
			particle:SetLifeTime(0)
			particle:SetDieTime(math.Rand(1, 3))
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(0)
			particle:SetStartSize(math.Clamp(15 * vScale, 5, 75)) -- Prevents oversized particles
			particle:SetEndSize(0)
			particle:SetRoll(math.Rand(0, 360))
			particle:SetRollDelta(math.Rand(-2, 2))
			local Col = math.Rand(10, 75)
			particle:SetColor(2, 50, 160 - Col)
		end
	end

	emitter:Finish()
end

function EFFECT:Think()
	self:EmitSound("cat_plasma_explosion")
	return false
end

function EFFECT:Render()
end
