hook.Add("TFA_DrawScopeOverlay", "MyHeavyScopeDraw", function(wep)
    local scopeTbl = wep:GetStat("Secondary.ScopeTable")
    if not scopeTbl then return end

    local mat = scopeTbl.ScopeMaterial
    if not mat or mat:IsError() then return end

    -- Optional: check if this is YOUR scope material
    -- if mat:GetName() ~= "scope/gdcw_closedsight" then return end

    -- Custom drawing
    local w, h = ScrW(), ScrH()
    local scale = scopeTbl.ScopeMaterialScale or 1.5
    local size = h * scale

    surface.SetDrawColor(255, 255, 255, 255)
    surface.SetMaterial(mat)
    surface.DrawTexturedRect(w / 2 - size / 2, h / 2 - size / 2, size, size)

    -- Draw crosshair too, if needed
    local ch = scopeTbl.ScopeCrosshair
    if ch and ch.Material then
        local chscale = ch.scale or 0.5
        local chsize = h * chscale
        surface.SetMaterial(ch.Material)
        surface.SetDrawColor(ch.r or 255, ch.g or 255, ch.b or 255, ch.a or 255)
        surface.DrawTexturedRect(w / 2 - chsize / 2, h / 2 - chsize / 2, chsize, chsize)
    end

    return true -- override default drawing
end)
