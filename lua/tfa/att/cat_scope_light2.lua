if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Light Scope"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Better Aiming and recoil", TFA.Attachments.Colors["-"], "Worse hip-fire spread" }
ATTACHMENT.Icon = "scope/gdcw_scopesight" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "LIGHT"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["KickUp"] = function(wep,stat) return stat * 0.8 end,
		["KickDown"] = function(wep,stat) return stat * 0.8 end,
		["KickHorizontal"] = function(wep,stat) return stat * 0.8 end,
		["Spread"] = function(wep,stat) return stat * 1.3 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.75 end
	},
	["Secondary"] = {
		["UseMilDot"] = function(wep,stat) return true end,
		["IronFOV"] = function(wep,stat) return 20 end,
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.5 end,
	["Scoped"] = function(wep,stat) return true end,
	["ScopeScale"] = function(wep,stat) return 0.6 end,
	["IronSightsPos"] = function(wep,stat) return Vector(0, -10, 0) end,
["VElements"] = {
		["autogun"] = {
			["bodygroup"] = {[1] = 2},
		},
		["lasgunK"] = {
			["bodygroup"] = {[5] = 1},
		},
		["lascarbineK"] = {
			["bodygroup"] = {[5] = 2},
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
	},
["WElements"] = {
		["autogunW"] = {
			["bodygroup"] = {[1] = 2},
		},
		["lasgunKW"] = {
			["bodygroup"] = {[5] = 1},
		},
		["lascarbineKW"] = {
			["bodygroup"] = {[5] = 2},
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
