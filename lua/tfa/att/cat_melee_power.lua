if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Power Field"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Toggle the power field" }
ATTACHMENT.Icon = "entities/melee_powerfield.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "Руна"


ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["gun"] = {
			["skin"] = 0
		},
		["gun0"] = {
			["skin"] = 0
		},
		["gun1"] = {
			["skin"] = 0
		},
		["gun2"] = {
			["skin"] = 0
		},
		["gun3"] = {
			["skin"] = 0
		},
		["gun4"] = {
			["skin"] = 0
		},
		["gun5"] = {
			["skin"] = 0
		},
		["gun6"] = {
			["skin"] = 0
		},
	},	
	["WElements"] = {
		["gun"] = {
			["skin"] = 0
		},
		["gun0"] = {
			["skin"] = 0
		},
		["gun1"] = {
			["skin"] = 0
		},
		["gun2"] = {
			["skin"] = 0
		},
		["gun3"] = {
			["skin"] = 0
		},
		["gun4"] = {
			["skin"] = 0
		},
		["gun5"] = {
			["skin"] = 0
		},
		["gun6"] = {
			["skin"] = 0
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