function EFFECT:Init(data)
    self.Pos = data:GetOrigin()
    local Emitter = ParticleEmitter(self.Pos)
    if not Emitter then return end

    -- Quick flash at explosion point
    local flash = Emitter:Add("effects/muzzleflash4", self.Pos)
    if flash then
        flash:SetDieTime(0.1)
        flash:SetStartAlpha(255)
        flash:SetEndAlpha(0)
        flash:SetStartSize(50)
        flash:SetEndSize(500)
        flash:SetColor(255, 200, 150)
    end

    -- Shockwave effect
    for i = 1, 8 do
        local shockwave = Emitter:Add("models/monk/glint", self.Pos)
        if shockwave then
            shockwave:SetVelocity(VectorRand() * 5)
            shockwave:SetDieTime(0.15)
            shockwave:SetStartAlpha(255)
            shockwave:SetEndAlpha(0)
            shockwave:SetStartSize(20)
            shockwave:SetEndSize(500)
            shockwave:SetRoll(math.Rand(0, 360))
            shockwave:SetRollDelta(math.Rand(-2, 2))
            shockwave:SetColor(255, 255, 255)
        end
    end

    -- Shockwave heat distortion
    local heatwave = Emitter:Add("sprites/heatwave", self.Pos)
    if heatwave then
        heatwave:SetDieTime(0.3)
        heatwave:SetStartAlpha(255)
        heatwave:SetEndAlpha(0)
        heatwave:SetStartSize(20)
        heatwave:SetEndSize(400)
        heatwave:SetColor(255, 255, 255)
    end

    -- Small debris flying out
    for i = 1, 10 do
        local debris = Emitter:Add("effects/fleck_cement", self.Pos)
        if debris then
            debris:SetVelocity(VectorRand() * 400 + Vector(0, 0, math.random(50, 150)))
            debris:SetDieTime(math.Rand(0.15, 0.5))
            debris:SetStartAlpha(255)
            debris:SetEndAlpha(0)
            debris:SetStartSize(math.Rand(5, 10))
            debris:SetEndSize(0)
            debris:SetRoll(math.Rand(0, 360))
            debris:SetRollDelta(math.Rand(-10, 10))
            debris:SetColor(100, 100, 100)
            debris:SetGravity(Vector(0, 0, -600))
            debris:SetAirResistance(50)
        end
    end

    -- Minimal smoke trail (optional)
    for i = 1, 4 do
        local smoke = Emitter:Add("particles/smokey", self.Pos)
        if smoke then
            smoke:SetVelocity(VectorRand() * 100 + Vector(0, 0, 50))
            smoke:SetDieTime(math.Rand(1, 2))
            smoke:SetStartAlpha(150)
            smoke:SetEndAlpha(0)
            smoke:SetStartSize(50)
            smoke:SetEndSize(500)
            smoke:SetRoll(math.Rand(0, 360))
            smoke:SetRollDelta(math.Rand(-1, 1))
            smoke:SetColor(90, 90, 90)
            smoke:SetGravity(Vector(0, 0, 30))
            smoke:SetAirResistance(50)
        end
    end

    -- Clean up
    Emitter:Finish()
end

function EFFECT:Think()
    return false
end

function EFFECT:Render()
end
