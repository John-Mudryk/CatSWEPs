if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Rifle Conversion"
--ATTACHMENT.ID = "base" normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["="], "Convert weapon to a rifle", TFA.AttachmentColors["+"], "Improves accuracy" , "Increased damage", "Decreased recoil", TFA.AttachmentColors["-"], "Increased hip-fire spread", }
ATTACHMENT.Icon = "entities/GalvanicRifle.png"
ATTACHMENT.ShortName = "RIFLE"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["KickUp"] = function(wep,stat) return stat * 0.65 end,
		["KickDown"] = function(wep,stat) return stat * 0.65 end,
		["KickHorizontal"] = function(wep,stat) return stat * 0.65 end,
		["Spread"] = function(wep,stat) return stat * 1.15 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.85 end,
		["Damage"] = function(wep,stat) return stat * 2.25 end,
		["RPM"] = function(wep,stat) return stat * 0.5 end,
		["ClipSize"] = function(wep,stat) return stat * 0.5 end,
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.95 end,
	["PrintName"] = "Galvanic Rifle",
}

function ATTACHMENT:Attach(wep)
	Weapon_act = wep:GetClass()
	if 	( 	Weapon_act == "cat_custom_galvanic" 
		) then
		wep.Bodygroups_W = {
			[2] = 2
		}
		wep.Bodygroups_V = {
			[2] = 2
		}

	end

	JamChance = wep["JamChance"]

	wep.JamChance = JamChance - 0.10 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

    if not originalPrintName then
        originalPrintName = wep.PrintName
    end
    wep.PrintName = "Galvanic Rifle"
wep:SetClip1( 0 )
end

function ATTACHMENT:Detach(wep)
Weapon_act = wep:GetClass()
	if 	( 	Weapon_act == "cat_custom_galvanic" 
		) then
		wep.Bodygroups_W = {
			[2] = 0
		}
		wep.Bodygroups_V = {
			[2] = 0
		}
	end
    if originalPrintName then
        wep.PrintName = originalPrintName
    end
wep:SetClip1( 0 )
end
if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end