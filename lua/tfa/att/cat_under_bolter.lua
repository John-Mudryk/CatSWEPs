
if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Combi-Bolter"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["="], "Enable second barrel", TFA.AttachmentColors["+"], "Double fire-rate", TFA.AttachmentColors["-"], "Increased spread" }
ATTACHMENT.Icon = "entities/cat_under_bolter.png"
ATTACHMENT.ShortName = "BOLTER"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
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
