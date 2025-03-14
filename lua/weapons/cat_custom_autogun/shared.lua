SWEP.Category                           = "Cat's SWEPs"
SWEP.Author				= "The Cat"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "1" 	-- Should be "2" for CSS models or "shell" for hl2 models
SWEP.PrintName				= "Autogun"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
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
SWEP.ViewModel				= "models/muschi/weapons/muschi_swep_autogun_v.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/muschi/weapons/muschi_swep_autogun.mdl"	-- Weapon world model
SWEP.ViewModelFlip                      = false
SWEP.Base 				= "tfa_bash_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.Primary.Force = 5 -- Force value, leave nil to autocalc
SWEP.Primary.Knockback = 0.5 -- Autodetected if nil; this is the velocity kickback

SWEP.Primary.Sound			= "40k/rifle_fire_1.wav"		-- script that calls the primary fire sound
SWEP.Primary.RPM			= 600		-- This is in Rounds Per Minute This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Burst				= 180					-- RPM for burst fire, overrides semi.  
SWEP.Primary.BurstDelay				= 0.1					-- Delay between bursts, leave nil to autocalculate
SWEP.Primary.ClipSize			= 20		-- Size of a clip
SWEP.Primary.DefaultClip		= 120	                -- Default number of bullets in a clip
SWEP.Primary.KickUp			= .10		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= .10		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= .10	             -- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true 		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "smg1"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
SWEP.Secondary.CanBash = true
SWEP.Secondary.BashDamage = 75

SWEP.Primary.MaxSurfacePenetrationCount = 10
SWEP.Primary.PenetrationPower = 3
SWEP.Primary.PenetrationMultiplier = 1

SWEP.Secondary.IronFOV			= 70		-- How much you 'zoom' in. Less is more! 

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.ImpactEffect       = nil -- Impact Effect

SWEP.DamageType = DMG_BULLET
SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 50	-- Base damage per bullet
SWEP.Primary.Spread		= 0.006	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = 0.001	-- Ironsight accuracy, should be the same for shotguns

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
		{range = 275, damage = 1},
                {range = 325, damage = 1},
		{range = 500, damage = 0},
	}
}

SWEP.SelectiveFire              = true
SWEP.FireModes = {
        "Single",
	"Auto"
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

SWEP.IronSightsPos = Vector(-4.771, -4.884, 2.563)
SWEP.IronSightsAng = Vector(0.56, -3.55, 0)

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
        [ACT_VM_RELOAD] = 1.5            
}


--[[EFFECTS]]--
--Muzzle Flash

SWEP.MuzzleAttachment			= "1" 		-- Should be "1" for CSS models or "muzzle" for hl2 models
--SWEP.MuzzleAttachmentRaw = 1 --This will override whatever string you gave.  This is the raw attachment number.  This is overridden or created when a gun makes a muzzle event.
SWEP.ShellAttachment			= "shell" 		-- Should be "2" for CSS models or "shell" for hl2 models

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

SWEP.Primary.TFAWeaponType = "Rifle"
--Shell eject override
SWEP.LuaShellEject = true 
SWEP.LuaShellEjectDelay = 0
SWEP.LuaShellEffect = "ShotgunShellEject" --Defaults to blowback

SWEP.Type                       = "Rifle" -- Weapon type. Autodetected, but in some cases needs to be set manually. PLEASE MAKE SURE THE TYPE IS SET PROPERLY so that autodetection code won't make funky stuff.
                                      -- Recognized generic types: "Pistol", "Machine Pistol", "Revolver", "Sub-Machine Gun", "Rifle", "Carbine", "Light Machine Gun", "Shotgun", "Designated Marksman Rifle", "Sniper Rifle", "Grenade", "Launcher"; "Dual Pistols", "Dual Revolvers", "Dual Sub-Machine Guns" and "Dual Guns".
SWEP.Type_Displayed             = "Agripinaa Pattern Type VI" -- Weapon type override for displaying in the inspection menu. If you want to add wacky text below the gun name, DO IT HERE AND NOT IN THE ACTUAL TYPE FIELD!

SWEP.IronSightsPos_GL = Vector(0.43, -10.509, 1.296)
SWEP.IronSightsAng_GL = Vector(10.887, 1.74, 0)
SWEP.Primary.GLSound = Sound("weapons/bolter/blotfire.wav")

SWEP.IronSightsPos_SG = Vector(0.017, -9.07, 4.372)
SWEP.IronSightsAng_SG = Vector(0, 0, 0)
SWEP.Primary.SGSound = Sound("40k/shotgun-fire1.mp3")

SWEP.RTMaterialOverride = -1

local cd = {}
local crosscol = Color(255, 255, 255, 255)
local rtmod = Color(255,0,0,4)
SWEP.RTOpaque = true

SWEP.RTCode = nil

-- Attachments
SWEP.VElements = {
	["laser"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "weapon_bone", rel = "", pos = Vector(23.17, 1.995, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false }
}

SWEP.WElements = {
	["laser"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(22.16, -1.2, -8.866), angle = Angle(-13.226, -1.963, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false }
}

SWEP.LaserSightModAttachment = 2

-- Define reload sound events
SWEP.EventTable = {
    [ACT_VM_RELOAD] = { -- Use the appropriate reload animation activity
        {time = 0.5, type = "sound", value = "weapons/ravager/rifle_clip_out_1.wav"}, -- Magazine out sound
        {time = 1.5, type = "sound", value = "weapons/ravager/rifle_clip_in_1.wav"}  -- Magazine in sound
    }
}

SWEP.Attachments = {
    	[1] = { offset = { 0, 0 }, atts = { "cat_am_ap", "cat_am_match", "cat_am_magnum", "cat_am_incendiary"}, order = 1 },
    	[2] = { offset = { 0, 0 }, atts = { "cat_mag_extend_two", "cat_mag_extend_three"}, order = 2 },
	[3] = { offset = { 0, 0 }, atts = { "cat_stock_heavy", "cat_stock_light"}, order = 3 },
	[4] = { offset = { 0, 0 }, atts = {"cat_scope_reflex" ,"cat_scope_dot","cat_scope_light","cat_scope_heavy"}, order = 4 },
    	[5] = { offset = { 0, 0 }, atts = { "cat_flashlight", "cat_lasersight"}, order = 5 },
    	[6] = { offset = { 0, 0 }, atts = { "cat_bayonet", "cat_under_shotgun", "cat_under_launcher"}, order = 6 },
    	[7] = { offset = { 0, 0 }, atts = { "cat_bar_suppressor", "cat_bar_extend_one"}, order = 7 },
    	[8] = { offset = { 0, 0 }, atts = { "cat_vent"}, order = 8 },
	[10] = { offset = { 0, 0 }, atts = { "cat_training"}, order = 10 },
}

SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}
