SWEP.Category                           = "Cat's Legacy SWEPs"
SWEP.Author				= "The Cat"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "Godwyn Dual Bolt Pistols"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 1				-- Slot in the weapon selection menu
SWEP.SlotPos				= 1			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "duel"	-- how others view you carrying the weapon
SWEP.UseHands   = true
SWEP.DisableChambering = true
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.MoveSpeed = 0.95

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/cstrike/c_pist_elite.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/muschi/weapons/muschi_swep_boltpistol.mdl"	-- Weapon world model
SWEP.ViewModelFlip                      = false
SWEP.Base 				= "tfa_bash_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.Primary.Force = 10 -- Force value, leave nil to autocalc
SWEP.Primary.Knockback = 1 -- Autodetected if nil; this is the velocity kickback

SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {
	["v_weapon.magazine_right"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["v_weapon.magazine_left"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["v_weapon.elite_right"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["v_weapon.elite_left"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}



SWEP.Primary.Sound			= "40k/b_fire4.wav"		-- script that calls the primary fire sound
SWEP.Primary.RPM			= 480		-- This is in Rounds Per Minute This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Burst				= 180					-- RPM for burst fire, overrides semi.  
SWEP.Primary.BurstDelay				= 0.1					-- Delay between bursts, leave nil to autocalculate
SWEP.Primary.ClipSize			= 40		-- Size of a clip
SWEP.Primary.DefaultClip		= 120	                -- Default number of bullets in a clip
SWEP.Primary.KickUp			= .4		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= .2		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= .2	             -- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false 		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "slam"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
SWEP.Secondary.CanBash = true

SWEP.Primary.MaxSurfacePenetrationCount = 10
SWEP.Primary.PenetrationPower = 10
SWEP.Primary.PenetrationMultiplier = 1

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.DamageType = DMG_BULLET
SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 275	-- Base damage per bullet
SWEP.Primary.Spread		= 0.015	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
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
		{range = 400, damage = 1},
                {range = 550, damage = 1},
		{range = 600, damage = 0},
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

SWEP.IronSightsPos = Vector(0, -5, 0)
SWEP.IronSightsAng = Vector(0, 0, 0)

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
    [ACT_VM_RELOAD] = 3,           	-- Standard reload
    [ACT_VM_RELOAD_EMPTY] = 4		-- Empty reload
}

--[[EFFECTS]]--
--Muzzle Flash

SWEP.MuzzleAttachment			= "1" 		-- Should be "1" for CSS models or "muzzle" for hl2 models
--SWEP.MuzzleAttachmentRaw = 1 --This will override whatever string you gave.  This is the raw attachment number.  This is overridden or created when a gun makes a muzzle event.
SWEP.ShellAttachment			= "2" 		-- Should be "2" for CSS models or "shell" for hl2 models

-- Tracer Stuff
SWEP.TracerName		 = "effect_t_boltgun"   -- Change to a string of your tracer name.  Can be custom. There is a nice example at https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/base/entities/effects/tooltracer.lua
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
SWEP.LuaShellEject = false 
SWEP.LuaShellEjectDelay = 0
SWEP.LuaShellEffect = "ShotgunShellEject" --Defaults to blowback

SWEP.Type                       = "Pistol" 
SWEP.Type_Displayed             = "Godwyn Pattern Mk. III + Godwyn Pattern Mk. III"

SWEP.Bodygroups_V       = {
[4] = 0
}
SWEP.Bodygroups_W       = {
[4] = 1
}

-- Attachments
SWEP.VElements = {
	["mag_l"] = { type = "Model", model = "models/joazzz/weapons/boltpistol_mag.mdl", bone = "v_weapon.magazine_left", rel = "", pos = Vector(-0.25, -6, 0), angle = Angle(-90, 90, 0), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["mag_r"] = { type = "Model", model = "models/joazzz/weapons/boltpistol_mag.mdl", bone = "v_weapon.magazine_right", rel = "", pos = Vector(0.25, -6, 0), angle = Angle(-90, 90, 0), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["boltpistol_l"] = { type = "Model", model = "models/joazzz/weapons/boltpistol.mdl", bone = "v_weapon.elite_left", rel = "", pos = Vector(0, -4, -0.75), angle = Angle(-90, 90, 0), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {[1] = 1} },
	["boltpistol_r"] = { type = "Model", model = "models/joazzz/weapons/boltpistol.mdl", bone = "v_weapon.elite_right", rel = "", pos = Vector(0, -4, -0.75), angle = Angle(-90, 90, 0), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {[1] = 1} }
}

SWEP.WElements = {
	["boltpistol_l"] = { type = "Model", model = "models/joazzz/weapons/boltpistol.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(4.967, 2.364, 6.125), angle = Angle(0, 166.994, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["boltpistol_r"] = { type = "Model", model = "models/joazzz/weapons/boltpistol.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.197, 3.155, -5.934), angle = Angle(173.891, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

-- Define reload sound events
SWEP.EventTable = {
     [ACT_VM_RELOAD] = { -- Use the appropriate reload animation activity
        {time = 0.5, type = "sound", value = "40k/b_magout.wav"}, -- Magazine out sound
        {time = 1.5, type = "sound", value = "40k/b_magin.wav"},  -- Magazine in sound
	{time = 2.5, type = "sound", value = "40k/b_magin.wav"}  -- Magazine in sound
     },
	[ACT_VM_RELOAD_EMPTY] = {
        {time = 0.5, type = "sound", value = "40k/b_magout.wav"}, -- Magazine out sound
        {time = 2, type = "sound", value = "40k/b_magin.wav"},  -- Magazine in sound
        {time = 2.5, type = "sound", value = "weapons/sombra_n/out.wav"}
     }
}

SWEP.Attachments = {
	[2] = { offset = { 0, 0 }, atts = { "cat_am_metalstorm", "cat_am_inferno", "cat_am_kraken", "cat_am_saw", "cat_am_stalker", "cat_am_hellfire", "cat_am_warp", "cat_am_psy"}, order = 2 },
    	[4] = { offset = { 0, 0 }, atts = { "cat_scope_astartes"}, order = 4 },
	[9] = { offset = { 0, 0 }, atts = { "cat_skin_white"}, order = 9 },
	[10] = { offset = { 0, 0 }, atts = { "cat_training"}, order = 10 },
}

SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}

SWEP.IronSightsPos_Short = Vector(-3.28, -4, -3)
SWEP.IronSightsAng_Short = Vector(-4.324, 1.217, 0)

SWEP.ViewModelBoneMods_Iron = {
	["v_weapon.magazine_right"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["v_weapon.magazine_left"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-22, -10, 18) },
	["v_weapon.elite_right"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 1.5, 1), angle = Angle(0, -45, 0) },
	["ValveBiped.Bip01_R_UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(22, -10, -18) },
	["v_weapon.elite_left"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, -1.201, 1.5), angle = Angle(0, 45, 0) }
}

if CLIENT then
    -- LerpAngle helper
    local function LerpAngle(t, from, to)
        return Angle(
            Lerp(t, from.p or 0, to.p or 0),
            Lerp(t, from.y or 0, to.y or 0),
            Lerp(t, from.r or 0, to.r or 0)
        )
    end

    function SWEP:Think2()
        self.BaseClass.Think2(self)

        local progress = self:GetIronSightsProgress() or 0
        self.ViewModelBoneMods = self.ViewModelBoneMods or {}
        self.ViewModelBoneMods_Iron = self.ViewModelBoneMods_Iron or {}

        -- Store default mods
        if not self.DefaultViewModelBoneMods then
            self.DefaultViewModelBoneMods = table.Copy(self.ViewModelBoneMods)
        end

        self.LerpedViewModelBoneMods = self.LerpedViewModelBoneMods or {}

        for bone, defaultMod in pairs(self.DefaultViewModelBoneMods) do
            local ironMod = self.ViewModelBoneMods_Iron[bone] or defaultMod

            -- Fallbacks for missing fields
            local defScale = defaultMod.scale or Vector(1, 1, 1)
            local defPos = defaultMod.pos or Vector(0, 0, 0)
            local defAngle = defaultMod.angle or Angle(0, 0, 0)

            local ironScale = ironMod.scale or defScale
            local ironPos = ironMod.pos or defPos
            local ironAngle = ironMod.angle or defAngle

            self.LerpedViewModelBoneMods[bone] = {
                scale = LerpVector(progress, defScale, ironScale),
                pos = LerpVector(progress, defPos, ironPos),
                angle = LerpAngle(progress, defAngle, ironAngle)
            }
        end

        self.ViewModelBoneMods = self.LerpedViewModelBoneMods
    end
end


