
if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Combi-Bolter"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "Enable second barrel", "Doubles fire-rate", TFA.AttachmentColors["-"], "Decreases accuracy" }
ATTACHMENT.Icon = "entities/cat_under_bolter.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "BOLTER"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["KickUp"] = function(wep,stat) return stat * 1 end,
		["KickDown"] = function(wep,stat) return stat * 1 end,
		["Spread"] = function(wep,stat) return stat * 1.1 end,
		["IronAccuracy"] = function(wep,stat) return stat * 1.1 end,
		["RPM"] = function(wep,stat) return stat * 2 end
	},
}

function ATTACHMENT:Attach( wep )
end

function ATTACHMENT:Detach( wep )
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
