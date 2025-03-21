function EFFECT:Init(data)
	local ent = data:GetEntity()
	if not IsValid(ent) or not ent:IsWeapon() then return end

	local owner = ent:GetOwner()
	if not IsValid(owner) then return end

	local vm = owner:GetViewModel()
	if not IsValid(vm) then return end

	local attach = vm:LookupAttachment("muzzle") or 1
	local muzzle = vm:GetAttachment(attach)
	if not muzzle then return end

	local pos = muzzle.Pos or owner:GetShootPos()
	local ang = muzzle.Ang or owner:EyeAngles()

	local emitter = ParticleEmitter(pos)
	if not emitter then return end

	-- Centered offset slightly back and up from the muzzle
	local spawnPos = pos + ang:Forward() * -20 + ang:Up() * -1

	-- Heat shimmer
	local heat = emitter:Add("sprites/heatwave", spawnPos)
	if heat then
		heat:SetVelocity(Vector(0, 0, math.Rand(15, 25)))
		heat:SetDieTime(math.Rand(0.25, 0.4))
		heat:SetStartAlpha(180)
		heat:SetEndAlpha(0)
		heat:SetStartSize(math.Rand(5, 7))
		heat:SetEndSize(math.Rand(10, 14))
		heat:SetRoll(math.Rand(0, 360))
		heat:SetRollDelta(math.Rand(-0.5, 0.5))
		heat:SetLighting(false)
		heat:SetAirResistance(20)
		heat:SetGravity(Vector(0, 0, 10))
	end

	-- Soft blueish steam
	local steam = emitter:Add("particles/smokey", spawnPos + VectorRand() * 1)
	if steam then
		steam:SetVelocity(Vector(0, 0, math.Rand(10, 18)))
		steam:SetDieTime(math.Rand(0.4, 0.6))
		steam:SetStartAlpha(40)
		steam:SetEndAlpha(0)
		steam:SetStartSize(math.Rand(6, 10))
		steam:SetEndSize(math.Rand(14, 18))
		steam:SetRoll(math.Rand(0, 360))
		steam:SetRollDelta(math.Rand(-1, 1))
		steam:SetColor(100, 200, 255)
		steam:SetLighting(false)
		steam:SetAirResistance(25)
		steam:SetGravity(Vector(0, 0, 5))
	end

	emitter:Finish()
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
