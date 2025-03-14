if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Melta Missile"
ATTACHMENT.ShortName = "MELTA"
ATTACHMENT.Icon = "particles/flamelet5"
ATTACHMENT.Description = { 
    --TFA.AttachmentColors["="], "", 
    TFA.AttachmentColors["="], "Melta warhead", TFA.AttachmentColors["+"], "250% higher explosive radius", TFA.AttachmentColors["+"], "1000% more damage",
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
