if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Suppressor"
--ATTACHMENT.ID = "base" normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "Improves accuracy, recoil and reduces sound of gunfire", TFA.AttachmentColors["-"], "Slightly increases hip-fire spread", }
ATTACHMENT.Icon = "entities/tfa_br_supp.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "SILENCER"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
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
		}
	},
	["WElements"] = {
		["autogunW"] = {
			["bodygroup"] = {[2] = 3},
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