SWEP.Category                           = "Cat's SWEPs"
SWEP.Author				= "The Cat"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "Plasma Gun"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
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

SWEP.MoveSpeed = 0.95

SWEP.ViewModelFOV			= 54
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/muschi/weapons/muschi_swep_plasmagun_v.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/muschi/weapons/muschi_swep_plasmagun.mdl"	-- Weapon world model
SWEP.ViewModelFlip                      = false
SWEP.Base 				= "tfa_bash_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.Primary.Force = 20 -- Force value, leave nil to autocalc
SWEP.Primary.Knockback = 2 -- Autodetected if nil; this is the velocity kickback

SWEP.Primary.Sound			= "40k/plasma1.wav"		-- script that calls the primary fire sound
SWEP.Primary.RPM			= 60		-- This is in Rounds Per Minute This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Burst				= 180					-- RPM for burst fire, overrides semi.  
SWEP.Primary.BurstDelay				= 0.1					-- Delay between bursts, leave nil to autocalculate
SWEP.Primary.ClipSize			= 100		-- Size of a clip
SWEP.Primary.DefaultClip		= 200	                -- Default number of bullets in a clip
SWEP.Primary.KickUp			= .1		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= .1		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= .1	             -- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true 		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "AR2AltFire"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
SWEP.Secondary.CanBash = false

SWEP.Primary.MaxSurfacePenetrationCount = 10
SWEP.Primary.PenetrationPower = 21
SWEP.Primary.PenetrationMultiplier = 1
SWEP.Primary.HullSize = 5

SWEP.Secondary.IronFOV			= 70		-- How much you 'zoom' in. Less is more! 

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.DamageType = DMG_SHOCK
SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 2000	-- Base damage per bullet
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
		{range = 290, damage = 1},
                {range = 300, damage = 1},
		{range = 650, damage = 0},
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

SWEP.IronSightsPos = Vector(-4.071, -6.09, 0.529)
SWEP.IronSightsAng = Vector(-1.92, -1.787, 0)

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
SWEP.TracerName		 = "tracer_laser_plasma"   -- Change to a string of your tracer name.  Can be custom. There is a nice example at https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/base/entities/effects/tooltracer.lua
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

SWEP.Type                       = "Rifle" 
SWEP.Type_Displayed             = "Mk. XII Ragefire"

SWEP.ImpactEffect = "zad_small_explosion"--Impact Effect
SWEP.ImpactDecal = "FadingScorch"--Impact Decal

-- Attachments
SWEP.VElements = {
}

SWEP.WElements = {
}

-- Define reload sound events
SWEP.EventTable = {
    [ACT_VM_RELOAD] = { -- Use the appropriate reload animation activity
        {time = 0.25, type = "sound", value = "weapons/flamer/wpn_flamer_reload.wav"}, -- Magazine out sound
        {time = 1, type = "sound", value = "weapons/laserrifle/wpn_riflelaser_reloadinout.wav"}  -- Magazine in sound
    }
}

SWEP.Attachments = {
    	[1] = { offset = { 0, 0 }, atts = { "cat_am_plasma_fast", "cat_am_plasma_overcharge", "cat_am_plasma_bolt"}, order = 1 },
	[10] = { offset = { 0, 0 }, atts = { "cat_training"}, order = 10 },
}

SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}

DEFINE_BASECLASS("tfa_bash_base")

function SWEP:ShootBullet(...)
	if self.IsVenting then return end

	-- Add heat
	self:AddHeat()

	-- If an attachment is equipped, fire a projectile
	if self:IsUsingProjectile() then
		self:FireShot()
		return
	end

	-- Otherwise, fire a hitscan bullet (default behavior)
	return self.BaseClass.ShootBullet(self, ...)
end

function SWEP:IsUsingProjectile()
	return self:IsAttached("cat_am_plasmacannon_bolt")
		or self:IsAttached("cat_am_plasmacannon_bolt_chaos")
		or self:IsAttached("cat_am_plasma_bolt")
		or self:IsAttached("cat_am_plasma_bolt_chaos")
end

function SWEP:FireShot()
	-- Default to hitscan if no projectile attachment is equipped
	if not self:IsUsingProjectile() then
		self:ShootBullet()
		return
	end

	-- Ensure this only runs on the server to prevent errors
	if CLIENT then return end

	-- Default projectile if no specific attachment is equipped
	local projectileClass = "cat_plasma_big"

	-- Check if an attachment modifies the projectile type
	if self:IsAttached("cat_am_plasmacannon_bolt") then
		projectileClass = "cat_plasma_bolt_big"
	elseif self:IsAttached("cat_am_plasmacannon_bolt_chaos") then
		projectileClass = "cat_plasma_bolt_big_chaos"
	elseif self:IsAttached("cat_am_plasma_bolt") then
		projectileClass = "cat_plasma_bolt_small"
	elseif self:IsAttached("cat_am_plasma_bolt_chaos") then
		projectileClass = "cat_plasma_bolt_small_chaos"
	end

	-- Create and fire the projectile (only on the server)
	local ent = ents.Create(projectileClass)
	if not IsValid(ent) then return end

	local dir = self:GetOwner():EyeAngles():Forward()
	local pos = self:GetOwner():EyePos()

	ent:SetPos(pos)
	ent:SetAngles(self:GetOwner():EyeAngles())
	ent:SetOwner(self:GetOwner())

	-- Pass the weapon's damage to the projectile
	ent.Damage = self.Primary.Damage or 1000
	ent.Range = self.Primary.Range or 100

	ent:Spawn()

	-- Apply velocity
	local phys = ent:GetPhysicsObject()
	if IsValid(phys) then
		phys:Wake()
		phys:SetVelocity(dir * 5000) -- Adjust plasma speed as needed
		phys:EnableGravity(false) -- Plasma should float
		phys:EnableDrag(false)
	end
end

SWEP.HeatLevel = 0
SWEP.HeatMax = 100
SWEP.HeatPerShot = 15
SWEP.OverheatThreshold = 100 -- optional, if you want to prevent firing
SWEP.HeatDecayRate = 5 -- per second
SWEP.VentDecayRate = 25 -- per second
SWEP.LastHeatUpdate = 0
SWEP.VentLoopSound = nil
SWEP.HeatMultiplier = 1 -- Base value; attachments will modify this dynamically

function SWEP:PrimaryAttack()
	if self.IsVenting then
		if SERVER and (not self.LastVentingSound or CurTime() - self.LastVentingSound > 1) then
			self:GetOwner():EmitSound("weapons/marsplasma/plasmagun2.wav", 75, 100, 0.3)
			self.LastVentingSound = CurTime()
		end

		self:SetNextPrimaryFire(CurTime() + 0.2)
		return
	end

	return self.BaseClass.PrimaryAttack(self)
end

function SWEP:Think()
	self:HandleHeat()
	return self.BaseClass.Think(self)
end

if CLIENT then
	SWEP.VentViewmodelOffset = {
		pos = Vector(0, 0, -4), -- Up/down/forward/backward
		ang = Angle(15, 0, 0) -- Tilt upward
	}

	SWEP.VentViewmodelLerp = 0 -- Lerp state 0 to 1

	function SWEP:GetViewModelPosition(pos, ang)

		if self.BaseClass.GetViewModelPosition then
			pos, ang = self.BaseClass.GetViewModelPosition(self, pos, ang)
		end

		local target = self:GetNWBool("IsVenting", false) and 1 or 0
		self.VentViewmodelLerp = Lerp(FrameTime() * 5, self.VentViewmodelLerp or 0, target)

		local offset = self.VentViewmodelOffset

		local offsetPos = Vector(offset.pos)
		local offsetAng = Angle(offset.ang)

		-- Apply lerp
		offsetPos:Mul(self.VentViewmodelLerp)
		offsetAng:Mul(self.VentViewmodelLerp)

		-- Move position
		pos = pos + ang:Forward() * offsetPos.x
		pos = pos + ang:Right()   * offsetPos.y
		pos = pos + ang:Up()      * offsetPos.z

		-- Rotate angle
		ang:RotateAroundAxis(ang:Right(), offsetAng.pitch)
		ang:RotateAroundAxis(ang:Up(), offsetAng.yaw)
		ang:RotateAroundAxis(ang:Forward(), offsetAng.roll)

		return pos, ang
	end
end


function SWEP:AddHeat()
	local multiplier = self:GetHeatMultiplier()
	local heatGain = (self.HeatPerShot or 15) * multiplier

	self.HeatLevel = math.min(self.HeatLevel + heatGain, self.HeatMax)

	if SERVER then
		self:SetNWFloat("HeatLevel", self.HeatLevel)

		if self.HeatLevel >= self.OverheatThreshold then
			local dmg = DamageInfo()
			dmg:SetDamage(self.Primary.Damage * 0.05)
			dmg:SetDamageType(DMG_BURN)
			dmg:SetAttacker(self:GetOwner())
			dmg:SetInflictor(self)
			self:GetOwner():TakeDamageInfo(dmg)
			self:GetOwner():EmitSound("weapons/laserrifle/impacts/fx_laser_impact_01.wav", 75, 100, 1)
		end
	end
end


function SWEP:HandleHeat()
	local curTime = CurTime()
	if curTime < (self.LastHeatUpdate or 0) + 0.1 then return end

	local owner = self:GetOwner()
	if not IsValid(owner) then return end

	-- Venting detection: E + (Walk or Zoom)
	local use = owner:KeyDown(IN_USE)
	local alt = owner:KeyDown(IN_WALK) or owner:KeyDown(IN_ZOOM)
	local venting = use and alt
	self.IsVenting = venting

	local decayRate = venting and self.VentDecayRate or self.HeatDecayRate
	self.HeatLevel = math.max(self.HeatLevel - decayRate * 0.1, 0)

	self.LastHeatUpdate = curTime

	if SERVER then
		self:SetNWFloat("HeatLevel", self.HeatLevel)
		self:SetNWBool("IsVenting", venting)

		-- Play venting sound once
		if venting then
			if not self.VentLoopSound then
			self.VentLoopSound = CreateSound(self:GetOwner(), "weapons/marsplasma/reload.wav")
		end

		if not self.VentLoopSound:IsPlaying() then
			self.VentLoopSound:Play()
		end

		else
			if self.VentLoopSound and self.VentLoopSound:IsPlaying() then
			self.VentLoopSound:Stop()
		end
end

		-- Emit steam
		if venting then
			if CurTime() >= (self.NextVentingSteam or 0) then
				local ed = EffectData()
				ed:SetEntity(self)
				util.Effect("plasma_venting", ed)

				self.NextVentingSteam = CurTime() + 0.2
			end
		else
			self.NextVentingSteam = nil
		end
	end
end




function SWEP:CanPrimaryAttack()
	if self.IsVenting then
		return false
	end

	return self.BaseClass.CanPrimaryAttack(self)
end

local heatModifiers = {
	["cat_am_plasma_overcharge"] = 0.75,
	["cat_am_plasma_fast"] = -0.3,
	["cat_am_plasma_bolt"] = 0.5,
	["cat_am_plasmacannon_overcharge"] = 0.75,
	["cat_am_plasmacannon_bolt"] = 0.5,
	["cat_am_plasma_overcharge_chaos"] = 0.75,
	["cat_am_plasma_fast_chaos"] = -0.3,
	["cat_am_plasma_bolt_chaos"] = 0.5,
	["cat_am_plasmacannon_overcharge_chaos"] = 0.75,
	["cat_am_plasmacannon_bolt_chaos"] = 0.5
}

function SWEP:GetHeatMultiplier()
	local mult = 1
	for k, v in pairs(heatModifiers) do
		if self:IsAttached(k) then
			mult = mult + v
		end
	end
	return math.max(mult, 0.1)
end

function SWEP:OnRemove()
	if self.VentLoopSound then
		self.VentLoopSound:Stop()
	end
end

function SWEP:Holster()
	if self.VentLoopSound then
		self.VentLoopSound:Stop()
	end
	return true
end


if CLIENT then
	surface.CreateFont("HeatFont", {
		font = "Roboto",
		size = 18,
		weight = 600
	})

	SWEP.DisplayedHeat = 0

	function SWEP:DrawHUD()
		self:DrawHeatBar()

		if self:GetNWBool("IsVenting", false) then
			draw.SimpleText("VENTING", "HeatFont", ScrW() / 2, 110, Color(100, 255, 255, 220), TEXT_ALIGN_CENTER)
		end

		return self.BaseClass.DrawHUD(self)
	end

	function SWEP:DrawHeatBar()
		local heat = self:GetNWFloat("HeatLevel", 0)
		local heatMax = self.HeatMax or 100
		local barW, barH = 200, 20
		local x = ScrW() / 2 - barW / 2
		local y = 80

		-- smoothing
		self.DisplayedHeat = Lerp(0.1, self.DisplayedHeat or 0, heat)
		local percent = math.Clamp(self.DisplayedHeat / heatMax, 0, 1)

		local barColor = Color(100 + 155 * percent, 255 - 255 * percent, 0, 255)

		-- Background
		draw.RoundedBox(6, x, y, barW, barH, Color(20, 20, 20, 200))
		-- Fill
		draw.RoundedBox(6, x + 2, y + 2, (barW - 4) * percent, barH - 4, barColor)
		-- Label
		draw.SimpleText("HEAT", "HeatFont", x + barW / 2, y - 20, Color(255, 255, 255, 200), TEXT_ALIGN_CENTER)
	end
end