if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Reflex Sight"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Utilize short ranged scope", TFA.Attachments.Colors["+"], "Decreased aiming spread", "Decreased recoil", TFA.Attachments.Colors["-"], "Increased hip-fire spread" }
ATTACHMENT.Icon = "scope/gdcw_elcansight"
ATTACHMENT.ShortName = "REFLEX"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["StaticRecoilFactor"] = function(wep,stat) return stat * 0.9 end,
		["Spread"] = function(wep,stat) return stat * 0.9 end,
		["IronAccuracy"] = function(wep,stat) return stat * 1.05 end
	},
	["Secondary"] = {
		["UseElcan"] = function(wep,stat) return true end,
		["IronFOV"] = function(wep,stat) return 50 end,
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.85 end,
	["Scoped"] = function(wep,stat) return true end,
	["ScopeScale"] = function(wep,stat) return 0.5 end,
	["IronSightsPos"] = function(wep,stat) return Vector(0, -10, 0) end,
["VElements"] = {
		["autogun"] = {
			["bodygroup"] = {[1] = 4},
		},
		["luciusH"] = {
			["bodygroup"] = {[1] = 3},
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
			["bodygroup"] = {[1] = 4},
		},
		["luciusHW"] = {
			["bodygroup"] = {[1] = 3},
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
