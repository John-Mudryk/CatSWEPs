if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Warp bolts"
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "Great damage", TFA.AttachmentColors["+"], "Area damage", TFA.AttachmentColors["-"], "Increased recoil"}
ATTACHMENT.Icon = "entities/cat_ammo_warp.png"
ATTACHMENT.ShortName = "WARP"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["DamageType"] = function(wep,stat) return DMG_BLAST end,
		["Damage"] = function(wep,stat) return stat * 2 end,
		["Recoil"] = function(wep,stat) return stat * 2 end,
		["PenetrationPower"] =  function(wep,stat) return 0 end,
		["Force"] = function( wep, stat ) return stat * 2.75 end,
		["Kickback"] = function( wep, stat ) return stat * 2.75 end,
	},
	["ImpactEffect"] = "Explosion",
	["TracerName"] = "effect_t_boltgun_warp",
	}

function ATTACHMENT:Attach(wep)
	wep:Unload()
end

function ATTACHMENT:Detach(wep)
	wep:Unload()
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
