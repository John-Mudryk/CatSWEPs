function EFFECT:Init(data)
    self.texcoord = math.Rand(0, 20) / 3
    self.Position = data:GetStart()
    self.WeaponEnt = data:GetEntity()
    self.Attachment = data:GetAttachment()

    self.StartPos = self:GetTracerShootPos(self.Position, self.WeaponEnt, self.Attachment)
    self.EndPos = data:GetOrigin()

    self.Entity:SetCollisionBounds(self.StartPos - self.EndPos, Vector(110, 110, 110))
    self.Entity:SetRenderBoundsWS(self.StartPos, self.EndPos, Vector() * 8)

    self.StartPos = self:GetTracerShootPos(self.Position, self.WeaponEnt, self.Attachment)

    self.Alpha = 255
    self.FlashA = 255

    -- Initialize particle effect at the start position
    self.ParticleEffectName = "plasma_bolt_small" -- Replace with your particle effect name
    self.ParticleEffect = ParticleEffect(self.ParticleEffectName, self.StartPos, Angle(), nil)
end

function EFFECT:Think()
    self.FlashA = self.FlashA - 2050 * FrameTime()
    if (self.FlashA < 0) then self.FlashA = 0 end

    self.Alpha = self.Alpha - 1650 * FrameTime()
    if (self.Alpha < 0) then return false end

    -- Update the particle effect position to follow the tracer
    local traceData = {}
    traceData.start = self.StartPos
    traceData.endpos = self.EndPos
    traceData.filter = self.Entity
    local traceResult = util.TraceLine(traceData)

    -- Move the particle effect to the new position
    -- This requires setting up a custom method to move or adjust particle position, as ParticleEffect does not inherently move
    -- One approach is to re-spawn the particle effect at the new position
    ParticleEffect(self.ParticleEffectName, traceResult.HitPos, Angle(), nil)

    -- Update StartPos and EndPos for the next frame
    self.StartPos = self:GetTracerShootPos(self.Position, self.WeaponEnt, self.Attachment)
    self.EndPos = data:GetOrigin()

    return true
end