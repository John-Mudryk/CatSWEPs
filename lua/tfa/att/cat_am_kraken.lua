if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Kraken Bolts"
ATTACHMENT.Description = { TFA.AttachmentColors["="], "Load heavy, armour-piercing bolts", TFA.AttachmentColors["+"], "Increased damage", "Increased Penetration", "Decreased spread", TFA.AttachmentColors["-"], "Decreased fire-rate", "Increased recoil"}
ATTACHMENT.Icon = "entities/cat_ammo_kraken.png"
ATTACHMENT.ShortName = "KRAKEN"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["DamageType"] = function(wep,stat) return DMG_AIRBOAT end,
		["Damage"] = function(wep,stat) return stat * 1.6 end,
		["StaticRecoilFactor"] = function(wep,stat) return stat * 1.25 end,
		["Spread"] = function(wep,stat) return stat * 0.75 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.75 end,
		["PenetrationPower"] =  function(wep,stat) return stat * 5 end,
		["Force"] =  function(wep,stat) return stat * 1.75 end,
		["Knockback"] =  function(wep,stat) return stat * 1.75 end,
		["RPM"] = function( wep, stat ) return stat * 0.75 end,
	},
	["TracerName"] = "effect_t_boltgun_kraken"
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
