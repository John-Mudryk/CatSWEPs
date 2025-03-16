if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Heavy Stock"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Utilize a heavier stock", TFA.Attachments.Colors["+"], "Decreased aiming spread", "Decreased recoil", TFA.Attachments.Colors["-"], "Increased hip-fire spread", "Decreased mobility" }
ATTACHMENT.Icon = "entities/gun-stock.png" 
ATTACHMENT.ShortName = "HEAVY"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["KickUp"] = function(wep,stat) return stat * 0.6 end,
		["KickDown"] = function(wep,stat) return stat * 0.6 end,
		["KickHorizontal"] = function(wep,stat) return stat * 0.6 end,
		["Spread"] = function(wep,stat) return stat * 1.3 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.75 end
	},
	["MoveSpeed"] = function(wep,stat) return stat - 0.05 end,
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.95 end,
["VElements"] = {
		["laspistolA"] = {
			["bodygroup"] = {[2] = 1},
		},
		["laspistolK"] = {
			["bodygroup"] = {[2] = 1},
		},
		["bolterG"] = {
			["bodygroup"] = {[6] = 1},
		},
		["bolterGC"] = {
			["bodygroup"] = {[4] = 1},
		},
		["bolterH"] = {
			["bodygroup"] = {[5] = 1},
		},
		["shotgunA"] = {
			["bodygroup"] = {[1] = 2},
		},

	},
["WElements"] = {
		["laspistolAW"] = {
			["bodygroup"] = {[2] = 1},
		},
		["laspistolKW"] = {
			["bodygroup"] = {[2] = 1},
		},
		["bolterG"] = {
			["bodygroup"] = {[6] = 1},
		},
		["bolterGC"] = {
			["bodygroup"] = {[4] = 1},
		},
		["bolterH"] = {
			["bodygroup"] = {[5] = 1},
		},
		["shotgunA"] = {
			["bodygroup"] = {[1] = 2},
		},
	},
}


function ATTACHMENT:Attach(wep)
	Weapon_act = wep:GetClass()
	if 	(	Weapon_act == "cat_custom_lasgun" || 
			Weapon_act == "cat_custom_autogun"|| 
			Weapon_act == "."
		) then
		wep.Bodygroups_W = {
			[4] = 3
		}
		wep.Bodygroups_V = {
			[4] = 3
		}
	elseif 	(	Weapon_act == "cat_custom_autorifle"|| 
			Weapon_act == "cat_custom_stubber" 
			) then
		wep.Bodygroups_W = {
			[3] = 3
		}
		wep.Bodygroups_V = {
			[3] = 3
		}
	elseif Weapon_act == "cat_custom_lascarbine" then
		wep.Bodygroups_W = {
			[4] = 2
		}
		wep.Bodygroups_V = {
			[4] = 2
		}
	elseif 	(	Weapon_act == "cat_custom_shotgun" 
			) then
		wep.Bodygroups_W = {
			[3] = 3
		}
		wep.Bodygroups_V = {
			[3] = 3
		}
	end

	JamChance = wep["JamChance"]

	wep.JamChance = JamChance - 0.10 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

function ATTACHMENT:Detach(wep)
	if 	(	Weapon_act == "cat_custom_lasgun" ||
			Weapon_act == "cat_custom_autogun" || 
			Weapon_act == "."
		) then
		wep.Bodygroups_W = {
			[4] = 1
		}
		wep.Bodygroups_V = {
			[4] = 1
		}
	elseif  (	Weapon_act == "cat_custom_autorifle" || 
				Weapon_act == "cat_custom_stubber"
				) then
		wep.Bodygroups_W = {
			[3] = 1
		}
		wep.Bodygroups_V = {
			[3] = 1
		}
	elseif Weapon_act == "cat_custom_lascarbine" then
		wep.Bodygroups_W = {
			[4] = 1
		}
		wep.Bodygroups_V = {
			[4] = 1
		}
	elseif 	(	Weapon_act == "cat_custom_shotgun" 
			) then
		wep.Bodygroups_W = {
			[3] = 1
		}
		wep.Bodygroups_V = {
			[3] = 1
		}
	end
	wep.JamChance = JamChance  -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
