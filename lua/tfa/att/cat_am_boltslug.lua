if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Explosive Slug Shell"
ATTACHMENT.ShortName = "BOLT" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Switch ammo type to a high calibre explosive slug"  }
ATTACHMENT.Icon = "entities/tfa_ammo_fragshell.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"

ATTACHMENT.WeaponTable = {
	["TracerName"] = function( wep, stat ) return "effect_t_boltgun" end,
	["Primary"] = {
		["Damage"] = function( wep, stat ) return stat * 5 end,
		["Spread"] = function( wep, stat ) return 0.005 end,
		["IronAccuracy"] = function( wep, stat ) return 0.001 end,
		["PenetrationPower"] = function( wep, stat ) return stat * 10 end,
		["Force"] = function( wep, stat ) return stat * 3 end,
		["Knockback"] = function( wep, stat ) return stat * 3 end,
		["NumShots"] = function( wep, stat ) return 1 end,
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

function ATTACHMENT:CustomBulletCallback(wep, attacker, trace, dmginfo)
	util.BlastDamage( wep, attacker, trace.HitPos, dmginfo:GetDamage()/10, dmginfo:GetDamage()/5 )
end

function ATTACHMENT:Attach(wep)
	wep:Unload()
end

function ATTACHMENT:Detach(wep)
	wep:Unload()
end


if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
