function EFFECT:Init(data)
    self.Position = data:GetOrigin()
    self.LifeTime = 0.5
    self.StartTime = CurTime()
end

function EFFECT:Think()
    return (CurTime() - self.StartTime) < self.LifeTime
end

function EFFECT:Render()
    local alpha = (1 - (CurTime() - self.StartTime) / self.LifeTime) * 255
    render.SetMaterial(Material("sprites/physbeam"))
    render.DrawSprite(self.Position, 16, 16, Color(200, 50, 255, alpha))
end
