if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Psy bolts"
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "Psychically charged bolts", TFA.AttachmentColors["+"], "Reduced kickback", TFA.AttachmentColors["+"], "Increased damage"}
ATTACHMENT.Icon = "entities/cat_ammo_psy.png"
ATTACHMENT.ShortName = "PSY"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["DamageType"] = function(wep,stat) return DMG_AIRBOAT end,
		["Damage"] = function(wep,stat) return stat * 2.5 end,
		["Recoil"] = function(wep,stat) return stat * 0.8 end,
		["RPM"] = function( wep, stat ) return stat * 1 end,
		["Force"] = function( wep, stat ) return stat * 1.75 end,
		["Kickback"] = function( wep, stat ) return stat * 1.75 end,
		["PenetrationPower"] = function( wep, stat ) return stat * 3 end,
	},
	["TracerName"] = "effect_t_boltgun_psy"
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
