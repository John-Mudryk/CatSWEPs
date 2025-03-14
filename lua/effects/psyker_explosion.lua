function EFFECT:Init(data)
    self.Position = data:GetOrigin()
    self.Radius = data:GetRadius() or 150
    self.LifeTime = 0.3
    self.StartTime = CurTime()

    -- Particle effect
    local emitter = ParticleEmitter(self.Position)
    for i = 1, 15 do
        local particle = emitter:Add("effects/energyball", self.Position)
        if particle then
            particle:SetVelocity(VectorRand() * 300)
            particle:SetDieTime(math.Rand(0.4, 0.7))
            particle:SetStartAlpha(255)
            particle:SetEndAlpha(0)
            particle:SetStartSize(math.Rand(10, 20))
            particle:SetEndSize(0)
            particle:SetRoll(math.Rand(0, 360))
            particle:SetColor(180, 50, 255)
        end
    end
    emitter:Finish()
end

function EFFECT:Think()
    return (CurTime() - self.StartTime) < self.LifeTime
end

function EFFECT:Render()
    local alpha = (1 - (CurTime() - self.StartTime) / self.LifeTime) * 255
    render.SetMaterial(Material("sprites/light_glow02_add"))
    render.DrawSprite(self.Position, self.Radius, self.Radius, Color(255, 50, 255, alpha))
end
