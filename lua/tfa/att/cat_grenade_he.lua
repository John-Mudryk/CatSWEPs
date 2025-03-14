if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "High Explosive Grenade"
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "Higher area of effect", TFA.AttachmentColors["-"], "Lower damage"}
ATTACHMENT.Icon = "particles/flamelet5"
ATTACHMENT.ShortName = "HE"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep,stat) return stat * 0.75 end,
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
