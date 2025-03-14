DEFINE_BASECLASS("tfa_gun_base")
SWEP.Type = "Grenade"
SWEP.MuzzleFlashEffect = ""
SWEP.data = {}
SWEP.data.ironsights = 0
SWEP.Primary.Round = ""
SWEP.UseHands = true

// Velocities
SWEP.Velocity = 1500
SWEP.Velocity_Underhand = 500

// How long the nade should be cooked for before blowing up in hand  
SWEP.CookTimer = 5

// Pretty simple
SWEP.UnderhandEnabled = false
SWEP.CookingEnabled = false

//Third person animation and entity throw delay
SWEP.Delay = 0
SWEP.DelayCooked = 0
SWEP.Delay_Underhand = 0

//How long into the animation to delay the start of the cook
SWEP.CookStartDelay = 0

//Angle modifiers for thrown NADE
SWEP.NadeAngleModifier = Angle( 0, 0, 0 )
SWEP.NadeAngleModifierUnderhand = Angle( 0, 0, 0 )

SWEP.IsTFADOINade = true

function SWEP:Initialize()
	self:SetNW2Bool("Cooking", false)
	self:SetNW2Bool("Pulling", false)
	self:SetNW2Bool("Underhand", false)
	self.NextThrowTime = math.huge
      self.ThrowTime = math.huge
      self.ThirdPersonThrowAnimTime = math.huge
      self.ResetTime = math.huge
      self.ProjectileEntity = self.Primary.Round
      self.DestructTime = math.huge
      self.IsTFADOINade = true
      BaseClass.Initialize(self)
end

function SWEP:Deploy()
      self:DoAmmoCheck()
	self:SetNW2Bool("Cooking", false)
	self:SetNW2Bool("Pulling", false)
	self:SetNW2Bool("Underhand", false)
	self.NextThrowTime = math.huge
      self.ThrowTime = math.huge
      self.ThirdPersonThrowAnimTime = math.huge
      self.ResetTime = math.huge
      self.DestructTime = math.huge
      BaseClass.Deploy(self)
end

function SWEP:ChoosePullAnim()
	if not self:OwnerIsValid() then return end
	
	local cooking = self:GetNW2Bool( "Cooking", false )
	
	local tanim = ACT_VM_PULLBACK_HIGH
	
	if cooking then
		tanim = ACT_VM_PULLBACK_HIGH
	end
	
	self:SendViewModelAnim(tanim)

	return tanim
end

function SWEP:ChooseShootAnim()
	if not self:OwnerIsValid() then return end
      
      local cooking = self:GetNW2Bool( "Cooking", false )
      local underhand = self:GetNW2Bool( "Underhand", false )
	
	local tanim = ACT_VM_THROW

      if cooking then
            tanim = ACT_VM_THROW
            self.ThirdPersonThrowAnimTime = CurTime() + self.DelayCooked
      elseif underhand then
		tanim = ACT_VM_HAULBACK
		self.ThirdPersonThrowAnimTime = CurTime() + self.Delay
	else
            self.ThirdPersonThrowAnimTime = CurTime() + self.Delay
      end

	self:SendViewModelAnim(tanim)

	return tanim
end

function SWEP:Throw()
    local tanim = self:ChooseShootAnim()
    local cooking = self:GetNW2Bool("Cooking", false)
    local underhand = self:GetNW2Bool("Underhand", false)

    -- Set throw timing based on cooking state
    if cooking then
        self.ThrowTime = CurTime() + self.DelayCooked
    elseif underhand then
        self.ThrowTime = CurTime() + self.Delay_Underhand
    else
        self.ThrowTime = CurTime() + self.Delay
    end

    -- Consume the grenade immediately (prevents exploits)
    self:SetClip1(0)

    -- Delay state resets until after the throw
    self.ResetTime = CurTime() + self:SequenceDuration(self:SelectWeightedSequence(tanim))
    self.NextThrowTime = math.huge
end

function SWEP:DoAmmoCheck()
       
       if self:Clip1() <= 0 then
		if self:Ammo1() <= 0 then
 			timer.Simple(0, function()
				if IsValid(self) and self:OwnerIsValid() and SERVER then
					-- self:GetOwner():StripWeapon(self:GetClass())
				end
			end)
		else
			self:TakePrimaryAmmo(1, true)
			self:SetClip1(1)
		end
	end
     
end

function SWEP:Think2()
    BaseClass.Think2(self)

    -- Handle cooking self-destruct
    if self.DestructTime <= CurTime() and self:GetNW2Bool("Cooking", false) then
        self:SelfDestruct()
    end

    -- Handle releasing the throw button
    if self.NextThrowTime <= CurTime() and not self:GetOwner():KeyDown(IN_ATTACK) and not self:GetOwner():KeyDown(IN_ATTACK2) then
        self:Throw()
    end

    -- When it's time to throw the grenade
    if self.ThrowTime <= CurTime() then
        self:ShootBulletInformation()
        self.ThrowTime = math.huge
    end

    -- Third-person animation trigger
    if self.ThirdPersonThrowAnimTime <= CurTime() then
        self:GetOwner():SetAnimation(PLAYER_ATTACK1)
        self.ThirdPersonThrowAnimTime = math.huge
    end

    -- Reset states after throw is fully processed
    if self.ResetTime <= CurTime() then
        self:SetNW2Bool("Cooking", false)
        self:SetNW2Bool("Pulling", false)
        self:SetNW2Bool("Underhand", false)
        self.DestructTime = math.huge
        self.CookStartTime = nil
        self:Deploy()
    end
end

function SWEP:PrimaryAttack()
    if not IsFirstTimePredicted() then return end

    if self:Clip1() > 0 and self:OwnerIsValid() and self:CanStartThrow() then
        self:SetNW2Bool("Pulling", true)

        -- Enable cooking if holding IN_USE
        if self.Owner:KeyDown(IN_USE) and self.CookingEnabled then
            self:SetNW2Bool("Cooking", true)
            self.CookStartTime = CurTime()
            self.DestructTime = CurTime() + self.CookTimer
        else
            self:SetNW2Bool("Cooking", false)
            self.DestructTime = math.huge
        end

        local tanim = self:ChoosePullAnim()
        self.NextThrowTime = CurTime() + self:SequenceDuration(self:SelectWeightedSequence(tanim))
    end
end

function SWEP:SecondaryAttack()
    if not IsFirstTimePredicted() then return end

    if self:Clip1() > 0 and self:OwnerIsValid() and self:CanStartThrow() and self.UnderhandEnabled then
        self:SetNW2Bool("Pulling", true)
        self:SetNW2Bool("Underhand", true)

        local tanim = self:ChoosePullAnim()
        self.NextThrowTime = CurTime() + self:SequenceDuration(self:SelectWeightedSequence(tanim))
    end
end

function SWEP:ChooseIdleAnim( ... )
	if self:GetNW2Bool( "Pulling", false ) then return end
	BaseClass.ChooseIdleAnim( self, ... )
end

function SWEP:CanStartThrow()
	if self:GetNW2Bool( "Pulling", false ) or not self:CanPrimaryAttack() then return false end
	return true
end

function SWEP:SelfDestruct()
    if not SERVER then return end
    if not IsValid(self:GetOwner()) then return end

    -- Calculate the actual cooking duration
    local cookedTime = 0
    if self.CookStartTime then
        cookedTime = CurTime() - self.CookStartTime
    end

    -- Only self-destruct if overcooked
    if self:GetNW2Bool("Cooking", false) and cookedTime >= self.CookTimer then
        local ent = ents.Create(self:GetStat("Primary.Projectile"))
        if not IsValid(ent) then return end

        -- Spawn grenade directly above the player
        ent:SetPos(self:GetOwner():GetPos() + Vector(0, 0, 10)) 
        ent:SetOwner(self:GetOwner())
        ent.Owner = self:GetOwner()
        ent.Inflictor = self
        ent.Damage = self.Primary.Damage or 250
        ent.Range = self.Primary.Range or 300
        ent.KaboomTime = CurTime() -- Immediate explosion

        ent:Spawn()

        -- Disable motion to keep it from bouncing
        local phys = ent:GetPhysicsObject()
        if IsValid(phys) then
            phys:EnableMotion(false)
        end

        -- Reset states to prevent further actions
        self:SetNW2Bool("Cooking", false)
        self:SetNW2Bool("Pulling", false)
        self:SetNW2Bool("Underhand", false)

        -- Reset timers to prevent further throwing
        self.DestructTime = math.huge
        self.NextThrowTime = math.huge
        self.ThrowTime = math.huge
        self.ThirdPersonThrowAnimTime = math.huge
        self.ResetTime = math.huge
        self.CookStartTime = nil

        -- Consume the grenade
        self:SetClip1(0)
    end
end

function SWEP:ShootBullet()
    if not IsFirstTimePredicted() and not game.SinglePlayer() then return end

    if SERVER then
        local ent = ents.Create(self:GetStat("Primary.Projectile"))
        if not IsValid(ent) then return end

        local dir = self:GetOwner():EyeAngles():Forward()
        local underhand = self:GetNW2Bool("Underhand", false)

        local throwVelocity = underhand and self:GetStat("Velocity_Underhand") or self:GetStat("Velocity")
	local grenadeDamage = self:GetStat("Primary.Damage")

        -- Pass the impact attachment status
        ent.IsImpact = self:IsAttached("cat_nade_fuse_impact")
	ent.Damage = grenadeDamage

	-- Toggle sticky behavior based on the attachment
	local isToggleActive = self:IsAttached("cat_nade_sticky")
	ent.StickOnImpact = isToggleActive and not self.StickOnImpact or (not isToggleActive and self.StickOnImpact)


        ent:SetPos(self:GetOwner():GetShootPos())
        ent:SetAngles(self:GetOwner():EyeAngles())
        ent:SetOwner(self:GetOwner())

        -- Set the correct explosion timer based on cooking
        ent.KaboomTime = self:GetNW2Bool("Cooking", false) and self.DestructTime or (CurTime() + self.CookTimer)

        ent:Spawn()

        -- Apply velocity after spawning
        local phys = ent:GetPhysicsObject()
        if IsValid(phys) then
            phys:AddAngleVelocity(Vector(0, 0.66, 0) * 1000)
            phys:SetVelocity(dir * throwVelocity)
        end

        -- Reset cooking state immediately after throwing
        self:SetNW2Bool("Cooking", false)
        self.DestructTime = math.huge
        self.CookStartTime = nil
    end
end




