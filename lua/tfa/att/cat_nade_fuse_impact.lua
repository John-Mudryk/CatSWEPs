if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Impact Fuze"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Set Fuze to explode on impact" }
ATTACHMENT.Icon = "entities/fuse_impact.png"
ATTACHMENT.ShortName = "IMPACT"

ATTACHMENT.WeaponTable = {
	["Velocity"] = function( wep, stat ) return stat * 2 end,
	["Velocity_Underhand"] = function( wep, stat ) return stat * 2 end,
}


function ATTACHMENT:Attach(wep)
end

function ATTACHMENT:Detach(wep)
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
