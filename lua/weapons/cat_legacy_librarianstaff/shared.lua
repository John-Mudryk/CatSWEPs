
SWEP.Base = "tfa_melee_base"
SWEP.Category = "Cat's Legacy SWEPs"
SWEP.PrintName = "Librarian Staff"
SWEP.ViewModel = "models/zadkiel/weapons/c_oren_katana.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelFOV = 80
SWEP.UseHands = true
SWEP.CameraOffset = Angle(0, 0, 0)
SWEP.WorldModel = "models/zadkiel/weapons/librarian_staff.mdl"
SWEP.HoldType = "melee2"
SWEP.Primary.Directional = true
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.DisableIdleAnimations = false
SWEP.VMPos = Vector(0, 0, -4)

SWEP.AllowSprintAttack = false

SWEP.Sprint_Mode = TFA.Enum.LOCOMOTION_HYBRID-- ANI = mdl, Hybrid = ani + lua, Lua = lua only
SWEP.SprintAnimation = {
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
		["value"] = "sprint_loop", --Number for act, String/Number for sequence
		["is_idle"] = true
	},--looping animation
	["out"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
		["value"] = "sprint_out", --Number for act, String/Number for sequence
		["transition"] = true
	} --Outward transition
}
SWEP.RunSightsPos = Vector(0, 0, 0)
SWEP.RunSightsAng = Vector(-10, -2.5, 2.5)


SWEP.CanBlock = true
SWEP.BlockAnimation = {
	["in"] = {
		["type"] = TFA.Enum.ANIMATION_ACT, --Sequence or act
		["value"] = ACT_VM_DEPLOY, --Number for act, String/Number for sequence
		["transition"] = true
	}, --Inward transition
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_ACT, --Sequence or act
		["value"] = ACT_VM_IDLE_DEPLOYED, --Number for act, String/Number for sequence
		["is_idle"] = true
	},--looping animation
	["hit"] = {
		["type"] = TFA.Enum.ANIMATION_ACT, --Sequence or act
		["value"] = ACT_VM_RELOAD_DEPLOYED, --Number for act, String/Number for sequence
		["is_idle"] = true
	},--when you get hit and block it
	["out"] = {
		["type"] = TFA.Enum.ANIMATION_ACT, --Sequence or act
		["value"] = ACT_VM_UNDEPLOY, --Number for act, String/Number for sequence
		["transition"] = true
	} --Outward transition
}

SWEP.BlockCone = 100 --Think of the player's view direction as being the middle of a sector, with the sector's angle being this
SWEP.BlockDamageMaximum = 0.0 --Multiply damage by this for a maximumly effective block
SWEP.BlockDamageMinimum = 0.0 --Multiply damage by this for a minimumly effective block
SWEP.BlockTimeWindow = 1 --Time to absorb maximum damage
SWEP.BlockTimeFade = 1 --Time for blocking to do minimum damage.  Does not include block window
SWEP.BlockSound = Sound("block_1.wav")
SWEP.BlockDamageCap = 200
SWEP.BlockDamageTypes = {
	DMG_SLASH,DMG_CLUB,DMG_CRUSH,DMG_BULLET,DMG_BLAST,DMG_BURN,DMG_PLASMA,DMG_SHOCK,DMG_DISSOLVE
}

SWEP.Secondary.CanBash = true
SWEP.Secondary.BashDamage = SWEP.Primary.Damage
SWEP.Secondary.BashDelay = 0.1
SWEP.Secondary.BashLength = SWEP.Primary.Range

SWEP.SequenceLengthOverride = {
	[ACT_VM_HITCENTER] = 0.8
}

SWEP.ViewModelBoneMods = {
	["TrueRoot"] = { scale = Vector(1, 1, 1), pos = Vector(3.954, 0.211, 0.671), angle = Angle(-9.24, -2.48, 9.508) },
	["RW_Weapon"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}


SWEP.VElements = {
	["staff"] = { type = "Model", model = "models/zadkiel/weapons/librarian_staff.mdl", bone = "RW_Weapon", rel = "", pos = Vector(0, 0, -28.532), angle = Angle(0, -91.667, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {[0] = 2} }
}

SWEP.WElements = {
	["staff"] = { type = "Model", model = "models/zadkiel/weapons/librarian_staff.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.466, -1.162, 44.618), angle = Angle(180, -180, -3.911), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {[0] = 2} }
}

SWEP.InspectionActions = {ACT_VM_RECOIL1, ACT_VM_RECOIL2, ACT_VM_RECOIL3}

SWEP.Type                       = nil 
SWEP.Type_Displayed             = "Veneficus Pattern Mk. III"

SWEP.Attachments = {
	[10] = { offset = { 0, 0 }, atts = { "cat_training"}, order = 10 },
}
SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}

SWEP.ViewModelBoneMods_Default = {
	["TrueRoot"] = { scale = Vector(1, 1, 1), pos = Vector(4, 0, 1), angle = Angle(-9.25, -2.481, 9.5) },
	["RW_Weapon"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

-- Raised hand position for casting
SWEP.ViewModelBoneMods_Raised = {
	["LeftHand_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10.84, 6.777, 0) },
	["LeftHandRing1_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 75.153, 0) },
	["LeftArm_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(-4.614, -0.763, -5.614), angle = Angle(-66.031, 0, 0) },
	["LeftHandRing2_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 48.832, 0) },
	["LeftHandPinky2_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 69.819, 0) },
	["LeftHandIndex2_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 105.459, 0) },
	["LeftHandMiddle1_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(-0.792, 0, 0), angle = Angle(0, 59.501, 0) },
	["LeftHandPinky1_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-12.334, 68.713, 0) },
	["TrueRoot"] = { scale = Vector(1, 1, 1), pos = Vector(4, 0, 1), angle = Angle(-9.25, -2.481, 9.5) },
	["LeftHandIndex1_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(-0.819, 0, 0), angle = Angle(0, 50.722, 0) },
	["RW_Weapon"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["LeftHandMiddle2_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 92.518, 0) }
}

-- Raised hand position for casting
SWEP.ViewModelBoneMods_Smite = {
	["LeftHand_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10.84, 6.777, 0) },
	["LeftHandRing1_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 75.153, 0) },
	["LeftArm_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(12.71, 0, 10.805), angle = Angle(0, 0, 0) },
	["LeftForeArm_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-18.782, 9.703, 65.593) },
	["LeftHandRing2_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 48.832, 0) },
	["LeftHandPinky2_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 69.819, 0) },
	["LeftHandIndex2_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 105.459, 0) },
	["LeftHandMiddle1_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(-0.792, 0, 0), angle = Angle(0, 59.501, 0) },
	["LeftHandPinky1_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-12.334, 68.713, 0) },
	["TrueRoot"] = { scale = Vector(1, 1, 1), pos = Vector(4, 0, 1), angle = Angle(-9.25, -2.481, 9.5) },
	["LeftHandIndex1_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(-0.819, 0, 0), angle = Angle(0, 50.722, 0) },
	["RW_Weapon"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["LeftHandMiddle2_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 92.518, 0) }
}


SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"
SWEP.Primary.Damage = 350 
SWEP.Primary.Spread = 0.0001
SWEP.Primary.Range = 120

SWEP.SmiteActive = false -- Tracks if Smite is currently being fired
SWEP.SmiteFireSound = "ambient/energy/weld1.wav"
SWEP.SmiteLoopSound = "ambient/energy/electric_loop.wav"
SWEP.SmiteImpactSound = "ambient/energy/spark4.wav"
SWEP.SmiteLoop = nil

--- 📌 **Primary Attack: Fire a Psyker Bolt** ---
function SWEP:PrimaryAttack()
    if not SERVER then return end

    self:SetNextPrimaryFire(CurTime() + 0.75)
    self.Owner:MuzzleFlash()

    local psykerBolt = ents.Create("cat_psyker_bolt")
    if not IsValid(psykerBolt) then 
        print("[ERROR] Failed to create Psyker Bolt! Check if `cat_psyker_bolt` exists.") 
        return 
    end

    local ownerPos = self.Owner:GetShootPos()
    local ownerAng = self.Owner:EyeAngles()
    local spawnPos = ownerPos + ownerAng:Forward() * 20 + ownerAng:Up() * -5

    psykerBolt:SetPos(spawnPos)
    psykerBolt:SetAngles(ownerAng)
    psykerBolt:SetOwner(self.Owner)
    psykerBolt.Damage = self.Primary.Damage
    psykerBolt:Spawn()
    psykerBolt:Activate()

    local phys = psykerBolt:GetPhysicsObject()
    if IsValid(phys) then
        phys:SetVelocity(ownerAng:Forward() * 2000)
    end
end

--- **Secondary Attack: Cast Smite (Lightning Beam)** ---
function SWEP:SecondaryAttack()
    if not SERVER then return end
    if self.SmiteActive then return end 

    self.SmiteActive = true
    self:SetNextSecondaryFire(CurTime() + 0.1)

    -- Play fire start sound
    self.Owner:EmitSound(self.SmiteFireSound)

    -- Start loop sound
    if not self.SmiteLoop then
        self.SmiteLoop = CreateSound(self.Owner, self.SmiteLoopSound)
    end
    self.SmiteLoop:PlayEx(1, 100) 
end

local function SmiteChain(attacker, origin, remainingChains, damage, hitEntities)
    if remainingChains <= 0 then return end -- Stop if no chains left

    local chainRange = 300 -- Maximum distance for Smite to jump
    local newTarget = nil
    local closestDist = chainRange

    -- Ensure `hitEntities` exists
    hitEntities = hitEntities or {}

    -- Find a new target in range that **hasn't already been hit**
    for _, ent in ipairs(ents.FindInSphere(origin, chainRange)) do
        if IsValid(ent) and (ent:IsNPC() or ent:IsPlayer()) and ent ~= attacker and not hitEntities[ent] then
            local dist = origin:Distance(ent:GetPos())
            if dist < closestDist then
                closestDist = dist
                newTarget = ent
            end
        end
    end

    if IsValid(newTarget) then
        -- Mark this entity as hit
        hitEntities[newTarget] = true

        -- Fire a new Smite shot at the new target
        local bullet = {}
        bullet.Attacker = attacker
        bullet.Damage = damage * 0.75 -- Reduce damage per chain
        bullet.Num = 1
        bullet.HullSize = 5
        bullet.Spread = Vector(0, 0, 0)
        bullet.Distance = 750
        bullet.Tracer = 1
        bullet.TracerName = "psyker_smite_beam_smaller" -- Force correct tracer effect
        bullet.Src = origin
        bullet.Dir = (newTarget:WorldSpaceCenter() - origin):GetNormalized()
        bullet.Callback = function(atk, tr, dmginfo)
            -- Apply electric damage
            dmginfo:SetDamageType(DMG_SHOCK)

            -- Play chain zap sound
            sound.Play("ambient/energy/spark1.wav", tr.HitPos, 75, 100)

            -- Spawn chain effect
            if SERVER then
                local effect = EffectData()
                effect:SetStart(origin)
                effect:SetOrigin(tr.HitPos)
                effect:SetEntity(atk)
                util.Effect("psyker_smite_beam_smaller", effect, true, true)
            end

            -- Extract damage IMMEDIATELY and pass as a number
            local newDamage = dmginfo:GetDamage()

            -- Delay next chain to simulate jumping
            timer.Simple(0.1, function()
                if IsValid(newTarget) then -- Ensure the entity is still valid
                    SmiteChain(atk, newTarget:GetPos() + Vector(0, 0, 40), remainingChains - 1, newDamage, hitEntities)
                end
            end)
        end

        attacker:FireBullets(bullet)
    end
end

local function SmiteCallback(attacker, tr, dmginfo)
    if not IsValid(attacker) or not tr.HitPos then return end

    local damageAmount = dmginfo:GetDamage()
    dmginfo:SetDamageType(DMG_SHOCK)

    -- Play Impact Sound
    local wep = attacker:GetActiveWeapon()
    if IsValid(wep) and wep.SmiteImpactSound then
        sound.Play(wep.SmiteImpactSound, tr.HitPos, 75, 100)
    end

    -- Spawn Lightning Effect
    if SERVER then
        local effect = EffectData()
        effect:SetStart(tr.StartPos * 20)
        effect:SetOrigin(tr.HitPos)
        effect:SetEntity(attacker)
        util.Effect("psyker_smite_beam", effect, true, true)
    end

    -- Start Chain Reaction with extracted damage
    timer.Simple(0.1, function()
        SmiteChain(attacker, tr.HitPos, 5, damageAmount, {})
    end)
end


function SWEP:FireSmiteBullet()
    if not IsValid(self.Owner) then return end

    local bullet = {}
    bullet.Attacker = self.Owner
    bullet.Damage = self.Primary.Damage * 0.1
    bullet.Num = 1
    bullet.HullSize = 5
    bullet.Spread = Vector(0, 0, 0)
    bullet.Distance = 750
    bullet.Tracer = 0
    bullet.Callback = SmiteCallback
    bullet.Src = self.Owner:GetShootPos()
    bullet.Dir = self.Owner:GetAimVector()

    self.Owner:LagCompensation(true)
    self.Owner:FireBullets(bullet)
    self.Owner:LagCompensation(false)
end


-- Apply the raised hand bone modification dynamically
function SWEP:RaiseLeftHand()
    -- Set the raised bone modifications
    self.ViewModelBoneMods = table.Copy(self.ViewModelBoneMods_Raised)
    
    -- Force TFA to refresh the bone mods cache
    if self.ClearStatCache then
        self:ClearStatCache("ViewModelBoneMods")
    end

    self:UpdateViewModelBoneMods()
end

-- Reset the hand to the default bone modification dynamically
function SWEP:ResetLeftHand()
    -- Reset to default bone modifications
    self.ViewModelBoneMods = table.Copy(self.ViewModelBoneMods_Default)
    
    -- Force TFA to refresh the bone mods cache
    if self.ClearStatCache then
        self:ClearStatCache("ViewModelBoneMods")
    end

    self:UpdateViewModelBoneMods()
end

-- Helper to apply the current bone modifications immediately
function SWEP:UpdateViewModelBoneMods()
    local vm = self.Owner:GetViewModel()
    if not IsValid(vm) then return end

    for boneName, mod in pairs(self.ViewModelBoneMods) do
        local bone = vm:LookupBone(boneName)
        if bone then
            vm:ManipulateBoneScale(bone, mod.scale)
            vm:ManipulateBonePosition(bone, mod.pos)
            vm:ManipulateBoneAngles(bone, mod.angle)
        end
    end
end

-- Ensure Think forces bone mod updates dynamically
function SWEP:Think()
    if self.BaseClass and self.BaseClass.Think then
        self.BaseClass.Think(self)
    end

    -- Determine if we're casting
    local isCasting = self.Owner:KeyDown(IN_ATTACK)
    local isSmiting = self.Owner:KeyDown(IN_ATTACK2)

    -- Switch bone mods based on casting state
    if isCasting then
        self.ViewModelBoneMods = table.Copy(self.ViewModelBoneMods_Raised)
	self.HoldType = "magic"
    elseif isSmiting then
   	self.ViewModelBoneMods = table.Copy(self.ViewModelBoneMods_Smite)
	self.HoldType = "magic"
    else
        self.ViewModelBoneMods = table.Copy(self.ViewModelBoneMods_Default)
	self.HoldType = "melee2"
    end

    -- Force TFA to update bone mods if necessary
    if self.ClearStatCache then
        self:ClearStatCache("ViewModelBoneMods")
	self:ClearStatCache("HoldType")
    end

    self:UpdateViewModelBoneMods()

    -- Smite bullet handling
    if SERVER and self.SmiteActive then
        if not self.Owner:KeyDown(IN_ATTACK2) then
            self.SmiteActive = false

            -- Stop looping sound
            if self.SmiteLoop then
                self.SmiteLoop:Stop()
                self.SmiteLoop = nil
            end
        else
            -- Fire smite bullets while holding right-click
            if not self.LastSmiteShot or CurTime() > self.LastSmiteShot + 0.1 then
                self:FireSmiteBullet()
                self.LastSmiteShot = CurTime()
            end
        end
    end
end