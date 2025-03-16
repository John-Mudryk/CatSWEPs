if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Armour Piercing Rounds"
ATTACHMENT.ShortName = "AP" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Switch to armour-piercing ammunition", TFA.Attachments.Colors["+"], "Increased Penetration", "Increased damage", TFA.Attachments.Colors["-"], "Increased recoil", "Increased spread"  }
ATTACHMENT.Icon = "entities/ArmourPiercing_Bullet.png"
ATTACHMENT.TFADataVersion = TFA.LatestDataVersion

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["DamageType"] = function(wep,stat) return DMG_AIRBOAT end,
		["Damage"] = function( wep, stat ) return stat * 1.05 end,
		["Spread"] = function( wep, stat ) return stat * 1.1 end,
		["IronAccuracy"] = function( wep, stat ) return stat * 1.1 end,
		["PenetrationPower"] = function( wep, stat ) return stat * 3 end,
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
