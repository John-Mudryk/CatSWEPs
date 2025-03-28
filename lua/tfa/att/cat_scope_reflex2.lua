if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Reflex Sight"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Utilize short ranged scope", TFA.Attachments.Colors["+"], "Decreased aiming spread", "Decreased recoil", TFA.Attachments.Colors["-"], "Increased hip-fire spread" }
ATTACHMENT.Icon = "entities/scope_reflex_overlay.png"
ATTACHMENT.ShortName = "REFLEX"

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
		["IronFOV"] = function(wep, stat) return 60 end, -- Adjust zoom
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.85 end,
	["Scoped"] = function(wep,stat) return false end,
	["ScopeScale"] = function(wep,stat) return 0.5 end,
	["IronSightsPos"] = function(wep,stat) return wep.IronSightsPos_Reflex end,
	["IronSightsAng"] = function(wep,stat) return wep.IronSightsAng_Reflex end,
["VElements"] = {
		["autogun"] = {
			["bodygroup"] = {[1] = 4},
		},
		["luciusH"] = {
			["bodygroup"] = {[1] = 3},
		},
        	["scope_reflex"] = {
            		active = true
        	}
	},
["WElements"] = {
		["autogunW"] = {
			["bodygroup"] = {[1] = 4},
		},
		["luciusHW"] = {
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
