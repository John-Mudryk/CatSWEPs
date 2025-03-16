SWEP.Category                           = "Cat's Legacy SWEPs"
SWEP.Author				= "The Cat"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "Missile Launcher"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 1			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.DrawCrosshairIS = false
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "rpg"	-- how others view you carrying the weapon
SWEP.UseHands   = true
SWEP.DisableChambering = true
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.MoveSpeed = 0.95

SWEP.ViewModelFOV			= 54
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/muschi/weapons/muschi_swep_bazooka_v.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/muschi/weapons/muschi_swep_bazooka.mdl"	-- Weapon world model
SWEP.ViewModelFlip                      = false
SWEP.Base 				= "tfa_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.Primary.Force = 0 -- Force value, leave nil to autocalc
SWEP.Primary.Knockback = 0 -- Autodetected if nil; this is the velocity kickback

SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {
	["weapon_bone"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}


SWEP.Primary.Sound			= "gdc/rockets/matadorf.wav"		-- script that calls the primary fire sound
SWEP.Primary.RPM			= 30		-- This is in Rounds Per Minute This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Burst				= 180					-- RPM for burst fire, overrides semi.  
SWEP.Primary.BurstDelay				= 0.1					-- Delay between bursts, leave nil to autocalculate
SWEP.Primary.ClipSize			= 1		-- Size of a clip
SWEP.Primary.DefaultClip		= 12	                -- Default number of bullets in a clip
SWEP.Primary.KickUp			= .1		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= .1		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= .1	             -- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true 		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "rpg_round"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
SWEP.Secondary.CanBash = true

SWEP.Primary.MaxSurfacePenetrationCount = 7
SWEP.Primary.PenetrationPower = 75
SWEP.Primary.PenetrationMultiplier = 1

SWEP.Secondary.IronFOV			= 40		-- How much you 'zoom' in. Less is more! 

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.DamageType = DMG_BLAST
SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 2500	-- Base damage per bullet
SWEP.Primary.Spread		= 0.003	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = 0.0003	-- Ironsight accuracy, should be the same for shotguns

SWEP.BoltAction			= false  --Unscope/sight after you shoot?
SWEP.Scoped			= true  --Draw a scope overlay?

SWEP.ScopeOverlayThreshold = 0.875 --Percentage you have to be sighted in to see the scope.
SWEP.BoltTimerOffset = 0.1 --How long you stay sighted in after shooting, with a bolt action.

SWEP.ScopeScale = 0.65 --Scale of the scope overlay
SWEP.ReticleScale = 0.85 --Scale of the reticle overlay

--GDCW Overlay Options.  Only choose one.

SWEP.Secondary.UseGreenDuplex			= true	 	--Overlay option

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
		{range = 290, damage = 1},
                {range = 300, damage = 1},
		{range = 350, damage = 0},
	}
}

SWEP.SelectiveFire              = true
SWEP.FireModes = {
        "Single",
	"Auto"
}

--[[SHOTGUN CODE]]--

SWEP.Shotgun = false --Enable shotgun style reloading.

SWEP.ShellTime = 1 -- For shotguns, how long it takes to insert a shell.

-- Because irons don't magically give you less pellet spread!
-- Enter iron sight info and bone mod info below
SWEP.VMPos = Vector(0, 0, 0) -- The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position.
SWEP.VMAng = Vector(0, 0, 0) -- The viewmodel angular offset, constantly.   Subtract this from any other modifications to viewmodel angle.

SWEP.IronSightsPos = Vector(-1.121, -18.018, -0.64)
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.RunSightsPos = Vector(0, 0, 0)
SWEP.RunSightsAng = Vector(-11.869, 17.129, -16.056)

--Procedural world model animation, defaulted for CS:S purposes
SWEP.Offset = {
        Pos = {
                Up = 0,
                Right = 0,
                Forward = 0
        },
        Ang = {
                Up = -90,
                Right = -15,
                Forward = 180
        },
                Scale = 0.5
}

SWEP.ThirdPersonReloadDisable = false --Disable third person reload?  True disables.

-- Reload 
SWEP.SequenceTimeOverride = {
        [ACT_VM_RELOAD] = 5            
}

--[[EFFECTS]]--
--Muzzle Flash

SWEP.MuzzleAttachment			= "1" 		-- Should be "1" for CSS models or "muzzle" for hl2 models
--SWEP.MuzzleAttachmentRaw = 1 --This will override whatever string you gave.  This is the raw attachment number.  This is overridden or created when a gun makes a muzzle event.
SWEP.ShellAttachment			= "2" 		-- Should be "2" for CSS models or "shell" for hl2 models

-- Tracer Stuff
SWEP.TracerName		 = "thetalaser1"   -- Change to a string of your tracer name.  Can be custom. There is a nice example at https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/base/entities/effects/tooltracer.lua
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

SWEP.Type                       = "Launcher" 
SWEP.Type_Displayed             = "Soundstrike Pattern Mk. I" 

-- Attachments
SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/joazzz/weapons/missilelauncher.mdl", bone = "weapon_bone", rel = "", pos = Vector(0, 4.638, -3.638), angle = Angle(3.482, 90, -7.773), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/joazzz/weapons/missilelauncher.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-7.917, 0.961, -4.993), angle = Angle(180, 90, -11.518), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

-- Define reload sound events
SWEP.EventTable = {
    [ACT_VM_RELOAD] = { -- Use the appropriate reload animation activity
        {time = 0.5, type = "sound", value = "items/cliprelease1.wav"}, -- Magazine out sound
        {time = 1.5, type = "sound", value = "items/clipinsert1.wav"}  -- Magazine in sound
    }
}

SWEP.Attachments = {
	[1] = { offset = { 0, 0 }, atts = {"cat_rocket_krak","cat_rocket_he","cat_rocket_melta"}, order = 1 },
	[10] = { offset = { 0, 0 }, atts = { "cat_training"}, order = 10 },
}

SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}

--[[PROJECTILES]]--

function SWEP:ShootBullet()

	
	if SERVER then
	self:FireShot()
	end
end

function SWEP:FireShot()
	if  not self:IsAttached("cat_rocket_krak") and not self:IsAttached("cat_rocket_melta") and not self:IsAttached("cat_rocket_he") and not self:IsAttached("practice_rocket") then 
		local ent = ents.Create("cat_rpg_rocket")
		dir = (self:GetOwner():EyeAngles() + Angle(0,0,0)):Forward()
		ent:SetPos(self:GetOwner():EyePos())
		ent:SetAngles( (self:GetOwner():EyeAngles() + Angle(-2,0,0))  )
		ent.Damage = self.Primary.Damage
		ent:Spawn()
        ent.Owner = self:GetOwner()
        ent:SetVelocity(dir * 500000)
        local phys = ent:GetPhysicsObject()
        phys:Wake()
        phys:SetMass(0.4)
        phys:EnableGravity( false )
        phys:SetInertia(dir * 0.4 * 500000)
        phys:SetVelocity(dir * 500000)
        phys:ApplyForceCenter(dir * 0.4 * 500000)
        phys:EnableDrag(false)

	end
	if  self:IsAttached("cat_rocket_melta") then 
		local ent = ents.Create("cat_rpg_rocket_melta")
		dir = (self:GetOwner():EyeAngles() + Angle(0,0,0)):Forward()
		ent:SetPos(self:GetOwner():EyePos())
		ent:SetAngles( (self:GetOwner():EyeAngles() + Angle(0,0,0))  )
		ent.Damage = self.Primary.Damage
		ent:Spawn()
        ent.Owner = self:GetOwner()
        ent:SetVelocity(dir * 500000)
        local phys = ent:GetPhysicsObject()
        phys:Wake()
        phys:SetMass(1)
        phys:EnableGravity( false )
        phys:SetInertia(dir * 1 * 500000)
        phys:SetVelocity(dir * 500000)
        phys:ApplyForceCenter(dir * 1 * 500000)
        phys:EnableDrag(false)

	end
	if  self:IsAttached("cat_rocket_he") then 
		local ent = ents.Create("cat_rpg_rocket_he")
		dir = (self:GetOwner():EyeAngles() + Angle(0,0,0)):Forward()
		ent:SetPos(self:GetOwner():EyePos())
		ent:SetAngles( (self:GetOwner():EyeAngles() + Angle(0,0,0))  )
		ent.Damage = self.Primary.Damage
		ent:Spawn()
        ent.Owner = self:GetOwner()
        ent:SetVelocity(dir * 500000)
        local phys = ent:GetPhysicsObject()
        phys:Wake()
        phys:SetMass(1)
        phys:EnableGravity( false )
        phys:SetInertia(dir * 1 * 500000)
        phys:SetVelocity(dir * 500000)
        phys:ApplyForceCenter(dir * 1 * 500000)
        phys:EnableDrag(false)

	end
	if  self:IsAttached("cat_rocket_krak") then 
		local ent = ents.Create("cat_rpg_rocket_krak")
		dir = (self:GetOwner():EyeAngles() + Angle(0,0,0)):Forward()
		ent:SetPos(self:GetOwner():EyePos())
		ent:SetAngles( (self:GetOwner():EyeAngles() + Angle(0,0,0))  )
		ent.Damage = self.Primary.Damage
		ent:Spawn()
        ent.Owner = self:GetOwner()
        ent:SetVelocity(dir * 500000)
        local phys = ent:GetPhysicsObject()
        phys:Wake()
        phys:SetMass(1)
        phys:EnableGravity( false )
        phys:SetInertia(dir * 1 * 500000)
        phys:SetVelocity(dir * 500000)
        phys:ApplyForceCenter(dir * 1 * 500000)
        phys:EnableDrag(false)

	end
end

SWEP.SequenceRateOverrideScaled = {
	[ACT_VM_PRIMARYATTACK] = 0.85,
	[ACT_VM_PRIMARYATTACK_1] = 0.85
}

SWEP.ProjectileVelocity = 7150 * 12 / 10 --Entity to shoot's velocity
SWEP.DisableChambering = true
