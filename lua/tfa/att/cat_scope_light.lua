if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Light Scope"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Better Aiming and recoil", TFA.Attachments.Colors["-"], "Worse hip-fire spread" }
ATTACHMENT.Icon = "scope/gdcw_scopesight" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "LIGHT"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["KickUp"] = function(wep,stat) return stat * 0.8 end,
		["KickDown"] = function(wep,stat) return stat * 0.8 end,
		["KickHorizontal"] = function(wep,stat) return stat * 0.8 end,
		["Spread"] = function(wep,stat) return stat * 1.3 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.75 end
	},
	["Secondary"] = {
		["UseMildot"] = function(wep,stat) return true end,
		["IronFOV"] = function(wep,stat) return 20 end,
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.5 end,
	["Scoped"] = function(wep,stat) return true end,
	["ScopeScale"] = function(wep,stat) return 0.6 end,

}


function ATTACHMENT:Attach(wep)
	Weapon_act = wep:GetClass()
	if 	(	Weapon_act == "cat_custom_lasgun" || 
			Weapon_act == "cat_custom_autogun"||
			Weapon_act == "cat_custom_hellgunstandard"|| 
			Weapon_act == "cat_custom_hellpistol"
		) then
		wep.Bodygroups_W = {
			[2] = 3
		}
		wep.Bodygroups_V = {
			[2] = 3
		}
	elseif 	(	Weapon_act == "cat_custom_autorifle" || 
			Weapon_act == "cat_custom_phosphor"|| 
			Weapon_act == "cat_custom_galvanic"
			) then
		wep.Bodygroups_W = {
			[1] = 1
		}
		wep.Bodygroups_V = {
			[1] = 1
		}
	elseif Weapon_act == "cat_custom_longlas" then
		wep.Bodygroups_W = {
			[2] = 2
		}
		wep.Bodygroups_V = {
			[2] = 1
		}
	elseif Weapon_act == "cat_custom_hellgun" then
		wep.Bodygroups_W = {
			[1] = 3
		}
		wep.Bodygroups_V = {
			[1] = 3
		}
	elseif Weapon_act == "cat_custom_laspistol" then
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
	if 	(	Weapon_act == "cat_custom_lasgun" ||
			Weapon_act == "cat_custom_autogun" ||
			Weapon_act == "cat_custom_hellgunstandard"|| 
			Weapon_act == "cat_custom_hellpistol"|| 
			Weapon_act == "cat_custom_laspistol"
		) then
		wep.Bodygroups_W = {
			[2] = 0
		}
		wep.Bodygroups_V = {
			[2] = 0
		}
	elseif  (	Weapon_act == "cat_custom_autorifle"|| 
			Weapon_act == "cat_custom_hellgun"|| 
			Weapon_act == "cat_custom_galvanic"|| 
			Weapon_act == "cat_custom_phosphor" 
				) then
		wep.Bodygroups_W = {
			[1] = 0
		}
		wep.Bodygroups_V = {
			[1] = 0
		}
	elseif Weapon_act == "cat_custom_longlas" then
		wep.Bodygroups_W = {
			[2] = 1
		}
		wep.Bodygroups_V = {
			[2] = 0
		}
	end
	wep.JamChance = JamChance  -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
