SWEP.Category                           = "Cat's SWEPs"
SWEP.Author				= "The Cat"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "Autorifle"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 1			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "ar2"	-- how others view you carrying the weapon
SWEP.UseHands   = true
SWEP.DisableChambering = true
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.MoveSpeed = 0.95

SWEP.ViewModelFOV			= 54
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/muschi/weapons/muschi_swep_autogun_sniper_v.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/muschi/weapons/muschi_swep_autogun_sniper.mdl"	-- Weapon world model
SWEP.ViewModelFlip                      = false
SWEP.Base 				= "tfa_bash_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.Primary.Force = 7.5 -- Force value, leave nil to autocalc
SWEP.Primary.Knockback = 0.75 -- Autodetected if nil; this is the velocity kickback

SWEP.Primary.Sound			= "40k/rifle_fire_1.wav"		-- script that calls the primary fire sound
SWEP.Primary.RPM			= 180		-- This is in Rounds Per Minute This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Burst				= 180					-- RPM for burst fire, overrides semi.  
SWEP.Primary.BurstDelay				= 0.1					-- Delay between bursts, leave nil to autocalculate
SWEP.Primary.ClipSize			= 15		-- Size of a clip
SWEP.Primary.DefaultClip		= 120	                -- Default number of bullets in a clip
SWEP.Primary.KickUp			= .15		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= .15		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= .15	             -- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false 		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "smg1"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
SWEP.Secondary.CanBash = true
SWEP.Secondary.BashDamage = 75

SWEP.Primary.MaxSurfacePenetrationCount = 10
SWEP.Primary.PenetrationPower = 8
SWEP.Primary.PenetrationMultiplier = 1

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 

SWEP.IronSightsSensitivity = 0.25 --Useful for a RT scope.  Change this to 0.25 for 25% sensitivity.  This is if normal FOV compenstaion isn't your thing for whatever reason, so don't change it for normal scopes.
SWEP.BoltAction			= false  --Unscope/sight after you shoot?
SWEP.Scoped			= false  --Draw a scope overlay?

SWEP.ScopeOverlayThreshold = 0.875 --Percentage you have to be sighted in to see the scope.
SWEP.BoltTimerOffset = 0.1 --How long you stay sighted in after shooting, with a bolt action.

SWEP.ScopeScale = 0.5 --Scale of the scope overlay
SWEP.ReticleScale = 0.75 --Scale of the reticle overlay

--GDCW Overlay Options.  Only choose one.

SWEP.Secondary.UseACOG			= false	 	--Overlay option
SWEP.Secondary.UseMilDot		= false		--Overlay option
SWEP.Secondary.UseSVD			= false		--Overlay option
SWEP.Secondary.UseParabolic		= false		--Overlay option
SWEP.Secondary.UseElcan			= false	 	--Overlay option
SWEP.Secondary.UseGreenDuplex		= false		--Overlay option

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

if surface then
	SWEP.Secondary.ScopeTable = nil --[[
		{
			scopetex = surface.GetTextureID("scope/gdcw_closedsight"),
			reticletex = surface.GetTextureID("scope/gdcw_acogchevron"),
			dottex = surface.GetTextureID("scope/gdcw_acogcross")
		}
	]]--
end

SWEP.DamageType = DMG_BULLET
SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 150	-- Base damage per bullet
SWEP.Primary.Spread		= 0.0075	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = 0.002	-- Ironsight accuracy, should be the same for shotguns

--Range Related
SWEP.Primary.RangeFalloffLUT = {
	bezier = true, -- Whenever to use Bezier or not to interpolate points?
	-- you probably always want it to be set to true
	range_func = "quintic", -- function to spline range
	-- "linear" for linear splining.
	-- Possible values are "quintic", "cubic", "cosine", "sinusine", "linear" or your own function
	units = "meters", -- possible values are "inches", "inch", "hammer", "hu" (are all equal)
	-- everything else is considered to be meters
	lut = { -- providing zero point is not required
		-- without zero point it is considered to be as {range = 0, damage = 1}
		{range = 390, damage = 1},
                {range = 500, damage = 1},
		{range = 750, damage = 0},
	}
}

SWEP.SelectiveFire              = true
SWEP.FireModes = {
        "Single"
}

--[[VIEWMODEL BLOWBACK]]--

SWEP.BlowbackEnabled = false --Enable Blowback?
SWEP.BlowbackVector = Vector(-0.03,-7,0.00) --Vector to move bone <or root> relative to bone <or view> orientation.
SWEP.BlowbackCurrentRoot = 0 --Amount of blowback currently, for root
SWEP.BlowbackCurrent = 0 --Amount of blowback currently, for bones
SWEP.BlowbackBoneMods = nil --Viewmodel bone mods via SWEP Creation Kit
SWEP.Blowback_Only_Iron = false --Only do blowback on ironsights
SWEP.Blowback_PistolMode = false --Do we recover from blowback when empty?
SWEP.Blowback_Shell_Enabled = true
SWEP.Blowback_Shell_Effect = "ShotgunShellEject"

--[[SHOTGUN CODE]]--

SWEP.Shotgun = false --Enable shotgun style reloading.

SWEP.ShellTime = 1 -- For shotguns, how long it takes to insert a shell.

-- Because irons don't magically give you less pellet spread!
-- Enter iron sight info and bone mod info below
SWEP.VMPos = Vector(0, 0, 0) -- The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position.
SWEP.VMAng = Vector(0, 0, 0) -- The viewmodel angular offset, constantly.   Subtract this from any other modifications to viewmodel angle.

SWEP.IronSightsPos = Vector(-4.623, -7.347, 2.592)
SWEP.IronSightsAng = Vector(0.291, -3.521, 0)

SWEP.RunSightsPos = Vector(0, 0, 0)
SWEP.RunSightsAng = Vector(-11.869, 17.129, -16.056)
SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
                Up = -6,
                Right = .5,
                Forward = -2.8,
        },
        Ang = {
                Up = -90,
                Right = -15,
                Forward = 180
        },
                Scale = 1
}

SWEP.ThirdPersonReloadDisable = false --Disable third person reload?  True disables.

-- Reload 
SWEP.SequenceTimeOverride = {
        [ACT_VM_RELOAD] = 2.5            
}

--[[EFFECTS]]--
--Muzzle Flash

SWEP.MuzzleAttachment			= "1" 		-- Should be "1" for CSS models or "muzzle" for hl2 models
--SWEP.MuzzleAttachmentRaw = 1 --This will override whatever string you gave.  This is the raw attachment number.  This is overridden or created when a gun makes a muzzle event.
SWEP.ShellAttachment			= "2" 		-- Should be "2" for CSS models or "shell" for hl2 models

-- Tracer Stuff
SWEP.TracerName		 = 4   -- Change to a string of your tracer name.  Can be custom. There is a nice example at https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/base/entities/effects/tooltracer.lua
SWEP.TracerCount		= 1	 -- 0 disables, otherwise, 1 in X chance

-- Weapon jam
SWEP.CanJam = true -- whenever weapon cam jam
SWEP.JamChance = 0.015 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.
SWEP.JamFactor = 0.001 -- How to increase jam factor after each shot.

SWEP.DoMuzzleFlash = true --Do a muzzle flash?
SWEP.CustomMuzzleFlash = false --Disable muzzle anim events and use our custom flashes?
SWEP.AutoDetectMuzzleAttachment = false --For multi-barrel weapons, detect the proper attachment?
SWEP.MuzzleFlashEffect = nil--Change to a string of your muzzle flash effect.  Copy/paste one of the existing from the base.

--Shell eject override
SWEP.LuaShellEject = true 
SWEP.LuaShellEjectDelay = 0
SWEP.LuaShellEffect = "ShotgunShellEject" --Defaults to blowback

SWEP.Type                       = "Designated Marksman Rifle"
SWEP.Type_Displayed             = "Agripinaa Pattern Type V"

-- Attachments
SWEP.VElements = {
	["scope_light"] = { type = "Model", model = "models/rtcircle.mdl", bone = "weapon_bone", rel = "", pos = Vector(-7.171, 0.689, 4.059), angle = Angle(0, -178.601, 0), size = Vector(0.268, 0.268, 0.268), color = Color(255, 255, 255, 255), surpresslightning = false, material = "!tfa_rtmaterial", skin = 0, bodygroup = {}, active = false },
	["scope_heavy"] = { type = "Model", model = "models/rtcircle.mdl", bone = "weapon_bone", rel = "", pos = Vector(-7.171, 0.689, 4.059), angle = Angle(0, -178.601, 0), size = Vector(0.268, 0.268, 0.268), color = Color(255, 255, 255, 255), surpresslightning = false, material = "!tfa_rtmaterial", skin = 0, bodygroup = {}, active = false },

	["laser"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "weapon_bone", rel = "", pos = Vector(23.17, 1.995, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false }
}

SWEP.WElements = {
	["laser"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(22.16, -1.2, -8.866), angle = Angle(-13.226, -1.963, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false }
}

-- Define reload sound events
SWEP.EventTable = {
    [ACT_VM_RELOAD] = { -- Use the appropriate reload animation activity
        {time = 0.5, type = "sound", value = "weapons/ravager/rifle_clip_out_1.wav"}, -- Magazine out sound
        {time = 1.5, type = "sound", value = "weapons/ravager/rifle_clip_in_1.wav"}  -- Magazine in sound
    }
}

SWEP.Attachments = {
	[1] = { offset = { 0, 0 }, atts = { "cat_am_ap", "cat_am_match", "cat_am_magnum", "cat_am_incendiary"}, order = 1 },
    	[2] = { offset = { 0, 0 }, atts = { "cat_mag_extend_two"}, order = 2 },
	[3] = { offset = { 0, 0 }, atts = { "cat_stock_heavy", "cat_stock_light"}, order = 3 },
	[4] = { offset = { 0, 0 }, atts = { "cat_scope_light", "cat_scope_heavy", "cat_scope_light_hud", "cat_scope_heavy_hud"}, order = 4 },
    	[5] = { offset = { 0, 0 }, atts = { "cat_flashlight", "cat_lasersight"}, order = 5 },
    	[6] = { offset = { 0, 0 }, atts = { "cat_bar_suppressor"}, order = 6 },
	[10] = { offset = { 0, 0 }, atts = { "cat_training"}, order = 10 },
}

SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}

SWEP.IronSightsPos_Light = Vector(-4.761, -5, 2.559)
SWEP.IronSightsAng_Light = Vector(-6.402, -3.44, 0)

SWEP.IronSightsPos_Heavy = Vector(-4.761, -5, 2.559)
SWEP.IronSightsAng_Heavy = Vector(-6.402, -3.44, 0)