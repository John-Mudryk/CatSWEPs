SWEP.Category                           = "Cat's Lore SWEPs"
SWEP.Author				= "The Cat"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "Catachan Lascarbine"		-- Weapon name (Shown on HUD)	
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

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/muschi/weapons/muschi_swep_lascarabine_v.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/muschi/weapons/muschi_swep_lascarabine.mdl"	-- Weapon world model
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelFlip                      = false
SWEP.Base 				= "tfa_bash_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.Primary.Force = 5 -- Force value, leave nil to autocalc
SWEP.Primary.Knockback = 0.5 -- Autodetected if nil; this is the velocity kickback

SWEP.ViewModelBoneMods = {
	["mag_bone"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["weapon_bone"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.Primary.Sound			= "weapons/lasgun/ig_lasgun_fire1.wav"		-- script that calls the primary fire sound
SWEP.Primary.RPM			= 320		-- This is in Rounds Per Minute This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Burst				= 180					-- RPM for burst fire, overrides semi.  
SWEP.Primary.BurstDelay				= 0.1					-- Delay between bursts, leave nil to autocalculate
SWEP.Primary.ClipSize			= 65		-- Size of a clip
SWEP.Primary.DefaultClip		= 260	                -- Default number of bullets in a clip
SWEP.Primary.KickUp			= .1		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= .1		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= .1	             -- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true 		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "ar2"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
SWEP.Secondary.CanBash = true
SWEP.Secondary.BashDamage = 80

SWEP.Primary.MaxSurfacePenetrationCount = 10
SWEP.Primary.PenetrationPower = 5
SWEP.Primary.PenetrationMultiplier = 1

SWEP.Secondary.IronFOV			= 70		-- How much you 'zoom' in. Less is more! 

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.DamageType = DMG_BULLET
SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 70	-- Base damage per bullet
SWEP.Primary.Spread		= 0.003	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = 0.0003	-- Ironsight accuracy, should be the same for shotguns

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
		{range = 200, damage = 1},
                {range = 310, damage = 1},
		{range = 560, damage = 0},
	}
}

SWEP.SelectiveFire              = true
SWEP.FireModes = {
        "Single",
	"Auto"
}

--[[VIEWMODEL BLOWBACK]]--

SWEP.BlowbackEnabled = true --Enable Blowback?
SWEP.BlowbackVector = Vector(0, -0.5, 0.00) --Vector to move bone <or root> relative to bone <or view> orientation.
SWEP.BlowbackCurrentRoot = 0 --Amount of blowback currently, for root
SWEP.BlowbackCurrent = 0 --Amount of blowback currently, for bones
SWEP.BlowbackBoneMods = nil --Viewmodel bone mods via SWEP Creation Kit
SWEP.Blowback_Only_Iron = false --Only do blowback on ironsights
SWEP.Blowback_PistolMode = false --Do we recover from blowback when empty?
SWEP.Blowback_Shell_Enabled = false
SWEP.Blowback_Shell_Effect = "ShotgunShellEject"

--[[SHOTGUN CODE]]--

SWEP.Shotgun = false --Enable shotgun style reloading.

SWEP.ShellTime = 1 -- For shotguns, how long it takes to insert a shell.

-- Because irons don't magically give you less pellet spread!
-- Enter iron sight info and bone mod info below
SWEP.VMPos = Vector(0, 0, 0) -- The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position.
SWEP.VMAng = Vector(0, 0, 0) -- The viewmodel angular offset, constantly.   Subtract this from any other modifications to viewmodel angle.

SWEP.IronSightsPos = Vector(-4.24, -6.5, 4.409)
SWEP.IronSightsAng = Vector(-6, -1.706, 0)

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
        [ACT_VM_RELOAD] = 2            
}

--[[EFFECTS]]--
--Muzzle Flash

SWEP.MuzzleAttachment			= "1" 		-- Should be "1" for CSS models or "muzzle" for hl2 models
--SWEP.MuzzleAttachmentRaw = 1 --This will override whatever string you gave.  This is the raw attachment number.  This is overridden or created when a gun makes a muzzle event.
SWEP.ShellAttachment			= "2" 		-- Should be "2" for CSS models or "shell" for hl2 models

-- Tracer Stuff
SWEP.TracerName		 = "effect_cat_laser"   -- Change to a string of your tracer name.  Can be custom. There is a nice example at https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/base/entities/effects/tooltracer.lua
SWEP.TracerCount		= 1	 -- 0 disables, otherwise, 1 in X chance

-- Weapon jam
SWEP.CanJam = true -- whenever weapon cam jam
SWEP.JamChance = 0.015 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.
SWEP.JamFactor = 0.001 -- How to increase jam factor after each shot.

SWEP.DoMuzzleFlash = false --Do a muzzle flash?
SWEP.CustomMuzzleFlash = false --Disable muzzle anim events and use our custom flashes?
SWEP.AutoDetectMuzzleAttachment = false --For multi-barrel weapons, detect the proper attachment?
SWEP.MuzzleFlashEffect = nil--Change to a string of your muzzle flash effect.  Copy/paste one of the existing from the base.

--Shell eject override
SWEP.LuaShellEject = false 
SWEP.LuaShellEjectDelay = 0
SWEP.LuaShellEffect = "ShotgunShellEject" --Defaults to blowback

SWEP.Type                       = "Sub-Machine Gun" 
SWEP.Type_Displayed             = "Catachan Mk. IV"

-- Attachments
SWEP.VElements = {
	["sight2"] = { type = "Model", model = "models/phxtended/trieq1x1x2solid.mdl", bone = "weapon_bone", rel = "", pos = Vector(5.736, 0.481, 2.471), angle = Angle(0, 135, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/combine_advisor/mask", skin = 0, bodygroup = {} },
	["sight1"] = { type = "Model", model = "models/mechanics/solid_steel/steel_beam45_3.mdl", bone = "weapon_bone", rel = "", pos = Vector(-7.511, 0.465, 1.794), angle = Angle(0, 45, 0), size = Vector(0.019, 0.019, 0.019), color = Color(155, 155, 155, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["lascarbineG"] = { type = "Model", model = "models/bloocobalt/dow/deathwing/weapons/lascarbine.mdl", bone = "weapon_bone", rel = "", pos = Vector(2.607, 0.469, -3.135), angle = Angle(-4.989, 180, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {[1] = 2, [3] = 2} },

	["mag"] = { type = "Model", model = "models/bloocobalt/dow/deathwing/weapons/lasgun_mag.mdl", bone = "mag_bone", rel = "", pos = Vector(5.116, 0.312, -0.608), angle = Angle(-5, 180, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["mag2"] = { type = "Model", model = "models/bloocobalt/dow/deathwing/weapons/lasgun_mag.mdl", bone = "mag_bone", rel = "", pos = Vector(5.116, 0.312, -0.608), angle = Angle(-5, 180, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {[0] = 1}, active = false },
	["scope_heavy"] = { type = "Model", model = "models/rtcircle.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "lascarbineG", pos = Vector(8.8, 0, 7.25), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 255, 255, 255), surpresslightning = false, material = "!tfa_rtmaterial", skin = 0, bodygroup = {}, active = false },

}

SWEP.WElements = {
	["lascarbineGW"] = { type = "Model", model = "models/bloocobalt/dow/deathwing/weapons/lascarbine.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(13.993, 0.597, -2.577), angle = Angle(166.645, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {[3] = 2} },
}

-- Define reload sound events
SWEP.EventTable = {
    [ACT_VM_RELOAD] = { -- Use the appropriate reload animation activity
        {time = 0.5, type = "sound", value = "weapons/magout.wav"}, -- Magazine out sound
        {time = 1.0, type = "sound", value = "weapons/laserrifle/wpn_riflelaser_reloadinout.wav"}  -- Magazine in sound
    }
}

SWEP.Attachments = {
    	[1] = { offset = { 0, 0 }, atts = { "cat_am_lowcharge", "cat_am_overcharge"}, order = 1 },
        [2] = { offset = { 0, 0 }, atts = { "cat_mag_extend_two"}, order = 2 },
        [3] = { offset = { 0, 0 }, atts = { "cat_bayonet"}, order = 3 },
	[4] = { offset = { 0, 0 }, atts = { "cat_stock_light"}, order = 4 },
	[5] = { offset = { 0, 0 }, atts = { "cat_scope_heavy2", "cat_scope_heavy2_hud"}, order = 5 },
	[6] = { offset = { 0, 0 }, atts = { "cat_skin1", "cat_skin2", "cat_skin3", "cat_skin4", "cat_skin5", "cat_skin6", "cat_skin7", "cat_skin8"}, order = 6 },
	[10] = { offset = { 0, 0 }, atts = { "cat_training"}, order = 10 },
}

SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}

SWEP.IronSightsPos_Heavy = Vector(-4.2, -7, 2.92)
SWEP.IronSightsAng_Heavy = Vector(-4.961, -1.661, 0)