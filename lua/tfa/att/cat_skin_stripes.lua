if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Striped Paint"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Change paint colour" }
ATTACHMENT.Icon = "entities/skinhazard.png"
ATTACHMENT.ShortName = "STRIPE"

ATTACHMENT.WeaponTable = {
["VElements"] = {
		["chainswordCH"] = {
			["skin"] = 17,
		},
		["bolterG"] = {
			["skin"] = 1,
		},
 		["bolterH"] = {
			["skin"] = 3,
		},
 		["bolterU"] = {
			["skin"] = 1,
		},
 		["chainsword"] = {
			["skin"] = 9,
		},
 		["stormbolterT"] = {
			["skin"] = 1,
		},
	},
	["WElements"] = {
		["chainswordCH"] = {
			["skin"] = 17,
		},
		["bolterG"] = {
			["skin"] = 1,
		},
 		["bolterH"] = {
			["skin"] = 3,
		},
 		["bolterU"] = {
			["skin"] = 1,
		},
 		["chainsword"] = {
			["skin"] = 9,
		},
 		["stormbolterT"] = {
			["skin"] = 1,
		},
	},
}


function ATTACHMENT:Attach(wep)

end

function ATTACHMENT:Detach(wep)

end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
