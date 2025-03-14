if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Long Fuze"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Set Fuze time to 7 seconds" }
ATTACHMENT.Icon = "entities/fuse_7.png"
ATTACHMENT.ShortName = "LONG"

ATTACHMENT.WeaponTable = {
}


function ATTACHMENT:Attach(wep)
end

function ATTACHMENT:Detach(wep)
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
