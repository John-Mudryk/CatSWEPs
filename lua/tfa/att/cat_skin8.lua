if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Gold Paint"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Change paint colour" }
ATTACHMENT.Icon = "entities/skin8.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "GOLD"

ATTACHMENT.WeaponTable = {
["VElements"] = {
		["lasgunK"] = {
			["skin"] = 8,
		},
		["lascarbineK"] = {
			["skin"] = 8,
		},
		["lasgunG"] = {
			["skin"] = 8,
		},
		["lascarbineG"] = {
			["skin"] = 8,
		},
		["laspistolA"] = {
			["skin"] = 8,
		},
		["laspistolK"] = {
			["skin"] = 8,
		},
	},
	["WElements"] = {
		["lasgunKW"] = {
			["skin"] = 8,
		},
		["lascarbineKW"] = {
			["skin"] = 8,
		},
		["lasgunGW"] = {
			["skin"] = 8,
		},
		["lascarbineGW"] = {
			["skin"] = 8,
		},
		["laspistolAW"] = {
			["skin"] = 8,
		},
		["laspistolKW"] = {
			["skin"] = 8,
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
