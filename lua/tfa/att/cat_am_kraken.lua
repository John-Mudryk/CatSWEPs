if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Kraken bolts"
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "Increased armor damage", TFA.AttachmentColors["+"], "Minimal kickback", TFA.AttachmentColors["+"], "Reduced spread"}
ATTACHMENT.Icon = "entities/cat_ammo_kraken.png"
ATTACHMENT.ShortName = "KRAKEN"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep,stat) return stat * 1.6 end,
		["Recoil"] = function(wep,stat) return stat * 0.5 end,
		["Spread"] = function(wep,stat) return stat * 0.75 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.75 end,
		["PenetrationPower"] =  function(wep,stat) return stat * 4 end,
		["Force"] =  function(wep,stat) return stat * 0.5 end,
		["Knockback"] =  function(wep,stat) return stat * 0.5 end,
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
