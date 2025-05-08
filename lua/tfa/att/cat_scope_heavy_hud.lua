if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Heavy HUD Scope"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Utilize long ranged scope linked to HUD overlay", TFA.Attachments.Colors["+"], "Decreased aiming spread", "Decreased recoil", TFA.Attachments.Colors["-"], "Increased hip-fire spread" }
ATTACHMENT.Icon = "entities/scope_heavy_crosshair"
ATTACHMENT.ShortName = "HEAVY HUD"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["StaticRecoilFactor"] = function(wep,stat) return stat * 0.9 end,
		["Spread"] = function(wep,stat) return stat * 1.5 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.4 end
	},
	["Secondary"] = {
		["ScopeTable"] = {
			ScopeBorder = Color(0, 0, 0, 0), -- no border
			ScopeMaterial = Material("scope/gdcw_closedsight"),
			ScopeMaterialScale = 1.75,
			ScopeOverlay = Material(""),
			ScopeCrosshair = { 
				r = 255, g = 255, b = 255, a = 240, -- Crosshair color
				scale = 1.25, -- Scale
				Material = Material("entities/scope_heavy_crosshair") 
				
			}
		},
		["IronFOV"] = function(wep, stat) return 10 end, -- Adjust zoom
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.25 end,
	["Scoped"] = function(wep,stat) return true end,
	["ScopeScale"] = function(wep,stat) return 0.65 end,
	["IronSightsPos"] = function(wep,stat) return wep.IronSightsPos_Heavy end,
	["IronSightsAng"] = function(wep,stat) return wep.IronSightsAng_Heavy end,

}

function ATTACHMENT:Attach(wep)
	Weapon_act = wep:GetClass()
	if 	(	Weapon_act == "cat_custom_lasgun" || 
			Weapon_act == "cat_custom_autogun"
		) then
		wep.Bodygroups_W = {
			[2] = 4
		}
		wep.Bodygroups_V = {
			[2] = 4
		}
	elseif 	(	Weapon_act == "cat_custom_autorifle" || 
			Weapon_act == "cat_custom_galvanic" || 
			Weapon_act == "cat_custom_galvanic_rifle"
			) then
		wep.Bodygroups_W = {
			[1] = 2
		}
		wep.Bodygroups_V = {
			[1] = 2
		}
	elseif Weapon_act == "cat_custom_longlas" then
		wep.Bodygroups_W = {
			[2] = 3
		}
		wep.Bodygroups_V = {
			[2] = 2
		}
	elseif Weapon_act == "cat_custom_hellgun" then
		wep.Bodygroups_W = {
			[1] = 4
		}
		wep.Bodygroups_V = {
			[1] = 4
		}
	elseif 	(	Weapon_act == "cat_custom_bolter" || 
			Weapon_act == "cat_custom_bolterastartes"
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
	if 	(	Weapon_act == "cat_custom_lasgun" ||
			Weapon_act == "cat_custom_autogun" 
		) then
		wep.Bodygroups_W = {
			[2] = 0
		}
		wep.Bodygroups_V = {
			[2] = 0
		}
	elseif  ( 	Weapon_act == "cat_custom_autorifle"||
			Weapon_act == "cat_custom_hellgun" ||
			Weapon_act == "cat_custom_galvanic"||
			Weapon_act == "cat_custom_galvanic_rifle"||
			Weapon_act == "cat_custom_bolter"||
			Weapon_act == "cat_custom_bolterastartes"
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
