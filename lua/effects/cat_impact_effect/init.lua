function EFFECT:Init(data)
    local pos = data:GetOrigin()
    local normal = data:GetNormal()

    local emitter = ParticleEmitter(pos)

    for i = 1, 10 do
        local particle = emitter:Add("effects/StunstickImpact", pos)
        if particle then
            particle:SetVelocity(normal * 100 + VectorRand() * 50)
            particle:SetLifeTime(0)
            particle:SetDieTime(math.Rand(0.5, 1))
            particle:SetStartAlpha(255)
            particle:SetEndAlpha(0)
            particle:SetStartSize(5)
            particle:SetEndSize(0)
            particle:SetRoll(math.Rand(0, 360))
            particle:SetRollDelta(math.Rand(-2, 2))
            particle:SetColor(255, 255, 255)
        end
    end

    emitter:Finish()
end

function EFFECT:Think()
    return false
end

function EFFECT:Render()
end
