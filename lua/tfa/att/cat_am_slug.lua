if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Slug Shell"
ATTACHMENT.ShortName = "SLUG" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Switch ammo type to a high calibre slug"  }
ATTACHMENT.Icon = "entities/tfa_ammo_slug.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"

ATTACHMENT.WeaponTable = {
	["TracerName"] = function( wep, stat ) return "effect_t_sniper" end,
	["Primary"] = {
		["Damage"] = function( wep, stat ) return stat * 5.5 end,
		["Spread"] = function( wep, stat ) return stat * 0.05 end,
		["IronAccuracy"] = function( wep, stat ) return stat * 0.05 end,
		["NumShots"] = function( wep, stat ) return 1 end,
		["Force"] = function( wep, stat ) return stat * 10 end,
		["Kickback"] = function( wep, stat ) return stat * 10 end,
		["PenetrationPower"] = function( wep, stat ) return stat * 10 end,


["RangeFalloffLUT"] = {
	bezier = true, -- Whenever to use Bezier or not to interpolate points?
	-- you probably always want it to be set to true
	range_func = "quintic", -- function to spline range
	-- "linear" for linear splining.
	-- Possible values are "quintic", "cubic", "cosine", "sinusine", "linear" or your own function
	units = "meters", -- possible values are "inches", "inch", "hammer", "hu" (are all equal)
	-- everything else is considered to be meters
	lut = {
		{range = 200, damage = 1},
		{range = 250, damage = 1},
		{range = 275, damage = 0}
	}
}
	}
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
