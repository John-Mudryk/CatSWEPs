include("shared.lua")

function ENT:Draw()
    self:DrawModel() -- Ensure the model is rendered
end

local activeSmoke = {}

-- Start the smoke effect
net.Receive("StartSmokeEffect", function()
    local smokeID = net.ReadUInt(16)
    local pos = net.ReadVector()
    local duration = net.ReadFloat()
    local maxRadius = net.ReadFloat()

    -- Prevent duplicate effects for the same ID
    if activeSmoke[smokeID] then
        return
    end

    -- Create emitter
    local emitter = ParticleEmitter(pos)
    if not emitter then
        print("[SMOKE] Failed to create emitter at", pos)
        return
    end

    -- Track this smoke effect
    activeSmoke[smokeID] = {
        Emitter = emitter,
        EndTime = CurTime() + duration + 5, -- Include fade-out
        Pos = pos,
        Radius = 100,          -- Starting small
        MaxRadius = maxRadius,
        GrowthTime = 10        -- Time to reach full size
    }

    -- Timer for smoke particle emission
    timer.Create("ClientSmokeEffect_" .. smokeID, 0.1, 0, function()
        local smokeData = activeSmoke[smokeID]
        if not smokeData or not IsValid(smokeData.Emitter) then
            timer.Remove("ClientSmokeEffect_" .. smokeID)
            return
        end

        local elapsedTime = CurTime() - (smokeData.EndTime - duration - 5)

        -- Gradually increase the smoke radius
        if elapsedTime <= smokeData.GrowthTime then
            local growthFraction = math.Clamp(elapsedTime / smokeData.GrowthTime, 0, 1)
            smokeData.Radius = 100 + (smokeData.MaxRadius - 100) * growthFraction
        end

-- Emit particles in a disc shape, denser at the center, fading at edges
for _ = 1, 5 do
    local spreadMultiplier = 3
    -- Offset for disc-like shape (very low Z-axis randomness)
    local offset = Vector(
        math.Rand(-1, 1),
        math.Rand(-1, 1),
        math.Rand(0, 0.025) * 5 -- Stay close to the ground
    ) * math.Rand(0, smokeData.Radius * spreadMultiplier)

    local distanceFromCenter = offset:Length()
    local densityFactor = 2 - (distanceFromCenter / (smokeData.Radius * spreadMultiplier))

    local particle = smokeData.Emitter:Add("particle/particle_smokegrenade1", smokeData.Pos + offset)

    if particle then
        -- Particles move slightly outward but stay near the ground
        local velocityDirection = Vector(offset.x, offset.y, 0):GetNormalized()
        particle:SetVelocity(velocityDirection * math.Rand(5, 15))

        particle:SetDieTime(math.Rand(5, 10) * densityFactor) -- Shorter lifetime at edges
        particle:SetStartAlpha(255 * densityFactor)           -- More transparent at the edges
        particle:SetEndAlpha(20)

        particle:SetStartSize(smokeData.Radius * 0.1 * densityFactor) -- Smaller size near edges
        particle:SetEndSize(smokeData.Radius * 3 * densityFactor)

        particle:SetRoll(math.Rand(0, 360))
        particle:SetColor(100, 100, 100)

        particle:SetAirResistance(10)
        particle:SetGravity(Vector(0, 0, -100)) -- Keep particles low
        particle:SetCollide(true)
        particle:SetBounce(0.2)
    end
end

        -- Auto-cleanup after duration
        if CurTime() >= smokeData.EndTime then
            if IsValid(smokeData.Emitter) then
                smokeData.Emitter:Finish()
            end
            activeSmoke[smokeID] = nil
            timer.Remove("ClientSmokeEffect_" .. smokeID)
        end
    end)
end)

-- Stop a specific smoke effect
net.Receive("StopSmokeEffect", function()
    local smokeID = net.ReadUInt(16)
    local smokeData = activeSmoke[smokeID]

    if smokeData then
        -- Clean up the emitter
        if IsValid(smokeData.Emitter) then
            smokeData.Emitter:Finish()
        end

        -- Remove the timer and effect
        timer.Remove("ClientSmokeEffect_" .. smokeID)
        activeSmoke[smokeID] = nil
    end
end)
