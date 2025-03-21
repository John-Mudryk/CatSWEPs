if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Metal Storm bolts"
ATTACHMENT.Description = { TFA.AttachmentColors["="], "Load bolts that fire shards of metal", TFA.AttachmentColors["+"], "Increased shot count", "Reduced recoil", TFA.AttachmentColors["-"], "Increased spread", "Reduced damage", "Reduced fire-rate"}
ATTACHMENT.Icon = "entities/cat_ammo_clastic.png"
ATTACHMENT.ShortName = "STORM"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["DamageType"] = function(wep,stat) return bit.bor( stat or 0, DMG_BUCKSHOT  ) end,
		["Damage"] = function(wep,stat) return stat * 0.3 end,
		["StaticRecoilFactor"] = function(wep,stat) return stat * 0.5 end,
		["KickUp"] = function(wep,stat) return stat * 0.85 end,
		["KickDown"] = function(wep,stat) return stat * 0.85 end,
		["KickHorizontal"] = function(wep,stat) return stat * 0.85 end,
		["Spread"] = function( wep, stat ) return stat + 0.0125 end,
		["IronAccuracy"] = function( wep, stat ) return stat + 0.0125 end,
		["NumShots"] = function( wep, stat ) return stat * 6 end,
		["RPM"] = function( wep, stat ) return stat * 0.75 end,
		["Force"] = function( wep, stat ) return stat * 0.25 end,
		["Kickback"] = function( wep, stat ) return stat * 0.25 end,
		["PenetrationPower"] = function( wep, stat ) return stat * 0.5 end,
	},
	["TracerName"] = 4
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
