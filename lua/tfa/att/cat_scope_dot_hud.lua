if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Short HUD Scope"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Utilize short-medium ranged scope linked to HUD overlay", TFA.Attachments.Colors["+"], "Decreased aiming spread", "Decreased recoil", TFA.Attachments.Colors["-"], "Increased hip-fire spread" }
ATTACHMENT.Icon = "entities/scope_short_crosshair"
ATTACHMENT.ShortName = "SHORT HUD"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["StaticRecoilFactor"] = function(wep,stat) return stat * 0.9 end,
		["Spread"] = function(wep,stat) return stat * 1.1 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.8 end
	},
	["Secondary"] = {
		["ScopeTable"] = {
			ScopeBorder = Color(0, 0, 0, 0), -- no border
			ScopeMaterial = Material("entities/scope_reflex_overlay.png"),
			ScopeMaterialScale = 1.5,
			ScopeOverlay = Material(""),
			ScopeCrosshair = { 
				r = 255, g = 255, b = 255, a = 225, -- Crosshair color
				scale = 0.4, -- Scale
				Material = Material("entities/scope_short_crosshair") 
				
			}
		},
		["IronFOV"] = function(wep,stat) return 30 end,
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.75 end,
	["Scoped"] = function(wep,stat) return true end,
	["IronSightsPos"] = function(wep,stat) return wep.IronSightsPos_Short end,
	["IronSightsAng"] = function(wep,stat) return wep.IronSightsAng_Short end,
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
	elseif 	(	Weapon_act == "cat_custom_autorifle"
			) then
		wep.Bodygroups_W = {
			[1] = 1
		}
		wep.Bodygroups_V = {
			[1] = 1
		}
	elseif 	(	Weapon_act == "cat_custom_volleygun"
			) then
		wep.Bodygroups_W = {
			[1] = 2
		}
		wep.Bodygroups_V = {
			[1] = 2
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
	wep.JamChance = JamChance - 0.10

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
