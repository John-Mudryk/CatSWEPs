if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Camoflage Paint"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Change paint colour" }
ATTACHMENT.Icon = "entities/skin3.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "CAMO"

ATTACHMENT.WeaponTable = {
["VElements"] = {
		["lasgunK"] = {
			["skin"] = 3,
		},
		["lascarbineK"] = {
			["skin"] = 3,
		},
		["lasgunG"] = {
			["skin"] = 3,
		},
		["lascarbineG"] = {
			["skin"] = 3,
		},
		["laspistolA"] = {
			["skin"] = 3,
		},
		["laspistolK"] = {
			["skin"] = 3,
		},
	},
	["WElements"] = {
		["lasgunKW"] = {
			["skin"] = 3,
		},
		["lascarbineKW"] = {
			["skin"] = 3,
		},
		["lasgunGW"] = {
			["skin"] = 3,
		},
		["lascarbineGW"] = {
			["skin"] = 3,
		},
		["laspistolAW"] = {
			["skin"] = 3,
		},
		["laspistolKW"] = {
			["skin"] = 3,
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
