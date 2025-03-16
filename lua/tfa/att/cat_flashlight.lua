if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Tactical Flashlight"
--ATTACHMENT.ID = "base" normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["="], "Replace default flashlight with stronger focused beam", "Illuminate the darkness" }
ATTACHMENT.Icon = "entities/flashlight_icon.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "FLASH"

ATTACHMENT.WeaponTable = {
	["FlashlightAttachment"] = 1,
    ["FlashlightDistance"] = 50 * 50,
    ["FlashlightBrightness"] = 8,
    ["FlashlightFOV"] = 65,
    ["FlashlightMaterial"] = "effects/flashlight001",
}

function ATTACHMENT:Attach(wep)
	Weapon_act = wep:GetClass()
	if 	(	Weapon_act == "cat_custom_lasgun" || 
			Weapon_act == "cat_custom_autogun"|| 
			Weapon_act == "cat_custom_autopistol"|| 
			Weapon_act == "cat_custom_boltpistol"|| 
			Weapon_act == "cat_custom_boltpistolastartes"|| 
			Weapon_act == "cat_custom_hellgunstandard"|| 
			Weapon_act == "cat_custom_hellpistol"|| 
			Weapon_act == "cat_custom_lascarbine"|| 
			Weapon_act == "cat_custom_laspistol"|| 
			Weapon_act == "cat_custom_longlas"|| 
			Weapon_act == "cat_custom_shotgun"|| 
			Weapon_act == "cat_custom_stubber"|| 
			Weapon_act == "cat_custom_heavystubber"
		) then
		wep.Bodygroups_W = {
			[1] = 1
		}
		wep.Bodygroups_V = {
			[1] = 1
		}

	elseif Weapon_act == "cat_custom_autorifle" then
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
	if 	(	Weapon_act == "cat_custom_lasgun" || 
			Weapon_act == "cat_custom_autogun"|| 
			Weapon_act == "cat_custom_autopistol"|| 
			Weapon_act == "cat_custom_boltpistol"|| 
			Weapon_act == "cat_custom_boltpistolastartes"|| 
			Weapon_act == "cat_custom_hellgunstandard"|| 
			Weapon_act == "cat_custom_hellpistol"|| 
			Weapon_act == "cat_custom_lascarbine"|| 
			Weapon_act == "cat_custom_laspistol"|| 
			Weapon_act == "cat_custom_longlas"|| 
			Weapon_act == "cat_custom_shotgun"|| 
			Weapon_act == "cat_custom_stubber"|| 
			Weapon_act == "cat_custom_heavystubber"
		) then
		wep.Bodygroups_W = {
			[1] = 0
		}
		wep.Bodygroups_V = {
			[1] = 0
		}

	elseif Weapon_act == "cat_custom_autorifle" then
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