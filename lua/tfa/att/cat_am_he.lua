if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "High Explosive Rounds"
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "Area damage", TFA.AttachmentColors["-"], "Increased recoil", TFA.AttachmentColors["-"], "Lower Direct Damage"}
ATTACHMENT.Icon = "entities/explosive_bullet.png"
ATTACHMENT.ShortName = "HE"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["DamageType"] = function(wep,stat) return bit.bor( stat or 0, DMG_BLAST ) end,
		["Damage"] = function(wep,stat) return stat * 0.75 end,
		["Recoil"] = function(wep,stat) return stat * 2 end,
		["Force"] = function(wep,stat) return stat * 5 end,
		["Knockback"] = function(wep,stat) return stat * 5 end,
		["PenetrationPower"] =  function(wep,stat) return 0 end,
	},
	["ImpactEffect"] = "Explosion",
	["TracerName"] = "effect_t_boltgun",
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
