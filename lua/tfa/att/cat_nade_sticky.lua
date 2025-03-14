if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Sticky Toggle"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Toggle the magnetic attachment method" }
ATTACHMENT.Icon = "entities/fuse_sticky.png"
ATTACHMENT.ShortName = "STICKY"

ATTACHMENT.WeaponTable = {
}


function ATTACHMENT:Attach(wep)
end

function ATTACHMENT:Detach(wep)
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
