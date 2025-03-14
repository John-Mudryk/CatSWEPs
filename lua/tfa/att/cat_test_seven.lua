if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Test 7"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Better Aiming and recoil", TFA.Attachments.Colors["-"], "Worse hip-fire spread and movespeed" }
ATTACHMENT.Icon = "sprites/scanner_bottom" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "HS"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["KickUp"] = function(wep,stat) return stat * 0.6 end,
		["KickDown"] = function(wep,stat) return stat * 0.6 end,
		["KickHorizontal"] = function(wep,stat) return stat * 0.6 end,
		["Spread"] = function(wep,stat) return stat * 1.3 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.8 end
	},
	["MoveSpeed"] = function(wep,stat) return stat * 0.9 end,
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.95 end,

}


function ATTACHMENT:Attach(wep)
	Weapon_act = wep:GetClass()
	if 	(	Weapon_act == "cat_custom_lasgun" || 
			Weapon_act == "cat_custom_autogun"
		) then
		wep.Bodygroups_W = {
			[4] = 2
		}
		wep.Bodygroups_V = {
			[4] = 2
		}
	elseif 	(	Weapon_act == "cat_custom_autogun" || 
				Weapon_act == "weapon_astra_lascarabine" || 
				Weapon_act == "weapon_spec-wp_plasma" || 
				Weapon_act == "weapon_astra_stabber"
			) then
		wep.Bodygroups_W = {
			[8] = 1
		}
		wep.Bodygroups_V = {
			[8] = 1
		}
	elseif Weapon_act ~= "weapon_astra_lasgun" then
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
	if 	(	Weapon_act == "cat_custom_lasgun" ||
			Weapon_act == "cat_custom_autogun" 
		) then
		wep.Bodygroups_W = {
			[4] = 1
		}
		wep.Bodygroups_V = {
			[4] = 1
		}
	elseif  (	Weapon_act == "." || 
				Weapon_act == "weapon_astra_lascarabine" || 
				Weapon_act == "weapon_spec-wp_plasma" || 
				Weapon_act == "weapon_astra_stabber"
				) then
		wep.Bodygroups_W = {
			[8] = 0
		}
		wep.Bodygroups_V = {
			[8] = 0
		}
	elseif Weapon_act ~= "weapon_astra_lasgun" then
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
