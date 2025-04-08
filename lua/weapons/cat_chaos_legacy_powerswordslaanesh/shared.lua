SWEP.Base = "tfa_melee_base"
SWEP.Category = "Cat's Legacy Chaos SWEPs"
SWEP.PrintName = "Charnabal Sabre"
SWEP.ViewModel = "models/zadkiel/weapons/c_oren_katana.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelFOV = 80
SWEP.UseHands = true
SWEP.CameraOffset = Angle(0, 0, 0)
--SWEP.InspectPos = Vector(17.184, -4.891, -11.902) - SWEP.VMPos
--SWEP.InspectAng = Vector(70, 46.431, 70)
SWEP.WorldModel = "models/joazzz/weapons/chaos/sword_powersword.mdl"
SWEP.HoldType = "melee"
SWEP.Primary.Directional = true
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.DisableIdleAnimations = false
SWEP.VMPos = Vector(5, 5, -6)
SWEP.Primary.Damage = 690
SWEP.Primary.Range = 100
SWEP.Primary.End = 0.75

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
SWEP.BlockDamageMinimum = 0.5 --Multiply damage by this for a minimumly effective block
SWEP.BlockTimeWindow = 0.5 --Time to absorb maximum damage
SWEP.BlockTimeFade = 0.5 --Time for blocking to do minimum damage.  Does not include block window
SWEP.BlockSound = Sound("block_1.wav")
SWEP.BlockDamageCap = 80
SWEP.BlockDamageTypes = {
	DMG_SLASH,DMG_CLUB
}

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
	["sword"] = { type = "Model", model = "models/joazzz/weapons/chaos/sword_powersword.mdl", bone = "RW_Weapon", rel = "", pos = Vector(0.218, -0.518, 5.5), angle = Angle(-3.507, -90.675, 0), size = Vector(0.7, 0.7, 0.7), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 21, bodygroup = {[1] = 15, [2] = 14} }
}

SWEP.WElements = {
	["sword"] = { type = "Model", model = "models/joazzz/weapons/chaos/sword_powersword.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 2, -7), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 21, bodygroup = {[1] = 15, [2] = 14} },
}

SWEP.InspectionActions = {ACT_VM_RECOIL1, ACT_VM_RECOIL2, ACT_VM_RECOIL3}

SWEP.Type                       = nil 
SWEP.Type_Displayed             = "Voluptas-Dantis Mk. VI"

SWEP.Attachments = {
	[10] = { offset = { 0, 0 }, atts = { "cat_training"}, order = 10 },
}
SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}

if SERVER then
    AddCSLuaFile()
end

SWEP.CritChance = 0 -- Starts at 0%
SWEP.CritMultiplier = 1.5 -- 1.5x damage on crits
SWEP.CritIncrease = 5 -- Gain 5% per hit
SWEP.CritMax = 50 -- Cap at 50%
SWEP.SpeedIncrease = 0.01 -- 1% movespeed per hit
SWEP.SpeedMax = 0.10 -- Max 10% speed boost
SWEP.FalteringTime = 3 -- Display "Faltering" message for 3 seconds

function SWEP:ChoosePrimaryAttack()
    local ind, attack = self.BaseClass.ChoosePrimaryAttack(self)
    if attack then
        attack.dmg = self:GetStat("Primary.Damage")
        attack.len = self:GetStat("Primary.Range")
        attack["end"] = self:GetStat("Primary.End") or attack["end"]

        attack.callback = function(attk, wep, trace)
            local owner = wep:GetOwner()

            if not trace.Hit then
                wep:ResetSlaaneshBuff(owner)
                return
            end

            local hitEnt = trace.Entity
            if IsValid(hitEnt) then
                wep:ApplySlaaneshCritBonusDamage(hitEnt, attack.dmg)
                wep:IncreaseSlaaneshSpeed(owner)
            end
        end
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

        attack.callback = function(attk, wep, trace)
            local owner = wep:GetOwner()

            if not trace.Hit then
                wep:ResetSlaaneshBuff(owner)
                return
            end

            local hitEnt = trace.Entity
            if IsValid(hitEnt) then
                wep:ApplySlaaneshCritBonusDamage(hitEnt, attack.dmg)
                wep:IncreaseSlaaneshSpeed(owner)
            end
        end
    end
    return ind, attack
end

function SWEP:ApplySlaaneshCritBonusDamage(target, baseDamage)
    local owner = self:GetOwner()
    local isCrit = math.random(1, 100) <= self.CritChance

    if isCrit then
        local bonusDamage = baseDamage * (self.CritMultiplier - 1)

        local dmginfo = DamageInfo()
        dmginfo:SetAttacker(owner)
        dmginfo:SetInflictor(self)
        dmginfo:SetDamage(bonusDamage)
        dmginfo:SetDamageType(DMG_SLASH)

        target:TakeDamageInfo(dmginfo)

            target:EmitSound("ambient/machines/slicer" .. math.random(1, 4) .. ".wav", 100, 100)
    end

    self.CritChance = math.min(self.CritChance + self.CritIncrease, self.CritMax)
    self:SetNWInt("SlaaneshCritChance", self.CritChance)
end

function SWEP:Deploy()
    local owner = self:GetOwner()
    if IsValid(owner) then
        -- Store default speed when weapon is equipped
        self.DefaultWalkSpeed = owner:GetWalkSpeed()
        self.DefaultRunSpeed = owner:GetRunSpeed()
    end
    return true
end

function SWEP:IncreaseSlaaneshSpeed(owner)
    local stacks = math.floor(self.CritChance / self.CritIncrease) -- Convert crit chance to stacks
    local speedBonus = 1 + (stacks * self.SpeedIncrease) -- 1% per stack
    local maxSpeedBonus = 1 + self.SpeedMax -- Max speed bonus (10%)

    -- Clamp to max speed limit
    local newSpeed = math.min(speedBonus, maxSpeedBonus)

    -- Apply new speed only if it has changed
    if self:GetNWFloat("SlaaneshSpeed", 1) ~= newSpeed then
        self:SetNWFloat("SlaaneshSpeed", newSpeed)
        owner:SetWalkSpeed(self.DefaultWalkSpeed * newSpeed)
        owner:SetRunSpeed(self.DefaultRunSpeed * newSpeed)
    end
end

function SWEP:ResetSlaaneshBuff(owner)
    -- If Perfection crumbles, trigger warning
    if self.CritChance > 0 then
        self:SetNWFloat("FalteringTime", CurTime() + self.FalteringTime)
    end

    self.CritChance = 0
    self:SetNWInt("SlaaneshCritChance", 0)

    -- Reset speed to default values
    if self:GetNWFloat("SlaaneshSpeed", 1) > 1 then
        self:SetNWFloat("SlaaneshSpeed", 1)
        owner:SetWalkSpeed(self.DefaultWalkSpeed)
        owner:SetRunSpeed(self.DefaultRunSpeed)
    end
end


hook.Add("HUDPaint", "SlaaneshHUD", function()
    local ply = LocalPlayer()
    if not IsValid(ply) then return end
    
    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) or wep:GetClass() ~= "cat_chaos_legacy_powerswordslaanesh" then return end

    local stacks = math.floor(wep:GetNWInt("SlaaneshCritChance", 0) / wep.CritIncrease) -- Convert crit chance into stack count
    local maxStacks = math.floor(wep.CritMax / wep.CritIncrease) -- Max possible stacks
    local falteringTime = wep:GetNWFloat("FalteringTime", 0)
    local isFaltering = falteringTime > CurTime()

    local x, y = 50, 50
    local width, height = 200, 40

    -- Draw background box
    draw.RoundedBox(8, x - 5, y - 5, width + 10, height + 10, Color(0, 0, 0, 180))

    -- Display Perfection Stacks
    draw.SimpleTextOutlined(
        "Perfection: " .. stacks .. "/" .. maxStacks,
        "DermaLarge",
        x + width / 2, y + height / 2,
        Color(200, 100, 255, 255), -- Purple for Slaanesh
        TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,
        2, Color(0, 0, 0, 255)
    )

    -- Display Faltering Message at the Top of the Screen
    if isFaltering then
        draw.SimpleTextOutlined(
            "**Your perfection crumbles...**",
            "DermaLarge",
            ScrW() / 2, 40, -- Top center of screen
            Color(255, 100, 100, 255), -- Red fading effect
            TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,
            2, Color(0, 0, 0, 255)
        )
    end
end)


