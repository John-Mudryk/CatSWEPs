if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Heavy Scope"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Utilize long ranged scope", TFA.Attachments.Colors["+"], "Decreased aiming spread", "Decreased recoil", TFA.Attachments.Colors["-"], "Increased hip-fire spread" }
ATTACHMENT.Icon = "scope/gdcw_parabolicsight"
ATTACHMENT.ShortName = "HEAVY"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["StaticRecoilFactor"] = function(wep,stat) return stat * 0.9 end,
		["Spread"] = function(wep,stat) return stat * 1.5 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.4 end
	},
	["Secondary"] = {
		["UseParabolic"] = function(wep,stat) return true end,
		["IronFOV"] = function(wep,stat) return 10 end,
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.25 end,
	["Scoped"] = function(wep,stat) return true end,
	["ScopeScale"] = function(wep,stat) return 0.65 end,
	["IronSightsPos"] = function(wep,stat) return Vector(0, -10, 0) end,
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
		["lasgunG"] = {
			["bodygroup"] = {[5] = 1},
		},
		["lascarbineG"] = {
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
		["luciusW"] = {
			["bodygroup"] = {[1] = 1},
		},
		["luciusHW"] = {
			["bodygroup"] = {[1] = 1},
		},
		["lasgunGW"] = {
			["bodygroup"] = {[5] = 1},
		},
		["lascarbineGW"] = {
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
