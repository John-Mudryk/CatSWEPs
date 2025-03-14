if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Krak Grenade"
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "Higher damage", TFA.AttachmentColors["-"], "Lower area of effect"}
ATTACHMENT.Icon = "sprites/rico1_noz"
ATTACHMENT.ShortName = "KRAK"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep,stat) return stat * 3 end,
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
