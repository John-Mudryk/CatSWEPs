if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Heavy Scope"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Utilize long ranged scope", TFA.Attachments.Colors["+"], "Decreased aiming spread", "Decreased recoil", TFA.Attachments.Colors["-"], "Increased hip-fire spread" }
ATTACHMENT.Icon = "scope/gdcw_parabolicsight"
ATTACHMENT.ShortName = "HEAVY"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["StaticRecoilFactor"] = function(wep,stat) return stat * 0.9 end,
		["Spread"] = function(wep,stat) return stat * 1.5 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.4 end
	},
	["Secondary"] = {
		["ScopeTable"] = {
			ScopeBorder = Color(0, 0, 0, 0), -- no border
			ScopeMaterial = Material("scope/gdcw_closedsight"),
			ScopeMaterialScale = 1.75,
			ScopeOverlay = Material(""),
			ScopeCrosshair = { 
				r = 255, g = 255, b = 255, a = 240, -- Crosshair color
				scale = 1.25, -- Scale
				Material = Material("entities/scope_heavy_crosshair.png") 
				
			}
		},
		["IronFOV"] = function(wep, stat) return 50 end, -- Adjust zoom
	},
	["Scoped"] = function(wep, stat) return false end,

	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.25 end,
	["IronSightsPos"] = function(wep,stat) return wep.IronSightsPos_Heavy end,
	["IronSightsAng"] = function(wep,stat) return wep.IronSightsAng_Heavy end,
["VElements"] = {
		["scope_heavy"] = {
            		active = true
        	},
		["autogun"] = {
			["bodygroup"] = {[1] = 3},
		},
		["lasgunG"] = {
			["bodygroup"] = {[5] = 1},
		},
		["lascarbineG"] = {
			["bodygroup"] = {[5] = 1},
		},
		["longlasV"] = {
			["bodygroup"] = {[5] = 1},
		},
		["laspistolA"] = {
			["bodygroup"] = {[3] = 1},
		},
		["bolterCH"] = {
			["bodygroup"] = {[4] = 2},
		},
		["bolterG"] = {
			["bodygroup"] = {[3] = 3},
		},
		["bolterGC"] = {
			["bodygroup"] = {[3] = 3},
		},
		["bolterP"] = {
			["bodygroup"] = {[2] = 2},
		},
		["bolterT"] = {
			["bodygroup"] = {[2] = 2},
		},
		["bolterTC2"] = {
			["bodygroup"] = {[2] = 2},
		},
		["bolterU"] = {
			["bodygroup"] = {[4] = 2},
		},
		["bolterU2"] = {
			["bodygroup"] = {[2] = 2},
		},
		["bolterH"] = {
			["bodygroup"] = {[2] = 2},
		},
	},
["WElements"] = {
		["autogunW"] = {
			["bodygroup"] = {[1] = 3},
		},
		["lasgunGW"] = {
			["bodygroup"] = {[5] = 1},
		},
		["lascarbineGW"] = {
			["bodygroup"] = {[5] = 1},
		},
		["longlasVW"] = {
			["bodygroup"] = {[5] = 1},
		},
		["laspistolAW"] = {
			["bodygroup"] = {[3] = 1},
		},
		["bolterCH"] = {
			["bodygroup"] = {[4] = 2},
		},
		["bolterG"] = {
			["bodygroup"] = {[3] = 3},
		},
		["bolterGC"] = {
			["bodygroup"] = {[3] = 3},
		},
		["bolterP"] = {
			["bodygroup"] = {[2] = 2},
		},
		["bolterT"] = {
			["bodygroup"] = {[2] = 2},
		},
		["bolterTC2"] = {
			["bodygroup"] = {[2] = 2},
		},
		["bolterU"] = {
			["bodygroup"] = {[4] = 2},
		},
		["bolterU2"] = {
			["bodygroup"] = {[2] = 2},
		},
		["bolterH"] = {
			["bodygroup"] = {[2] = 2},
		},
	},
}

-- Cache reticle material once
local reticleMat_HeavyScope = Material("entities/scope_heavy_crosshair")
local rtmod2 = Color(255,255,255,2)
local fov = 5
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
