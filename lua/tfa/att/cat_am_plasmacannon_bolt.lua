local sv_tfa_jamming = GetConVar('sv_tfa_jamming')
local sv_tfa_jamming_mult = GetConVar('sv_tfa_jamming_mult')
local sv_tfa_jamming_factor = GetConVar('sv_tfa_jamming_factor')
local sv_tfa_jamming_factor_inc = GetConVar('sv_tfa_jamming_factor_inc')

local l_CT = CurTime

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Charged Bolt"
ATTACHMENT.ShortName = "BOLT" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Charge the plasma and release it into a slower but widely damaging bolt" }
ATTACHMENT.Icon = "sprites/strider_blackball" 

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Projectile"] = "cat_plasma_bolt_big", -- Change from hitscan to projectile
		["ProjectileVelocity"] = 3000,     -- Adjust projectile speed
		["ProjectileModel"] = "models/props_junk/watermelon01_chunk02c.mdl", -- Optional: Change projectile model
		["Damage"] = function(wep, stat) return stat * 0.75 end,
		["RPM"] = function(wep, stat) return stat / 2 end,
		["Sound"] = function(wep, stat) return "weapons/marsplasma/plasmagun.wav" end,
		["AmmoConsumption"] = function(wep, stat) return stat * 2 end
	},
	["TracerName"] = function(wep, stat) return "tracer_laser_big_plasma" end
}

function ATTACHMENT:Attach(wep)
	_G.JamChance = wep["JamChance"]
	_G.JamFactor = wep["JamFactor"]

	wep.JamChance = _G.JamChance + 0.05
	wep.JamFactor = _G.JamFactor + 0.2
end

function ATTACHMENT:Detach(wep)
end

function ATTACHMENT:CustomBulletCallback(wep, attacker, trace, dmginfo)
	util.BlastDamage( wep, attacker, trace.HitPos, dmginfo:GetDamage()/40, dmginfo:GetDamage()/5 )
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
