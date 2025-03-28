if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Sniper Scope"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Utilize very-long ranged scope", TFA.Attachments.Colors["+"], "Decreased aiming spread", "Decreased recoil", TFA.Attachments.Colors["-"], "Increased hip-fire spread" }
ATTACHMENT.Icon = "scope/gdcw_parabolicsight"
ATTACHMENT.ShortName = "SNIPER"

ATTACHMENT.WeaponTable = {
	["VElements"] = {
        	["scope_sniper"] = {
            		active = true
        	}
    	},
	["Primary"] = {
		["StaticRecoilFactor"] = function(wep,stat) return stat * 0.9 end,
		["Spread"] = function(wep,stat) return stat * 1.1 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.25 end
	},
	["Secondary"] = {
		["ScopeTable"] = {
			ScopeBorder = Color(0, 0, 0, 0), -- no border
			ScopeMaterial = Material("scope/gdcw_closedsight"),
			ScopeMaterialScale = 2,
			ScopeOverlay = Material(""),
			ScopeCrosshair = { 
				r = 255, g = 255, b = 255, a = 240, -- Crosshair color
				scale = 1.35, -- Scale
				Material = Material("entities/scope_light_crosshair") 
				
			}
		},
		["IronFOV"] = function(wep, stat) return 60 end, -- Adjust zoom
	},
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.25 end,
	["Scoped"] = function(wep,stat) return false end,
	["ScopeScale"] = function(wep,stat) return 0.65 end,
	["IronSightsPos"] = function(wep,stat) return wep.IronSightsPos_Sniper end,
	["IronSightsAng"] = function(wep,stat) return wep.IronSightsAng_Sniper end,

}

-- Cache reticle material once
local reticleMat_HeavyScope = Material("entities/scope_light_crosshair")
local rtmod2 = Color(255,255,255,2)
local fov = 3
local cd = {}

function ATTACHMENT:Attach(wep)

	JamChance = wep["JamChance"]

	wep.JamChance = JamChance - 0.10 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

	if not IsValid(wep) then return end
	wep.RTCodeOld = wep.RTCodeOld or wep.RTCode

	wep.RTCode = function(myself, rt, scrw, scrh)
		if not IsValid(myself.Owner) then return end
		local wcol = myself.Owner:GetWeaponColor()
		rtmod2.r = wcol.x * 255 * 2
		rtmod2.g = wcol.y * 255 * 2
		rtmod2.b = wcol.z * 255 * 2

		local reticle = reticleMat_HeavyScope
		local reticleScale = 1.05

		local w, h = ScrW(), ScrH()
		local scaledW, scaledH = w * reticleScale, h * reticleScale
		local x = (w - scaledW) / 2
		local y = (h - scaledH) / 2

		render.OverrideAlphaWriteEnable(true, true)
		surface.SetDrawColor(color_white)
		surface.DrawRect(-ScrW(), -ScrH(), ScrW() * 2, ScrH() * 2)
		render.OverrideAlphaWriteEnable(true, true)
		local ang = myself.Owner:EyeAngles()
		cd.angles = ang
		cd.origin = myself.Owner:GetShootPos()
		local rtw, rth = ScrW(), ScrH()
		cd.x = 0
		cd.y = 0
		cd.w = ScrW()
		cd.h = ScrH()
		cd.fov = fov
		cd.drawviewmodel = false
		cd.drawhud = false
		render.Clear(0, 0, 0, 255, true, true)
		render.SetScissorRect(0, 0, rtw, rth, true)

		if myself.CLIronSightsProgress > 0.005 then
			render.RenderView(cd)
		end

		render.SetScissorRect(0, 0, rtw, rth, false)
		render.OverrideAlphaWriteEnable(false, true)
		cam.Start2D()
		draw.NoTexture()
		surface.SetDrawColor(ColorAlpha(color_black, 255 * (1 - myself.CLIronSightsProgress)))
		surface.DrawRect(0, 0, rtw, rth)
		surface.SetMaterial(reticle)
		surface.SetDrawColor(color_white)
		surface.DrawTexturedRect(x, y, scaledW, scaledH)
		surface.SetDrawColor(rtmod2)
		surface.DrawRect(0, 0, ScrW(), ScrH())
		cam.End2D()
	end
end

function ATTACHMENT:Detach(wep)

	wep.JamChance = JamChance  -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
