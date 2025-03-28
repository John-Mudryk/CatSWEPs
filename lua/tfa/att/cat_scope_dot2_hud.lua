if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Short HUD Scope"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Utilize short-medium ranged scope linked to HUD overlay", TFA.Attachments.Colors["+"], "Decreased aiming spread", "Decreased recoil", TFA.Attachments.Colors["-"], "Increased hip-fire spread" }
ATTACHMENT.Icon = "scope/gdcw_nvgilluminatedduplex"
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
			ScopeMaterial = Material("scope/gdcw_closedsight"),
			ScopeMaterialScale = 1,
			ScopeOverlay = Material(""),
			ScopeCrosshair = { 
				r = 255, g = 255, b = 255, a = 225, -- Crosshair color
				scale = 0.4, -- Scale
				Material = Material("scope/gdcw_nvgilluminatedduplex") 
				
			}
		},
		["IronFOV"] = function(wep,stat) return 30 end,
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.95 end,
	["Scoped"] = function(wep,stat) return true end,
	["IronSightsPos"] = function(wep,stat) return wep.IronSightsPos_Short end,
	["IronSightsAng"] = function(wep,stat) return wep.IronSightsAng_Short end,
["VElements"] = {
		["autogun"] = {
			["bodygroup"] = {[1] = 2},
		},
		["lucius"] = {
			["bodygroup"] = {[1] = 2},
		},
		["luciusH"] = {
			["bodygroup"] = {[1] = 2},
		},
		["lasgunK"] = {
			["bodygroup"] = {[5] = 2},
		},
		["lascarbineK"] = {
			["bodygroup"] = {[5] = 1},
		},
		["longlasK"] = {
			["bodygroup"] = {[5] = 2},
		},
		["laspistolK"] = {
			["bodygroup"] = {[4] = 1},
		},
		["hellpistol"] = {
			["bodygroup"] = {[1] = 1},
		},
		["boltpistolG"] = {
			["bodygroup"] = {[2] = 1},
		},
		["boltpistolP"] = {
			["bodygroup"] = {[2] = 1},
		},
		["boltpistolT"] = {
			["bodygroup"] = {[2] = 1},
		},
	},
["WElements"] = {
		["autogunW"] = {
			["bodygroup"] = {[1] = 2},
		},
		["luciusW"] = {
			["bodygroup"] = {[1] = 2},
		},
		["luciusHW"] = {
			["bodygroup"] = {[1] = 2},
		},
		["lasgunKW"] = {
			["bodygroup"] = {[5] = 2},
		},
		["lascarbineKW"] = {
			["bodygroup"] = {[5] = 1},
		},
		["longlasKW"] = {
			["bodygroup"] = {[5] = 2},
		},
		["laspistolKW"] = {
			["bodygroup"] = {[4] = 1},
		},
		["hellpistolW"] = {
			["bodygroup"] = {[1] = 1},
		},
		["boltpistolG"] = {
			["bodygroup"] = {[2] = 1},
		},
		["boltpistolP"] = {
			["bodygroup"] = {[2] = 1},
		},
		["boltpistolT"] = {
			["bodygroup"] = {[2] = 1},
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
