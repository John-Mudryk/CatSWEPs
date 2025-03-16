if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Chain Bayonet"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Affix chain bayonet", TFA.Attachments.Colors["+"], "Increased Bash Damage", "Decreased Recoil", TFA.Attachments.Colors["-"], "Increased hip-fire spread", "Decreased mobility" }
ATTACHMENT.Icon = "entities/chainbayonet_icon.png"
ATTACHMENT.ShortName = "CHAIN"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["KickUp"] = function(wep,stat) return stat * 0.7 end,
		["KickDown"] = function(wep,stat) return stat * 0.7 end,
		["KickHorizontal"] = function(wep,stat) return stat * 0.7 end,
		["Spread"] = function(wep,stat) return stat * 1.065 end,
	},
	["MoveSpeed"] = function(wep,stat) return stat - 0.03 end,
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.95 end,
	["Secondary"] = {
		["BashDamage"] = function(wep,stat) return stat * 5 end,
		["BashSound"] = function(wep,stat) return "chainhit.wav" end,
	},
["VElements"] = {
		["knife2"] = {
			active = true,
		},
		["bolterG"] = {
			["bodygroup"] = {[2] = 3},
		},
		["bolterP"] = {
			["bodygroup"] = {[3] = 3},
		},
		["bolterT"] = {
			["bodygroup"] = {[4] = 3},
		},
		["bolterU"] = {
			["bodygroup"] = {[2] = 3},
		},


	},
	["WElements"] = {
		["knife2"] = {
			active = true,
		}, 
		["bolterG"] = {
			["bodygroup"] = {[2] = 3},
		},
		["bolterP"] = {
			["bodygroup"] = {[3] = 3},
		},
		["bolterT"] = {
			["bodygroup"] = {[4] = 3},
		},
		["bolterU"] = {
			["bodygroup"] = {[2] = 3},
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
