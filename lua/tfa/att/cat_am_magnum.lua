if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Magnum Ammunition"
ATTACHMENT.ShortName = "MAGNUM" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Switch to heavier ammunition", TFA.Attachments.Colors["+"], "Increased damage", "Increased penetration", TFA.Attachments.Colors["-"], "Increased recoil", "Increased spread"  }
ATTACHMENT.Icon = "entities/Magnum_Bullet.png" 
ATTACHMENT.TFADataVersion = TFA.LatestDataVersion

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function( wep, stat ) return stat * 1.15 end,
		["Spread"] = function( wep, stat ) return stat * 1.2 end,
		["IronAccuracy"] = function( wep, stat ) return stat * 1.2 end,
		["KickUp"] = function( wep, stat ) return stat * 1.2 end,
		["KickDown"] = function( wep, stat ) return stat * 1.2 end,
		["Force"] = function( wep, stat ) return stat * 1.25 end,
		["Kickback"] = function( wep, stat ) return stat * 1.25 end,
		["PenetrationPower"] = function( wep, stat ) return stat * 1.25 end,
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
