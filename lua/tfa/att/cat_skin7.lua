if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Red Paint"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Change paint colour" }
ATTACHMENT.Icon = "entities/skin7.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "RED"

ATTACHMENT.WeaponTable = {
["VElements"] = {
		["lasgunK"] = {
			["skin"] = 7,
		},
		["lascarbineK"] = {
			["skin"] = 7,
		},
		["lasgunG"] = {
			["skin"] = 7,
		},
		["lascarbineG"] = {
			["skin"] = 7,
		},
		["longlasK"] = {
			["skin"] = 7,
		},
		["longlasV"] = {
			["skin"] = 7,
		},
		["laspistolA"] = {
			["skin"] = 7,
		},
		["laspistolK"] = {
			["skin"] = 7,
		},
	},
	["WElements"] = {
		["lasgunKW"] = {
			["skin"] = 7,
		},
		["lascarbineKW"] = {
			["skin"] = 7,
		},
		["lasgunGW"] = {
			["skin"] = 7,
		},
		["lascarbineGW"] = {
			["skin"] = 7,
		},
		["longlasKW"] = {
			["skin"] = 7,
		},
		["longlasVW"] = {
			["skin"] = 7,
		},
		["laspistolAW"] = {
			["skin"] = 7,
		},
		["laspistolKW"] = {
			["skin"] = 7,
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
