if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Match Rounds"
ATTACHMENT.ShortName = "MATCH" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Load lighter, more reliable ammunition", TFA.AttachmentColors["+"], "Increased accuracy", "Decreased recoil", TFA.Attachments.Colors["-"], "Decreased damage", "Decreased penetration"  }
ATTACHMENT.Icon = "entities/FMJ_Bullet.png" 
ATTACHMENT.TFADataVersion = TFA.LatestDataVersion

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["SpreadIncrement"] = function( wep, stat ) return stat * 0.9 end,
		["SpreadRecovery"] = function( wep, stat ) return stat * 1.25 end,
		["IronAccuracy"] = function( wep, stat ) return stat * 0.9 end,
		["Spread"] = function( wep, stat ) return stat * 0.9 end,
		["KickUp"] = function( wep, stat ) return stat * 0.9 end,
		["Damage"] = function( wep, stat ) return stat * 0.9 end,
		["KickDown"] = function( wep, stat ) return stat * 0.9 end,
		["Recoil"] = function( wep, stat ) return stat * 0.9 end,
		["Force"] = function( wep, stat ) return stat * 0.75 end,
		["Kickback"] = function( wep, stat ) return stat * 0.75 end,
		["PenetrationPower"] = function( wep, stat ) return stat * 0.85 end,
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
