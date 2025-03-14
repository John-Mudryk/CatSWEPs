if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Improved Grip"
--ATTACHMENT.ID = "base" normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "Slightly improves accuracy", TFA.AttachmentColors["+"], "Better recoil control", }
ATTACHMENT.Icon = "entities/grip_icon.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "GRIP"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["KickUp"] = function(wep,stat) return stat * 0.85 end,
		["KickDown"] = function(wep,stat) return stat * 0.85 end,
		["KickHorizontal"] = function(wep,stat) return stat * 0.85 end,
		["Spread"] = function(wep,stat) return stat * 0.95 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.95 end
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.95 end,
	["VElements"] = {
		["bolterCH"] = {
			["bodygroup"] = {[2] = 1},
		},
		["bolterG"] = {
			["bodygroup"] = {[7] = 0},
		},
		["bolterP"] = {
			["bodygroup"] = {[5] = 1},
		},
		["bolterT"] = {
			["bodygroup"] = {[5] = 1},
		},
		["bolterU"] = {
			["bodygroup"] = {[5] = 1},
		},
		["bolterH"] = {
			["bodygroup"] = {[4] = 1},
		},

	},
	["WElements"] = {
		["bolterCH"] = {
			["bodygroup"] = {[2] = 1},
		},
		["bolterG"] = {
			["bodygroup"] = {[7] = 0},
		},
		["bolterP"] = {
			["bodygroup"] = {[5] = 1},
		},
		["bolterT"] = {
			["bodygroup"] = {[5] = 1},
		},
		["bolterU"] = {
			["bodygroup"] = {[5] = 1},
		},
		["bolterH"] = {
			["bodygroup"] = {[4] = 1},
		},
	},
}

function ATTACHMENT:Attach(wep)
	Weapon_act = wep:GetClass()
	if 	(	Weapon_act == "cat_custom_bolter" || 
			Weapon_act == "cat_custom_bolterastartes"
		) then
		wep.Bodygroups_W = {
			[5] = 1
		}
		wep.Bodygroups_V = {
			[5] = 1
		}
	end
	JamChance = wep["JamChance"]

	wep.JamChance = JamChance - 0.10 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

function ATTACHMENT:Detach(wep)
Weapon_act = wep:GetClass()
	if 	(	Weapon_act == "cat_custom_bolter" || 
			Weapon_act == "cat_custom_bolterastartes"
		) then
		wep.Bodygroups_W = {
			[5] = 0
		}
		wep.Bodygroups_V = {
			[5] = 0
		}
	end
end
if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end