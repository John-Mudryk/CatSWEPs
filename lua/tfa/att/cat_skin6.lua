if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Black Paint"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Change paint colour" }
ATTACHMENT.Icon = "entities/skin6.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "BLACK"

ATTACHMENT.WeaponTable = {
["VElements"] = {
		["lasgunK"] = {
			["skin"] = 6,
		},
		["lascarbineK"] = {
			["skin"] = 6,
		},
		["lasgunG"] = {
			["skin"] = 6,
		},
		["lascarbineG"] = {
			["skin"] = 6,
		},
		["laspistolA"] = {
			["skin"] = 6,
		},
		["laspistolK"] = {
			["skin"] = 6,
		},
	},
	["WElements"] = {
		["lasgunKW"] = {
			["skin"] = 6,
		},
		["lascarbineKW"] = {
			["skin"] = 6,
		},
		["lasgunGW"] = {
			["skin"] = 6,
		},
		["lascarbineGW"] = {
			["skin"] = 6,
		},
		["laspistolAW"] = {
			["skin"] = 6,
		},
		["laspistolKW"] = {
			["skin"] = 6,
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
