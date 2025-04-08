SWEP.Base = "tfa_melee_base"
SWEP.Category = "Cat's Legacy Chaos SWEPs"
SWEP.PrintName = "Reaver's Fang"
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
SWEP.Primary.Damage = 700
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
	["sword"] = { type = "Model", model = "models/joazzz/weapons/chaos/sword_powersword.mdl", bone = "RW_Weapon", rel = "", pos = Vector(0.218, -0.518, 5.5), angle = Angle(-3.507, -90.675, 0), size = Vector(0.7, 0.7, 0.7), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 4, bodygroup = {[1] = 11, [2] = 9} }
}

SWEP.WElements = {
	["sword"] = { type = "Model", model = "models/joazzz/weapons/chaos/sword_powersword.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 2, -7), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 4, bodygroup = {[1] = 11, [2] = 9} },
}

SWEP.InspectionActions = {ACT_VM_RECOIL1, ACT_VM_RECOIL2, ACT_VM_RECOIL3}

SWEP.Type                       = nil 
SWEP.Type_Displayed             = "Sanguis-Urget Mk. VIII"

SWEP.Attachments = {
	[10] = { offset = { 0, 0 }, atts = { "cat_training"}, order = 10 },
}
SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}

SWEP.BloodlustStacks = 0 -- Starts at 0 stacks
SWEP.BloodlustMax = 8 -- Max stacks
SWEP.BloodlustDecayTime = 5 -- Time in seconds before stacks reset
SWEP.BloodlustTimer = 0 -- Keeps track of last hit time

if SERVER then
    AddCSLuaFile()
end

function SWEP:ChoosePrimaryAttack()
    local ind, attack = self.BaseClass.ChoosePrimaryAttack(self)
    if attack then
        attack.dmg = self:GetStat("Primary.Damage") * self:GetBloodlustDamageMultiplier()
        attack.len = self:GetStat("Primary.Range")
        attack["end"] = self:GetStat("Primary.End") or attack["end"]

        attack.callback = function(attk, wep, trace)
            if not trace.Hit then return end
            local hitEnt = trace.Entity
            if IsValid(hitEnt) then
                wep:ApplyBloodlust(hitEnt)
            end
        end
    end
    return ind, attack
end

function SWEP:ChooseSecondaryAttack()
    local ind, attack = self.BaseClass.ChooseSecondaryAttack(self)
    if attack then
        attack.dmg = self:GetStat("Primary.Damage") * 1.25 * self:GetBloodlustDamageMultiplier()
        attack.len = self:GetStat("Primary.Range") * 1.1

        local baseEnd = self:GetStat("Primary.End")
        attack["end"] = (baseEnd and baseEnd * 1.25) or attack["end"]

        attack.callback = function(attk, wep, trace)
            if not trace.Hit then return end
            local hitEnt = trace.Entity
            if IsValid(hitEnt) then
                wep:ApplyBloodlust(hitEnt)
            end
        end
    end
    return ind, attack
end

function SWEP:ApplyBloodlust(target)
    if not IsValid(target) then return end
    local owner = self:GetOwner()

    -- Increase Bloodlust Stacks (Max 8)
    self.BloodlustStacks = math.min(self.BloodlustStacks + 1, self.BloodlustMax)
    self:SetNWInt("BloodlustStacks", self.BloodlustStacks) -- Sync to clients

    -- Reset decay timer using timer.Simple instead of Think()
    if timer.Exists("BloodlustDecay_" .. self:EntIndex()) then
        timer.Remove("BloodlustDecay_" .. self:EntIndex()) -- Remove existing timer
    end

    timer.Create("BloodlustDecay_" .. self:EntIndex(), self.BloodlustDecayTime, 1, function()
        if IsValid(self) and IsValid(owner) then
            self.BloodlustStacks = 0
            self:SetNWInt("BloodlustStacks", 0) -- Reset networked value
	    self:SetNWFloat("BloodlustFadeTime", CurTime() + 3)
        end
    end)

    -- Calculate lifesteal amount
    local baseHeal = 0.015 -- 1.5% base heal
    local maxBonusHeal = 0.015 -- Additional 3.5% heal at max stacks (so total is 3%)
    local bonusPerStack = maxBonusHeal / self.BloodlustMax -- Properly distribute over max stacks
    local healAmount = owner:GetMaxHealth() * (baseHeal + (self.BloodlustStacks * bonusPerStack))

    owner:SetHealth(math.min(owner:Health() + healAmount, owner:GetMaxHealth()))

end


function SWEP:GetBloodlustDamageMultiplier()
    return 1 + (self.BloodlustStacks * 0.0125) -- Each stack gives 1% more damage, max 10%
end

hook.Add("PlayerDeath", "BloodlustOnKill", function(victim, inflictor, attacker)
    -- Ensure the attacker is a player and is using THIS weapon
    if IsValid(attacker) and attacker:IsPlayer() and IsValid(attacker:GetActiveWeapon()) then
        local wep = attacker:GetActiveWeapon()
        
        if wep:GetClass() == "cat_chaos_legacy_powerswordkhorne" then  -- Change this to your SWEP's class name
            -- Give %% max armor per kill at highest stack
            local maxArmor = attacker:GetMaxArmor() or 100 -- Default to 100 max armor if nil
            local baseArmorGain = 0.01 -- 1% base armor per kill
		local maxArmorGain = 0.05  -- 5% armor cap at max stacks
		local bonusPerStack = 4 / (wep.BloodlustMax or 8) --Ensures 5% total at max stacks

	    local armorGain = maxArmor * math.min(baseArmorGain + (self.BloodlustStacks * bonusPerStack), maxArmorGain)

            attacker:SetArmor(math.min(attacker:Armor() + armorGain, maxArmor))

            attacker:EmitSound("ambient/levels/canals/toxic_slime_gurgle2.wav", 75, 100) -- Play a sound
        end
    end
end)

hook.Add("OnNPCKilled", "BloodlustOnKillNPC", function(npc, attacker, inflictor)
    if IsValid(attacker) and attacker:IsPlayer() and IsValid(attacker:GetActiveWeapon()) then
        local wep = attacker:GetActiveWeapon()
        
        if wep:GetClass() == "cat_chaos_legacy_powerswordkhorne" then  -- Change this to your SWEP's class name
            local maxArmor = attacker:GetMaxArmor() or 100
            local baseArmorGain = 0.01 -- 1% base armor per kill
		local maxArmorGain = 0.05  -- 5% armor cap at max stacks
		local bonusPerStack = 4 / (wep.BloodlustMax or 8) --Ensures 5% total at max stacks

	    local armorGain = maxArmor * math.min(baseArmorGain + (wep.BloodlustStacks * bonusPerStack), maxArmorGain)

            attacker:SetArmor(math.min(attacker:Armor() + armorGain, maxArmor))

            attacker:EmitSound("ambient/levels/canals/toxic_slime_gurgle2.wav", 75, 100)
        end
    end
end)

hook.Add("HUDPaint", "BloodlustHUD", function()
    local ply = LocalPlayer()
    if not IsValid(ply) then return end
    
    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) or wep:GetClass() ~= "cat_chaos_legacy_powerswordkhorne" then return end

    local stacks = wep:GetNWInt("BloodlustStacks", 0) 
    local maxStacks = wep.BloodlustMax or 8
    local fadeTime = wep:GetNWFloat("BloodlustFadeTime", 0)
    local isFading = fadeTime > CurTime()

    -- Set up positioning
    local x, y = 50, 50
    local width, height = 200, 40

    -- Draw background box
    draw.RoundedBox(8, x - 5, y - 5, width + 10, height + 10, Color(0, 0, 0, 150))

    -- Draw stack counter
    draw.SimpleTextOutlined(
        "Bloodlust: " .. stacks .. "/" .. maxStacks, 
        "DermaLarge", 
        x + width / 2, y + height / 2, 
        Color(255, 0, 0, 255), 
        TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 
        2, Color(0, 0, 0, 255)
    )

    -- Show warning when Bloodlust fades
    if isFading then
        draw.SimpleTextOutlined(
            "**Your fury fades... Bloodlust has ended.**",
            "DermaLarge",
            ScrW() / 2, 40, -- Top center of the screen
            Color(255, 50, 50, 255), -- Fading red color
            TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,
            2, Color(0, 0, 0, 255)
        )
    end
end)


