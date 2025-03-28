-- effects/volkite_chargeup/init.lua
EFFECT.Mat = Material("sprites/light_glow02_add")

function EFFECT:Init(data)
	self.Entity = data:GetEntity()
	self.Pos = data:GetOrigin()

	if not IsValid(self.Entity) then return end

	self.Emitter = ParticleEmitter(self.Pos)
	self.LifeTime = 0.6
	self.StartTime = CurTime()
end

function EFFECT:Think()
	if not IsValid(self.Entity) then return false end

	local elapsed = CurTime() - self.StartTime
	if elapsed > self.LifeTime then
		return false
	end

	local pos = self.Entity:GetPos() + Vector(0, 0, 65)

	-- Emit spark
	if math.random() < 0.3 then
		local particle = self.Emitter:Add("effects/spark", pos + VectorRand() * 10)
		if particle then
			particle:SetVelocity(VectorRand() * 20)
			particle:SetDieTime(0.4)
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(0)
			particle:SetStartSize(12)
			particle:SetEndSize(0)
			particle:SetRoll(math.Rand(0, 360))
			particle:SetColor(255, 100, 50)
			particle:SetGravity(Vector(0, 0, 10))
		end
	end

	return true
end

function EFFECT:Render()
	if not IsValid(self.Entity) then return end

	local intensity = 1 - ((CurTime() - self.StartTime) / self.LifeTime)
	local size = 64 * intensity
	local pos = self.Entity:GetPos() + Vector(0, 0, 45)

	render.SetMaterial(self.Mat)
	render.DrawSprite(pos, size, size, Color(255, 100, 50, 180 * intensity))
end

function EFFECT:OnRemove()
	if self.Emitter then
		self.Emitter:Finish()
	end
end
