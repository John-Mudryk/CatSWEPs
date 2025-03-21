if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Muzzle Break"
--ATTACHMENT.ID = "base" normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "Decreased vertical recoil", TFA.AttachmentColors["-"], "Increased horizontal recoil" }
ATTACHMENT.Icon = "entities/Icon_attach_Muzzle_Compensator_SniperRifle.png"
ATTACHMENT.ShortName = "BREAK"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["KickUp"] = function(wep,stat) return stat * 0.65 end,
		["KickDown"] = function(wep,stat) return stat * 0.65 end,
		["KickHorizontal"] = function(wep,stat) return stat * 1.1 end,
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.95 end,

	["VElements"] = {
		["bolterGC"] = {
			["bodygroup"] = {[3] = 1},
		},
		["bolterCH"] = {
			["bodygroup"] = {[3] = 2},
		},

	},
	["WElements"] = {
		["bolterGC"] = {
			["bodygroup"] = {[3] = 1},
		},
		["bolterCH"] = {
			["bodygroup"] = {[3] = 2},
		},
	},
}

function ATTACHMENT:Attach(wep)
	Weapon_act = wep:GetClass()
	if 	( 	Weapon_act == "cat_custom_hellgunstandard"|| 
			Weapon_act == "cat_custom_hellpistol" || 
			Weapon_act == "cat_custom_lascarbine"|| 
			Weapon_act == "cat_custom_lasgun"|| 
			Weapon_act == "cat_custom_laspistol"|| 
			Weapon_act == "cat_custom_longlas"
		) then
		wep.Bodygroups_W = {
			[3] = 2
		}
		wep.Bodygroups_V = {
			[3] = 2
		}

	elseif 	(	Weapon_act == "cat_custom_bolter"|| 
			Weapon_act == "cat_custom_bolterastartes"|| 
			Weapon_act == "cat_custom_boardingshieldbolter"  ||
			Weapon_act == "cat_custom_boardingshield_bolterastartes"  ||
			Weapon_act == "cat_custom_boltpistol" || 
			Weapon_act == "cat_custom_boltpistolastartes"|| 
			Weapon_act == "cat_custom_hellgun"|| 
			Weapon_act == "cat_custom_stormbolter"|| 
			Weapon_act == "cat_custom_stormbolterastartes"|| 
			Weapon_act == "cat_custom_stormbolterterminator"	) then
		wep.Bodygroups_W = {
			[2] = 2
		}
		wep.Bodygroups_V = {
			[2] = 2
		}
	end

	JamChance = wep["JamChance"]

	wep.JamChance = JamChance - 0.10 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

function ATTACHMENT:Detach(wep)
Weapon_act = wep:GetClass()
	if 	( 	Weapon_act == "cat_custom_hellgunstandard"|| 
			Weapon_act == "cat_custom_hellpistol" || 
			Weapon_act == "cat_custom_lascarbine"|| 
			Weapon_act == "cat_custom_lasgun"|| 
			Weapon_act == "cat_custom_laspistol"|| 
			Weapon_act == "cat_custom_longlas"
		) then
		wep.Bodygroups_W = {
			[3] = 0
		}
		wep.Bodygroups_V = {
			[3] = 0
		}

	elseif 	(	Weapon_act == "cat_custom_bolter"|| 
			Weapon_act == "cat_custom_bolterastartes"|| 
			Weapon_act == "cat_custom_boardingshieldbolter"  ||
			Weapon_act == "cat_custom_boardingshield_bolterastartes"  ||
			Weapon_act == "cat_custom_boltpistol" || 
			Weapon_act == "cat_custom_boltpistolastartes"|| 
			Weapon_act == "cat_custom_hellgun"|| 
			Weapon_act == "cat_custom_stormbolter"|| 
			Weapon_act == "cat_custom_stormbolterastartes"|| 
			Weapon_act == "cat_custom_stormbolterterminator"	) then
		wep.Bodygroups_W = {
			[2] = 0
		}
		wep.Bodygroups_V = {
			[2] = 0
		}
	end
end
if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end