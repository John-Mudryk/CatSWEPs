if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Light Stock"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Utilize a lighter stock", TFA.Attachments.Colors["+"], "Increased Mobility", "Decreased hip-fire spread", TFA.Attachments.Colors["-"], "Increased aiming spread", "Increased recoil" }
ATTACHMENT.Icon = "entities/gun-stock.png"
ATTACHMENT.ShortName = "LIGHT"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["KickUp"] = function(wep,stat) return stat * 1.1 end,
		["KickDown"] = function(wep,stat) return stat * 1.1 end,
		["KickHorizontal"] = function(wep,stat) return stat * 1.1 end,
		["Spread"] = function(wep,stat) return stat * .65 end,
		["IronAccuracy"] = function(wep,stat) return stat * 1.25 end
	},
	["MoveSpeed"] = function(wep,stat) return stat * 1.1 end,
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 1.25 end,
["VElements"] = {
		["autogun"] = {
			["bodygroup"] = {[5] = 1},
		},
		["lucius"] = {
			["bodygroup"] = {[5] = 1},
		},
		["luciusH"] = {
			["bodygroup"] = {[6] = 1},
		},
		["lasgunG"] = {
			["bodygroup"] = {[2] = 1},
		},
		["lascarbineG"] = {
			["bodygroup"] = {[2] = 1},
		},
		["longlasV"] = {
			["bodygroup"] = {[2] = 1},
		},
		["lasgunK"] = {
			["bodygroup"] = {[2] = 1},
		},
		["lascarbineK"] = {
			["bodygroup"] = {[2] = 1},
		},
		["longlasKW"] = {
			["bodygroup"] = {[2] = 1},
		},
		["stubber"] = {
			["bodygroup"] = {[5] = 1},
		},
	},
["WElements"] = {
		["autogunW"] = {
			["bodygroup"] = {[5] = 1},
		},
		["luciusW"] = {
			["bodygroup"] = {[5] = 1},
		},
		["luciusHW"] = {
			["bodygroup"] = {[6] = 1},
		},
		["lasgunGW"] = {
			["bodygroup"] = {[2] = 1},
		},
		["lascarbineGW"] = {
			["bodygroup"] = {[2] = 1},
		},
		["longlasVW"] = {
			["bodygroup"] = {[2] = 1},
		},
		["lasgunKW"] = {
			["bodygroup"] = {[2] = 1},
		},
		["lascarbineKW"] = {
			["bodygroup"] = {[2] = 1},
		},
		["longlasKW"] = {
			["bodygroup"] = {[2] = 1},
		},
		["stubberW"] = {
			["bodygroup"] = {[5] = 1},
		},
	},
}


function ATTACHMENT:Attach(wep)
	Weapon_act = wep:GetClass()
	if 	(	Weapon_act == "cat_custom_lasgun" || 
			Weapon_act == "cat_custom_autogun"|| 
			Weapon_act == "cat_custom_lascarbine"
		) then
		wep.Bodygroups_W = {
			[4] = 0
		}
		wep.Bodygroups_V = {
			[4] = 0
		}
	elseif 	(	Weapon_act == "cat_custom_autorifle" || 
				Weapon_act == "cat_custom_shotgun" || 
				Weapon_act == "cat_custom_stubber" || 
				Weapon_act == "weapon_astra_stabber"
			) then
		wep.Bodygroups_W = {
			[3] = 0
		}
		wep.Bodygroups_V = {
			[3] = 0
		}
	elseif Weapon_act == "cat_custom_longlas" then
		wep.Bodygroups_W = {
			[3] = 2
		}
		wep.Bodygroups_V = {
			[3] = 2
		}
	end
	NewSpread = wep["Primary"]["Spread"]
	if NewSpread <= 0.25 then
		NewSpread = 0.00000001
	else
		NewSpread = NewSpread - 0.25
	end

	JamChance = wep["JamChance"]

	wep.JamChance = JamChance - 0.10 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

function ATTACHMENT:Detach(wep)
	if 	(	Weapon_act == "cat_custom_lasgun" ||
			Weapon_act == "cat_custom_autogun" || 
			Weapon_act == "cat_custom_lascarbine"
		) then
		wep.Bodygroups_W = {
			[4] = 1
		}
		wep.Bodygroups_V = {
			[4] = 1
		}
	elseif  (	Weapon_act == "cat_custom_autorifle" || 
				Weapon_act == "cat_custom_shotgun" || 
				Weapon_act == "cat_custom_stubber"
				) then
		wep.Bodygroups_W = {
			[3] = 1
		}
		wep.Bodygroups_V = {
			[3] = 1
		}
	elseif Weapon_act == "cat_custom_longlas" then
		wep.Bodygroups_W = {
			[3] = 0
		}
		wep.Bodygroups_V = {
			[3] = 0
		}
	end
	wep.JamChance = JamChance  -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
