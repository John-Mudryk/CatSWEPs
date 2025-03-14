function EFFECT:Init(data)
	self.Pos = data:GetOrigin()
	local Emitter = ParticleEmitter(self.Pos)
	if Emitter == nil then return end
	
	local effectdata = EffectData()
	effectdata:SetOrigin( self.Pos )
	effectdata:SetNormal( Vector(0,0,0) )
	effectdata:SetMagnitude( 2 )
	effectdata:SetScale( 1.5 )
	effectdata:SetRadius( 150 )
	util.Effect( "Sparks", effectdata, true, true )

	-- Smoke screen
	for i = 1,12 do
		local EffectCode = Emitter:Add("particles/smokey",self.Pos)
		EffectCode:SetVelocity(Vector(math.random(-5,5),math.random(-40,40),math.random(5,15)))
		EffectCode:SetDieTime(math.Rand(5,7)) -- How much time until it dies
		EffectCode:SetStartAlpha(math.Rand(220,230)) -- Transparency
		EffectCode:SetStartSize(math.Rand(100,105)) -- Size of the effect
		EffectCode:SetEndSize(math.Rand(200,300)) -- Size of the effect at the end (The effect slowly trasnsforms to this size)
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
/*--------------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/