if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Explosive Slug Shells"
ATTACHMENT.ShortName = "BOLT" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Load high-calibre explosive slugs", TFA.Attachments.Colors["+"], "Increased per-shot damage", "Decreased spread", TFA.Attachments.Colors["-"], "Decreased shot count" }
ATTACHMENT.Icon = "entities/tfa_ammo_fragshell.png"

ATTACHMENT.WeaponTable = {
	["TracerName"] = function( wep, stat ) return "effect_t_boltgun" end,
	["Primary"] = {
		["DamageType"] = function( wep, stat ) return DMG_BLAST end,
		["Damage"] = function( wep, stat ) return stat * 5 end,
		["Spread"] = function( wep, stat ) return stat * 0.2 end,
		["IronAccuracy"] = function( wep, stat ) return stat * 0.05 end,
		["PenetrationPower"] = function( wep, stat ) return stat * 2 end,
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
