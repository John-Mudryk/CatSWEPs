 SWEP.Base				= "tfa_gun_base"
SWEP.Category				= "Cat's SWEPs"
SWEP.Manufacturer = ""
SWEP.Author				= "The Cat"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.Spawnable				= true --Can you, as a normal user, spawn this?
SWEP.AdminSpawnable			= true --Can an adminstrator spawn this?  Does not tie into your admin mod necessarily, unless its coded to allow for GMod's default ranks somewhere in its code.  Evolve and ULX should work, but try to use weapon restriction rather than these.
SWEP.DrawCrosshair			= true 		-- Draw the crosshair?
SWEP.DrawCrosshairIS = false  
SWEP.PrintName				= "Heavy Stubber"
SWEP.Slot				= 3				-- Slot in the weapon selection menu.  Subtract 1, as this starts at 0.
SWEP.SlotPos				= 1			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter if enabled in the GUI.
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.AutoSwitchTo			= false		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false		-- Auto switch from if you pick up a better weapon
SWEP.Weight				= 30			-- This controls how "good" the weapon is for autopickup.

--Firing related
----------------- TFA Base Basic sound handling
SWEP.Primary.Sound			  = "weapons/tfa_nam_m60/m60_fp.wav" -- This is the sound of the weapon, when you shoot.
SWEP.Primary.SilencedSound	  = nil -- This is the sound of the weapon, when silenced.
-- AKA IronInSound
SWEP.Secondary.IronSightsInSound = nil -- Sound to play when iron sighting in? nil for default
-- AKA IronOutSound
SWEP.Secondary.IronSightsOutSound = nil -- Sound to play when iron sighting out? nil for default

----------------- TFA Base Advanced sound handling
SWEP.Primary.LoopSound		  = nil -- Looped fire sound, unsilenced
SWEP.Primary.LoopSoundSilenced  = nil -- Looped fire sound, silenced
SWEP.Primary.LoopSoundTail	  = nil -- Loop end/tail sound, unsilenced
SWEP.Primary.LoopSoundTailSilenced = nil -- Loop end/tail sound, silenced
SWEP.Primary.LoopSoundAutoOnly  = true -- Play loop sound for full-auto only? Fallbacks to Primary.Sound for semi/burst if true

SWEP.Primary.PenetrationMultiplier = 1 --Change the amount of something this gun can penetrate through
SWEP.Primary.Damage		= 80					-- Damage, in standard damage points.
SWEP.Primary.HullSize = 1 --Big bullets, increase this value.  They increase the hull size of the hitscan bullet.
SWEP.Primary.NumShots	= 1 --The number of shots the weapon fires.  SWEP.Shotgun is NOT required for this to be >1.
SWEP.Primary.Automatic			= true					-- Automatic/Semi Auto
SWEP.Primary.RPM				= 650					-- This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Semi				= 190					-- RPM for semi-automatic or burst fire.  This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Burst				= nil					-- RPM for burst fire, overrides semi.  This is in Rounds Per Minute / RPM
SWEP.Primary.BurstDelay				= 0.5					-- Delay between bursts, leave nil to autocalculate
SWEP.FiresUnderwater = false
SWEP.Primary.Force = 5 -- Force value, leave nil to autocalc
SWEP.Primary.Knockback = 0.5 -- Autodetected if nil; this is the velocity kickback

SWEP.CanBeSilenced = false --Can we silence?  Requires animations.
SWEP.Silenced = false --Silenced by default?

SWEP.Primary.MaxSurfacePenetrationCount = 10
SWEP.Primary.PenetrationPower = 6
SWEP.Primary.PenetrationMultiplier = 1

-- Selective Fire Stuff

SWEP.SelectiveFire              = true
SWEP.FireModes = {
        "Auto",
}

--[[VIEWMODEL BLOWBACK]]--

SWEP.BlowbackEnabled = true --Enable Blowback?
SWEP.BlowbackVector = Vector(-0.03,-1,0.00) --Vector to move bone <or root> relative to bone <or view> orientation.
SWEP.BlowbackCurrentRoot = 0 --Amount of blowback currently, for root
SWEP.BlowbackCurrent = 0 --Amount of blowback currently, for bones
SWEP.BlowbackBoneMods = nil --Viewmodel bone mods via SWEP Creation Kit
SWEP.Blowback_Only_Iron = false --Only do blowback on ironsights
SWEP.Blowback_PistolMode = false --Do we recover from blowback when empty?
SWEP.Blowback_Shell_Enabled = true
SWEP.Blowback_Shell_Effect = "ShotgunShellEject"

SWEP.DisableBurstFire	= false --Only auto/single?
SWEP.OnlyBurstFire		= false --No auto, only burst/single?
SWEP.DefaultFireMode 	= "" --Default to auto or whatev
SWEP.FireModeName = nil --Change to a text value to override it

-- Weapon jam
SWEP.CanJam = true -- whenever weapon cam jam
SWEP.JamChance = 0.005 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.
SWEP.JamFactor = 0.001 -- How to increase jam factor after each shot.


--Ammo Related

SWEP.Primary.ClipSize = 175					-- This is the size of a clip
SWEP.Primary.DefaultClip = 0					-- This is the number of bullets the gun gives you, counting a clip as defined directly above.
SWEP.Primary.Ammo = "smg1"					-- What kind of ammo.  Options, besides custom, include pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, and AirboatGun.
--Pistol, buckshot, and slam like to ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.DisableChambering = true --Disable round-in-the-chamber

--Recoil Related
SWEP.Primary.KickUp			= 0				-- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown			= 0 					-- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal			= 0					-- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 0 	--Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.

--Firing Cone Related

SWEP.Primary.Spread		= 0.005				--This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = 0.001

--Range Related
SWEP.Primary.RangeFalloffLUT = {
	bezier = true , -- Whenever to use Bezier or not to interpolate points?
	-- you probably always want it to be set to true
	range_func = "quintic", -- function to spline range
	-- "linear" for linear splining.
	-- Possible values are "quintic", "cubic", "cosine", "sinusine", "linear" or your own function
	units = "meters", -- possible values are "inches", "inch", "hammer", "hu" (are all equal)
	-- everything else is considered to be meters
	lut = { -- providing zero point is not required
		-- without zero point it is considered to be as {range = 0, damage = 1}
		{range = 200, damage = 1},
		{range = 350, damage = 1},
		{range = 475, damage = 0.7},
		{range = 500, damage = 0},
	}
}

--Misc
SWEP.IronRecoilMultiplier=0.6 --Multiply recoil by this factor when we're in ironsights.  This is proportional, not inversely.
SWEP.CrouchRecoilMultiplier=0.6  --Multiply recoil by this factor when we're crouching.  This is proportional, not inversely.
SWEP.JumpRecoilMultiplier=1.3  --Multiply recoil by this factor when we're crouching.  This is proportional, not inversely.
SWEP.WallRecoilMultiplier=1.1  --Multiply recoil by this factor when we're changing state e.g. not completely ironsighted.  This is proportional, not inversely.
SWEP.ChangeStateRecoilMultiplier=1.3  --Multiply recoil by this factor when we're crouching.  This is proportional, not inversely.
SWEP.CrouchAccuracyMultiplier=0.5--Less is more.  Accuracy * 0.5 = Twice as accurate, Accuracy * 0.1 = Ten times as accurate
SWEP.ChangeStateAccuracyMultiplier=1.5 --Less is more.  A change of state is when we're in the progress of doing something, like crouching or ironsighting.  Accuracy * 2 = Half as accurate.  Accuracy * 5 = 1/5 as accurate
SWEP.JumpAccuracyMultiplier=2--Less is more.  Accuracy * 2 = Half as accurate.  Accuracy * 5 = 1/5 as accurate
SWEP.WalkAccuracyMultiplier=1.35--Less is more.  Accuracy * 2 = Half as accurate.  Accuracy * 5 = 1/5 as accurate
SWEP.IronSightTime = 0.3 --The time to enter ironsights/exit it.
SWEP.NearWallTime = 0.25 --The time to pull up  your weapon or put it back down
SWEP.ToCrouchTime = 0.05 --The time it takes to enter crouching state
SWEP.WeaponLength = 40 --Almost 3 feet Feet.  This should be how far the weapon sticks out from the player.  This is used for calculating the nearwall trace.
SWEP.MoveSpeed = 0.9 --Multiply the player's movespeed by this.
SWEP.IronSightsMoveSpeed = 0.6 --Multiply the player's movespeed by this when sighting.
SWEP.SprintFOVOffset = 3.75 --Add this onto the FOV when we're sprinting.

SWEP.ShootWhileDraw=false --Can you shoot while draw anim plays?
SWEP.AllowReloadWhileDraw=false --Can you reload while draw anim plays?
SWEP.SightWhileDraw=false --Can we sight in while the weapon is drawing / the draw anim plays?
SWEP.AllowReloadWhileHolster=true --Can we interrupt holstering for reloading?
SWEP.ShootWhileHolster=true --Cam we interrupt holstering for shooting?
SWEP.SightWhileHolster=false --Cancel out "iron"sights when we holster?
SWEP.UnSightOnReload=true --Cancel out ironsights for reloading.
SWEP.AllowReloadWhileSprinting=false --Can you reload when close to a wall and facing it?
SWEP.AllowReloadWhileNearWall=false --Can you reload when close to a wall and facing it?
SWEP.SprintBobMult=3 -- More is more bobbing, proportionally.  This is multiplication, not addition.  You want to make this > 1 probably for sprinting.
SWEP.IronBobMult=0  -- More is more bobbing, proportionally.  This is multiplication, not addition.  You want to make this < 1 for sighting, 0 to outright disable.
SWEP.IronBobMultWalk=0.2  -- More is more bobbing, proportionally.  This is multiplication, not addition.  You want to make this < 1 for sighting, 0 to outright disable.
SWEP.AllowViewAttachment = true --Allow the view to sway based on weapon attachment while reloading or drawing, IF THE CLIENT HAS IT ENABLED IN THEIR CONVARS!!!!11111oneONEELEVEN

SWEP.CanDrawAnimate=true
SWEP.CanDrawAnimateEmpty=true
SWEP.CanDrawAnimateSilenced=true
SWEP.CanHolsterAnimate=true
SWEP.CanHolsterAnimateEmpty=true
SWEP.CanIdleAnimate=true
SWEP.CanIdleAnimateEmpty=true
SWEP.CanIdleAnimateSilenced=true
SWEP.CanShootAnimate=true
SWEP.CanShootAnimateSilenced=true
SWEP.CanReloadAnimate=true
SWEP.CanReloadAnimateEmpty=true
SWEP.CanReloadAnimateSilenced=true
SWEP.CanDryFireAnimate=true
SWEP.CanDryFireAnimateSilenced=true
SWEP.CanSilencerAttachAnimate=true
SWEP.CanSilencerDetachAnimate=true

--[[VIEWMODEL]]--

SWEP.ViewModel			= "models/muschi/weapons/muschi_swep_heavy_stubber_v.mdl" --Viewmodel path
SWEP.ViewModelFOV			= 75		-- This controls how big the viewmodel looks.  Less is more.
SWEP.ViewModelFlip			= false		-- Set this to true for CSS models, or false for everything else (with a righthanded viewmodel.)
SWEP.MaterialTable = nil --Make sure the viewmodel and the worldmodel have the same material ids.  Next, fill this in with your desired submaterials.
SWEP.UseHands = true --Use gmod c_arms system.
SWEP.VMPos = Vector(0,0,0) --The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position.
SWEP.VMAng = Vector(0,0,0) --The viewmodel angular offset, constantly.   Subtract this from any other modifications to viewmodel angle.
SWEP.CameraOffset = Angle(0,0,0)
--[[WORLDMODEL]]--

SWEP.WorldModel			= "models/muschi/weapons/muschi_swep_heavy_stubber.mdl" -- Weapon world model path

SWEP.HoldType  = "ar2"		-- This is how others view you carrying the weapon. Options include:
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive
-- You're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles


SWEP.ThirdPersonReloadDisable=false --Disable third person reload?  True disables.

--[[SCOPES]]--
SWEP.IronSightsSensitivity = 1--0.25 --Useful for a RT scope.  Change this to 0.25 for 25% sensitivity.  This is if normal FOV compenstaion isn't your thing for whatever reason, so don't change it for normal scopes.
SWEP.BoltAction                 = false  --Unscope/sight after you shoot?
SWEP.BoltAction_Forced                  = false  --Unscope/sight after you shoot?
SWEP.Scoped                             = false  --Draw a scope overlay?

SWEP.ScopeScale = 0.5 --Scale of the scope overlay
SWEP.ReticleScale = 0.7 --Scale of the reticle overlay

--[[SHOTGUN CODE]]--

SWEP.Shotgun = false --Enable shotgun style reloading.
SWEP.ShellTime = .35 -- For shotguns, how long it takes to insert a shell.

--[[SPRINTING]]--

SWEP.RunSightsPos = Vector(0, 0, 0)
SWEP.RunSightsAng = Vector(-11.869, 17.129, -16.056)
--[[IRONSIGHTS]]--

SWEP.data 				= {}
SWEP.data.ironsights			= 1 --Enable Ironsights
SWEP.Secondary.IronFOV			= 70					-- How much you 'zoom' in. Less is more!  Don't have this be <= 0.  A good value for ironsights is like 70.

--[[INSPECTION]]--
SWEP.InspectPos = Vector(14.086, -12.136, 0.032)
SWEP.InspectAng = Vector(14.149, 54.548, 11.729)

--[[VIEWMODEL ANIMATION HANDLING]]--


--[[VIEWMODEL PROCEDURAL ANIMATION]]--

SWEP.DoProceduralReload = false --Animate first person reload using lua?
SWEP.ProceduralReloadTime = 5 --Procedural reload time?

--[[HOLDTYPES]]--

SWEP.IronSightHoldTypeOverride=""  --This variable overrides the ironsights holdtype, choosing it instead of something from the above tables.  Change it to "" to disable.
SWEP.SprintHoldTypeOverride=""  --This variable overrides the sprint holdtype, choosing it instead of something from the above tables.  Change it to "" to disable.

--[[ANIMATION]]--

SWEP.ForceDryFireOff = true --Disables dryfire.  Set to false to enable them.
SWEP.DisableIdleAnimations = false --Disables idle animations.  Set to false to enable them.
SWEP.ForceEmptyFireOff = true --Disables empty fire animations.  Set to false to enable them.

--If you really want, you can remove things from SWEP.actlist and manually enable animations and set their lengths.

SWEP.SequenceEnabled = {} --Self explanitory.  This can forcefully enable or disable a certain ACT_VM
SWEP.SequenceLength = {}  --This controls the length of a certain ACT_VM
SWEP.SequenceLengthOverride={

} --Override this if you want to change the length of a sequence but not the next idle

--[[EFFECTS]]--

--Muzzle Flash

SWEP.MuzzleAttachment			= "1" 		-- Should be "1" for CSS models or "muzzle" for hl2 models
--SWEP.MuzzleAttachmentRaw = 1 --This will override whatever string you gave.  This is the raw attachment number.  This is overridden or created when a gun makes a muzzle event.
SWEP.ShellAttachment			= "2" 		-- Should be "2" for CSS models or "shell" for hl2 models

SWEP.DoMuzzleFlash = true --Do a muzzle flash?
SWEP.CustomMuzzleFlash = false --Disable muzzle anim events and use our custom flashes?
SWEP.AutoDetectMuzzleAttachment = false --For multi-barrel weapons, detect the proper attachment?
SWEP.MuzzleFlashEffect = nil--Change to a string of your muzzle flash effect.  Copy/paste one of the existing from the base.

--Shell eject override
SWEP.LuaShellEject = true
SWEP.LuaShellEjectDelay = 0
SWEP.LuaShellEffect = "ShotgunShellEject" --Defaults to blowback

SWEP.Type                       = "Rifle" 
SWEP.Type_Displayed             = "Catachan Mk. LXr" 

-- Tracer Stuff
SWEP.TracerName		 = 4   -- Change to a string of your tracer name.  Can be custom. There is a nice example at https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/base/entities/effects/tooltracer.lua
SWEP.TracerCount		= 1	 -- 0 disables, otherwise, 1 in X chance

--[[RENDER TARGET]]--
SWEP.RTMaterialOverride = -1 -- Take the material you want out of

--Misc
SWEP.ShouldDrawAmmoHUD=false--THIS IS PROCEDURALLY CHANGED AND SHOULD NOT BE TWEAKED.  BASE DEPENDENT VALUE.  DO NOT CHANGE OR THINGS MAY BREAK.  NO USE TO YOU.
SWEP.DefaultFOV=90 --BASE DEPENDENT VALUE.  DO NOT CHANGE OR THINGS MAY BREAK.  NO USE TO YOU.

--Disable secondary crap


SWEP.IronSightsPos = Vector( -1.7, -6, 0)
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.Secondary.CanBash = false

-- Reload 
SWEP.SequenceTimeOverride = {
	[ACT_VM_RELOAD] = 8	
}

-- Worldmodel position
SWEP.Offset = {
	Pos = {
		Up = 2,
		Right = 2,
		Forward = 20
			},
	Ang = {
		Up = 0,
		Right = -2,
		Forward = 185
	},
	Scale = 1.25
} --Procedural world model animation, defaulted for CS:S purposes.


SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}
SWEP.Attachments = {
	[1] = { offset = { 0, 0 }, atts = { "cat_am_ap", "cat_am_match", "cat_am_magnum", "cat_am_incendiary"}, order = 1 },
    	[2] = { offset = { 0, 0 }, atts = { "cat_flashlight", "cat_lasersight"}, order = 3 },
	[10] = { offset = { 0, 0 }, atts = { "cat_training"}, order = 10 },
}

SWEP.ViewModelBoneMods = {
}

SWEP.VElements = {
}

DEFINE_BASECLASS( SWEP.Base )

SWEP.AP = 20

SWEP.BeltBG = 3
SWEP.BeltMax = 9

SWEP.EventTable = {
	[ACT_VM_RELOAD] = {
		{ ["time"] = 100 / 31.5, ["type"] = "lua", ["value"] = function(self)
			self.Bodygroups_V[ self.BeltBG ] = math.Clamp( self:Ammo1() + self:Clip1(), 0, self.BeltMax )
		end}
	},
	[ACT_VM_RELOAD_DEPLOYED] = {
		{ ["time"] = 100 / 31.5, ["type"] = "lua", ["value"] = function(self)
			self.Bodygroups_V[ self.BeltBG ] = math.Clamp( self:Ammo1() + self:Clip1(), 0, self.BeltMax )
		end}
	},
	[ACT_VM_RELOAD_EMPTY] = {
		{ ["time"] = 140 / 31.5, ["type"] = "lua", ["value"] = function(self)
			self.Bodygroups_V[ self.BeltBG ] = math.Clamp( self:Ammo1() + self:Clip1(), 0, self.BeltMax )
		end}
	}
}

function SWEP:Think2( ... )
	if self:GetStatus() ~= TFA.GetStatus("reloading") then
		self.Bodygroups_V[ self.BeltBG ] = math.Clamp( self:Clip1(), 0, self.BeltMax )
	end
	return BaseClass.Think2( self, ... )
end

function SWEP:ChooseReloadAnim( ... )
	if self:Clip1() > 0 and self:Clip1() < self.BeltMax  then
		return self:SendViewModelAnim(ACT_VM_RELOAD_DEPLOYED)
	else
		return BaseClass.ChooseReloadAnim( self, ... )
	end
end