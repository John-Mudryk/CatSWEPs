if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "High Explosive Missile"
ATTACHMENT.ShortName = "HE"
ATTACHMENT.Icon = "particles/flamelet3"
ATTACHMENT.Description = { 
    --TFA.AttachmentColors["="], "", 
    TFA.AttachmentColors["="], "High explosive warhead", TFA.AttachmentColors["+"], "200% higher explosive radius", TFA.AttachmentColors["-"], "25% less damage",
}

ATTACHMENT.WeaponTable = {
	["VElements"] = {},
	["WElements"] = {},
	["Primary"] = {
		["Damage"] = function( wep, stat ) return stat * 0.75 end,
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
