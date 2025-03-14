if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Grey Paint"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Change paint colour" }
ATTACHMENT.Icon = "entities/skin1.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "GREY"

ATTACHMENT.WeaponTable = {
["VElements"] = {
		["lasgunK"] = {
			["skin"] = 1,
		},
		["lascarbineK"] = {
			["skin"] = 1,
		},
		["lasgunG"] = {
			["skin"] = 1,
		},
		["lascarbineG"] = {
			["skin"] = 1,
		},
		["laspistolA"] = {
			["skin"] = 1,
		},
		["laspistolK"] = {
			["skin"] = 1,
		},
	},
	["WElements"] = {
		["lasgunKW"] = {
			["skin"] = 1,
		},
		["lascarbineKW"] = {
			["skin"] = 1,
		},
		["lasgunGW"] = {
			["skin"] = 1,
		},
		["lascarbineGW"] = {
			["skin"] = 1,
		},
		["laspistolAW"] = {
			["skin"] = 1,
		},
		["laspistolKW"] = {
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
