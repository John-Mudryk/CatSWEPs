local function BlockDamageRiotShield(ent, dmginfo)
    if not IsValid(ent) or not ent:IsPlayer() then return end
    if dmginfo:IsDamageType(DMG_DROWNRECOVER) or dmginfo:IsDamageType(DMG_DIRECT) then return end

    local wep = ent:GetActiveWeapon()
    if not IsValid(wep) or not wep.IsTFAWeapon or not wep.RiotShield then return end -- Ensure it's a TFA weapon with a riot shield

    -- Check if the damage type is blockable
    local shouldBlock = false
    for _, v in ipairs(wep.RiotShieldDamageTypes or {}) do
        if dmginfo:IsDamageType(v) then
            shouldBlock = true
            break
        end
    end
    if not shouldBlock then return end

    -- Get block angle
    local blockThreshold = (wep.RiotShieldCone or 135) / 2
    local attackSource = dmginfo:GetInflictor()
    if not IsValid(attackSource) then
        attackSource = dmginfo:GetAttacker()
    end
    if not IsValid(attackSource) then return end

    local attackAngle = (attackSource:GetPos() - ent:GetPos()):Angle()
    local eyeAngles = ent:EyeAngles()

    -- Calculate angle differences
    local yawDiff = math.abs(math.AngleDifference(eyeAngles.y, attackAngle.y))
    local pitchDiff = math.abs(math.AngleDifference(eyeAngles.p, attackAngle.p))
    local pitchThreshold = blockThreshold * 0.5  -- Adjust pitch threshold

    -- Reduce block cone when aiming down sights
    if wep.IronSightsProgress and wep.IronSightsProgress > 0.75 then
        blockThreshold = (wep.RiotShieldConeADS or 80) / 2
    end

    -- Check if attack is within block angle
    if yawDiff <= blockThreshold and pitchDiff <= pitchThreshold then
        local dmgScale = wep.RiotShieldMaximum or 0.1 -- Default: 90% damage reduction
        if wep.RiotShieldDamageCap then
            dmgScale = math.min(dmgScale, wep.RiotShieldDamageCap / dmginfo:GetDamage())
        end

        -- Scale damage based on Riot Shield settings
        dmginfo:ScaleDamage(dmgScale)
        dmginfo:SetDamagePosition(vector_origin)
        dmginfo:SetDamageType(bit.bor(dmginfo:GetDamageType(), DMG_DROWNRECOVER)) -- Mark as blocked damage
        wep:EmitSound(wep.RiotShieldImpact or "Shield_Impact")

        -- Play block animation if available
        if wep.ChooseBlockAnimation then
            wep:ChooseBlockAnimation()
        end
    end
end

-- Hook into damage handling
hook.Add("EntityTakeDamage", "tfa_melee_block", function(ent, dmginfo)
    return BlockDamageRiotShield(ent, dmginfo)
end)

hook.Add("ScalePlayerDamage", "tfa_melee_block", function(ent, _, dmginfo)
    return BlockDamageRiotShield(ent, dmginfo)
end)

-- Sound for block impact
sound.Add({
    name = "Shield_Impact",
    channel = CHAN_STATIC,
    volume = 1,
    level = 125,
    pitch = { 95, 105 },
    sound = {
        "phx/epicmetal_hard.wav",
        "phx/epicmetal_hard1.wav",
        "phx/epicmetal_hard2.wav",
        "phx/epicmetal_hard3.wav",
        "phx/epicmetal_hard4.wav",
        "phx/epicmetal_hard5.wav",
        "phx/epicmetal_hard6.wav",
        "phx/epicmetal_hard7.wav"
    }
})
