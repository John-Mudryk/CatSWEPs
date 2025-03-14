function EFFECT:Init(data)
	self.Pos = data:GetOrigin()
	local Emitter = ParticleEmitter(self.Pos)
	if Emitter == nil then return end
	self.Pos:Add(Vector(0, 0, 50))
	local particle = Emitter:Add( "Effects/strider_pinch_dudv", self.Pos)

	particle:SetVelocity( Vector( 0, 0, 0))
	particle:SetDieTime(0.5)
	particle:SetStartAlpha(255)
	particle:SetEndAlpha(255)
	particle:SetStartSize(50)
	particle:SetEndSize(0)
	particle:SetRoll( math.Rand( -10,10  ) )
	particle:SetRollDelta(math.Rand( -2, 2 ))
	particle:SetColor( 0, 0, 0)

	-- Smoke screen
	for i = 1,12 do
		local EffectCode = Emitter:Add("particles/smokey",self.Pos)
		EffectCode:SetVelocity(Vector(math.random(-5,5),math.random(-40,40),math.random(5,15)))
		EffectCode:SetDieTime(math.Rand(0.3,0.6)) -- How much time until it dies
		EffectCode:SetStartAlpha(math.Rand(220,230)) -- Transparency
		EffectCode:SetStartSize(math.Rand(5,10)) -- Size of the effect
		EffectCode:SetEndSize(math.Rand(12,15)) -- Size of the effect at the end (The effect slowly trasnsforms to this size)
		EffectCode:SetRoll(math.Rand(480,540))
		EffectCode:SetRollDelta(0) -- How fast it rolls
		EffectCode:SetColor(100,100,100) -- The color of the effect
		EffectCode:SetGravity(Vector(0,0,0)) -- The Gravity
		EffectCode:SetAirResistance(15)
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function EFFECT:Think()
	return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function EFFECT:Render()
end



