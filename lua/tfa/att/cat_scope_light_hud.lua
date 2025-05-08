if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Light HUD Scope"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Utilize medium ranged scope linked to HUD overlay", TFA.Attachments.Colors["+"], "Decreased aiming spread", "Decreased recoil", TFA.Attachments.Colors["-"], "Increased hip-fire spread" }
ATTACHMENT.Icon = "entities/scope_medium_crosshair"
ATTACHMENT.ShortName = "LIGHT HUD"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["StaticRecoilFactor"] = function(wep,stat) return stat * 0.9 end,
		["Spread"] = function(wep,stat) return stat * 1.3 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.75 end
	},
	["Secondary"] = {
		["ScopeTable"] = {
			ScopeBorder = Color(0, 0, 0, 0), -- no border
			ScopeMaterial = Material("scope/gdcw_closedsight"),
			ScopeMaterialScale = 1.5,
			ScopeOverlay = Material(""),
			ScopeCrosshair = { 
				r = 255, g = 255, b = 255, a = 225, -- Crosshair color
				scale = 1, -- Scale
				Material = Material("entities/scope_medium_crosshair") 
				
			}
		},
		["IronFOV"] = function(wep, stat) return 20 end, -- Adjust zoom
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.5 end,
	["Scoped"] = function(wep,stat) return true end,
	["ScopeScale"] = function(wep,stat) return 0.6 end,
	["IronSightsPos"] = function(wep,stat) return wep.IronSightsPos_Light end,
	["IronSightsAng"] = function(wep,stat) return wep.IronSightsAng_Light end,

}

-- Cache reticle material once
local reticleMat_LightScope = Material("entities/scope_medium_crosshair")
local rtmod2 = Color(255,255,255,2)
local fov = 7
local cd = {}

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
			Weapon_act == "cat_custom_galvanic" || 
			Weapon_act == "cat_custom_galvanic_rifle"
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
			Weapon_act == "cat_custom_galvanic_rifle" ||
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
