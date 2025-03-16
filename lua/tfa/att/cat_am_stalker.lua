if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Stalker Bolts"
ATTACHMENT.Description = { TFA.AttachmentColors["="], "Load silenced solid-core bolts", TFA.AttachmentColors["+"], "Suppressed sound", TFA.AttachmentColors["+"], "Increased damage", "Increased penetration", "Decreased spread", TFA.AttachmentColors["-"], "Decreased fire-rate", "Increased recoil"}
ATTACHMENT.Icon = "entities/cat_ammo_stalker.png"
ATTACHMENT.ShortName = "STALKER"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep,stat) return stat * 1.65 end,
		["StaticRecoilFactor"] = function(wep,stat) return stat * 1.5 end,
		["Spread"] = function(wep,stat) return stat * 0.5 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.5 end,
		["PenetrationPower"] =  function(wep,stat) return stat * 3 end,
		["RPM"] = function( wep, stat ) return stat * 0.5 end,
		["Sound"] = function(wep,stat) return "weapons/phobosboltgun/fire2.mp3" end,
		["Force"] = function( wep, stat ) return stat * 1.25 end,
		["Kickback"] = function( wep, stat ) return stat * 1.25 end,

	},
	["TracerName"] = "effect_t_boltgun_stalker"
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
