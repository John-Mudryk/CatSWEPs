SWEP.Category                           = "Cat's Legacy SWEPs"
SWEP.Author				= "The Cat"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "Graviton Gun + Heresy Boarding Shield"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 1			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.DrawCrosshairIS			= true
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "shotgun"	-- how others view you carrying the weapon
SWEP.UseHands   = true
SWEP.DisableChambering = true
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.MoveSpeed = 0.9

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/muschi/weapons/muschi_swep_melta_v.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/muschi/weapons/muschi_swep_melta.mdl"	-- Weapon world model
SWEP.ViewModelFlip                      = false
SWEP.Base 				= "tfa_bash_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.Primary.Force = 0 -- Force value, leave nil to autocalc
SWEP.Primary.Knockback = 0 -- Autodetected if nil; this is the velocity kickback

SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_R_UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, -5), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(37.022, 20.812, 23.853) },
	["weapon_bone"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, -5), angle = Angle(0, 0, 0) },
	["mag_bone"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, -5), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(10.715, -10.837, -2.678), angle = Angle(5.639, 8.47, 0) },
	["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-3.948, -44.591, 68.254) }
}


SWEP.Primary.Sound = "" -- Prevent normal fire sounds
SWEP.Primary.LoopSoundStart = "weapons/rivet/rivet_boltpull.wav" -- Optional, played when starting
SWEP.Primary.LoopSound = "40k/gauss_idle.wav" -- Replace with your actual looped sound
SWEP.Primary.LoopSoundTail = "weapons/rivet/rivet_boltpull.wav" -- Optional, played when stopping

SWEP.Primary.RPM			= 900		-- This is in Rounds Per Minute This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Burst				= 180					-- RPM for burst fire, overrides semi.  
SWEP.Primary.BurstDelay				= 0.1					-- Delay between bursts, leave nil to autocalculate
SWEP.Primary.ClipSize			= 100		-- Size of a clip
SWEP.Primary.DefaultClip		= 400	                -- Default number of bullets in a clip
SWEP.Primary.KickUp			= .001		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= .001		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= .001	             -- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true 		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "AR2AltFire"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
SWEP.Secondary.CanBash = true
SWEP.Secondary.BashDamage = 95

SWEP.Primary.MaxSurfacePenetrationCount = 7
SWEP.Primary.PenetrationPower = 75
SWEP.Primary.PenetrationMultiplier = 1

SWEP.Secondary.IronFOV			= 70		-- How much you 'zoom' in. Less is more! 

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.DamageType = DMG_DIRECT
SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 100	-- Base damage per bullet
SWEP.Primary.Spread		= 0.00025	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = 0.00025	-- Ironsight accuracy, should be the same for shotguns
SWEP.Primary.Hullsize = 12

--Range Related
SWEP.Primary.RangeFalloffLUT = {
	bezier = true, -- Whenever to use Bezier or not to interpolate points?
	-- you probably always want it to be set to true
	range_func = "cubic", -- function to spline range
	-- "linear" for linear splining.
	-- Possible values are "quintic", "cubic", "cosine", "sinusine", "linear" or your own function
	units = "meters", -- possible values are "inches", "inch", "hammer", "hu" (are all equal)
	-- everything else is considered to be meters
	lut = { -- providing zero point is not required
		-- without zero point it is considered to be as {range = 0, damage = 1}
		{range = 0, damage = 1},
                {range = 100, damage = 1},
                {range = 500, damage = 1},
	}
}

SWEP.SelectiveFire              = true
SWEP.FireModes = {
        "Single",
	"Auto"
}

--[[VIEWMODEL BLOWBACK]]--

SWEP.BlowbackEnabled = true --Enable Blowback?
SWEP.BlowbackVector = Vector(0, 0, 0) --Vector to move bone <or root> relative to bone <or view> orientation.
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

SWEP.IronSightsPos = Vector(0, -4, 0)
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
        [ACT_VM_RELOAD] = 4            
}

--[[EFFECTS]]--
--Muzzle Flash

SWEP.MuzzleAttachment			= "1" 		-- Should be "1" for CSS models or "muzzle" for hl2 models
--SWEP.MuzzleAttachmentRaw = 1 --This will override whatever string you gave.  This is the raw attachment number.  This is overridden or created when a gun makes a muzzle event.
SWEP.ShellAttachment			= "2" 		-- Should be "2" for CSS models or "shell" for hl2 models

-- Tracer Stuff
SWEP.TracerName		 = "tracer_laser_big_grav"   -- Change to a string of your tracer name.  Can be custom. There is a nice example at https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/base/entities/effects/tooltracer.lua
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

SWEP.Type                       = "Shotgun" 
SWEP.Type_Displayed             = "Autotellurian Pattern Mk. I + Atticus Pattern Mk. I"

-- Attachments
SWEP.VElements = {
	["gun"] = { type = "Model", model = "models/joazzz/weapons/gravitongun.mdl", bone = "weapon_bone", rel = "", pos = Vector(3.309, 1.636, -0.715), angle = Angle(5.594, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["shield"] = { type = "Model", model = "models/joazzz/weapons/w_shield.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(12.597, -10.436, 3.023), angle = Angle(15.765, 40.588, 18.965), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {[0] = 24} }

}

SWEP.WElements = {
	["gunW"] = { type = "Model", model = "models/joazzz/weapons/gravitongun.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(13.906, 1.44, -3.398), angle = Angle(-13.65, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["shield"] = { type = "Model", model = "models/joazzz/weapons/w_shield.mdl", bone = "ValveBiped.Bip01_L_Forearm", rel = "", pos = Vector(4.883, -8.115, 4.888), angle = Angle(86.148, 165.11, -77.848), size = Vector(0.782, 0.782, 0.782), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {[0] = 24} }

}

-- Define reload sound events
SWEP.EventTable = {
    [ACT_VM_RELOAD] = { -- Use the appropriate reload animation activity
        {time = 0.5, type = "sound", value = "40k/b_magout.wav"}, -- Magazine out sound
        {time = 1.5, type = "sound", value = "weapons/reload_new.wav"}  -- Magazine in sound
    }
}

SWEP.Attachments = {
	[10] = { offset = { 0, 0 }, atts = { "cat_training"}, order = 10 },
}

SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}

SWEP.RiotShield = true -- Enable passive blocking
SWEP.RiotShieldCone = 135 -- Default blocking angle
SWEP.RiotShieldConeADS = 80 -- Reduced block angle when ADS
SWEP.RiotShieldDamageTypes = {DMG_BULLET, DMG_SLASH, DMG_CLUB, DMG_BLAST} -- What can be blocked
SWEP.RiotShieldMaximum = 0 -- 100% damage reduction
SWEP.RiotShieldDamageCap = 500 -- Max damage the shield can absorb
SWEP.RiotShieldImpact = "Shield_Impact" -- Block sound effect

local function ScaleDamage(damage, target)
    local baseHP = 100 -- The reference HP for normal damage
    local targetMaxHP = target:GetMaxHealth()
    local scale = targetMaxHP / 7500
    return damage + (scale*damage)
end

-- Custom bullet callback function to apply scaled damage
local function CustomBulletCallback(attacker, tr, dmginfo)
    local target = tr.Entity

    if IsValid(target) and (target:IsPlayer() or target:IsNPC()) then
        local scaledDamage = ScaleDamage(dmginfo:GetDamage(), target)
        dmginfo:SetDamage(scaledDamage)
    end
end

function SWEP:ShootBullet(...)
    local bullet = {}
    bullet.Attacker = self.Owner
    bullet.Num = self.Primary.NumShots
    bullet.Src = self.Owner:GetShootPos()
    bullet.Dir = self.Owner:GetAimVector()
    bullet.Spread = self.Primary.Spread
    bullet.Tracer = self.TracerNum
    bullet.TracerName = self.TracerName
    bullet.Force = self.Primary.Force
    bullet.Damage = self.Primary.Damage
    bullet.Callback = CustomBulletCallback

    self.Owner:FireBullets(bullet)
    self:ShootEffects()
end
