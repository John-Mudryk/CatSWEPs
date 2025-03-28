if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Reflex HUD Sight"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Utilize short ranged scope linked to HUD overlay", TFA.Attachments.Colors["+"], "Decreased aiming spread", "Decreased recoil", TFA.Attachments.Colors["-"], "Increased hip-fire spread" }
ATTACHMENT.Icon = "entities/scope_reflex_reticle"
ATTACHMENT.ShortName = "REFLEX HUD"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["StaticRecoilFactor"] = function(wep,stat) return stat * 0.9 end,
		["Spread"] = function(wep,stat) return stat * 0.9 end,
		["IronAccuracy"] = function(wep,stat) return stat * 1.05 end
	},
	["Secondary"] = {
		["ScopeTable"] = {
			ScopeBorder = Color(0, 0, 0, 0), -- no border
			ScopeMaterial = Material("entities/scope_reflex_overlay.png"),
			ScopeMaterialScale = 1,
			ScopeOverlay = Material(""),
			ScopeCrosshair = { 
				r = 255, g = 255, b = 255, a = 255, -- Crosshair color
				scale = 0.25, -- Scale
				Material = Material("entities/scope_reflex_reticle") 
				
			}
		},
		["IronFOV"] = function(wep, stat) return 50 end, -- Adjust zoom
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.85 end,
	["Scoped"] = function(wep,stat) return true end,
	["ScopeScale"] = function(wep,stat) return 0.5 end,
	["IronSightsPos"] = function(wep,stat) return wep.IronSightsPos_Reflex end,
	["IronSightsAng"] = function(wep,stat) return wep.IronSightsAng_Reflex end,
}




function ATTACHMENT:Attach(wep)
	Weapon_act = wep:GetClass()
	if 	(	Weapon_act == "cat_custom_lasgun" || 
			Weapon_act == "cat_custom_lascarbine"|| 
			Weapon_act == "cat_custom_autogun"|| 
			Weapon_act == "cat_custom_autopistol"|| 
			Weapon_act == "cat_custom_hellgunstandard"|| 
			Weapon_act == "cat_custom_hellpistol"|| 
			Weapon_act == "cat_custom_shotgun"|| 
			Weapon_act == "cat_custom_laspistol"
		) then
		wep.Bodygroups_W = {
			[2] = 1
		}
		wep.Bodygroups_V = {
			[2] = 1
		}
	elseif 	(	Weapon_act == "cat_custom_autorifle" || 
				Weapon_act == "cat_custom_hellgun" || 
				Weapon_act == "cat_custom_volleygun"
			) then
		wep.Bodygroups_W = {
			[1] = 1
		}
		wep.Bodygroups_V = {
			[1] = 1
		}
elseif Weapon_act == "cat_custom_stubber" then
		wep.Bodygroups_W = {
			[2] = 2
		}
		wep.Bodygroups_V = {
			[2] = 2
		}
	end
end

function ATTACHMENT:Detach(wep)
	if 	(	Weapon_act == "cat_custom_lasgun" ||
			Weapon_act == "cat_custom_lascarbine"|| 
			Weapon_act == "cat_custom_autogun"|| 
			Weapon_act == "cat_custom_autopistol"|| 
			Weapon_act == "cat_custom_hellgunstandard"|| 
			Weapon_act == "cat_custom_hellpistol"|| 
			Weapon_act == "cat_custom_shotgun"|| 
			Weapon_act == "cat_custom_stubber"|| 
			Weapon_act == "cat_custom_laspistol"
		) then
		wep.Bodygroups_W = {
			[2] = 0
		}
		wep.Bodygroups_V = {
			[2] = 0
		}
	elseif  (	Weapon_act == "cat_custom_volleygun" || 
				Weapon_act == "cat_custom_autorifle" || 
				Weapon_act == "cat_custom_hellgun"
				) then
		wep.Bodygroups_W = {
			[1] = 0
		}
		wep.Bodygroups_V = {
			[1] = 0
		}
	end
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
