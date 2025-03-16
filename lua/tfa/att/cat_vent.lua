if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Lightened Frame"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["="], "Utilized a lighter weapon frame", TFA.Attachments.Colors["+"], "Increased mobility", "Decreased hip-fire spread", TFA.Attachments.Colors["-"], "Increased aiming spread", "Increased recoil" }
ATTACHMENT.Icon = "entities/vent_icon2.png"
ATTACHMENT.ShortName = "LIGHT"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["KickUp"] = function(wep,stat) return stat * 1.05 end,
		["KickDown"] = function(wep,stat) return stat * 1.05 end,
		["KickHorizontal"] = function(wep,stat) return stat * 1.05 end,
		["Spread"] = function(wep,stat) return stat * 0.9 end,
		["IronAccuracy"] = function(wep,stat) return stat * 1.1 end
	},
	["MoveSpeed"] = function(wep,stat) return stat * 1.05 end,
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 1.05 end,

}


function ATTACHMENT:Attach(wep)
	Weapon_act = wep:GetClass()
	if 	(	Weapon_act == "cat_custom_bolter" || 
			Weapon_act == "cat_custom_boardingshieldbolter"  ||
			Weapon_act == "cat_custom_boardingshield_bolterastartes"  ||
			Weapon_act == "cat_custom_bolterastartes"
		) then
		wep.Bodygroups_W = {
			[3] = 2
		}
		wep.Bodygroups_V = {
			[3] = 2
		}
	elseif 	(	Weapon_act == "cat_custom_boltpistol"|| 
			Weapon_act == "cat_custom_boltpistolastartes"
			) then
		wep.Bodygroups_W = {
			[3] = 1
		}
		wep.Bodygroups_V = {
			[3] = 1
		}
	elseif 	(	Weapon_act == "cat_custom_autogun"
			) then
		wep.Bodygroups_W = {
			[6] = 1
		}
		wep.Bodygroups_V = {
			[6] = 1
		}
	end
	NewSpread = wep["Primary"]["Spread"]
	if NewSpread <= 0.25 then
		NewSpread = 0.00000001
	else
		NewSpread = NewSpread - 0.25
	end

	JamChance = wep["JamChance"]

	wep.JamChance = JamChance - 0.10 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

function ATTACHMENT:Detach(wep)
	if 	(	Weapon_act == "cat_custom_bolter" || 
			Weapon_act == "cat_custom_bolterastartes"|| 
			Weapon_act == "cat_custom_boltpistol"|| 
			Weapon_act == "cat_custom_boardingshieldbolter"  ||
			Weapon_act == "cat_custom_boardingshield_bolterastartes"  ||
			Weapon_act == "cat_custom_boltpistolastartes"
		) then
		wep.Bodygroups_W = {
			[3] = 0
		}
		wep.Bodygroups_V = {
			[3] = 0
		}
	elseif 	(	Weapon_act == "cat_custom_autogun"
			) then
		wep.Bodygroups_W = {
			[6] = 0
		}
		wep.Bodygroups_V = {
			[6] = 0
		}
	end
	wep.JamChance = JamChance  -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
