if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Power Field"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Toggle the power field", TFA.Attachments.Colors["-"], "Decreased Damage" }
ATTACHMENT.Icon = "entities/melee_powerfield.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "FIELD"


ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["powersword"] = {
			["skin"] = 0
		},
		["poweraxe"] = {
			["skin"] = 0
		},
		["powerhalberd"] = {
			["skin"] = 0
		},
		["powerswordCH"] = {
			["skin"] = 0
		},
		["poweraxeCH"] = {
			["skin"] = 0
		},
		["poweraxeCHB"] = {
			["skin"] = 0
		},
		["forcesword"] = {
			["skin"] = 0
		},
		["forceaxe"] = {
			["skin"] = 0
		},
		["powerclaw_l"] = {
			["bodygroup"] = {[1] = 1},
		},
		["powerclaw_r"] = {
			["bodygroup"] = {[1] = 1},
		},
		["powerclaw_lC"] = {
			["bodygroup"] = {[1] = 1},
		},
		["powerclaw_rC"] = {
			["bodygroup"] = {[1] = 1},
		},
	},	
	["WElements"] = {
		["powersword"] = {
			["skin"] = 0
		},
		["poweraxe"] = {
			["skin"] = 0
		},
		["powerhalberd"] = {
			["skin"] = 0
		},
		["powerswordCH"] = {
			["skin"] = 0
		},
		["poweraxeCH"] = {
			["skin"] = 0
		},
		["poweraxeCHB"] = {
			["skin"] = 0
		},
		["forcesword"] = {
			["skin"] = 0
		},
		["forceaxe"] = {
			["skin"] = 0
		},
		["powerclaw_l"] = {
			["bodygroup"] = {[1] = 1},
		},
		["powerclaw_r"] = {
			["bodygroup"] = {[1] = 1},
		},
		["powerclaw_lC"] = {
			["bodygroup"] = {[1] = 1},
		},
		["powerclaw_rC"] = {
			["bodygroup"] = {[1] = 1},
		},
	},	
	["Primary"] = {
		["Damage"] = function( wep, stat ) return stat * 0.5 end
	},
}


function ATTACHMENT:Attach(wep)
end

function ATTACHMENT:Detach(wep)
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end