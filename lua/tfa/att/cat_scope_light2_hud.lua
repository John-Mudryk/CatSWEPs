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

["VElements"] = {
		["autogun"] = {
			["bodygroup"] = {[1] = 3},
		},
		["lucius"] = {
			["bodygroup"] = {[1] = 1},
		},
		["luciusH"] = {
			["bodygroup"] = {[1] = 1},
		},
		["lasgunK"] = {
			["bodygroup"] = {[5] = 1},
		},
		["lascarbineK"] = {
			["bodygroup"] = {[5] = 2},
		},
		["longlasK"] = {
			["bodygroup"] = {[5] = 1},
		},
		["laspistolK"] = {
			["bodygroup"] = {[4] = 2},
		},
		["laspistolA"] = {
			["bodygroup"] = {[3] = 1},
		},
		["bolterG"] = {
			["bodygroup"] = {[3] = 2},
		},
		["bolterGC"] = {
			["bodygroup"] = {[3] = 2},
		},
		["bolterP"] = {
			["bodygroup"] = {[2] = 1},
		},
		["bolterT"] = {
			["bodygroup"] = {[2] = 1},
		},
		["bolterTC2"] = {
			["bodygroup"] = {[2] = 1},
		},
		["bolterU"] = {
			["bodygroup"] = {[4] = 1},
		},
		["bolterU2"] = {
			["bodygroup"] = {[2] = 1},
		},
		["bolterH"] = {
			["bodygroup"] = {[2] = 1},
		},
		["stormbolter"] = {
			["bodygroup"] = {[2] = 1},
		},
		["stormbolterT"] = {
			["bodygroup"] = {[2] = 1},
		},
		["boltrifle"] = {
			["bodygroup"] = {[2] = 1},
		},
		["stubber"] = {
			["bodygroup"] = {[1] = 3},
		},
	},
["WElements"] = {
		["autogunW"] = {
			["bodygroup"] = {[1] = 3},
		},
		["lucius"] = {
			["bodygroup"] = {[1] = 1},
		},
		["luciusH"] = {
			["bodygroup"] = {[1] = 1},
		},
		["lasgunKW"] = {
			["bodygroup"] = {[5] = 1},
		},
		["lascarbineKW"] = {
			["bodygroup"] = {[5] = 2},
		},
		["longlasKW"] = {
			["bodygroup"] = {[5] = 1},
		},
		["laspistolKW"] = {
			["bodygroup"] = {[4] = 2},
		},
		["laspistolAW"] = {
			["bodygroup"] = {[3] = 1},
		},
		["bolterG"] = {
			["bodygroup"] = {[3] = 2},
		},
		["bolterGC"] = {
			["bodygroup"] = {[3] = 2},
		},
		["bolterP"] = {
			["bodygroup"] = {[2] = 1},
		},
		["bolterT"] = {
			["bodygroup"] = {[2] = 1},
		},
		["bolterTC2"] = {
			["bodygroup"] = {[2] = 1},
		},
		["bolterU"] = {
			["bodygroup"] = {[4] = 1},
		},
		["bolterU2"] = {
			["bodygroup"] = {[2] = 1},
		},
		["bolterH"] = {
			["bodygroup"] = {[2] = 1},
		},
		["stormbolter"] = {
			["bodygroup"] = {[2] = 1},
		},
		["stormbolterT"] = {
			["bodygroup"] = {[2] = 1},
		},
		["boltrifle"] = {
			["bodygroup"] = {[2] = 1},
		},
		["stubberW"] = {
			["bodygroup"] = {[1] = 3},
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
