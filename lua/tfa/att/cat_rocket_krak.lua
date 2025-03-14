if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Krak Missile"
ATTACHMENT.ShortName = "KRAK"
ATTACHMENT.Icon = "particles/flamelet4"
ATTACHMENT.Description = { 
    --TFA.AttachmentColors["="], "", 
    TFA.AttachmentColors["="], "Krak warhead", TFA.AttachmentColors["+"], "350% damage", TFA.AttachmentColors["-"], "83% less explosive radius", 
}

ATTACHMENT.WeaponTable = {
	["VElements"] = {},
	["WElements"] = {},
	["Primary"] = {
		["Damage"] = function( wep, stat ) return stat * 3.5 end,
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
