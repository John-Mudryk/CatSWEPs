if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Training Setting"
ATTACHMENT.ShortName = "TRAINING" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Switch to Training setting", TFA.Attachments.Colors["-"], "90% less damage"  }
ATTACHMENT.Icon = "entities/caution-15.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.TFADataVersion = TFA.LatestDataVersion

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function( wep, stat ) return stat * 0.1 end,
	},
	["Secondary"] = {
		["BashDamage"] = function( wep, stat ) return stat * 0.1 end,
	}
}
function ATTACHMENT:Attach(wep)
end

function ATTACHMENT:Detach(wep)
end
if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
