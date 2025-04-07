SWEP.Category                           = "Cat's Legacy SWEPs"
SWEP.Author				= "The Cat"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "Volkite Charger"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 1			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "shotgun"	-- how others view you carrying the weapon
SWEP.UseHands   = true
SWEP.DisableChambering = true
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.MoveSpeed = 1

SWEP.ViewModelFOV			= 60
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/muschi/weapons/muschi_swep_bolter_v.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/muschi/weapons/muschi_swep_bolter.mdl"	-- Weapon world model
SWEP.ViewModelFlip                      = false
SWEP.Base 				= "tfa_bash_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.Primary.Force = 20 -- Force value, leave nil to autocalc
SWEP.Primary.Knockback = 2 -- Autodetected if nil; this is the velocity kickback

SWEP.ShowWorldModel = false

SWEP.ViewModelBoneMods = {
	["mag_bone"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["weapon_bone"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.Primary.Sound			= "asuran/fire2.wav"		-- script that calls the primary fire sound
SWEP.Primary.RPM			= 120		-- This is in Rounds Per Minute This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Burst				= 180					-- RPM for burst fire, overrides semi.  
SWEP.Primary.BurstDelay				= 0.1					-- Delay between bursts, leave nil to autocalculate
SWEP.Primary.ClipSize			= 15		-- Size of a clip
SWEP.Primary.DefaultClip		= 120	                -- Default number of bullets in a clip
SWEP.Primary.KickUp			= .025		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= .025		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= .025	             -- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false 		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "slam"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
SWEP.Secondary.CanBash = true
SWEP.Secondary.BashDamage = 100

SWEP.Primary.MaxSurfacePenetrationCount = 10
SWEP.Primary.PenetrationPower = 10
SWEP.Primary.PenetrationMultiplier = 1

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 
SWEP.BoltAction			= false  --Unscope/sight after you shoot?
SWEP.Scoped			= false  --Draw a scope overlay?

SWEP.ScopeOverlayThreshold = 0.875 --Percentage you have to be sighted in to see the scope.
SWEP.BoltTimerOffset = 0.1 --How long you stay sighted in after shooting, with a bolt action.

SWEP.ScopeScale = 0.75 --Scale of the scope overlay
SWEP.ReticleScale = 1 --Scale of the reticle overlay

--GDCW Overlay Options.  Only choose one.

SWEP.Secondary.UseACOG			= false	 	--Overlay option
SWEP.Secondary.UseMilDot		= false		--Overlay option
SWEP.Secondary.UseSVD			= false		--Overlay option
SWEP.Secondary.UseParabolic		= false		--Overlay option
SWEP.Secondary.UseElcan			= false	 	--Overlay option
SWEP.Secondary.UseGreenDuplex		= true		--Overlay option



SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.DamageType = DMG_BULLET
SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 1250	-- Base damage per bullet
SWEP.Primary.Spread		= 0.01	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
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
		{range = 450, damage = 1},
                {range = 600, damage = 0.75},
		{range = 650, damage = 0},
	}
}

SWEP.SelectiveFire              = true
SWEP.FireModes = {
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
        [ACT_VM_RELOAD] = 3            
}

--[[EFFECTS]]--
--Muzzle Flash

SWEP.MuzzleAttachment			= "1" 		-- Should be "1" for CSS models or "muzzle" for hl2 models
--SWEP.MuzzleAttachmentRaw = 1 --This will override whatever string you gave.  This is the raw attachment number.  This is overridden or created when a gun makes a muzzle event.
SWEP.ShellAttachment			= "2" 		-- Should be "2" for CSS models or "shell" for hl2 models

-- Tracer Stuff
SWEP.TracerName		 = "tracer_laser_big_volkite"   -- Change to a string of your tracer name.  Can be custom. There is a nice example at https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/base/entities/effects/tooltracer.lua
SWEP.TracerCount		= 1	 -- 0 disables, otherwise, 1 in X chance

-- Weapon jam
SWEP.CanJam = true -- whenever weapon cam jam
SWEP.JamChance = 0.015 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.
SWEP.JamFactor = 0.001 -- How to increase jam factor after each shot.

SWEP.DoMuzzleFlash = true --Do a muzzle flash?
SWEP.CustomMuzzleFlash = false --Disable muzzle anim events and use our custom flashes?
SWEP.AutoDetectMuzzleAttachment = false --For multi-barrel weapons, detect the proper attachment?
SWEP.MuzzleFlashEffect = "muzzlelaser" --Change to a string of your muzzle flash effect.  Copy/paste one of the existing from the base.

--Shell eject override
SWEP.LuaShellEject = false 
SWEP.LuaShellEjectDelay = 0
SWEP.LuaShellEffect = "ShotgunShellEject" --Defaults to blowback

SWEP.Type                       = "Rifle" 
SWEP.Type_Displayed             = "Mars-Omega Pattern Mk. Ib"

-- Attachments
SWEP.VElements = {
	["volkitecharger"] = { type = "Model", model = "models/joazzz/weapons/volkite_charger.mdl", bone = "weapon_bone", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["scope_short"] = { type = "Model", model = "models/rtcircle.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "volkitecharger", pos = Vector(-10.662, 0.004, 7.479), angle = Angle(0, 180, 0), size = Vector(0.4, 0.4, 0.4), color = Color(255, 255, 255, 255), surpresslightning = false, material = "!tfa_rtmaterial", skin = 0, bodygroup = {}, active = false }
}


SWEP.WElements = {
	["volkitecharger"] = { type = "Model", model = "models/joazzz/weapons/volkite_charger.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(12.961, 1.179, -3.872), angle = Angle(-12.556, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
}

-- Define reload sound events
SWEP.EventTable = {
    [ACT_VM_RELOAD] = { -- Use the appropriate reload animation activity
        {time = 0.5, type = "sound", value = "40k/b_magout.wav"}, -- Magazine out sound
        {time = 1.5, type = "sound", value = "weapons/reload_new.wav"}  -- Magazine in sound
    }
}

SWEP.Attachments = {
	[1] = { offset = { 0, 0 }, atts = { "cat_scope_dot2", "cat_scope_dot2_hud"}, order = 1 },
	[10] = { offset = { 0, 0 }, atts = { "cat_training"}, order = 10 },
}

SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}

SWEP.IronSightsPos_Short = Vector(-3.84, -2.589, -1.081)
SWEP.IronSightsAng_Short = Vector(-5.628, -1.803, 0)

function SWEP:ShootBullet(...)
	-- Call base logic first (handles animations, sounds, ammo)
	self.BaseClass.ShootBullet(self, ...)

	-- Fire custom invisible bullet for explosion logic
	self:FireVolkiteEffectBullet()
end

function SWEP:FireVolkiteEffectBullet()
	local ply = self:GetOwner()
	if not IsValid(ply) then return end

	local bullet = {}
	bullet.Num    = 1
	bullet.Src    = ply:GetShootPos()
	bullet.Dir    = ply:GetAimVector()
	bullet.Spread = Vector(0, 0, 0)
	bullet.Tracer = 0
	bullet.Force  = 0
	bullet.Damage = 0 -- No actual damage
	bullet.Callback = function(attacker, tr, dmginfo)
		local ent = tr.Entity
		if not IsValid(ent) or not ent:IsNPC() then return end

		if math.random() < 0.10 then -- 10% chance

			local pos = ent:GetPos()

			-- Charge-up
			local charge = EffectData()
			charge:SetEntity(ent)
			charge:SetOrigin(pos)
			util.Effect("volkite_chargeup", charge)
			ent:Ignite(2, 0)
			ent:EmitSound("ambient/fire/gascan_ignite1.wav", 75, 100)

			timer.Simple(0.3, function()
				if not IsValid(ent) then return end

				-- Boom
				local boom = EffectData()
				boom:SetOrigin(pos)
				util.Effect("volkite_explosion", boom, true, true)

				sound.Play("ambient/explosions/explode_4.wav", pos)
				sound.Play("npc/roller/mine/rmine_explode_shock1.wav", pos)

				util.Decal("FadingScorch", pos + Vector(0,0,5), pos - Vector(0,0,30), attacker)

				-- Do some blast damage
				local dmg = self.Primary and self.Primary.Damage or 100
				util.BlastDamage(attacker, attacker, pos, 128, dmg * 0.25)
			end)
		end
	end

	ply:FireBullets(bullet)
end

