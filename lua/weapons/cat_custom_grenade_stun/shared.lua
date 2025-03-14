DEFINE_BASECLASS("tfa_cat_nade_base") 

SWEP.Category                           = "Cat's SWEPs"
SWEP.Author				= "The Cat"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "Grenade - Stun"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 1			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "grenade"	-- how others view you carrying the weapon
SWEP.UseHands   = true
SWEP.DisableChambering = true
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.MoveSpeed = 1

SWEP.ViewModelFOV			= 54
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/c_grenade.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_grenade.mdl"	-- Weapon world model
SWEP.ViewModelFlip                      = false
SWEP.Base 				= "tfa_cat_nade_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.Primary.Force = 0 -- Force value, leave nil to autocalc
SWEP.Primary.Knockback = 0 -- Autodetected if nil; this is the velocity kickback
SWEP.ShowWorldModel 			= false

SWEP.ViewModelBoneMods = {
	["ValveBiped.Grenade_body"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}


SWEP.Primary.Sound			= "gdc/rockets/m202f2.wav"		-- script that calls the primary fire sound
SWEP.Primary.RPM			= 60		-- This is in Rounds Per Minute This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Burst				= 180					-- RPM for burst fire, overrides semi.  
SWEP.Primary.BurstDelay				= 0.1					-- Delay between bursts, leave nil to autocalculate
SWEP.Primary.ClipSize			= 1		-- Size of a clip
SWEP.Primary.DefaultClip		= 1	                -- Default number of bullets in a clip
SWEP.Primary.Automatic			= false 		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "grenade"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun

SWEP.Secondary.IronFOV			= 70		-- How much you 'zoom' in. Less is more! 

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 0

SWEP.DamageType = DMG_BULLET
SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 0	-- Base damage per bullet
SWEP.Primary.Spread		= 0.05	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = 0.05	-- Ironsight accuracy, should be the same for shotguns

--Range Related
SWEP.Primary.RangeFalloffLUT = {
	bezier = true,
	range_func = "quintic",
	units = "meters",
	lut = { -- providing zero point is not required
		-- without zero point it is considered to be as {range = 0, damage = 1}
		{range = 0, damage = 1},
                {range = 9, damage = 0}
	}
}

SWEP.SelectiveFire              = false
SWEP.FireModes = {
        "Single"
}

-- Because irons don't magically give you less pellet spread!
-- Enter iron sight info and bone mod info below
SWEP.VMPos = Vector(0, 0, 0) -- The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position.
SWEP.VMAng = Vector(0, 0, 0) -- The viewmodel angular offset, constantly.   Subtract this from any other modifications to viewmodel angle.

SWEP.RunSightsPos = Vector(0, 0, 0)
SWEP.RunSightsAng = Vector(-11.869, 17.129, -16.056)
SWEP.Offset = {
        Pos = {
                Up = -6,
                Right = .5,
                Forward = -7,
        },
        Ang = {
                Up = -90,
                Right = -15,
                Forward = 180
        },
                Scale = .75
}

-- Reload 
SWEP.SequenceTimeOverride = {
        [ACT_VM_RELOAD] = 5            
}

SWEP.Type                       = "Launcher" 
SWEP.Type_Displayed             = "Conturbo Mk. VI" 

-- Attachments
SWEP.VElements = {
	["grenade"] = { type = "Model", model = "models/muschi/weapons/muschi_grenade_light.mdl", bone = "ValveBiped.Grenade_body", rel = "", pos = Vector(0, 0.771, 1.223), angle = Angle(180, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["grenade"] = { type = "Model", model = "models/muschi/weapons/muschi_grenade_light.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.591, 2.733, 2.772), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

-- Define reload sound events
SWEP.EventTable = {
    [ACT_VM_RELOAD] = { -- Use the appropriate reload animation activity
        {time = 0.5, type = "sound", value = "40k/b_magout.wav"}, -- Magazine out sound
        {time = 1.5, type = "sound", value = "40k/b_magin.wav"}  -- Magazine in sound
    }
}

SWEP.Attachments = {
    	[1] = { offset = { 0, 0 }, atts = { "cat_nade_fuse_short", "cat_nade_fuse_long", "cat_nade_fuse_impact"}, order = 1 },
	[2] = { offset = { 0, 0 }, atts = { "cat_nade_sticky"}, order = 2 },
	[10] = { offset = { 0, 0 }, atts = { "cat_training"}, order = 10 },
}

SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}

-- Sprint Animation
SWEP.Sprint_Mode = TFA.Enum.LOCOMOTION_ANI
SWEP.SprintAnimation = {
    ["loop"] = {
        ["type"] = TFA.Enum.ANIMATION_SEQ,
        ["value"] = "sprint",
        ["is_idle"] = true
    }
}

-- Inspection Animations
SWEP.InspectPos = Vector(-3, 0, 3)
SWEP.InspectAng = Vector(0, 0, 0)

SWEP.Primary.Projectile = "cat_grenade_stun" -- What entity is to be spawned
SWEP.Primary.Round = "cat_grenade_stun" -- What entity is to be spawned
SWEP.UnderhandEnabled = true
SWEP.CookingEnabled = true
SWEP.StickOnImpact = false

-- Fuse & Throw Timings
SWEP.CookTimer = 5                    -- Default fuse time
SWEP.Delay = 0.2                      -- Standard throw delay
SWEP.Delay_Underhand = 0.3            -- Underhand throw delay
SWEP.DelayCooked = 0.0                -- Cooked throw delay
SWEP.CookStartDelay = 0               -- Delay before cooking starts

-- Velocity Settings
SWEP.Velocity = 1500                  -- Overhand throw speed
SWEP.Velocity_Underhand = 750         -- Underhand throw speed

-- Angle Modifiers
SWEP.NadeAngleModifier = Angle(0, 0, 0)
SWEP.NadeAngleModifierUnderhand = Angle(0, 0, 0)



function SWEP:Think()
    BaseClass.Think(self)

    -- Set the fuse time based on attachments
    if self:IsAttached("cat_nade_fuse_short") then
        self.CookTimer = 3
    elseif self:IsAttached("cat_nade_fuse_long") then
        self.CookTimer = 7
    elseif self:IsAttached("cat_nade_fuse_impact") then
        self.CookTimer = math.huge -- Disable timer since it's impact based
    else
        self.CookTimer = 5 -- Default fuse
    end
end
