if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Low Charge"
ATTACHMENT.ShortName = "LOW" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Set weapon to lower intensity", TFA.Attachments.Colors["+"], "Increased fire-rate", "Decreased spread", "Decreased recoil", TFA.Attachments.Colors["-"], "Decreased damage", "Decreased penetration" }
ATTACHMENT.Icon = "entities/effect_cat_laser__hell_over.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Sound"] = Sound("weapons/lasgun/ig_lasgun_fire3.wav"),	
		["Damage"] = function( wep, stat ) return stat * 0.65 end,
		["Spread"] = function( wep, stat ) return stat * 0.8 end,
		["IronAccuracy"] = function( wep, stat ) return stat * 0.9 end,
		["KickUp"] = function( wep, stat ) return stat * 0.8 end,
		["KickDown"] = function( wep, stat ) return stat * 0.8 end,
		["RPM"] = function( wep, stat ) return stat * 1.5 end,
		["StaticRecoilFactor"] = function( wep, stat ) return stat * 0.8 end,
		["Force"] = function( wep, stat ) return stat * 0.75 end,
		["Kickback"] = function( wep, stat ) return stat * 0.75 end,
		["PenetrationPower"] = function( wep, stat ) return stat * 0.75 end,
	}
}

function ATTACHMENT:Attach( wep )
	wep.ImpactEffectUsed = false
	wep.TracerName = "hellgunlaser"
end

function ATTACHMENT:Detach( wep )
	wep.ImpactEffectUsed = false
	wep.ImpactDecal = niull
	wep.TracerName 		= "effect_cat_lasgun_hell"
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
