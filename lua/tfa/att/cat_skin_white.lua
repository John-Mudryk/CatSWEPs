if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Light Paint"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Change paint colour" }
ATTACHMENT.Icon = "entities/skinwhite.png"
ATTACHMENT.ShortName = "LIGHT"

ATTACHMENT.WeaponTable = {
["VElements"] = {
		["autocannon"] = {
			["skin"] = 1,
		},
		["bolterCH"] = {
			["skin"] = 3,
		},
		["bolterCHC"] = {
			["skin"] = 3,
		},
		["stormbolterCH"] = {
			["skin"] = 3,
		},
		["boltpistolCH"] = {
			["skin"] = 1,
		},
		["axeCH"] = {
			["skin"] = 17,
		},
		["chainswordCH"] = {
			["skin"] = 26,
		},
		["heavybolterCH"] = {
			["skin"] = 1,
		},
		["lascannonCH"] = {
			["skin"] = 3,
		},
		["meltaCH"] = {
			["skin"] = 1,
		},
		["missilelauncherCH"] = {
			["skin"] = 3,
		},
		["plasmacannonCH"] = {
			["skin"] = 1,
		},
		["plasmacannonCHH"] = {
			["skin"] = 3,
		},
		["plasmagunCH"] = {
			["skin"] = 1,
		},
		["plasmagunCHH"] = {
			["skin"] = 3,
		},
		["plasmapistolCH"] = {
			["skin"] = 1,
		},
		["plasmapistolCHH"] = {
			["skin"] = 3,
		},
		["bolterG"] = {
			["skin"] = 2,
		},
 		["bolterGC"] = {
			["skin"] = 1,
		},
 		["bolterP"] = {
			["skin"] = 1,
		},
 		["bolterPC"] = {
			["skin"] = 1,
		},
 		["bolterT"] = {
			["skin"] = 1,
		},
 		["bolterTC"] = {
			["skin"] = 1,
		},
 		["bolterTC2"] = {
			["skin"] = 1,
		},
 		["bolter1"] = {
			["skin"] = 1,
		},
 		["bolterH"] = {
			["skin"] = 1,
		},
 		["bolterU"] = {
			["skin"] = 2,
		},
 		["bolterU2"] = {
			["skin"] = 1,
		},
 		["boltpistolG"] = {
			["skin"] = 1,
		},
 		["boltpistolP"] = {
			["skin"] = 1,
		},
 		["boltpistolT"] = {
			["skin"] = 1,
		},
 		["boltpistol_r"] = {
			["skin"] = 1,
		},
 		["boltpistol_l"] = {
			["skin"] = 1,
		},
 		["axe"] = {
			["skin"] = 9,
		},
 		["chainsword"] = {
			["skin"] = 18,
		},
 		["flamer"] = {
			["skin"] = 3,
		},
 		["flamerH"] = {
			["skin"] = 1,
		},
 		["heavybolter"] = {
			["skin"] = 1,
		},
 		["plasmagun"] = {
			["skin"] = 1,
		},
 		["plasmagunH"] = {
			["skin"] = 3,
		},
 		["plasmapistol"] = {
			["skin"] = 1,
		},
 		["plasmapistolH"] = {
			["skin"] = 3,
		},
 		["shotgunA"] = {
			["skin"] = 1,
		},
 		["shotgunC"] = {
			["skin"] = 1,
		},
 		["stormbolter"] = {
			["skin"] = 1,
		},
 		["stormbolter"] = {
			["skin"] = 1,
		},
 		["stormbolterT"] = {
			["skin"] = 2,
		},
 		["assaultbolter"] = {
			["skin"] = 1,
		},
 		["assaultbolter_r"] = {
			["skin"] = 1,
		},
 		["assaultbolter_l"] = {
			["skin"] = 1,
		},
 		["boltcarbine"] = {
			["skin"] = 1,
		},
 		["boltrifle"] = {
			["skin"] = 1,
		},
 		["boltpistolPrimaris"] = {
			["skin"] = 1,
		},
 		["boltpistolHeavy"] = {
			["skin"] = 1,
		},
 		["plasmaincinerator"] = {
			["skin"] = 1,
		},
	},
	["WElements"] = {
		["autocannon"] = {
			["skin"] = 1,
		},
		["bolterCH"] = {
			["skin"] = 3,
		},
		["bolterCHC"] = {
			["skin"] = 3,
		},
		["stormbolterCH"] = {
			["skin"] = 3,
		},
		["boltpistolCH"] = {
			["skin"] = 3,
		},
		["axeCH"] = {
			["skin"] = 17,
		},
		["chainswordCH"] = {
			["skin"] = 26,
		},
		["heavybolterCH"] = {
			["skin"] = 1,
		},
		["lascannonCH"] = {
			["skin"] = 3,
		},
		["meltaCH"] = {
			["skin"] = 1,
		},
		["missilelauncherCH"] = {
			["skin"] = 3,
		},
		["plasmacannonCH"] = {
			["skin"] = 1,
		},
		["plasmacannonCHH"] = {
			["skin"] = 3,
		},
		["plasmagunCH"] = {
			["skin"] = 1,
		},
		["plasmagunCHH"] = {
			["skin"] = 3,
		},
		["plasmapistolCH"] = {
			["skin"] = 1,
		},
		["plasmapistolCHH"] = {
			["skin"] = 3,
		},
		["bolterG"] = {
			["skin"] = 2,
		},
 		["bolterGC"] = {
			["skin"] = 1,
		},
 		["bolterP"] = {
			["skin"] = 1,
		},
 		["bolterPC"] = {
			["skin"] = 1,
		},
 		["bolterT"] = {
			["skin"] = 1,
		},
 		["bolterTC"] = {
			["skin"] = 1,
		},
 		["bolterTC2"] = {
			["skin"] = 1,
		},
 		["bolter1"] = {
			["skin"] = 1,
		},
 		["bolterH"] = {
			["skin"] = 1,
		},
 		["bolterU"] = {
			["skin"] = 2,
		},
 		["bolterU2"] = {
			["skin"] = 1,
		},
 		["boltpistolG"] = {
			["skin"] = 1,
		},
 		["boltpistolP"] = {
			["skin"] = 1,
		},
 		["boltpistolT"] = {
			["skin"] = 1,
		},
 		["axe"] = {
			["skin"] = 9,
		},
 		["chainsword"] = {
			["skin"] = 18,
		},
 		["flamer"] = {
			["skin"] = 3,
		},
 		["flamerH"] = {
			["skin"] = 1,
		},
 		["heavybolter"] = {
			["skin"] = 1,
		},
 		["plasmagun"] = {
			["skin"] = 1,
		},
 		["plasmagunH"] = {
			["skin"] = 3,
		},
 		["plasmapistol"] = {
			["skin"] = 1,
		},
 		["plasmapistolH"] = {
			["skin"] = 3,
		},
 		["shotgunA"] = {
			["skin"] = 1,
		},
 		["shotgunC"] = {
			["skin"] = 1,
		},
 		["stormbolter"] = {
			["skin"] = 1,
		},
 		["stormbolter"] = {
			["skin"] = 1,
		},
 		["stormbolterT"] = {
			["skin"] = 2,
		},
 		["assaultbolter"] = {
			["skin"] = 1,
		},
 		["assaultbolter_r"] = {
			["skin"] = 1,
		},
 		["assaultbolter_l"] = {
			["skin"] = 1,
		},
 		["boltcarbine"] = {
			["skin"] = 1,
		},
 		["boltrifle"] = {
			["skin"] = 1,
		},
 		["boltpistolPrimaris"] = {
			["skin"] = 1,
		},
 		["boltpistolHeavy"] = {
			["skin"] = 1,
		},
 		["plasmaincinerator"] = {
			["skin"] = 1,
		},
	},
}


function ATTACHMENT:Attach(wep)

end

function ATTACHMENT:Detach(wep)

end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
