SWEP.Base = "tfa_melee_base"
SWEP.Category = "Cat's SWEPs"
SWEP.PrintName = "Ogryn Mace + Chimera Hatch"
SWEP.ViewModel = "models/zadkiel/weapons/c_shield_mace.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelFOV = 70
SWEP.UseHands = true
SWEP.CameraOffset = Angle(0, 0, 0)
--SWEP.InspectPos = Vector(17.184, -4.891, -11.902) - SWEP.VMPos
--SWEP.InspectAng = Vector(70, 46.431, 70)
SWEP.WorldModel = "models/muschi/weapons/muschi_swep_shield_2.mdl"
SWEP.HoldType = "melee"
SWEP.Primary.Directional = true
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.DisableIdleAnimations = false
SWEP.VMPos = Vector(0, 0, 0)
SWEP.Primary.Damage = 800
SWEP.Primary.Range = 120
SWEP.Primary.End = 1

SWEP.Primary.Attacks = {
	{
		["act"] = ACT_VM_HITLEFT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = SWEP.Primary.Range, -- Trace distance
		["dir"] = Vector(60, 0, 0), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage, --Damage
		["dmgtype"] = bit.bor(DMG_SLASH,DMG_ALWAYSGIB), --bit.bor(DMG_SLASH,DMG_ALWAYSGIB),DMG_CRUSH, etc.
		["delay"] = 0.45, --Delay
		["spr"] = false, --Allow attack while sprinting?
		["snd"] = Sound("weapons/tfa_kf2/zweihander/swing_hard_2.wav"), -- Sound ID
		["snd_delay"] = 0.26,
		["viewpunch"] = Angle(1, -5, 0), --viewpunch angle
		["end"] = 1, --time before next attack
		["hull"] = 42, --Hullsize
		["direction"] = "R", --Swing dir,
		["hitflesh"] = Sound("weapons/tfa_kf2/zweihander/hitflesh_1.wav"),
		["hitworld"] = Sound("weapons/rpg/single.wav"),
	},
	{
		["act"] = ACT_VM_MISSRIGHT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = SWEP.Primary.Range, -- Trace distance
		["dir"] = Vector(-60, 0, 0), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage * 0.8, --Damage
		["dmgtype"] = bit.bor(DMG_SLASH,DMG_ALWAYSGIB), --bit.bor(DMG_SLASH,DMG_ALWAYSGIB),DMG_CRUSH, etc.
		["delay"] = 0.45, --Delay
		["spr"] = false, --Allow attack while sprinting?
		["snd"] = Sound("weapons/tfa_kf2/zweihander/swing_hard_2.wav"), -- Sound ID
		["snd_delay"] = 0.26,
		["viewpunch"] = Angle(1, 5, 0), --viewpunch angle
		["end"] = 1, --time before next attack
		["hull"] = 42, --Hullsize
		["direction"] = "L", --Swing dir,
		["hitflesh"] = Sound("weapons/tfa_kf2/zweihander/hitflesh_1.wav"),
		["hitworld"] = Sound("weapons/rpg/single.wav"),
	},
	{
		["act"] = ACT_VM_PRIMARYATTACK, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = SWEP.Primary.Range, -- Trace distance
		["dir"] = Vector(0, 20, -70), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage, --Damage
		["dmgtype"] = bit.bor(DMG_SLASH,DMG_ALWAYSGIB), --bit.bor(DMG_SLASH,DMG_ALWAYSGIB),DMG_CRUSH, etc.
		["delay"] = 0.45, --Delay
		["spr"] = true, --Allow attack while sprinting?
		["snd"] = Sound("weapons/tfa_kf2/zweihander/swing_hard_2.wav"), -- Sound ID
		["snd_delay"] = 0.26,
		["viewpunch"] = Angle(5, 0, 0), --viewpunch angle
		["end"] = 1, --time before next attack
		["hull"] = 42, --Hullsize
		["direction"] = "F", --Swing dir,
		["hitflesh"] = Sound("weapons/tfa_kf2/zweihander/hitflesh_1.wav"),
		["hitworld"] = Sound("weapons/rpg/single.wav"),
	},
	{
		["act"] = ACT_VM_PULLBACK, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = SWEP.Primary.Range, -- Trace distance
		["dir"] = Vector(0, 20, 70), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage, --Damage
		["dmgtype"] = bit.bor(DMG_SLASH,DMG_ALWAYSGIB), --bit.bor(DMG_SLASH,DMG_ALWAYSGIB),DMG_CRUSH, etc.
		["delay"] = 0.45, --Delay
		["spr"] = false, --Allow attack while sprinting?
		["snd"] = Sound("weapons/tfa_kf2/zweihander/swing_hard_2.wav"), -- Sound ID
		["snd_delay"] = 0.26,
		["viewpunch"] = Angle(-5, 0, 0), --viewpunch angle
		["end"] = 1, --time before next attack
		["hull"] = 42, --Hullsize
		["direction"] = "B", --Swing dir,
		["hitflesh"] = Sound("weapons/tfa_kf2/zweihander/hitflesh_1.wav"),
		["hitworld"] = Sound("weapons/rpg/single.wav"),
	}
}

SWEP.Secondary.Attacks = {
	{
		["act"] = ACT_VM_SECONDARYATTACK, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = SWEP.Primary.Range, -- Trace distance
		["dir"] = Vector(0, 20, -70), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage * 1.2, --Damage
		["dmgtype"] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
		["delay"] = 0.6, --Delay
		["spr"] = true, --Allow attack while sprinting?
		["snd"] = Sound("weapons/tfa_kf2/zweihander/swing_hard_4.wav"), -- Sound ID
		["snd_delay"] = 0.5,
		["viewpunch"] = Angle(5, 0, 0), --viewpunch angle
		["end"] = 1.1, --time before next attack
		["hull"] = 42, --Hullsize
		["direction"] = "F", --Swing dir,
		["hitflesh"] = Sound("weapons/tfa_kf2/zweihander/hitflesh_1.wav"),
		["hitworld"] = Sound("weapons/rpg/single.wav"),
	},
	{
		["act"] = ACT_VM_MISSLEFT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = SWEP.Primary.Range * 1.1, -- Trace distance
		["dir"] = Vector(60, 0, 0), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage * 1.2, --Damage
		["dmgtype"] = bit.bor(bit.bor(DMG_SLASH,DMG_ALWAYSGIB), DMG_ALWAYSGIB), --bit.bor(DMG_SLASH,DMG_ALWAYSGIB),DMG_CRUSH, etc.
		["delay"] = 0.7, --Delay
		["spr"] = false, --Allow attack while sprinting?
		["snd"] = Sound("weapons/tfa_kf2/zweihander/swing_hard_4.wav"), -- Sound ID
		["snd_delay"] = 0.4,
		["viewpunch"] = Angle(1, -5, 0), --viewpunch angle
		["end"] = 1.3, --time before next attack
		["hull"] = 42, --Hullsize
		["direction"] = "R", --Swing dir,
		["hitflesh"] = Sound("weapons/tfa_kf2/zweihander/hitflesh_1.wav"),
		["hitworld"] = Sound("weapons/rpg/single.wav"),
	},
	{
		["act"] = ACT_VM_MISSRIGHT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = SWEP.Primary.Range, -- Trace distance
		["dir"] = Vector(-60, 0, 0), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage * 1, --Damage
		["dmgtype"] = bit.bor(bit.bor(DMG_SLASH,DMG_ALWAYSGIB), DMG_ALWAYSGIB), --bit.bor(DMG_SLASH,DMG_ALWAYSGIB),DMG_CRUSH, etc.
		["delay"] = 0.65, --Delay
		["spr"] = false, --Allow attack while sprinting?
		["snd"] = Sound("weapons/tfa_kf2/zweihander/swing_hard_4.wav"), -- Sound ID
		["snd_delay"] = 0.5,
		["viewpunch"] = Angle(1, 5, 0), --viewpunch angle
		["end"] = 1.3, --time before next attack
		["hull"] = 42, --Hullsize
		["direction"] = "L", --Swing dir,
		["hitflesh"] = Sound("weapons/tfa_kf2/zweihander/hitflesh_1.wav"),
		["hitworld"] = Sound("weapons/rpg/single.wav"),
	},
	{
		["act"] = ACT_VM_SECONDARYATTACK, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = SWEP.Primary.Range, -- Trace distance
		["dir"] = Vector(0, 20, -70), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage * 1.2, --Damage
		["dmgtype"] = bit.bor(bit.bor(DMG_SLASH,DMG_ALWAYSGIB), DMG_ALWAYSGIB), --bit.bor(DMG_SLASH,DMG_ALWAYSGIB),DMG_CRUSH, etc.
		["delay"] = 0.8, --Delay
		["spr"] = false, --Allow attack while sprinting?
		["snd"] = Sound("weapons/tfa_kf2/zweihander/swing_hard_4.wav"), -- Sound ID
		["snd_delay"] = 0.6,
		["viewpunch"] = Angle(10, 0, 0), --viewpunch angle
		["end"] = 1.3, --time before next attack
		["hull"] = 42, --Hullsize
		["direction"] = "B", --Swing dir,
		["hitflesh"] = Sound("weapons/tfa_kf2/zweihander/hitflesh_1.wav"),
		["hitworld"] = Sound("weapons/rpg/single.wav"),
	},
	{
		["act"] = ACT_VM_PULLBACK_HIGH, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = SWEP.Primary.Range, -- Trace distance
		["dir"] = Vector(0, 20, -70), -- Trace arc cast
		["dmg"] = SWEP.Primary.Damage * 1.2, --Damage
		["dmgtype"] = bit.bor(bit.bor(DMG_SLASH,DMG_ALWAYSGIB), DMG_ALWAYSGIB), --bit.bor(DMG_SLASH,DMG_ALWAYSGIB),DMG_CRUSH, etc.
		["delay"] = 0.55, --Delay
		["spr"] = false, --Allow attack while sprinting?
		["snd"] = Sound("weapons/tfa_kf2/zweihander/swing_hard_4.wav"), -- Sound ID
		["snd_delay"] = 0.5,
		["viewpunch"] = Angle(7.5, 0, 0), --viewpunch angle
		["end"] = 1.3, --time before next attack
		["hull"] = 42, --Hullsize
		["direction"] = "F", --Swing dir,
		["hitflesh"] = Sound("weapons/tfa_kf2/zweihander/hitflesh_1.wav"),
		["hitworld"] = Sound("weapons/rpg/single.wav"),
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
SWEP.BlockDamageMinimum = 0.0 --Multiply damage by this for a minimumly effective block
SWEP.BlockTimeWindow = 0.1 --Time to absorb maximum damage
SWEP.BlockTimeFade = 0.5 --Time for blocking to do minimum damage.  Does not include block window
SWEP.BlockSound = Sound("block_1.wav")
SWEP.BlockDamageCap = 80
SWEP.BlockDamageTypes = {
	DMG_SLASH,DMG_CLUB,DMG_CRUSH,DMG_BULLET,DMG_BLAST,DMG_BURN,DMG_PLASMA,DMG_SHOCK,DMG_DISSOLVE
}
SWEP.BlockHoldType = "melee2"
SWEP.BlockCanDeflect = false

SWEP.Secondary.CanBash = true
SWEP.Secondary.BashDamage = SWEP.Primary.Damage
SWEP.Secondary.BashDelay = 0.1
SWEP.Secondary.BashLength = SWEP.Primary.Range

SWEP.SequenceLengthOverride = {
	[ACT_VM_HITCENTER] = 0.8
}

SWEP.ViewModelBoneMods = {
	["TrueRoot"] = { scale = Vector(1, 1, 1), pos = Vector(10, 0, 0), angle = Angle(0, 0, 0) },
	["RW_Weapon"] = { scale = Vector(0.1, 0.1, 0.1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["LW_Weapon"] = { scale = Vector(0, 0, 0), pos = Vector(100, 0, 0), angle = Angle(0, 0, 0) },
	["RightArm_1stP"] = { scale = Vector(1, 1, 1), pos = Vector(-6, 0, 0), angle = Angle(0, 0, 0) }
}


SWEP.VElements = {
	["macehandle"] = { type = "Model", model = "models/props_trainstation/trainstation_column001.mdl", bone = "RW_Weapon", rel = "", pos = Vector(0, 0, -8.53), angle = Angle(0, 0, 0), size = Vector(0.25, 0.25, 0.189), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["macegrip"] = { type = "Model", model = "models/props_docks/channelmarker_gib01.mdl", bone = "RW_Weapon", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 180), size = Vector(0.275, 0.275, 0.275), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["macehead1"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament001.mdl", bone = "RW_Weapon", rel = "", pos = Vector(0, 0, 36.257), angle = Angle(180, 45, 0), size = Vector(0.15, 0.15, 0.1), color = Color(200, 200, 200, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["macehead2"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament001.mdl", bone = "RW_Weapon", rel = "", pos = Vector(0, 0, 35.855), angle = Angle(0, 45, 0), size = Vector(0.15, 0.15, 0.1), color = Color(200, 200, 200, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["macepommel"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "RW_Weapon", rel = "", pos = Vector(0, 0, -5.138), angle = Angle(180, 0, 0), size = Vector(0.25, 0.25, 0.25), color = Color(200, 200, 200, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["shield"] = { type = "Model", model = "models/muschi/weapons/muschi_swep_shield_2.mdl", bone = "LeftHand_1stP", rel = "", pos = Vector(0.885, -6.296, 4.535), angle = Angle(0, 180, -80), size = Vector(0.625, 0.796, 0.7), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["macehandle"] = { type = "Model", model = "models/props_trainstation/trainstation_column001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.75, 2.5, 11.35), angle = Angle(0, 0, 180), size = Vector(0.25, 0.25, 0.189), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["macegrip"] = { type = "Model", model = "models/props_docks/channelmarker_gib01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.75, 2.5, 0), angle = Angle(0, 0, 0), size = Vector(0.275, 0.275, 0.275), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["macehead1"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.75, 2.5, -32.724), angle = Angle(0, 45, 0), size = Vector(0.15, 0.15, 0.1), color = Color(200, 200, 200, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["macehead2"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.75, 2.5, -32.251), angle = Angle(0, 45, 180), size = Vector(0.15, 0.15, 0.1), color = Color(200, 200, 200, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["macepommel"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.75, 2.5, 7.787), angle = Angle(0, 0, 0), size = Vector(0.25, 0.25, 0.25), color = Color(200, 200, 200, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["shield"] = { type = "Model", model = "models/muschi/weapons/muschi_swep_shield_2.mdl", bone = "ValveBiped.Bip01_L_Forearm", rel = "", pos = Vector(6.623, -5.805, 3.608), angle = Angle(0, 180, -53.938), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.InspectionActions = {ACT_VM_RECOIL1, ACT_VM_RECOIL2, ACT_VM_RECOIL3}

SWEP.Type                       = nil 
SWEP.Type_Displayed             = "BIG BASHAH + DEYZ WAZIN' UZIN IT!!"

SWEP.Attachments = {
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