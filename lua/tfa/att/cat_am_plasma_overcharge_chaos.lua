local sv_tfa_jamming = GetConVar('sv_tfa_jamming')
local sv_tfa_jamming_mult = GetConVar('sv_tfa_jamming_mult')
local sv_tfa_jamming_factor = GetConVar('sv_tfa_jamming_factor')
local sv_tfa_jamming_factor_inc = GetConVar('sv_tfa_jamming_factor_inc')

local l_CT = CurTime

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Overcharge"
ATTACHMENT.ShortName = "OVER" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Charge the plasma for a longer period", TFA.Attachments.Colors["+"], "Area damage", "Increased damage", "Increased penetration", TFA.Attachments.Colors["-"], "Decreased fire-rate", "Double waste of magazine"  }
ATTACHMENT.Icon = "particle/Particle_Glow_02"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function( wep, stat ) return stat * 1.75 end,
		["RPM"] = function(wep, stat) return stat / 2 end,
		["Sound"] = function(wep, stat) return "weapons/75watt/75watt.wav" end,
		["AmmoConsumption"] = function(wep, stat) return stat * 2 end,
		["Force"] = function( wep, stat ) return stat * 0.75 end,
		["Kickback"] = function( wep, stat ) return stat * 0.75 end,
		["PenetrationPower"] = function( wep, stat ) return stat * 2 end,
	},
	["TracerName"] = function(wep, stat) return "tracer_laser_big_plasma_chaos" end

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
