if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Dark Green Paint"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Change paint colour" }
ATTACHMENT.Icon = "entities/skin2.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "DARK GREEN"

ATTACHMENT.WeaponTable = {
["VElements"] = {
		["lasgunK"] = {
			["skin"] = 2,
		},
		["lascarbineK"] = {
			["skin"] = 2,
		},
		["lasgunG"] = {
			["skin"] = 2,
		},
		["lascarbineG"] = {
			["skin"] = 2,
		},
		["laspistolA"] = {
			["skin"] = 2,
		},
		["laspistolK"] = {
			["skin"] = 2,
		},
	},
	["WElements"] = {
		["lasgunKW"] = {
			["skin"] = 2,
		},
		["lascarbineKW"] = {
			["skin"] = 2,
		},
		["lasgunGW"] = {
			["skin"] = 2,
		},
		["lascarbineGW"] = {
			["skin"] = 2,
		},
		["laspistolAW"] = {
			["skin"] = 2,
		},
		["laspistolKW"] = {
			["skin"] = 2,
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
