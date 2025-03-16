if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Advanced Grip"
--ATTACHMENT.ID = "base" normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["="], "Attach an improved grip", TFA.AttachmentColors["+"], "Increased accuracy", "Decreased recoil", }
ATTACHMENT.Icon = "entities/grip_icon2.png"
ATTACHMENT.ShortName = "GRIP"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["KickUp"] = function(wep,stat) return stat * 0.75 end,
		["KickDown"] = function(wep,stat) return stat * 0.75 end,
		["KickHorizontal"] = function(wep,stat) return stat * 0.75 end,
		["Spread"] = function(wep,stat) return stat * 0.85 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.85 end
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.75 end,
	["VElements"] = {
		["bolterT"] = {
			["bodygroup"] = {[5] = 2},
		},

	},
	["WElements"] = {
		["bolterT"] = {
			["bodygroup"] = {[5] = 2},
		},
	},
}

function ATTACHMENT:Attach(wep)
	Weapon_act = wep:GetClass()
	if 	(	Weapon_act == "cat_custom_bolter" || 
			Weapon_act == "cat_custom_bolterastartes"
		) then
		wep.Bodygroups_W = {
			[5] = 1
		}
		wep.Bodygroups_V = {
			[5] = 1
		}
	end
	JamChance = wep["JamChance"]

	wep.JamChance = JamChance - 0.10 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

function ATTACHMENT:Detach(wep)
Weapon_act = wep:GetClass()
	if 	(	Weapon_act == "cat_custom_bolter" || 
			Weapon_act == "cat_custom_bolterastartes"
		) then
		wep.Bodygroups_W = {
			[5] = 0
		}
		wep.Bodygroups_V = {
			[5] = 0
		}
	end
end
if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end