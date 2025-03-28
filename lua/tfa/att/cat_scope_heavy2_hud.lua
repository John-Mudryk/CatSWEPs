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
	["Scoped"] = function(wep, stat) return true end,

	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.25 end,
	["IronSightsPos"] = function(wep,stat) return wep.IronSightsPos_Heavy end,
	["IronSightsAng"] = function(wep,stat) return wep.IronSightsAng_Heavy end,
["VElements"] = {
		["autogun"] = {
			["bodygroup"] = {[1] = 3},
		},
		["lasgunG"] = {
			["bodygroup"] = {[5] = 1},
		},
		["lascarbineG"] = {
			["bodygroup"] = {[5] = 1},
		},
		["longlasV"] = {
			["bodygroup"] = {[5] = 1},
		},
		["laspistolA"] = {
			["bodygroup"] = {[3] = 1},
		},
		["bolterCH"] = {
			["bodygroup"] = {[4] = 2},
		},
		["bolterG"] = {
			["bodygroup"] = {[3] = 3},
		},
		["bolterGC"] = {
			["bodygroup"] = {[3] = 3},
		},
		["bolterP"] = {
			["bodygroup"] = {[2] = 2},
		},
		["bolterT"] = {
			["bodygroup"] = {[2] = 2},
		},
		["bolterTC2"] = {
			["bodygroup"] = {[2] = 2},
		},
		["bolterU"] = {
			["bodygroup"] = {[4] = 2},
		},
		["bolterU2"] = {
			["bodygroup"] = {[2] = 2},
		},
		["bolterH"] = {
			["bodygroup"] = {[2] = 2},
		},
	},
["WElements"] = {
		["autogunW"] = {
			["bodygroup"] = {[1] = 3},
		},
		["lasgunGW"] = {
			["bodygroup"] = {[5] = 1},
		},
		["lascarbineGW"] = {
			["bodygroup"] = {[5] = 1},
		},
		["longlasVW"] = {
			["bodygroup"] = {[5] = 1},
		},
		["laspistolAW"] = {
			["bodygroup"] = {[3] = 1},
		},
		["bolterCH"] = {
			["bodygroup"] = {[4] = 2},
		},
		["bolterG"] = {
			["bodygroup"] = {[3] = 3},
		},
		["bolterGC"] = {
			["bodygroup"] = {[3] = 3},
		},
		["bolterP"] = {
			["bodygroup"] = {[2] = 2},
		},
		["bolterT"] = {
			["bodygroup"] = {[2] = 2},
		},
		["bolterTC2"] = {
			["bodygroup"] = {[2] = 2},
		},
		["bolterU"] = {
			["bodygroup"] = {[4] = 2},
		},
		["bolterU2"] = {
			["bodygroup"] = {[2] = 2},
		},
		["bolterH"] = {
			["bodygroup"] = {[2] = 2},
		},
	},
}

function ATTACHMENT:Attach(wep)

	JamChance = wep["JamChance"]

	wep.JamChance = JamChance - 0.10 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

function ATTACHMENT:Detach(wep)

	wep.JamChance = JamChance  -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
