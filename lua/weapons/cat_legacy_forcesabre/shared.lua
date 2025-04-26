SWEP.Base = "tfa_melee_base"
SWEP.Category = "Cat's Legacy SWEPs"
SWEP.PrintName = "Force Sabre"
SWEP.ViewModel = "models/zadkiel/weapons/c_oren_katana.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelFOV = 80
SWEP.UseHands = true
SWEP.CameraOffset = Angle(0, 0, 0)
--SWEP.InspectPos = Vector(17.184, -4.891, -11.902) - SWEP.VMPos
--SWEP.InspectAng = Vector(70, 46.431, 70)
SWEP.WorldModel = "models/joazzz/weapons/forcesword.mdl"
SWEP.HoldType = "melee"
SWEP.Primary.Directional = true
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.DisableIdleAnimations = false
SWEP.VMPos = Vector(5, 5, -6)
SWEP.Primary.Damage = 800
SWEP.Primary.Range = 100
SWEP.Primary.End = 0.85

SWEP.Primary.Attacks = {
	{
		["act"] = ACT_VM_HITLEFT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = SWEP.Primary.Range, -- Trace distance
		["dir"] = Vector(120, 0, 0), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage, --Damage
		["dmgtype"] = bit.bor(DMG_SLASH,DMG_ALWAYSGIB), --bit.bor(DMG_SLASH,DMG_ALWAYSGIB),DMG_CRUSH, etc.
		["delay"] = 0.45, --Delay
		["spr"] = false, --Allow attack while sprinting?
		["snd"] = Sound("weapons/tfa_kf2/katana/katana_swing_miss3.wav"), -- Sound ID
		["snd_delay"] = 0.26,
		["viewpunch"] = Angle(1, -5, 0), --viewpunch angle
		["end"] = 0.8, --time before next attack
		["hull"] = 42, --Hullsize
		["direction"] = "R", --Swing dir,
		["hitflesh"] = Sound("weapons/tfa_kf2/zweihander/hitflesh_3.wav"),
		["hitworld"] = Sound("weapons/tfa_kf2/katana/block01.wav"),
	},
	{
		["act"] = ACT_VM_HITRIGHT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = SWEP.Primary.Range, -- Trace distance
		["dir"] = Vector(-120, 0, 0), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage, --Damage
		["dmgtype"] = bit.bor(DMG_SLASH,DMG_ALWAYSGIB), --bit.bor(DMG_SLASH,DMG_ALWAYSGIB),DMG_CRUSH, etc.
		["delay"] = 0.45, --Delay
		["spr"] = false, --Allow attack while sprinting?
		["snd"] = Sound("weapons/tfa_kf2/katana/katana_swing_miss3.wav"), -- Sound ID
		["snd_delay"] = 0.26,
		["viewpunch"] = Angle(1, 5, 0), --viewpunch angle
		["end"] = 0.8, --time before next attack
		["hull"] = 42, --Hullsize
		["direction"] = "L", --Swing dir,
		["hitflesh"] = Sound("weapons/tfa_kf2/zweihander/hitflesh_3.wav"),
		["hitworld"] = Sound("weapons/tfa_kf2/katana/block01.wav"),
	},
	{
		["act"] = ACT_VM_PRIMARYATTACK, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = SWEP.Primary.Range, -- Trace distance
		["dir"] = Vector(0, 20, -70), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage, --Damage
		["dmgtype"] = bit.bor(DMG_SLASH,DMG_ALWAYSGIB), --bit.bor(DMG_SLASH,DMG_ALWAYSGIB),DMG_CRUSH, etc.
		["delay"] = 0.45, --Delay
		["spr"] = true, --Allow attack while sprinting?
		["snd"] = Sound("weapons/tfa_kf2/katana/katana_swing_miss3.wav"), -- Sound ID
		["snd_delay"] = 0.26,
		["viewpunch"] = Angle(5, 0, 0), --viewpunch angle
		["end"] = 0.8, --time before next attack
		["hull"] = 42, --Hullsize
		["direction"] = "F", --Swing dir,
		["hitflesh"] = Sound("weapons/tfa_kf2/zweihander/hitflesh_3.wav"),
		["hitworld"] = Sound("weapons/tfa_kf2/katana/block01.wav"),
	},
	{
		["act"] = ACT_VM_PULLBACK, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = SWEP.Primary.Range, -- Trace distance
		["dir"] = Vector(0, 20, 70), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage, --Damage
		["dmgtype"] = bit.bor(DMG_SLASH,DMG_ALWAYSGIB), --bit.bor(DMG_SLASH,DMG_ALWAYSGIB),DMG_CRUSH, etc.
		["delay"] = 0.45, --Delay
		["spr"] = false, --Allow attack while sprinting?
		["snd"] = Sound("weapons/tfa_kf2/katana/katana_swing_miss3.wav"), -- Sound ID
		["snd_delay"] = 0.26,
		["viewpunch"] = Angle(-5, 0, 0), --viewpunch angle
		["end"] = 0.8, --time before next attack
		["hull"] = 42, --Hullsize
		["direction"] = "B", --Swing dir,
		["hitflesh"] = Sound("weapons/tfa_kf2/zweihander/hitflesh_3.wav"),
		["hitworld"] = Sound("weapons/tfa_kf2/katana/block01.wav"),
	}
}

SWEP.Secondary.Attacks = {
	{
		["act"] = ACT_VM_SECONDARYATTACK, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = SWEP.Primary.Range * 1.1, -- Trace distance
		["dir"] = Vector(0, 20, -70), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage * 1.2, --Damage
		["dmgtype"] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
		["delay"] = 0.6, --Delay
		["spr"] = true, --Allow attack while sprinting?
		["snd"] = Sound("weapons/tfa_kf2/zweihander/swing_light_2.wav"), -- Sound ID
		["snd_delay"] = 0.5,
		["viewpunch"] = Angle(5, 0, 0), --viewpunch angle
		["end"] = 0.9, --time before next attack
		["hull"] = 42, --Hullsize
		["direction"] = "F", --Swing dir,
		["hitflesh"] = Sound("weapons/tfa_kf2/zweihander/hitflesh_3.wav"),
		["hitworld"] = Sound("weapons/tfa_kf2/katana/block01.wav"),
	},
	{
		["act"] = ACT_VM_MISSLEFT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = SWEP.Primary.Range * 1.1, -- Trace distance
		["dir"] = Vector(120, 0, 0), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage * 1.2, --Damage
		["dmgtype"] = bit.bor(bit.bor(DMG_SLASH,DMG_ALWAYSGIB), DMG_ALWAYSGIB), --bit.bor(DMG_SLASH,DMG_ALWAYSGIB),DMG_CRUSH, etc.
		["delay"] = 0.7, --Delay
		["spr"] = false, --Allow attack while sprinting?
		["snd"] = Sound("weapons/tfa_kf2/zweihander/swing_light_2.wav"), -- Sound ID
		["snd_delay"] = 0.4,
		["viewpunch"] = Angle(1, -5, 0), --viewpunch angle
		["end"] = 1.1, --time before next attack
		["hull"] = 42, --Hullsize
		["direction"] = "R", --Swing dir,
		["hitflesh"] = Sound("weapons/tfa_kf2/zweihander/hitflesh_3.wav"),
		["hitworld"] = Sound("weapons/tfa_kf2/katana/block01.wav"),
	},
	{
		["act"] = ACT_VM_MISSRIGHT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = SWEP.Primary.Range * 1.1, -- Trace distance
		["dir"] = Vector(-120, 0, 0), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage * 1.2, --Damage
		["dmgtype"] = bit.bor(bit.bor(DMG_SLASH,DMG_ALWAYSGIB), DMG_ALWAYSGIB), --bit.bor(DMG_SLASH,DMG_ALWAYSGIB),DMG_CRUSH, etc.
		["delay"] = 0.65, --Delay
		["spr"] = false, --Allow attack while sprinting?
		["snd"] = Sound("weapons/tfa_kf2/zweihander/swing_light_2.wav"), -- Sound ID
		["snd_delay"] = 0.5,
		["viewpunch"] = Angle(1, 5, 0), --viewpunch angle
		["end"] = 1.1, --time before next attack
		["hull"] = 42, --Hullsize
		["direction"] = "L", --Swing dir,
		["hitflesh"] = Sound("weapons/tfa_kf2/zweihander/hitflesh_3.wav"),
		["hitworld"] = Sound("weapons/tfa_kf2/katana/block01.wav"),
	},
	{
		["act"] = ACT_VM_SECONDARYATTACK, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = SWEP.Primary.Range * 1.1, -- Trace distance
		["dir"] = Vector(0, 20, -70), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage * 1.2, --Damage
		["dmgtype"] = bit.bor(bit.bor(DMG_SLASH,DMG_ALWAYSGIB), DMG_ALWAYSGIB), --bit.bor(DMG_SLASH,DMG_ALWAYSGIB),DMG_CRUSH, etc.
		["delay"] = 0.8, --Delay
		["spr"] = false, --Allow attack while sprinting?
		["snd"] = Sound("weapons/tfa_kf2/zweihander/swing_light_2.wav"), -- Sound ID
		["snd_delay"] = 0.6,
		["viewpunch"] = Angle(10, 0, 0), --viewpunch angle
		["end"] = 1.1, --time before next attack
		["hull"] = 42, --Hullsize
		["direction"] = "B", --Swing dir,
		["hitflesh"] = Sound("weapons/tfa_kf2/zweihander/hitflesh_3.wav"),
		["hitworld"] = Sound("weapons/tfa_kf2/katana/block01.wav"),
	},
	{
		["act"] = ACT_VM_PULLBACK_HIGH, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = SWEP.Primary.Range * 1.1, -- Trace distance
		["dir"] = Vector(0, 20, -70), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage * 1.2, --Damage
		["dmgtype"] = bit.bor(bit.bor(DMG_SLASH,DMG_ALWAYSGIB), DMG_ALWAYSGIB), --bit.bor(DMG_SLASH,DMG_ALWAYSGIB),DMG_CRUSH, etc.
		["delay"] = 0.55, --Delay
		["spr"] = false, --Allow attack while sprinting?
		["snd"] = Sound("weapons/tfa_kf2/zweihander/swing_light_2.wav"), -- Sound ID
		["snd_delay"] = 0.5,
		["viewpunch"] = Angle(7.5, 0, 0), --viewpunch angle
		["end"] = 1.1, --time before next attack
		["hull"] = 42, --Hullsize
		["direction"] = "F", --Swing dir,
		["hitflesh"] = Sound("weapons/tfa_kf2/zweihander/hitflesh_3.wav"),
		["hitworld"] = Sound("weapons/tfa_kf2/katana/block01.wav"),
	}
}

SWEP.AllowSprintAttack = true

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
SWEP.BlockSound = Sound("weapons/laserrifle/impacts/fx_laser_impact_02.wav")
SWEP.BlockDamageCap = 200
SWEP.BlockDamageTypes = {
	DMG_SLASH,DMG_CLUB,DMG_CRUSH,DMG_BULLET,DMG_BLAST,DMG_BURN,DMG_PLASMA,DMG_SHOCK,DMG_DISSOLVE
}

SWEP.BlockCanDeflect = true  --Can "bounce" bullets off a perfect parry?

SWEP.Secondary.CanBash = true
SWEP.Secondary.BashDamage = SWEP.Primary.Damage
SWEP.Secondary.BashDelay = 0.1
SWEP.Secondary.BashLength = SWEP.Primary.Range

SWEP.SequenceLengthOverride = {
	[ACT_VM_HITCENTER] = 0.8
}

SWEP.ViewModelBoneMods = {
	["RW_Weapon"] = { scale = Vector(0.01, 0.01, 0.01), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
}

SWEP.VElements = {
	["forcesword"] = { type = "Model", model = "models/joazzz/weapons/forcesword.mdl", bone = "RW_Weapon", rel = "", pos = Vector(0.218, -0.518, 5.5), angle = Angle(-3.507, -90.675, 0), size = Vector(0.7, 0.7, 0.7), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 1, bodygroup = {[1] = 2, [2] = 8} }
}

SWEP.WElements = {
	["forcesword"] = { type = "Model", model = "models/joazzz/weapons/forcesword.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 2, -7), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 1, bodygroup = {[1] = 2, [2] = 8} },
}

SWEP.InspectionActions = {ACT_VM_RECOIL1, ACT_VM_RECOIL2, ACT_VM_RECOIL3}

SWEP.Type                       = nil 
SWEP.Type_Displayed             = "Infernus Pattern Mk. III"

SWEP.Attachments = {
	[1] = { offset = { 0, 0 }, atts = { "cat_melee_power"}, order = 1 },
	[2] = { offset = { 0, 0 }, atts = { "cat_skin_powersword"}, order = 2 },
	[10] = { offset = { 0, 0 }, atts = { "cat_training"}, order = 10 },
}
SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}

function SWEP:ChoosePrimaryAttack()
    local ind, attack = self.BaseClass.ChoosePrimaryAttack(self) -- Call original function
    if attack then
        attack.dmg = self:GetStat("Primary.Damage") -- Force damage update
	attack.len = self:GetStat("Primary.Range") -- Update range dynamically
        attack["end"] = self:GetStat("Primary.End") or attack["end"]
    end
    return ind, attack
end

function SWEP:ChooseSecondaryAttack()
    local ind, attack = self.BaseClass.ChooseSecondaryAttack(self)
    if attack then
        attack.dmg = self:GetStat("Primary.Damage") * 1.25
        attack.len = self:GetStat("Primary.Range") * 1.1

        local baseEnd = self:GetStat("Primary.End")
        attack["end"] = (baseEnd and baseEnd * 1.25) or attack["end"]
    end
    return ind, attack
end

function SWEP:Think2(...)

    if self.BaseClass and self.BaseClass.Think2 then
        self.BaseClass.Think2(self, ...)
    end

    if not self:VMIV() then return end

    local stat = self:GetStatus()
    local isBlocking = (stat == 24)  -- 24 means actively blocking

    if CLIENT then
        if isBlocking then
            if not IsValid(self.ShieldModel) then
                -- Create the shield model
                self.ShieldModel = ClientsideModel("models/props_trainstation/trainstation_clock001.mdl")
                self.ShieldModel:SetNoDraw(false)  -- Ensure it's visible
                self.ShieldModel:SetMaterial("models/props_combine/portalball001_sheet")
                self.ShieldModel:SetColor(Color(0, 40, 80, 255))
                self.ShieldModel:SetModelScale(1, 0)

                -- Play sound when blocking starts
                if not self.WasBlocking then
                    self:GetOwner():EmitSound("ambient/levels/citadel/weapon_disintegrate1.wav")
                end
            end

            -- Get player's hand position to attach the shield
            local vm = self:GetOwner():GetViewModel()
            if IsValid(vm) then
                local bone = vm:LookupBone("ValveBiped.Bip01_R_Hand")
                if bone then
                    local pos, ang = vm:GetBonePosition(bone)

                    -- Adjust position
                    pos = pos + ang:Right() * 1 + ang:Forward() * 30 + ang:Up() * 1
                    ang:RotateAroundAxis(ang:Right(), 180)

                    -- Update shield position
                    self.ShieldModel:SetPos(pos)
                    self.ShieldModel:SetAngles(ang)
                end
            end

            -- Play looped humming sound while blocking
            if not self.BlockingLoop then
                self.BlockingLoop = CreateSound(self:GetOwner(), "ambient/levels/citadel/field_loop1.wav")
                self.BlockingLoop:Play()
            end
        else
            -- Hide or remove the shield if not blocking
            if IsValid(self.ShieldModel) then
                self.ShieldModel:Remove()
                self.ShieldModel = nil
            end

            -- Stop the looped blocking sound
            if self.BlockingLoop then
                self.BlockingLoop:Stop()
                self.BlockingLoop = nil
            end

            -- Play sound when blocking stops
            if self.WasBlocking then
                self:GetOwner():EmitSound("ambient/levels/citadel/weapon_disintegrate3.wav")
            end
        end
    end

    self.WasBlocking = isBlocking  -- Track state change

    self.BaseClass.Think2(self, ...)
end

function SWEP:Holster(...)
    if CLIENT then
        if IsValid(self.ShieldModel) then
            self.ShieldModel:Remove()
            self.ShieldModel = nil
        end

        -- Stop sound when weapon is holstered
        if self.BlockingLoop then
            self.BlockingLoop:Stop()
            self.BlockingLoop = nil
        end
    end

    return self.BaseClass.Holster(self, ...)
end

function SWEP:OnRemove()
    if CLIENT then
        if IsValid(self.ShieldModel) then
            self.ShieldModel:Remove()
            self.ShieldModel = nil
        end

        -- Stop sound when weapon is removed
        if self.BlockingLoop then
            self.BlockingLoop:Stop()
            self.BlockingLoop = nil
        end
    end
end
