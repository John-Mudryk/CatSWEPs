if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Blue Paint"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Change paint colour" }
ATTACHMENT.Icon = "entities/skin4.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "BLUE"

ATTACHMENT.WeaponTable = {
["VElements"] = {
		["lasgunK"] = {
			["skin"] = 4,
		},
		["lascarbineK"] = {
			["skin"] = 4,
		},
		["lasgunG"] = {
			["skin"] = 4,
		},
		["lascarbineG"] = {
			["skin"] = 4,
		},
		["longlasK"] = {
			["skin"] = 4,
		},
		["longlasV"] = {
			["skin"] = 4,
		},
		["laspistolA"] = {
			["skin"] = 4,
		},
		["laspistolK"] = {
			["skin"] = 4,
		},
	},
	["WElements"] = {
		["lasgunKW"] = {
			["skin"] = 4,
		},
		["lascarbineKW"] = {
			["skin"] = 4,
		},
		["lasgunGW"] = {
			["skin"] = 4,
		},
		["lascarbineGW"] = {
			["skin"] = 4,
		},
		["longlasKW"] = {
			["skin"] = 4,
		},
		["longlasVW"] = {
			["skin"] = 4,
		},
		["laspistolAW"] = {
			["skin"] = 4,
		},
		["laspistolKW"] = {
			["skin"] = 4,
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
