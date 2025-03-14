if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Range Calibration"
ATTACHMENT.ShortName = "OVER" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Calibrate to a finer beam to extend range and pierce heavy armour", TFA.Attachments.Colors["-"], "More recoil", "Lower firerate", "Double waste of magazine"  }
ATTACHMENT.Icon = "entities/effect_cat_laser__hell_over.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		-- ["Sound"] = Sound("weapons/snipgauss/awp1.wav"),	
		["Damage"] = function( wep, stat ) return stat * 20 end,
		["KickUp"] = function( wep, stat ) return stat * 1.25 end,
		["KickDown"] = function( wep, stat ) return stat * 1.25 end,
		["Spread"] = function( wep, stat ) return stat / 5 end,
		["IronAccuracy"] = function( wep, stat ) return stat / 5 end,
		["RPM"] = function( wep, stat ) return stat * 0.5 end,
		["StaticRecoilFactor"] = function( wep, stat ) return stat * 1.5 end,
		["AmmoConsumption"] = 2,
		["NumShots"] = 1,
		["Hullsize"] = 64,
		["RangeFalloffLUT"] = {
	bezier = true, -- Whenever to use Bezier or not to interpolate points?
	-- you probably always want it to be set to true
	range_func = "quintic", -- function to spline range
	-- "linear" for linear splining.
	-- Possible values are "quintic", "cubic", "cosine", "sinusine", "linear" or your own function
	units = "meters", -- possible values are "inches", "inch", "hammer", "hu" (are all equal)
	-- everything else is considered to be meters
	lut = {
		{range = 15, damage = 1},
		{range = 20, damage = 1},
		{range = 30, damage = 0}
	}
}
	},
	["TracerName"] = function( wep, stat ) return "tracer_laser_big_melta" end,
}

function ATTACHMENT:Attach( wep )
end

function ATTACHMENT:Detach( wep )
end


if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
