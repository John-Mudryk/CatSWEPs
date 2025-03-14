if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Overcharge"
ATTACHMENT.ShortName = "OVER" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Higher damage per shot", TFA.Attachments.Colors["-"], "More recoil", "More spread","Triple waste of magazine"  }
ATTACHMENT.Icon = "entities/effect_cat_hellgun_big.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Sound"] = Sound("weapons/lasrgun.wav"),	
		["Damage"] = function( wep, stat ) return stat * 1.85 end,
		["Spread"] = function( wep, stat ) return stat * 1.2 end,
		["IronAccuracy"] = function( wep, stat ) return stat * 1.1 end,
		["KickUp"] = function( wep, stat ) return stat * 1.2 end,
		["KickDown"] = function( wep, stat ) return stat * 1.2 end,
		["RPM"] = function( wep, stat ) return stat * 0.65 end,
		["StaticRecoilFactor"] = function( wep, stat ) return stat * 1.2 end,
		["AmmoConsumption"] = 3,
		["Force"] = function( wep, stat ) return stat * 1.25 end,
		["Kickback"] = function( wep, stat ) return stat * 1.25 end,
		["PenetrationPower"] = function( wep, stat ) return stat * 1.25 end,
	}
}

function ATTACHMENT:Attach( wep )
	wep.ImpactEffectUsed = false
	wep.TracerName = "tracer_laser_big_hot"
end

function ATTACHMENT:Detach( wep )
	wep.ImpactEffectUsed = false
	wep.ImpactDecal = nil
	wep.TracerName 		= "effect_cat_lasgun_hell"
end


if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
