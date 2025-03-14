if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Short Fuze"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Set Fuze time to 3 seconds" }
ATTACHMENT.Icon = "entities/fuse_3.png"
ATTACHMENT.ShortName = "SHORT"

ATTACHMENT.WeaponTable = {
}


function ATTACHMENT:Attach(wep)
end

function ATTACHMENT:Detach(wep)
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
