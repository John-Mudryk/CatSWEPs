if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Warp bolts"
ATTACHMENT.Description = { TFA.AttachmentColors["="], "Load warp infused bolts", TFA.AttachmentColors["+"], "Area damage", "Increased damage", TFA.AttachmentColors["-"], "Increased recoil", "Decreased penetration"}
ATTACHMENT.Icon = "entities/cat_ammo_warp.png"
ATTACHMENT.ShortName = "WARP"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["DamageType"] = function(wep,stat) return DMG_BLAST end,
		["Damage"] = function(wep,stat) return stat * 2 end,
		["StaticRecoilFactor"] = function(wep,stat) return stat * 2 end,
		["PenetrationPower"] =  function(wep,stat) return 0 end,
		["Force"] = function( wep, stat ) return stat * 2.75 end,
		["Kickback"] = function( wep, stat ) return stat * 2.75 end,
	},
	["ImpactEffect"] = "Explosion",
	["TracerName"] = "effect_t_boltgun_warp",
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
