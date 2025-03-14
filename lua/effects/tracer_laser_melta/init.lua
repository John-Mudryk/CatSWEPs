EFFECT.StartThickness = 1 -- Initial beam thickness
EFFECT.EndThickness = 80 -- Maximum beam thickness
EFFECT.Life = 0.15 -- Travel time before disappearing
EFFECT.MaxLength = 600 -- Max range of the Melta beam

-- Materials
local Mat_Beam = Material("cable/crystal_beam1")
local Mat_Glow = Material("sprites/light_glow02_add")
local Mat_Impact = Material("effects/energyball")

function EFFECT:Init(data)
    self.Position = data:GetStart()
    self.WeaponEnt = data:GetEntity()
    self.Attachment = data:GetAttachment()
    self.Alpha = 255
    self.StartTime = CurTime()

    -- Get weapon attachment position
    local angpos = IsValid(self.WeaponEnt) and self.WeaponEnt:GetAttachment(self.Attachment) or { Pos = vector_origin, Ang = angle_zero }
    self.StartPos = self:GetTracerShootPos(angpos.Pos or self.Position, self.WeaponEnt, self.Attachment)
    self.EndPos = data:GetOrigin()

    -- Clamp to max range
    local distance = (self.EndPos - self.StartPos):Length()
    if distance > self.MaxLength then
        self.EndPos = self.StartPos + (self.EndPos - self.StartPos):GetNormalized() * self.MaxLength
    end

    self.Entity:SetRenderBoundsWS(self.StartPos, self.EndPos)

    -- Travel Progress (For expanding movement)
    self.TravelProgress = 0
    self.Normal = (self.EndPos - self.StartPos):GetNormalized()
    self.LifeTime = self.Life
end

function EFFECT:Think()
    self.LifeTime = self.LifeTime - FrameTime()
    
    -- Travel effect: The beam expands over 0.15 seconds
    local elapsed = CurTime() - self.StartTime
    self.TravelProgress = math.Clamp(elapsed / self.Life, 0, 1)

    return self.LifeTime > 0
end

function EFFECT:Render()
    local alpha = (self.LifeTime / self.Life) * 255 -- Fade over time
    local beamColor = Color(255, 120, 0, alpha) -- Orange Melta blast
    local impactColor = Color(255, 55, 55, alpha) -- Impact tip glow

    -- Adjust end position based on travel progress
    local dynamicEndPos = LerpVector(self.TravelProgress, self.StartPos, self.EndPos)

    -- **New Feature: Beam Expands Over Distance**
    local dynamicThickness = Lerp(self.TravelProgress, self.StartThickness, self.EndThickness)

    -- Render expanding beam
    render.SetMaterial(Mat_Beam)
    render.DrawBeam(self.StartPos, dynamicEndPos, dynamicThickness, 0, 1, beamColor)

    -- Impact Glow at the tip
    render.SetMaterial(Mat_Impact)
    render.DrawSprite(dynamicEndPos, 32, 32, impactColor)

    -- Additional glow effect
    render.SetMaterial(Mat_Glow)
    render.DrawSprite(dynamicEndPos, 48, 48, beamColor)
end
