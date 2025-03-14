--[[
Server Name: [RU] Age Of Dark - Warhammer 40k Hard RP
Server IP:   142.44.176.80:27015
File Path:   addons/w40ktfaatweapons/lua/effects/timestop/init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

function EFFECT:Init( data )
	
	self.Position = data:GetOrigin()
	self.Position:Add( Vector( 0, 0, 35 ) )
	self.Speed = data:GetMagnitude()

	self.Speed = self.Speed-4

	local emitter = ParticleEmitter( self.Position )
	local particle = emitter:Add( "Effects/strider_pinch_dudv", self.Position)

	particle:SetVelocity( Vector( 0, 0, 0))
	particle:SetDieTime(2)
	particle:SetStartAlpha(255)
	particle:SetEndAlpha(255)
	particle:SetStartSize(500)
	particle:SetEndSize(0)
	particle:SetRoll( math.Rand( -10,10  ) )
	particle:SetRollDelta(math.Rand( -2, 2 ))
	particle:SetColor( 0, 0, 0)			

	emitter:Finish()
end


function EFFECT:Think( )
	return false	
end

function EFFECT:Render()

end



