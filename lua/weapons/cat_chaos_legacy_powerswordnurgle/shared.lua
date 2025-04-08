SWEP.Base = "tfa_melee_base"
SWEP.Category = "Cat's Legacy Chaos SWEPs"
SWEP.PrintName = "Plague Blade"
SWEP.ViewModel = "models/zadkiel/weapons/c_oren_katana.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelFOV = 80
SWEP.UseHands = true
SWEP.CameraOffset = Angle(0, 0, 0)
--SWEP.InspectPos = Vector(17.184, -4.891, -11.902) - SWEP.VMPos
--SWEP.InspectAng = Vector(70, 46.431, 70)
SWEP.WorldModel = "models/joazzz/weapons/chaos/sword_powersword.mdl"
SWEP.HoldType = "melee2"
SWEP.Primary.Directional = true
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.DisableIdleAnimations = false
SWEP.VMPos = Vector(5, 5, -6)
SWEP.Primary.Damage = 875
SWEP.Primary.Range = 125
SWEP.Primary.End = 1.15

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

SWEP.AllowSprintAttack = false
SWEP.MoveSpeed = 0.8

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
	["sword"] = { type = "Model", model = "models/joazzz/weapons/chaos/sword_powersword.mdl", bone = "RW_Weapon", rel = "", pos = Vector(0.218, -0.018, 12.5), angle = Angle(-3.507, -90.675, 0), size = Vector(0.7, 0.7, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 16, bodygroup = {[0] = 1, [1] = 13, [2] = 12} }
}

SWEP.WElements = {
	["sword"] = { type = "Model", model = "models/joazzz/weapons/chaos/sword_powersword.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 2, -17), angle = Angle(0, 0, 180), size = Vector(1, 1, 1.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 16, bodygroup = {[0] = 1, [1] = 13, [2] = 12} },
}

SWEP.InspectionActions = {ACT_VM_RECOIL1, ACT_VM_RECOIL2, ACT_VM_RECOIL3}

SWEP.Type                       = nil 
SWEP.Type_Displayed             = "Plaga-Factoris Mk. VII"

SWEP.Attachments = {
	[10] = { offset = { 0, 0 }, atts = { "cat_training"}, order = 10 },
}
SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}

SWEP.PlagueMaxStacks = 5  -- Max plague stacks on a single target
SWEP.PlagueDuration = 15   -- Each stack lasts 15 seconds
SWEP.PlagueDamageMultiplier = 0.05  -- 5% of base damage per tick
SWEP.PlagueTickInterval = 1  -- Damage applied every 1 second
SWEP.HealBaseRate = 0.01  -- 1% max HP per second base heal
SWEP.HealBonusPerTarget = 0.0025  -- 0.25% extra per afflicted target

function SWEP:ChoosePrimaryAttack()
    local ind, attack = self.BaseClass.ChoosePrimaryAttack(self)
    if attack then
        attack.dmg = self:GetStat("Primary.Damage")
        attack.len = self:GetStat("Primary.Range")
        attack["end"] = self:GetStat("Primary.End") or attack["end"]

        attack.callback = function(attk, wep, trace)
            if not trace.Hit then return end
            local hitEnt = trace.Entity
            if IsValid(hitEnt) and (hitEnt:IsNPC() or hitEnt:IsPlayer()) then
                wep:ApplyPlagueEffect(hitEnt)
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
            if not trace.Hit then return end
            local hitEnt = trace.Entity
            if IsValid(hitEnt) and (hitEnt:IsNPC() or hitEnt:IsPlayer()) then
                wep:ApplyPlagueEffect(hitEnt)
            end
        end
    end
    return ind, attack
end

function SWEP:ApplyPlagueEffect(target)
    if not IsValid(target) or not target:Alive() then return end
    local attacker = self:GetOwner()
    local wep = self  -- Store SWEP reference

    -- Increment plague stacks safely
    local currentStacks = target:GetNWInt("PlagueStacks", 0)
    local newStacks = math.min(currentStacks + 1, self.PlagueMaxStacks)
    target:SetNWInt("PlagueStacks", newStacks)

    -- Unique timer ID for this target
    local timerID = "PlagueEffect_" .. target:EntIndex()

    -- Refresh the plague timer if it already exists
    if timer.Exists(timerID) then
        timer.Adjust(timerID, self.PlagueTickInterval, self.PlagueDuration / self.PlagueTickInterval)
        return
    end

    -- Apply periodic damage
    timer.Create(timerID, self.PlagueTickInterval, self.PlagueDuration / self.PlagueTickInterval, function()
        if not IsValid(target) or not target:Alive() or not IsValid(attacker) or not IsValid(wep) then
            timer.Remove(timerID)
            return
        end

        local stacks = target:GetNWInt("PlagueStacks", 0)
        if stacks > 0 then
            local plagueDamage = wep:GetStat("Primary.Damage") * wep.PlagueDamageMultiplier * stacks
            local dmginfo = DamageInfo()
            dmginfo:SetDamage(plagueDamage)
            dmginfo:SetAttacker(attacker)
            dmginfo:SetInflictor(wep)
            dmginfo:SetDamageType(DMG_POISON)

            target:TakeDamageInfo(dmginfo)
            target:EmitSound("ambient/levels/canals/toxic_slime_gurgle8.wav", 75, 100)
        end
    end)

    -- Ensure stacks decay over time, reducing by 1 every few seconds
    local decayID = "PlagueDecay_" .. target:EntIndex()
    if not timer.Exists(decayID) then
        timer.Create(decayID, 5, 0, function()
            if not IsValid(target) then
                timer.Remove(decayID)
                return
            end

            local stacks = target:GetNWInt("PlagueStacks", 0)
            if stacks > 0 then
                target:SetNWInt("PlagueStacks", stacks - 1)
            else
                timer.Remove(decayID)
            end
        end)
    end
end

function SWEP:Think()
    if self.BaseClass and self.BaseClass.Think then
        self.BaseClass.Think(self)
    end

    local owner = self:GetOwner()
    if not IsValid(owner) or not owner:Alive() then return end

    -- Make sure healing happens once per second
    if not self.HealingTimer or CurTime() > self.HealingTimer then
        self:ApplyHealing()
        self.HealingTimer = CurTime() + 1  -- Set next heal time
    end
end

function SWEP:ApplyHealing()
    local owner = self:GetOwner()
    if not IsValid(owner) then return end

    local maxHP = owner:GetMaxHealth()
    local baseHeal = math.ceil(maxHP * 0.005) -- 0.5% of max HP, rounded up

    local afflictedCount = 0
    for _, ent in ipairs(ents.GetAll()) do
        if IsValid(ent) and ent:GetNWInt("PlagueStacks", 0) > 0 then
            afflictedCount = afflictedCount + 1
            if afflictedCount >= 5 then break end -- Only count up to 5 afflicted
        end
    end

    -- Bonus healing per afflicted (max 5)
    local bonusHeal = math.ceil(maxHP * 0.0025 * afflictedCount)
    local totalHeal = baseHeal + bonusHeal

    -- Apply health healing
    owner:SetHealth(math.min(owner:Health() + totalHeal, maxHP))

    -- Fix for Armor Healing  
    if owner.SetArmor and owner:GetMaxArmor() > 0 then
        local maxArmor = owner:GetMaxArmor()
        owner:SetArmor(math.min(owner:Armor() + totalHeal, maxArmor))
    end
end

hook.Add("HUDPaint", "PlagueBlade_HUD", function()
    local ply = LocalPlayer()
    local wep = ply:GetActiveWeapon()

    -- Ensure player is holding the Plague Blade
    if not IsValid(wep) or wep:GetClass() ~= "cat_chaos_legacy_powerswordnurgle" then return end

    local afflictedCount = 0
    for _, ent in ipairs(ents.GetAll()) do
        if IsValid(ent) and ent:GetNWInt("PlagueStacks", 0) > 0 then
            afflictedCount = afflictedCount + 1
        end
    end

    -- Set up positioning
    local x, y = 50, 50
    local width, height = 200, 40

    -- Draw background box
    draw.RoundedBox(8, x - 5, y - 5, width + 10, height + 10, Color(0, 0, 0, 150))

    -- Draw Afflicted Count at Bottom of Screen
    draw.SimpleTextOutlined(
        "Gifted: " .. afflictedCount,
        "DermaLarge",
        x + width / 2, y + height / 2,
        Color(0, 255, 0, 255), -- Green text
        TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,
        2, Color(0, 0, 0, 255) -- Black outline
    )
end)

hook.Add("PostDrawTranslucentRenderables", "PlagueBlade_3DText", function()
    local ply = LocalPlayer()
    local wep = ply:GetActiveWeapon()

    -- Ensure player is holding the Plague Blade
    if not IsValid(wep) or wep:GetClass() ~= "cat_chaos_legacy_powerswordnurgle" then return end

    for _, ent in ipairs(ents.GetAll()) do
        local stacks = ent:GetNWInt("PlagueStacks", 0)
        if IsValid(ent) and stacks > 0 then
            local pos = ent:GetPos() + Vector(0, 0, 85) -- Adjust height above entity
            local ang = EyeAngles()
            ang:RotateAroundAxis(ang:Right(), 90)
            ang:RotateAroundAxis(ang:Up(), -90)

            cam.Start3D2D(pos, ang, 0.1)
                draw.SimpleTextOutlined(
                    "Plagues: " .. stacks,
                    "DermaLarge",
                    0, 0,
                    Color(0, 255, 0, 255), -- Green text
                    TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,
                    2, Color(0, 0, 0, 255) -- Black outline
                )
            cam.End3D2D()
        end
    end
end)


