if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Heat Dispersion Vent"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Better hipfire spread and movespeed", TFA.Attachments.Colors["-"], "Worse aiming and recoil" }
ATTACHMENT.Icon = "entities/vent_icon1.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "HEAT"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["KickUp"] = function(wep,stat) return stat * 1.075 end,
		["KickDown"] = function(wep,stat) return stat * 1.075 end,
		["KickHorizontal"] = function(wep,stat) return stat * 1.075 end,
		["Spread"] = function(wep,stat) return stat * .9 end,
		["IronAccuracy"] = function(wep,stat) return stat * 1.1 end
	},
	["MoveSpeed"] = function(wep,stat) return stat * 1.05 end,
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 1.075 end,

}


function ATTACHMENT:Attach(wep)
	Weapon_act = wep:GetClass()
	if 	(	Weapon_act == "cat_custom_bolter" || 
			Weapon_act == "cat_custom_boardingshieldbolter"  ||
			Weapon_act == "cat_custom_boardingshield_bolterastartes"  ||
			Weapon_act == "cat_custom_bolterastartes"
		) then
		wep.Bodygroups_W = {
			[3] = 1
		}
		wep.Bodygroups_V = {
			[3] = 1
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
			Weapon_act == "cat_custom_boardingshieldbolter"  ||
			Weapon_act == "cat_custom_boardingshield_bolterastartes"  ||
			Weapon_act == "cat_custom_bolterastartes"
		) then
		wep.Bodygroups_W = {
			[3] = 0
		}
		wep.Bodygroups_V = {
			[3] = 0
		}
	end
	wep.JamChance = JamChance  -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
