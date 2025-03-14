include("shared.lua")

function ENT:Draw()
    self:DrawModel() -- Ensure the model is rendered
end

local activeChem = {}

-- Start the chemical effect
net.Receive("StartChemEffect", function()
    local chemID = net.ReadUInt(16)
    local pos = net.ReadVector()
    local duration = net.ReadFloat()
    local maxRadius = net.ReadFloat()

    -- Prevent duplicate effects for the same ID
    if activeChem[chemID] then return end

    -- Create emitter
    local emitter = ParticleEmitter(pos)
    if not emitter then
        print("[CHEM] Failed to create emitter at", pos)
        return
    end

    -- Track this chem effect
    activeChem[chemID] = {
        Emitter = emitter,
        EndTime = CurTime() + duration + 5, -- Include fade-out
        Pos = pos,
        Radius = 100,                       -- Starting small
        MaxRadius = maxRadius,
        GrowthTime = 10                     -- Time to reach full size
    }

    -- Timer for chem particle emission
    timer.Create("ClientChemEffect_" .. chemID, 0.1, 0, function()
        local chemData = activeChem[chemID]
        if not chemData or not IsValid(chemData.Emitter) then
            timer.Remove("ClientChemEffect_" .. chemID)
            return
        end

        local elapsedTime = CurTime() - (chemData.EndTime - duration - 5)

        -- Gradually increase the cloud radius
        if elapsedTime <= chemData.GrowthTime then
            local growthFraction = math.Clamp(elapsedTime / chemData.GrowthTime, 0, 1)
            chemData.Radius = 100 + (chemData.MaxRadius - 100) * growthFraction
        end

        -- Emit particles in a disc shape, denser at the center, fading at edges
for _ = 1, 10 do
    local spreadMultiplier = 3
    -- Offset for disc-like shape (very low Z-axis randomness)
    local offset = Vector(
        math.Rand(-1, 1),
        math.Rand(-1, 1),
        math.Rand(0, 0.025) * 5 -- Stay close to the ground
    ) * math.Rand(0, chemData.Radius * spreadMultiplier)

    local distanceFromCenter = offset:Length()
    local densityFactor = 1 - (distanceFromCenter / (chemData.Radius * spreadMultiplier))

    local particle = chemData.Emitter:Add("particles/smokey", chemData.Pos + offset)

    if particle then
        -- Particles move slightly outward but stay near the ground
        local velocityDirection = Vector(offset.x, offset.y, 0):GetNormalized()
        particle:SetVelocity(velocityDirection * math.Rand(5, 15))

        particle:SetDieTime(math.Rand(5, 10) * densityFactor) -- Shorter lifetime at edges
        particle:SetStartAlpha(50 * densityFactor)           -- More transparent at the edges
        particle:SetEndAlpha(10)

        particle:SetStartSize(chemData.Radius * 0.1 * densityFactor) -- Smaller size near edges
        particle:SetEndSize(chemData.Radius * 0.5 * densityFactor)

        particle:SetRoll(math.Rand(0, 360))
        particle:SetColor(0, 100, 0)

        particle:SetAirResistance(10)
        particle:SetGravity(Vector(0, 0, -100)) -- Keep particles low
        particle:SetCollide(true)
        particle:SetBounce(0.2)
    end
end

        -- Auto-cleanup after duration
        if CurTime() >= chemData.EndTime then
            if IsValid(chemData.Emitter) then
                chemData.Emitter:Finish()
            end
            activeChem[chemID] = nil
            timer.Remove("ClientChemEffect_" .. chemID)
        end
    end)
end)

-- Stop a specific chem effect
net.Receive("StopChemEffect", function()
    local chemID = net.ReadUInt(16)
    local chemData = activeChem[chemID]

    if chemData then
        -- Clean up the emitter
        if IsValid(chemData.Emitter) then
            chemData.Emitter:Finish()
        end

        -- Remove the timer and effect
        timer.Remove("ClientChemEffect_" .. chemID)
        activeChem[chemID] = nil
    end
end)
