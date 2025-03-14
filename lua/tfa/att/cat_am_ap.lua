if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Armour Piercing Ammunition"
ATTACHMENT.ShortName = "AP" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Increased Penetration", TFA.Attachments.Colors["+"], "5% more damage", TFA.Attachments.Colors["-"], "10% more recoil", TFA.Attachments.Colors["-"], "10% more spread"  }
ATTACHMENT.Icon = "entities/ArmourPiercing_Bullet.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.TFADataVersion = TFA.LatestDataVersion

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["DamageType"] = function(wep,stat) return DMG_AIRBOAT end,
		["Damage"] = function( wep, stat ) return stat * 1.05 end,
		["Spread"] = function( wep, stat ) return stat * 1.1 end,
		["IronAccuracy"] = function( wep, stat ) return stat * 1.1 end,
		["PenetrationPower"] = function( wep, stat ) return stat * 3 end,
		["KickUp"] = function( wep, stat ) return stat * 1.1 end,
		["KickDown"] = function( wep, stat ) return stat * 1.1 end
	}
}
function ATTACHMENT:Attach(wep)
	wep:Unload()
end

function ATTACHMENT:Detach(wep)
	wep:Unload()
end
if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
