if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Reflex Sight"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Utilize short ranged scope", TFA.Attachments.Colors["+"], "Decreased aiming spread", "Decreased recoil", TFA.Attachments.Colors["-"], "Increased hip-fire spread" }
ATTACHMENT.Icon = "scope/gdcw_elcansight"
ATTACHMENT.ShortName = "REFLEX"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["StaticRecoilFactor"] = function(wep,stat) return stat * 0.9 end,
		["Spread"] = function(wep,stat) return stat * 0.9 end,
		["IronAccuracy"] = function(wep,stat) return stat * 1.05 end
	},
	["Secondary"] = {
		["UseElcan"] = function(wep,stat) return true end,
		["IronFOV"] = function(wep,stat) return 50 end,
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.85 end,
	["Scoped"] = function(wep,stat) return true end,
	["ScopeScale"] = function(wep,stat) return 0.5 end,

}


function ATTACHMENT:Attach(wep)
	Weapon_act = wep:GetClass()
	if 	(	Weapon_act == "cat_custom_lasgun" || 
			Weapon_act == "cat_custom_lascarbine"|| 
			Weapon_act == "cat_custom_autogun"|| 
			Weapon_act == "cat_custom_autopistol"|| 
			Weapon_act == "cat_custom_hellgunstandard"|| 
			Weapon_act == "cat_custom_hellpistol"|| 
			Weapon_act == "cat_custom_shotgun"|| 
			Weapon_act == "cat_custom_laspistol"
		) then
		wep.Bodygroups_W = {
			[2] = 1
		}
		wep.Bodygroups_V = {
			[2] = 1
		}
	elseif 	(	Weapon_act == "cat_custom_autorifle" || 
				Weapon_act == "cat_custom_hellgun" || 
				Weapon_act == "cat_custom_volleygun"
			) then
		wep.Bodygroups_W = {
			[1] = 1
		}
		wep.Bodygroups_V = {
			[1] = 1
		}
elseif Weapon_act == "cat_custom_stubber" then
		wep.Bodygroups_W = {
			[2] = 2
		}
		wep.Bodygroups_V = {
			[2] = 2
		}
	end

	JamChance = wep["JamChance"]

	wep.JamChance = JamChance - 0.10 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

function ATTACHMENT:Detach(wep)
	if 	(	Weapon_act == "cat_custom_lasgun" ||
			Weapon_act == "cat_custom_lascarbine"|| 
			Weapon_act == "cat_custom_autogun"|| 
			Weapon_act == "cat_custom_autopistol"|| 
			Weapon_act == "cat_custom_hellgunstandard"|| 
			Weapon_act == "cat_custom_hellpistol"|| 
			Weapon_act == "cat_custom_shotgun"|| 
			Weapon_act == "cat_custom_stubber"|| 
			Weapon_act == "cat_custom_laspistol"
		) then
		wep.Bodygroups_W = {
			[2] = 0
		}
		wep.Bodygroups_V = {
			[2] = 0
		}
	elseif  (	Weapon_act == "cat_custom_volleygun" || 
				Weapon_act == "cat_custom_autorifle" || 
				Weapon_act == "cat_custom_hellgun"
				) then
		wep.Bodygroups_W = {
			[1] = 0
		}
		wep.Bodygroups_V = {
			[1] = 0
		}
	end
	wep.JamChance = JamChance  -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
