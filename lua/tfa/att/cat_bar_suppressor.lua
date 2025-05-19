if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Suppressor"
--ATTACHMENT.ID = "base" normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Attach a silencer", TFA.AttachmentColors["+"], "Suppressed sound", "Increased recoil control", "Decreased aiming spread", TFA.AttachmentColors["-"], "Increased hip-fire spread", }
ATTACHMENT.Icon = "entities/barrel_suppressor.png"
ATTACHMENT.ShortName = "SILENCER"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["SpreadIncrement"] = function( wep, stat ) return stat * 0.9 end,
		["SpreadRecovery"] = function( wep, stat ) return stat * 1.1 end,
		["KickUp"] = function(wep,stat) return stat * 0.75 end,
		["KickDown"] = function(wep,stat) return stat * 0.75 end,
		["KickHorizontal"] = function(wep,stat) return stat * 0.75 end,
		["Spread"] = function(wep,stat) return stat * 1.05 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.95 end,
		["Sound"] = function(wep,stat) return "weapons/fp_suppressed.wav" end
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.95 end,
	["DoMuzzleFlash"] = function(wep,stat) return false end,
	["VElements"] = {
		["autogun"] = {
			["bodygroup"] = {[2] = 3},
		},
		["stubber"] = {
			["bodygroup"] = {[2] = 2},
		}
	},
	["WElements"] = {
		["autogunW"] = {
			["bodygroup"] = {[2] = 3},
		},
		["stubberW"] = {
			["bodygroup"] = {[2] = 2},
		}
	},
}

function ATTACHMENT:Attach(wep)
	Weapon_act = wep:GetClass()
	if 	( 	Weapon_act == "cat_custom_autogun"|| 
			Weapon_act == "cat_custom_autopistol" 
		) then
		wep.Bodygroups_W = {
			[3] = 1
		}
		wep.Bodygroups_V = {
			[3] = 1
		}

	elseif ( 	Weapon_act == "cat_custom_autorifle"
	 ) then
		wep.Bodygroups_W = {
			[2] = 1
		}
		wep.Bodygroups_V = {
			[2] = 1
		}
	elseif ( 	Weapon_act == "cat_custom_phosphor"
	 ) then
		wep.Bodygroups_W = {
			[3] = 1
		}
		wep.Bodygroups_V = {
			[3] = 1
		}
	end

	JamChance = wep["JamChance"]

	wep.JamChance = JamChance - 0.10 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

function ATTACHMENT:Detach(wep)
Weapon_act = wep:GetClass()
	if 	( 	Weapon_act == "cat_custom_autogun"|| 
			Weapon_act == "cat_custom_autopistol" 
		) then
		wep.Bodygroups_W = {
			[3] = 0
		}
		wep.Bodygroups_V = {
			[3] = 0
		}

	elseif ( 	Weapon_act == "cat_custom_autorifle"
	) then
		wep.Bodygroups_W = {
			[2] = 0
		}
		wep.Bodygroups_V = {
			[2] = 0
		}
	elseif ( 	Weapon_act == "cat_custom_phosphor"
	 ) then
		wep.Bodygroups_W = {
			[3] = 0
		}
		wep.Bodygroups_V = {
			[3] = 0
		}
	end
end
if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end