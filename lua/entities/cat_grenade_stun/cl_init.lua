ENT.Spawnable			= false
ENT.AdminSpawnable		= false

include("shared.lua")

net.Receive("StunGrenadeEffect", function()
    local duration = net.ReadFloat()

    -- Customizable Flash Effect (change color and duration)
    LocalPlayer():ScreenFade(SCREENFADE.IN, Color(205, 205, 205, 120), 0.25, (duration * 0.25))

    -- Audio ringing effect
    LocalPlayer():EmitSound("Flashbang Ringing.mp3")

    -- Motion blur effect (fixed to stop repeating)
    local startStrength = 2 -- Max blur strength at the start
    local endTime = CurTime() + duration

    hook.Add("RenderScreenspaceEffects", "StunGrenadeBlur", function()
        local timeLeft = endTime - CurTime()

        -- Calculate dynamic blur strength based on remaining time
        if timeLeft > 0 then
            local strength = (timeLeft / duration) * startStrength
            DrawMotionBlur(0.01, strength, 0.01)
        else
            -- Clean up the blur effect once the duration ends
            hook.Remove("RenderScreenspaceEffects", "StunGrenadeBlur")
        end
    end)
end)

hook.Add("PlayerSwitchWeapon", "ClearStunBlurOnWeaponSwitch", function(ply)
    if ply == LocalPlayer() then
        hook.Remove("RenderScreenspaceEffects", "StunGrenadeBlur")
    end
end)
