if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Extended Magazine"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Utilize a greater magazine size", TFA.Attachments.Colors["+"], "Triple magazine capacity", TFA.AttachmentColors["-"], "Increased reload time", "Decreased mobility" }
ATTACHMENT.Icon = "gm_construct/overlay_3" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "MAG 3X"

function ATTACHMENT:Attach( wep )
	wep:Unload()
	Weapon_act = wep:GetClass()

    -- Ensure SequenceTimeOverride exists
    	wep.SequenceTimeOverride = wep.SequenceTimeOverride or {}
    -- Adjust reload times based on attachment
    	local reloadTime = wep.SequenceTimeOverride[ACT_VM_RELOAD] or 1 -- Default multiplier if not set
    	local reloadEmptyTime = wep.SequenceTimeOverride[ACT_VM_RELOAD_EMPTY] or 1
    -- Apply modified reload times
    	wep.SequenceTimeOverride[ACT_VM_RELOAD] = reloadTime * 1.5
    	wep.SequenceTimeOverride[ACT_VM_RELOAD_EMPTY] = reloadEmptyTime * 1.5
	
	if Weapon_act == "cat_custom_autopistol" then
		wep.Bodygroups_W = {
			[4] = 1
		}
		wep.Bodygroups_V = {
			[4] = 1
		}
	elseif  ( 	Weapon_act == "cat_custom_stormbolter" ||
			Weapon_act == "cat_custom_bolter" ||
	   		Weapon_act == "cat_custom_shotgun" ||
	    		Weapon_act == "cat_custom_bolterastartes" ||
			Weapon_act == "cat_custom_boardingshieldbolter"  ||
			Weapon_act == "cat_custom_boardingshield_bolterastartes" 
			) then
		wep.Bodygroups_W = {
			[4] = 2
		}
		wep.Bodygroups_V = {
			[4] = 2
		}

	elseif  ( 	Weapon_act == "cat_custom_boltpistol"||
			Weapon_act == "cat_custom_boltpistolastartes"
			) then
		wep.Bodygroups_W = {
			[4] = 2
		}
		wep.Bodygroups_V = {
			[4] = 1
		}
	elseif 	Weapon_act == "cat_custom_autogun" then
		wep.Bodygroups_W = {
			[5] = 2
		}
		wep.Bodygroups_V = {
			[5] = 2
		}
	end
	if wep:IsAttached("bg_scope_x8") then
		all_active = true
		clip_active = false
	else
		all_active = false
		clip_active = true
	end
end

function ATTACHMENT:Detach( wep )
	wep:Unload()

    -- Ensure SequenceTimeOverride exists
    	wep.SequenceTimeOverride = wep.SequenceTimeOverride or {}
    -- Reset reload times
   	wep.SequenceTimeOverride[ACT_VM_RELOAD] = wep.SequenceTimeOverride[ACT_VM_RELOAD] / 1.5
    	wep.SequenceTimeOverride[ACT_VM_RELOAD_EMPTY] = wep.SequenceTimeOverride[ACT_VM_RELOAD_EMPTY] / 1.5

	if Weapon_act == "cat_custom_boltpistol"||
			Weapon_act == "cat_custom_boltpistolastartes"  then
		wep.Bodygroups_W = {
			[4] = 1
		}
		wep.Bodygroups_V = {
			[4] = 0
		}
	elseif 	( 	Weapon_act == "cat_custom_autopistol" ||
			Weapon_act == "cat_custom_bolter" ||
	   		Weapon_act == "cat_custom_shotgun"||
	    		Weapon_act == "cat_custom_bolterastartes" ||
			Weapon_act == "cat_custom_boardingshieldbolter"  ||
			Weapon_act == "cat_custom_boardingshield_bolterastartes"
			) then
		wep.Bodygroups_W = {
			[4] = 0
		}
		wep.Bodygroups_V = {
			[4] = 0
		}

	elseif 	Weapon_act == "cat_custom_autogun" then
		wep.Bodygroups_W = {
			[5] = 0
		}
		wep.Bodygroups_V = {
			[5] = 0
		}
	end
	clip_active = false
end

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["ClipSize"] = function( wep, stat ) return stat * 3 end
	},
	["MoveSpeed"] = function(wep,stat) return stat - 0.05 end,
}


if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
