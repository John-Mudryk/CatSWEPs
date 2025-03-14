if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Sight"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Better Aiming and recoil", TFA.Attachments.Colors["-"], "Worse hip-fire spread" }
ATTACHMENT.Icon = "sprites/scanner_bottom" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "Sight"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["KickUp"] = function(wep,stat) return stat * 0.9 end,
		["KickDown"] = function(wep,stat) return stat * 0.9 end,
		["KickHorizontal"] = function(wep,stat) return stat * 0.9 end,
		["Spread"] = function(wep,stat) return stat * 1.1 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.9 end
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.95 end,
	["IronSightsPos"] = function(wep,stat) return Vector(-4.261, -6.159, 5.079) end,
	["IronSightsAng"] = function(wep,stat) return Vector(-10.86, -1.696, 0) end,
["VElements"] = {
		["glauncher"] = {
			["bodygroup"] = {[1] = 2},
		},
	},
["WElements"] = {
		["glauncherW"] = {
			["bodygroup"] = {[1] = 2},
		},
	},
}


function ATTACHMENT:Attach(wep)
	Weapon_act = wep:GetClass()
	if 	(	Weapon_act == "cat_custom_grenadelauncher" || 
			Weapon_act == "cat_custom_autogun"
		) then
		wep.Bodygroups_W = {
			[1] = 1
		}
		wep.Bodygroups_V = {
			[1] = 1
		}
	end

	JamChance = wep["JamChance"]

	wep.JamChance = JamChance - 0.10 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

function ATTACHMENT:Detach(wep)
	if 	(	Weapon_act == "cat_custom_grenadelauncher" ||
			Weapon_act == "cat_custom_autogun" 
		) then
		wep.Bodygroups_W = {
			[1] = 0
		}
		wep.Bodygroups_V = {
			[1] = 0
		}
	end
	wep.JamChance = JamChance  -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
