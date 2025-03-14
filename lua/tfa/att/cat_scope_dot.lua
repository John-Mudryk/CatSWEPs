if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Short Scope"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Better Aiming and recoil", TFA.Attachments.Colors["-"], "Worse hip-fire spread" }
ATTACHMENT.Icon = "scope/gdcw_svdsight" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "SHORT"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["KickUp"] = function(wep,stat) return stat * 0.8 end,
		["KickDown"] = function(wep,stat) return stat * 0.8 end,
		["KickHorizontal"] = function(wep,stat) return stat * 0.8 end,
		["Spread"] = function(wep,stat) return stat * 1.1 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.8 end
	},
	["Secondary"] = {
		["UseGreenDuplex"] = function(wep,stat) return true end,
		["IronFOV"] = function(wep,stat) return 30 end,
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.95 end,
	["Scoped"] = function(wep,stat) return true end,
	["ScopeScale"] = function(wep,stat) return 0.55 end,
	["ReticleScale"] = function(wep,stat) return 0.85 end,
}


function ATTACHMENT:Attach(wep)
	Weapon_act = wep:GetClass()
	if 	(	Weapon_act == "cat_custom_lasgun" || 
			Weapon_act == "cat_custom_lascarbine" || 
			Weapon_act == "cat_custom_autogun"|| 
			Weapon_act == "cat_custom_autopistol"|| 
			Weapon_act == "cat_custom_hellgunstandard"|| 
			Weapon_act == "cat_custom_hellpistol"|| 
			Weapon_act == "cat_custom_shotgun"
		) then
		wep.Bodygroups_W = {
			[2] = 2
		}
		wep.Bodygroups_V = {
			[2] = 2
		}
	elseif 	(	Weapon_act == "cat_custom_autorifle" || 
				Weapon_act == "cat_custom_volleygun"
			) then
		wep.Bodygroups_W = {
			[1] = 1
		}
		wep.Bodygroups_V = {
			[1] = 1
		}
	elseif Weapon_act == "cat_custom_hellgun" then
		wep.Bodygroups_W = {
			[1] = 2
		}
		wep.Bodygroups_V = {
			[1] = 2
		}
	elseif Weapon_act == "cat_custom_stubber" then
		wep.Bodygroups_W = {
			[2] = 1
		}
		wep.Bodygroups_V = {
			[2] = 1
		}
	end

	JamChance = wep["JamChance"]

	wep.JamChance = JamChance - 0.10 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

function ATTACHMENT:Detach(wep)
	if 	(	Weapon_act == "cat_custom_lasgun" ||
			Weapon_act == "cat_custom_lascarbine" || 
			Weapon_act == "cat_custom_autogun"|| 
			Weapon_act == "cat_custom_autopistol"|| 
			Weapon_act == "cat_custom_hellgunstandard"|| 
			Weapon_act == "cat_custom_hellpistol"|| 
			Weapon_act == "cat_custom_shotgun"|| 
			Weapon_act == "cat_custom_stubber"
		) then
		wep.Bodygroups_W = {
			[2] = 0
		}
		wep.Bodygroups_V = {
			[2] = 0
		}
	elseif  (	Weapon_act == "cat_custom_volleygun" || 
				Weapon_act == "cat_custom_autorifle" 
				) then
		wep.Bodygroups_W = {
			[1] = 0
		}
		wep.Bodygroups_V = {
			[1] = 0
		}
	elseif Weapon_act == "cat_custom_hellgun" then
		wep.Bodygroups_W = {
			[1] = 0
		}
		wep.Bodygroups_V = {
			[1] = 0
		}
	elseif Weapon_act == "cat_custom_stubber" then
		wep.Bodygroups_W = {
			[2] = 0
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
