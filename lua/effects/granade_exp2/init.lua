//Main function
function EFFECT:Init(data)

	//Create particle emitter
	local emitter = ParticleEmitter(data:GetOrigin())

		//Amount of particles to create
		for i=0, 128 do

			//Safeguard
			if !emitter then return end

			local Pos = (data:GetOrigin() + Vector( math.Rand(-32,32), math.Rand(-32,32), math.Rand(-32,32) ) + Vector(0,0,64))

			local particle = emitter:Add( "particle/particle_smokegrenade", Pos )
			if (particle) then

				particle:SetVelocity(VectorRand() * math.Rand(1420,5200))

				particle:SetLifeTime(0)
				particle:SetDieTime(math.Rand(9, 15))

				local rand = math.random(205,255)
				particle:SetColor(30,rand,50)

				particle:SetStartAlpha(math.Rand(50,150))
				particle:SetEndAlpha(0)

				local Size = math.Rand(132,162)
				particle:SetStartSize(Size)
				particle:SetEndSize(Size)

				particle:SetRoll(math.Rand(-360, 360))
				particle:SetRollDelta(math.Rand(-0.21, 0.21))

				particle:SetAirResistance(math.Rand(520,620))

				particle:SetGravity( Vector(0, 0, math.Rand(-42, -82)) )

				particle:SetCollide(true)
				particle:SetBounce(0.55)

				particle:SetLighting(1)

			end

		end

	//We're done with this emitter
	emitter:Finish()

end

//Kill effect
function EFFECT:Think()
return false
end

//Not used
function EFFECT:Render()
end