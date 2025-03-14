if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Birdshot Shell"
ATTACHMENT.ShortName = "BIRD" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Switch ammo type to a shell filled with smaller shot"  }
ATTACHMENT.Icon = "entities/Birdshot_shell.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"

ATTACHMENT.WeaponTable = {
	["TracerName"] = function( wep, stat ) return 5 end,
	["Primary"] = {
		["Damage"] = function( wep, stat ) return stat * .3 end,
		["Spread"] = function( wep, stat ) return stat + 0.05 end,
		["IronAccuracy"] = function( wep, stat ) return stat + 0.05 end,
		["NumShots"] = function( wep, stat ) return stat * 3 end,
		["PenetrationPower"] =  function(wep,stat) return 1 end,
		["Force"] =  function(wep,stat) return 0 end,
		["Knockback"] =  function(wep,stat) return 0 end,
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
