EFFECT.Thickness = 4
EFFECT.Life = 0.25
EFFECT.RotVelocity = 30
EFFECT.InValid = false
EFFECT.MaxLength = 750 -- Max range of the electric arc
EFFECT.Segments = 15 -- Number of segments in the arc

local Mat_Impact = Material("trails/smoke")
local Mat_Arc = Material("trails/laser") -- ⚡ Lightning-like material
local Mat_Glow = Material("sprites/light_glow02_add") -- ⚡ Glow for tip

function EFFECT:Init(data)
    self.Position = data:GetStart()
    self.WeaponEnt = data:GetEntity()
    self.Attachment = data:GetAttachment()
    self.Alpha = 255
    self.FlashA = 255

    local angpos = IsValid(self.WeaponEnt) and self.WeaponEnt:GetAttachment(self.Attachment) or { Pos = vector_origin, Ang = angle_zero }
    self.StartPos = self:GetTracerShootPos(angpos.Pos or self.Position, self.WeaponEnt, self.Attachment)
    self.EndPos = data:GetOrigin()

    -- Limit the arc distance
    local distance = self.StartPos:Distance(self.EndPos)
    if distance > self.MaxLength then
        self.EndPos = self.StartPos + (self.EndPos - self.StartPos):GetNormalized() * self.MaxLength
    end

    self.Entity:SetRenderBoundsWS(self.StartPos, self.EndPos)
    self.Normal = (self.EndPos - self.StartPos):GetNormalized()
    self.LifeTime = self.Life
end

function EFFECT:Think()
    if self.InValid then return false end
    self.LifeTime = self.LifeTime - FrameTime()

    if self.LifeTime <= 0 then return false end
    return true
end

-- Generate arc points for a jagged lightning effect
function EFFECT:GenerateArcPoints(startPos, endPos)
    local points = {}
    local direction = (endPos - startPos):GetNormalized()
    local distance = startPos:Distance(endPos)
    local segmentLength = distance / self.Segments

    for i = 0, self.Segments do
        local point = startPos + direction * (i * segmentLength)

        -- Randomize the position to create an arc effect
        point = point + VectorRand() * math.random(-6, 6)

        table.insert(points, point)
    end

    return points
end

function EFFECT:Render()
    if self.InValid then return end
    self.StartPos = self:GetTracerShootPos(self.StartPos, self.WeaponEnt, self.Attachment)

    -- Recalculate arc dynamically
    local newPoints = self:GenerateArcPoints(self.StartPos, self.EndPos)

    -- Draw the arcing electricity
    render.SetMaterial(Mat_Arc)
    for i = 1, #newPoints - 1 do
        render.DrawBeam(newPoints[i], newPoints[i + 1], self.Thickness, 0, 1, Color(150, 150, 255, self.Alpha))
    end

    -- Add glow at the impact point
    render.SetMaterial(Mat_Glow)
    render.DrawSprite(self.EndPos, 24, 24, Color(150, 200, 255, self.Alpha))
end
