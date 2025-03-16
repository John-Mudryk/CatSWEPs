if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Tan Paint"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Change paint colour" }
ATTACHMENT.Icon = "entities/skin5.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "GREY"

ATTACHMENT.WeaponTable = {
["VElements"] = {
		["lasgunK"] = {
			["skin"] = 5,
		},
		["lascarbineK"] = {
			["skin"] = 5,
		},
		["lasgunG"] = {
			["skin"] = 5,
		},
		["lascarbineG"] = {
			["skin"] = 5,
		},
		["laspistolA"] = {
			["skin"] = 5,
		},
		["laspistolK"] = {
			["skin"] = 5,
		},
	},
	["WElements"] = {
		["lasgunKW"] = {
			["skin"] = 5,
		},
		["lascarbineKW"] = {
			["skin"] = 5,
		},
		["lasgunGW"] = {
			["skin"] = 5,
		},
		["lascarbineGW"] = {
			["skin"] = 5,
		},
		["laspistolAW"] = {
			["skin"] = 5,
		},
		["laspistolKW"] = {
			["skin"] = 5,
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
