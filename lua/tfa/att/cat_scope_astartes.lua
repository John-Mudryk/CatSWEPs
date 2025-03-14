if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "HUD Scope"
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Use attached HUD equipment to zoom in" }
ATTACHMENT.Icon = "entities/scope_astartes.png"
ATTACHMENT.ShortName = "HUD"

ATTACHMENT.WeaponTable = {
	["Secondary"] = {
		["ScopeTable"] = {
			ScopeBorder = Color(0, 0, 0, 0), -- Black border
			ScopeMaterial = Material(""),
			ScopeOverlay = Material("effects/combine_binocoverlay"),
			ScopeCrosshair = { 
				r = 255, g = 255, b = 255, a = 250, -- Crosshair color
				scale = 0.85, -- Scale
				Material = Material("entities/scope_astartes.png") 
			}
		},
		["IronFOV"] = function(wep, stat) return 40 end, -- Adjust zoom
	},
	["Scoped"] = function(wep, stat) return true end,
	["ScopeScale"] = function(wep, stat) return 1 end, -- Adjusts size of the scope
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
