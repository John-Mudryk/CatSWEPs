include('shared.lua')

hook.Add("HUDPaint", "GrenadeCookingHUD", function()
    local ply = LocalPlayer()
    if not IsValid(ply) then return end

    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) or not wep:IsWeapon() then return end

    -- If cooking has started, initialize CookStartTime
    if wep:GetNW2Bool("Cooking", false) then
        if not wep.CookStartTime then
            wep.CookStartTime = CurTime()
        end

        -- Calculate elapsed time
        local cookTimeElapsed = CurTime() - wep.CookStartTime

        -- Draw the cooking status HUD
        draw.SimpleText("Cooking Grenade...", "Trebuchet24", ScrW() / 2, ScrH() - 100, Color(255, 50, 50), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText(string.format("Time Cooked: %.1f seconds", cookTimeElapsed), "Trebuchet18", ScrW() / 2, ScrH() - 75, Color(255, 150, 150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    else
        -- Reset the timer when cooking stops
        if wep.CookStartTime then
            wep.CookStartTime = nil
        end
    end
end)

