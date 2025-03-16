if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Vengeance Bolts"
ATTACHMENT.Description = { TFA.AttachmentColors["="], "Load armour-piercing bolts", TFA.AttachmentColors["+"], "Ignores armour", "Increased penetration", TFA.AttachmentColors["-"], "Increased recoil", "Reduced damage", "Reduced fire-rate"}
ATTACHMENT.Icon = "entities/deathwatch_ammo_saw.png"
ATTACHMENT.ShortName = "SAW"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["DamageType"] = function(wep,stat) return DMG_FALL end,
		["Damage"] = function(wep,stat) return stat * 0.65 end,
		["StaticRecoilFactor"] = function(wep,stat) return stat * 2 end,
		["RPM"] = function( wep, stat ) return stat * 0.8 end,
		["Force"] = function( wep, stat ) return stat * 0.75 end,
		["Kickback"] = function( wep, stat ) return stat * 0.75 end,
		["PenetrationPower"] = function( wep, stat ) return stat * 3 end,
	},
	["TracerName"] = "effect_t_boltgun_saw"
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
