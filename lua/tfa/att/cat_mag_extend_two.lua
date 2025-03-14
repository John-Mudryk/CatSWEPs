if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Extended Magazine"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Double magazine capacity"}
ATTACHMENT.Icon = "gm_construct/overlay_2" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "MAG 2X"

function ATTACHMENT:Attach( wep )
	wep:Unload()
	Weapon_act = wep:GetClass()

    -- Ensure SequenceTimeOverride exists
    	wep.SequenceTimeOverride = wep.SequenceTimeOverride or {}
    -- Adjust reload times based on attachment
    	local reloadTime = wep.SequenceTimeOverride[ACT_VM_RELOAD] or 1 -- Default multiplier if not set
    	local reloadEmptyTime = wep.SequenceTimeOverride[ACT_VM_RELOAD_EMPTY] or 1
    -- Apply modified reload times
    	wep.SequenceTimeOverride[ACT_VM_RELOAD] = reloadTime * 1.25
    	wep.SequenceTimeOverride[ACT_VM_RELOAD_EMPTY] = reloadEmptyTime * 1.25
	
	if 	Weapon_act == "cat_custom_autogun"||
		Weapon_act == "cat_custom_lascarbine"||
		Weapon_act == "cat_custom_lasgun"||
		Weapon_act == "cat_custom_hellgunstandard"
	then
		wep.Bodygroups_W = {
			[5] = 1
		}
		wep.Bodygroups_V = {
			[5] = 1
		}
	elseif  ( 	Weapon_act == "cat_custom_autorifle" ||
	   		Weapon_act == "cat_custom_bolter" ||
	    		Weapon_act == "cat_custom_shotgun" ||
			Weapon_act == "cat_custom_bolterastartes"  ||
			Weapon_act == "cat_custom_boardingshieldbolter"  ||
			Weapon_act == "cat_custom_boardingshield_bolterastartes"  ||
			Weapon_act == "cat_custom_laspistol" 
			) then
		wep.Bodygroups_W = {
			[4] = 1
		}
		wep.Bodygroups_V = {
			[4] = 1
		}
elseif  ( 	Weapon_act == "cat_custom_boltpistol" ||
	   	Weapon_act == "cat_custom_boltpistolastartes"
			) then
		wep.Bodygroups_W = {
			[4] = 3
		}
		wep.Bodygroups_V = {
			[4] = 2
		}
elseif  ( 	Weapon_act == "cat_custom_stormbolter" ||
	   	Weapon_act == "cat_custom_stormbolterastartes"||
	   	Weapon_act == "cat_custom_stormbolterterminator"
			) then
		wep.Bodygroups_W = {
			[1] = 2
		}
		wep.Bodygroups_V = {
			[1] = 2
		}
	end
end
function ATTACHMENT:Detach( wep )
	wep:Unload()

    -- Ensure SequenceTimeOverride exists
    	wep.SequenceTimeOverride = wep.SequenceTimeOverride or {}
    -- Reset reload times
   	wep.SequenceTimeOverride[ACT_VM_RELOAD] = wep.SequenceTimeOverride[ACT_VM_RELOAD] / 1.25
    	wep.SequenceTimeOverride[ACT_VM_RELOAD_EMPTY] = wep.SequenceTimeOverride[ACT_VM_RELOAD_EMPTY] / 1.25

	if Weapon_act == "cat_custom_autogun"||
		Weapon_act == "cat_custom_lascarbine"||
		Weapon_act == "cat_custom_lasgun"||
		Weapon_act == "cat_custom_hellgunstandard"
	 then
		wep.Bodygroups_W = {
			[5] = 0
		}
		wep.Bodygroups_V = {
			[5] = 0
		}
	elseif  ( 	Weapon_act == "cat_custom_autorifle" ||
	   		Weapon_act == "cat_custom_bolter" ||
	    		Weapon_act == "cat_custom_shotgun" ||
			Weapon_act == "cat_custom_bolterastartes"||
			Weapon_act == "cat_custom_boardingshieldbolter"  ||
			Weapon_act == "cat_custom_boardingshield_bolterastartes"  ||
			Weapon_act == "cat_custom_laspistol" 
			) then
		wep.Bodygroups_W = {
			[4] = 0
		}
		wep.Bodygroups_V = {
			[4] = 0
		}
elseif  ( 	Weapon_act == "cat_custom_boltpistol"||
	   	Weapon_act == "cat_custom_boltpistolastartes"
			) then
		wep.Bodygroups_W = {
			[4] = 1
		}
		wep.Bodygroups_V = {
			[4] = 0
		}
elseif  ( 	Weapon_act == "cat_custom_stormbolter" ||
	   	Weapon_act == "cat_custom_stormbolterastartes"||
	   	Weapon_act == "cat_custom_stormbolterterminator"
			) then
		wep.Bodygroups_W = {
			[1] = 0
		}
		wep.Bodygroups_V = {
			[1] = 0
		}
	end
	clip_active = false
end

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["ClipSize"] = function( wep, stat ) return stat * 2 end
	},
	["MoveSpeed"] = function(wep,stat) return stat - 0.025 end,
	["VElements"] = {
		["autogun"] = {
			["bodygroup"] = {[0] = 1},
		},
		["lucius"] = {
			["bodygroup"] = {[0] = 1},
		},
		["luciusH"] = {
			["bodygroup"] = {[0] = 1},
		},
		["lasgunG"] = {
			["bodygroup"] = {[1] = 1},
		},
		["lascarbineG"] = {
			["bodygroup"] = {[1] = 1},
		},
		["laspistolA"] = {
			["bodygroup"] = {[1] = 1},
		},
		["bolterGC"] = {
			["bodygroup"] = {[2] = 2},
		},
		["mag"] = {
			["active"] = false,
		},
		["mag2"] = {
			["active"] = true,
		},
		["mag22"] = {
			["active"] = true,
		},

	},
	["WElements"] = {
		["autogunW"] = {
			["bodygroup"] = {[0] = 1},
		},
		["luciusW"] = {
			["bodygroup"] = {[0] = 1},
		},
		["luciusHW"] = {
			["bodygroup"] = {[0] = 1},
		},
		["lasgunGW"] = {
			["bodygroup"] = {[1] = 1},
		},
		["lascarbineGW"] = {
			["bodygroup"] = {[1] = 1},
		},
		["laspistolAW"] = {
			["bodygroup"] = {[1] = 1},
		},
		["bolterG"] = {
			["bodygroup"] = {[1] = 3},
		},
		["bolterU"] = {
			["bodygroup"] = {[1] = 4},
		},
		["bolterU2"] = {
			["bodygroup"] = {[1] = 2},
		},
		["bolterGC"] = {
			["bodygroup"] = {[2] = 2},
		},
		["bolterT"] = {
			["bodygroup"] = {[1] = 3},
		},
		["bolterH"] = {
			["bodygroup"] = {[1] = 3},
		},
		["mag"] = {
			["active"] = false,
		},
		["mag2"] = {
			["active"] = true,
		},
		["mag22"] = {
			["active"] = true,
		},
	},
}


if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
