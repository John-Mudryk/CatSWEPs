SWEP.Base = "tfa_melee_base"
SWEP.Category = "Cat's Legacy Chaos SWEPs"
SWEP.PrintName = "Prophet's Razor"
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
SWEP.Primary.Damage = 675
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
	["sword"] = { type = "Model", model = "models/joazzz/weapons/chaos/sword_powersword.mdl", bone = "RW_Weapon", rel = "", pos = Vector(0.218, -0.518, 5.5), angle = Angle(-3.507, -90.675, 0), size = Vector(0.7, 0.7, 0.7), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 6, bodygroup = {[1] = 17, [2] = 17} }
}

SWEP.WElements = {
	["sword"] = { type = "Model", model = "models/joazzz/weapons/chaos/sword_powersword.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 2, -7), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 6, bodygroup = {[1] = 17, [2] = 17} },
}

SWEP.InspectionActions = {ACT_VM_RECOIL1, ACT_VM_RECOIL2, ACT_VM_RECOIL3}

SWEP.Type                       = nil 
SWEP.Type_Displayed             = "Consilium-Mutante Mk. IX"

SWEP.Attachments = {
	[10] = { offset = { 0, 0 }, atts = { "cat_training"}, order = 10 },
}
SWEP.AttachmentDependencies = {}
SWEP.AttachmentExclusions = {}

SWEP.LastEffectTime = 0 -- Cooldown system to prevent effect spam
SWEP.EffectCooldown = 10 -- Seconds before another effect can trigger

function SWEP:ChoosePrimaryAttack()
    local ind, attack = self.BaseClass.ChoosePrimaryAttack(self) -- Call original function
    if attack then
        attack.dmg = self:GetStat("Primary.Damage") -- Update damage
        attack.len = self:GetStat("Primary.Range") -- Update range
        attack["end"] = self:GetStat("Primary.End") or attack["end"]

        attack.callback = function(attk, wep, trace)
            if not trace.Hit then return end
            local hitEnt = trace.Entity

            if IsValid(hitEnt) then
                wep:ApplyTzeentchEffect(hitEnt)
            end
        end
    end
    return ind, attack
end

function SWEP:ChooseSecondaryAttack()
    local ind, attack = self.BaseClass.ChooseSecondaryAttack(self) -- Call original function
    if attack then
        attack.dmg = self:GetStat("Primary.Damage") * 1.25 -- Force damage update for secondary attacks
	attack.len = self:GetStat("Primary.Range") * 1.1 -- Update secondary attack range dynamically

        local baseEnd = self:GetStat("Primary.End")
        attack["end"] = (baseEnd and baseEnd * 1.25) or attack["end"]
    
        attack.callback = function(attk, wep, trace)
            if not trace.Hit then return end
            local hitEnt = trace.Entity

            if IsValid(hitEnt) then
                wep:ApplyTzeentchEffect(hitEnt)
            end
        end
    end
    return ind, attack
end

function SWEP:ApplyTzeentchEffect(target)
    if not IsValid(target) then return end
    if CurTime() < self.LastEffectTime + self.EffectCooldown then return end -- Cooldown check

    local effectID = math.random(1, 15) -- Choose a random effect
    self.LastEffectTime = CurTime() -- Store last effect time
    self.NextEffectTime = CurTime() + self.EffectCooldown -- Store next effect time
    self:SetNWFloat("NextEffectTime", self.NextEffectTime) -- Network it
    self:SetNWString("CurrentEffectMessage", "") -- Reset message

    local owner = self:GetOwner()

    -- Play a visual effect (subtle blue glow)
    local effectData = EffectData()
    effectData:SetOrigin(target:GetPos())
    effectData:SetEntity(target)
    util.Effect("psyker_explosion", effectData)

    -- Play a sound (chaotic whispers)
    target:EmitSound("ambient/levels/citadel/strange_talk".. math.random(1, 11).. ".wav", 75, 120)

    local effectMessage = "" -- This will store the chat message

    if effectID == 1 then
        -- Warp Surge (User speed boost)
        if IsValid(owner) then
            owner:SetWalkSpeed(owner:GetWalkSpeed() * 1.3)
            owner:SetRunSpeed(owner:GetRunSpeed() * 1.3)
            timer.Simple(3, function()
                if IsValid(owner) then
                    owner:SetWalkSpeed(owner:GetWalkSpeed() / 1.3)
                    owner:SetRunSpeed(owner:GetRunSpeed() / 1.3)
                end
            end)
        end
        effectMessage = "Warp Surge! - You feel a surge of power, increasing your speed for 3 seconds!"
	self:SetNWString("CurrentEffectMessage", effectMessage)

    elseif effectID == 2 then
        -- Reality Fracture (DoT on enemy)
        local dotDamage = self.Primary.Damage * 0.25
        for i = 1, 3 do
            timer.Simple(i, function()
                if IsValid(target) and target:Health() > 0 then
                    local dmginfo = DamageInfo()
                    dmginfo:SetDamage(dotDamage)
                    dmginfo:SetAttacker(owner)
                    dmginfo:SetInflictor(self)
                    dmginfo:SetDamageType(DMG_SHOCK)
                    target:TakeDamageInfo(dmginfo)
                end
            end)
        end
        effectMessage = "Reality Fracture! - Your strike distorts reality, causing your enemy to take additional damage over time!"
	self:SetNWString("CurrentEffectMessage", effectMessage)

elseif effectID == 3 then
        -- Temporal Shift (Switch weapons for 3 sec)
        if IsValid(owner) and owner:IsPlayer() then
            local weapons = owner:GetWeapons()
            if #weapons > 1 then
                local randomWeapon = weapons[math.random(#weapons)]
                owner:SelectWeapon(randomWeapon:GetClass())
                timer.Simple(3, function()
                    if IsValid(owner) then
                        owner:SelectWeapon(self:GetClass()) -- Switch back to the sword
                    end
                end)
            end
        end
        effectMessage = "Temporal Shift! - You are forced to wield another weapon for 3 seconds!"
	self:SetNWString("CurrentEffectMessage", effectMessage)

elseif effectID == 4 then
    -- Arcane Overload (NEW: Small AoE explosion)
    if IsValid(target) then
        local explosion = ents.Create("env_explosion")
        explosion:SetPos(target:GetPos())
        explosion:SetOwner(owner)
        explosion:SetKeyValue("iMagnitude", "40") -- Damage
        explosion:SetKeyValue("iRadiusOverride", "150") -- Small radius
        explosion:Spawn()
        explosion:Fire("Explode", 0, 0)
    end
    effectMessage = "Arcane Overload! - Your enemy suddenly explodes in a burst of chaotic energy!"
	self:SetNWString("CurrentEffectMessage", effectMessage)


    elseif effectID == 5 then
        -- Warp Hunger (User heals 5% of max HP)
        if IsValid(owner) and owner:Health() < owner:GetMaxHealth() then
            owner:SetHealth(math.min(owner:Health() + owner:GetMaxHealth() * 0.05, owner:GetMaxHealth()))
        end
        effectMessage = "Warp Hunger! - The sword drains energy from the enemy, healing you slightly!"
	self:SetNWString("CurrentEffectMessage", effectMessage)

    elseif effectID == 6 then
        -- Mutated Backlash (User takes 5% of primary damage)
        if IsValid(owner) then
            local dmginfo = DamageInfo()
            dmginfo:SetDamage(self.Primary.Damage * 0.05)
            dmginfo:SetAttacker(owner)
            dmginfo:SetInflictor(self)
            dmginfo:SetDamageType(DMG_SHOCK)
            owner:TakeDamageInfo(dmginfo)
        end
        effectMessage = "Mutated Backlash! - Your body twists painfully as the sword drains your own vitality!"
	self:SetNWString("CurrentEffectMessage", effectMessage)

    elseif effectID == 7 then
        -- Twisted Blessing (Enemy heals 15% of sword damage )
        if IsValid(target) then
            target:SetHealth(math.min(target:Health() + self.Primary.Damage * 0.5, target:GetMaxHealth()))
        end
        effectMessage = "Twisted Blessing! - The chaotic forces betray you, healing your foe!"
	self:SetNWString("CurrentEffectMessage", effectMessage)

    elseif effectID == 8 then
        -- Reality Warp (Teleport enemy randomly within 5m)
        local randomOffset = Vector(math.random(-250, 250), math.random(-250, 250), 0)
        local newPos = target:GetPos() + randomOffset
        target:SetPos(newPos)
        effectMessage = "Reality Warp! Your strike sends your enemy teleporting unpredictably!"
	self:SetNWString("CurrentEffectMessage", effectMessage)
    
elseif effectID == 9 then
        -- Paradox Surge (User slowed for 3 sec)
        if IsValid(owner) then
            owner:SetWalkSpeed(owner:GetWalkSpeed() * 0.6)
            owner:SetRunSpeed(owner:GetRunSpeed() * 0.6)
            timer.Simple(3, function()
                if IsValid(owner) then
                    owner:SetWalkSpeed(owner:GetWalkSpeed() / 0.6)
                    owner:SetRunSpeed(owner:GetRunSpeed() / 0.6)
                end
            end)
        end
        effectMessage = "Paradox Surge! - Your body staggers as time distorts around you, slowing your movement!"
	self:SetNWString("CurrentEffectMessage", effectMessage)

 elseif effectID == 10 then
        -- Gift of Change (Temporary armor)
        if IsValid(owner) then
            owner:SetArmor(owner:Armor() + owner:GetMaxArmor() * 0.1)
        end
        effectMessage = "Gift of Change! - Tzeentch grants you a temporary increase to toughness!"
	self:SetNWString("CurrentEffectMessage", effectMessage)

    elseif effectID == 11 then
    for i = 1, 3 do
        timer.Simple(i * 0.5, function()
            local strikePos = owner:GetPos() + Vector(math.random(-150, 150), math.random(-150, 150), 50) -- Keep it above ground
            local effectData = EffectData()
            effectData:SetOrigin(strikePos)
            util.Effect("cat_plasma_explosion_small_chaos", effectData, true, true)

            for _, ent in ipairs(ents.FindInSphere(strikePos, 75)) do
                if IsValid(ent) and (ent:IsPlayer() or ent:IsNPC()) then
                    local dmg = DamageInfo()
                    dmg:SetDamage(self.Primary.Damage * 0.2)
                    dmg:SetAttacker(owner)
                    dmg:SetDamageType(DMG_SHOCK)
                    ent:TakeDamageInfo(dmg)
                end
            end
        end)
    end
    effectMessage = "Arcane Storm! - Chaos rains from the skies!"
	self:SetNWString("CurrentEffectMessage", effectMessage)

elseif effectID == 12 then
    if IsValid(owner) then
        local originalPos = owner:GetPos() -- Save starting position

        effectMessage = "Warp Anchor! - Return to your position in 5 seconds..."
	self:SetNWString("CurrentEffectMessage", effectMessage)

        -- Return the player to original position after 5 sec
        timer.Simple(5, function()
            if IsValid(owner) then
                owner:SetPos(originalPos)
		util.Effect("timestart", effectData)
            end
        end)
    end

elseif effectID == 13 then
    if IsValid(owner) then
        local upwardForce = Vector(0, 0, 750) -- Adjust this value to control launch height

        if owner:IsOnGround() then
            owner:SetVelocity(upwardForce) -- Directly apply velocity upwards
            effectMessage = "Tzeentch’s Trick! - You are flung into the air!"
            owner:EmitSound("ambient/levels/labs/teleport_mechanism_windup1.wav", 75, 100)
	    self:SetNWString("CurrentEffectMessage", effectMessage)
        else
            effectMessage = "Tzeentch’s Trick! - The warp spared you... this time."
            owner:EmitSound("ambient/levels/labs/teleport_postblast.wav", 75, 100)
	    self:SetNWString("CurrentEffectMessage", effectMessage)
        end
    end

elseif effectID == 14 then
    if IsValid(owner) then
        local mutationType = math.random(1, 2) -- Random mutation

        -- Play a mutation effect
        local effectData = EffectData()
        effectData:SetOrigin(owner:GetPos())
        util.Effect("strider_impale_ground", effectData, true, true)
        owner:EmitSound("ambient/levels/citadel/weapon_disintegrate1.wav", 75, 100)

        if mutationType == 1 then
            -- Buff: Gain 10% max HP
            local newMaxHP = owner:GetMaxHealth() * 1.1
            owner:SetHealth(math.min(owner:Health() + (newMaxHP - owner:GetMaxHealth()), newMaxHP))
            owner:SetArmor(owner:Armor() + 25)
            effectMessage = "Unstable Mutation! - Your body surges with chaotic power!"
	    self:SetNWString("CurrentEffectMessage", effectMessage)
        else
            -- Debuff: Lose 10% max HP
            local newMaxHP = owner:GetMaxHealth() * 0.9
            owner:SetHealth(math.max(1, owner:Health() - (owner:GetMaxHealth() - newMaxHP)))
	    owner:SetArmor(math.max(0, owner:Armor() - 25))
            effectMessage = "Unstable Mutation! - Your body withers under chaotic strain!"
	    self:SetNWString("CurrentEffectMessage", effectMessage)
        end
     end


elseif effectID == 15 then

    effectMessage = "Fractured Reality! - Time distorts unpredictably!"
    self:SetNWString("CurrentEffectMessage", effectMessage)

    local effectData = EffectData()
    	effectData:SetOrigin(owner:GetPos())
    	util.Effect("timestop", effectData)

	timeShift = math.random(1, 2)
	if timeShift == 1 then
    game.SetTimeScale(0.5) -- Half-speed for everyone
    	else
    game.SetTimeScale(1.5) -- Double-speed for everyone
	end

    timer.Simple(3, function()
        -- Create effect for returning to normal time
        local effectDataEnd = EffectData()
        effectDataEnd:SetOrigin(owner:GetPos())
        util.Effect("timestart", effectDataEnd)

        game.SetTimeScale(1) -- Restore normal speed
    end)


end
    -- Send message to player's chat
    -- if IsValid(owner) and owner:IsPlayer() then
    --    owner:ChatPrint(effectMessage)
    -- end
end

if CLIENT then
    local displayTime = 5 -- How long the message stays on screen
    local effectCooldown = 10 -- Hardcoded to match SWEP.EffectCooldown

    hook.Add("HUDPaint", "RazorOfChangeHUD", function()
        local ply = LocalPlayer()
        local wep = ply:GetActiveWeapon()

        -- Check if the player is holding the Razor of Change
        if not IsValid(wep) or wep:GetClass() ~= "cat_chaos_legacy_powerswordtzeentch" then return end

        -- Retrieve networked values
        local effectMessage = wep:GetNWString("CurrentEffectMessage", "")
        local nextEffectTime = wep:GetNWFloat("NextEffectTime", 0)

        -- Draw the effect message (only if within display time)
        if effectMessage ~= "" and CurTime() - nextEffectTime + effectCooldown < displayTime then
            draw.SimpleTextOutlined(
                effectMessage,
                "DermaLarge",
                ScrW() / 2, 40, -- Adjust position
                Color(0, 200, 255, 255), -- Blue text for chaos vibes
                TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,
                2, Color(0, 0, 0, 255) -- Black outline
            )
        end

    local x, y = 50, 50
    local width, height = 200, 40

    -- Draw background box
    draw.RoundedBox(8, x - 5, y - 5, width + 10, height + 10, Color(0, 0, 0, 180))

        -- Draw the cooldown timer
        local timeLeft = math.max(0, math.Round(nextEffectTime - CurTime()))
        draw.SimpleTextOutlined(
            "Next Blessing: " .. timeLeft .. "s",
            "DermaLarge",
            x + width / 2, y + height / 2, -- Adjust position slightly above
            Color(55, 0, 255, 255), -- Slight purple to stand out
            TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,
            2, Color(0, 0, 0, 255) -- Black outline
        )
    end)
end




