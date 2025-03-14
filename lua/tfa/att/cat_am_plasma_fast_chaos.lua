

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Lower Charge"
ATTACHMENT.ShortName = "LOW" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Charge the plasma for a shorter time at the expense of lower damage"  }
ATTACHMENT.Icon = "particle/Particle_Glow_05" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function( wep, stat ) return stat / 3 end,
		["RPM"] = function( wep, stat ) return stat * 2 end,
		["Force"] = function( wep, stat ) return stat * 1.25 end,
		["Kickback"] = function( wep, stat ) return stat * 1.25 end,
		["PenetrationPower"] = function( wep, stat ) return stat * 0.5 end,
	},
	["TracerName"] = function(wep, stat) return "effect_t_plasma_bolt_chaos" end,
}

function ATTACHMENT:Attach(wep)

	_G.JamChance = wep["JamChance"]
	_G.JamFactor = wep["JamFactor"]

	wep.JamChance = _G.JamChance + 0.02
	wep.JamFactor = _G.JamFactor + 0.02
end

function ATTACHMENT:Detach(wep)
	wep:Unload()

	wep.JamChance = _G.JamChance -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end


if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
