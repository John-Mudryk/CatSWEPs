if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Birdshot Shells"
ATTACHMENT.ShortName = "BIRD" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Load shells with smaller shot", TFA.Attachments.Colors["+"], "Increased shot count",  TFA.Attachments.Colors["-"], "Reduced per-shot damage", "Increased spread" }
ATTACHMENT.Icon = "entities/Birdshot_shell.png" 
ATTACHMENT.WeaponTable = {
	["TracerName"] = function( wep, stat ) return 5 end,
	["Primary"] = {
		["Damage"] = function( wep, stat ) return stat * 0.3 end,
		["Spread"] = function( wep, stat ) return stat * 2 end,
		["IronAccuracy"] = function( wep, stat ) return stat * 2 end,
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
