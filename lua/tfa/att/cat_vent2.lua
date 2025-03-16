if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Heat Dispersion Vent"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["="], "Utilized cooling vents", TFA.Attachments.Colors["+"], "Increased mobility", "Increased recoil control", "Decreased aiming spread", TFA.Attachments.Colors["-"], "Increased hip-fire spread" }
ATTACHMENT.Icon = "entities/vent_icon1.png"
ATTACHMENT.ShortName = "HEAT"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["SpreadIncrement"] = function( wep, stat ) return stat * 0.95 end,
		["SpreadRecovery"] = function( wep, stat ) return stat * 1.05 end,
		["Spread"] = function(wep,stat) return stat * 1.05 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.95 end
	},
	["MoveSpeed"] = function(wep,stat) return stat * 1.025 end,
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
