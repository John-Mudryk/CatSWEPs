if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Melta Missile"
ATTACHMENT.ShortName = "MELTA"
ATTACHMENT.Icon = "particles/flamelet5"
ATTACHMENT.Description = { 
    --TFA.AttachmentColors["="], "", 
    TFA.AttachmentColors["="], "Load melta warheads", TFA.AttachmentColors["+"], "Increased area of effect", "Increased damage",
}

ATTACHMENT.WeaponTable = {
	["VElements"] = {},
	["WElements"] = {},
	["Primary"] = {
		["Damage"] = function( wep, stat ) return stat * 10 end,
	},
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
