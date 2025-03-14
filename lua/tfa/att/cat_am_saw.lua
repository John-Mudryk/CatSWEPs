if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Saw bolts"
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "Ignores the armor", TFA.AttachmentColors["+"], "Less damage", TFA.AttachmentColors["-"], "Increased recoil"}
ATTACHMENT.Icon = "entities/deathwatch_ammo_saw.png"
ATTACHMENT.ShortName = "SAW"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["DamageType"] = function(wep,stat) return DMG_FALL end,
		["Damage"] = function(wep,stat) return stat * 0.65 end,
		["Recoil"] = function(wep,stat) return stat * 2 end,
		["RPM"] = function( wep, stat ) return stat * 0.9 end,
		["Force"] = function( wep, stat ) return stat * 0.75 end,
		["Kickback"] = function( wep, stat ) return stat * 0.75 end,
		["PenetrationPower"] = function( wep, stat ) return stat * 2 end,
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
