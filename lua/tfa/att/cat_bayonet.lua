if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Bayonet"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Better bash damage and recoil", TFA.Attachments.Colors["-"], "Slightly worse hip-fire spread and movespeed" }
ATTACHMENT.Icon = "entities/Bayonet_icon.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "KNIFE"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["KickUp"] = function(wep,stat) return stat * 0.8 end,
		["KickDown"] = function(wep,stat) return stat * 0.8 end,
		["KickHorizontal"] = function(wep,stat) return stat * 0.8 end,
		["Spread"] = function(wep,stat) return stat * 1.05 end,
	},
	["MoveSpeed"] = function(wep,stat) return stat - 0.02 end,
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.95 end,
	["Secondary"] = {
		["BashDamage"] = function(wep,stat) return stat * 3 end,
	},
["VElements"] = {
		["lasgunK"] = {
			["bodygroup"] = {[4] = 0},
		},
		["lascarbineK"] = {
			["bodygroup"] = {[4] = 2},
		},
		["lasgunG"] = {
			["bodygroup"] = {[4] = 1},
		},
		["lascarbineG"] = {
			["bodygroup"] = {[4] = 2},
		},
		["lucius"] = {
			["bodygroup"] = {[3] = 1},
		},
		["luciusH"] = {
			["bodygroup"] = {[4] = 1},
		},
		["knife"] = {
			active = true,
		},

		["bolterCH"] = {
			["bodygroup"] = {[5] = 0},
		},
		["bolterCHC"] = {
			["bodygroup"] = {[3] = 1},
		},
		["bolterG"] = {
			["bodygroup"] = {[2] = 1},
		},
		["bolterP"] = {
			["bodygroup"] = {[3] = 1},
		},
		["bolterT"] = {
			["bodygroup"] = {[4] = 1},
		},
		["bolterU"] = {
			["bodygroup"] = {[2] = 1},
		},

	},
	["WElements"] = {
		["luciusHW"] = {
			["bodygroup"] = {[4] = 1},
		},
		["luciusW"] = {
			["bodygroup"] = {[3] = 1},
		},
		["lasgunGW"] = {
			["bodygroup"] = {[4] = 1},
		},
		["lasgunKW"] = {
			["bodygroup"] = {[4] = 0},
		},
		["lascarbineGW"] = {
			["bodygroup"] = {[4] = 2},
		},
		["lascarbineKW"] = {
			["bodygroup"] = {[4] = 2},
		},
		["knife"] = {
			active = true,
		}, 

		["bolterCH"] = {
			["bodygroup"] = {[5] = 0},
		},
		["bolterCHC"] = {
			["bodygroup"] = {[3] = 1},
		},
		["bolterG"] = {
			["bodygroup"] = {[2] = 1},
		},
		["bolterP"] = {
			["bodygroup"] = {[3] = 1},
		},
		["bolterT"] = {
			["bodygroup"] = {[4] = 1},
		},
		["bolterU"] = {
			["bodygroup"] = {[2] = 1},
		},
	},
}


function ATTACHMENT:Attach(wep)
	Weapon_act = wep:GetClass()
	if 	(	Weapon_act == "cat_custom_hellgunstandard" || 
			Weapon_act == "cat_custom_hellpistol"|| 
			Weapon_act == "."
		) then
		wep.Bodygroups_W = {
			[4] = 1
		}
		wep.Bodygroups_V = {
			[4] = 1
		}
	elseif 	(	Weapon_act == "cat_custom_lascarbine" || 
			Weapon_act == "cat_custom_lasgun"
			) then
		wep.Bodygroups_W = {
			[6] = 1
		}
		wep.Bodygroups_V = {
			[6] = 1
		}
	elseif 		Weapon_act == "cat_custom_shotgun"|| 
			Weapon_act == "cat_custom_stubber" 	then
		wep.Bodygroups_W = {
			[5] = 1
		}
		wep.Bodygroups_V = {
			[5] = 1
		}
	elseif 	(	Weapon_act == "cat_custom_autogun" 
			) then
		wep.Bodygroups_W = {
			[7] = 1
		}
		wep.Bodygroups_V = {
			[7] = 1
		}
	end

	JamChance = wep["JamChance"]

	wep.JamChance = JamChance - 0.10 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

function ATTACHMENT:Detach(wep)
	if 	(	Weapon_act == "cat_custom_hellgunstandard" || 
			Weapon_act == "cat_custom_hellpistol"|| 
			Weapon_act == "."
		) then
		wep.Bodygroups_W = {
			[4] = 0
		}
		wep.Bodygroups_V = {
			[4] = 0
		}
	elseif 	(	Weapon_act == "cat_custom_lascarbine" || 
			Weapon_act == "cat_custom_lasgun"
			) then
		wep.Bodygroups_W = {
			[6] = 0
		}
		wep.Bodygroups_V = {
			[6] = 0
		}
	elseif 		Weapon_act == "cat_custom_shotgun"|| 
			Weapon_act == "cat_custom_stubber" then
		wep.Bodygroups_W = {
			[5] = 0
		}
		wep.Bodygroups_V = {
			[5] = 0
		}
	elseif 	(	Weapon_act == "cat_custom_autogun" 
			) then
		wep.Bodygroups_W = {
			[7] = 0
		}
		wep.Bodygroups_V = {
			[7] = 0
		}
	end
	wep.JamChance = JamChance  -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
