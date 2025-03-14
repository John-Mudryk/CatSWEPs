
if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Marking Phosphor"
ATTACHMENT.ShortName = "MARK" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Leaving a burning beacon on the target for allies to focus on" }
ATTACHMENT.Icon = "particle/fire" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Spread"] = function( wep, stat ) return stat end,
		["IronAccuracy"] = function( wep, stat ) return stat end
	}
}

function ATTACHMENT:Attach(wep)
	wep:Unload()

	print("phosphor attached")
end

function ATTACHMENT:Detach(wep)
	wep:Unload()
end

function ATTACHMENT:CustomBulletCallback(wep, attacker, trace, dmginfo)
	if IsValid(trace.Entity) then
		local target = trace.Entity
		if not (target:IsNPC() or (target:IsNextBot() or target.IV04NextBot) or target:IsPlayer()) then print("ent invalid") return end

		local timer_name_add = target:GetCreationID()
		local owner = self.Owner

		local dmg = DamageInfo()

		if IsValid( attacker ) then
			dmg:SetAttacker( attacker ) 
		else
			dmg:SetAttacker( trace.Entity ) 
		end

		dmg:SetInflictor( wep ) 
		dmg:SetDamage( 20 )
		dmg:SetDamageType( DMG_BURN )

		if ( target:Health() > 0 ) then
			ParticleEffectAttach("wk_explosives_grenade_rad_core", 4, target, math.Rand(1, 3))
			timer.Create( "phosphor" .. timer_name_add , 1, 10, function()  -- 'timer' is not like 'for', firstly it takes 1 from repeats and then do function
				if ( !target:IsValid() || target:Health() <= 0 ) then 
					timer.Remove("phosphor" .. timer_name_add)
				elseif ( timer.RepsLeft( "phosphor" .. timer_name_add ) <= 0 ) then
					target:TakeDamageInfo( dmg )
					timer.Remove("phosphor" .. timer_name_add)
					target:StopParticles()
				else
					if not IsValid( dmg:GetAttacker()  ) then
						dmg:SetAttacker( target ) 
					end
					target:TakeDamageInfo( dmg ) 
				end
			end)
		end
	end
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
