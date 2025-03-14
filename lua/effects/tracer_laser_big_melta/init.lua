EFFECT.Thickness = 64
EFFECT.Life = 0.25
EFFECT.RotVelocity = 30
EFFECT.InValid = false
EFFECT.MaxLength = 1200 -- Maximum length for the tracer

local Mat_Impact = Material("trails/smoke")
local Mat_Beam = Material("cable/crystal_beam1")
local Mat_TracePart = Material("effects/select_ring")
local Mat_Glow = Material("sprites/light_glow02_add") -- Yellow heat glow
local Mat_Heatwave = Material("sprites/heatwave") -- Heat distortion effect

function EFFECT:Init(data)
    self.Position = data:GetStart()
    self.WeaponEnt = data:GetEntity()
    self.Attachment = data:GetAttachment()
    self.Alpha = 255
    self.FlashA = 255

    -- Try to get the weapon's owner
    local owent = IsValid(self.WeaponEnt) and self.WeaponEnt:GetOwner() or nil
    if IsValid(owent) and owent:IsPlayer() then
        if owent ~= LocalPlayer() or owent:ShouldDrawLocalPlayer() then
            self.WeaponEnt = owent:GetActiveWeapon()
        else
            self.WeaponEnt = owent:GetViewModel()
        end
    end

    -- Get muzzle attachment position
    local angpos = IsValid(self.WeaponEnt) and self.WeaponEnt:GetAttachment(self.Attachment) or { Pos = vector_origin, Ang = angle_zero }
    self.texcoord = math.Rand(0, 20) / 3
    self.StartPos = self:GetTracerShootPos(angpos.Pos or self.Position, self.WeaponEnt, self.Attachment)
    self.EndPos = data:GetOrigin()
    self.Entity:SetRenderBoundsWS(self.StartPos, self.EndPos)
    self.Normal = (self.EndPos - self.StartPos):GetNormalized()
    self.StartTime = 0
    self.LifeTime = self.Life
    self.data = data
    self.rot = 0

    -- Particle emitter at the start position
    self.Emitter = ParticleEmitter(self.StartPos)
end

EFFECT.Mat = Material("effects/fire_cloud1") -- Main beam effect

function EFFECT:Think()
    if self.InValid then return false end
    self.LifeTime = self.LifeTime - FrameTime()
    self.StartTime = self.StartTime + FrameTime()

    self.FlashA = math.max(self.FlashA - 1150 * FrameTime(), 0)
    self.Alpha = math.max(self.Alpha - 1150 * FrameTime(), 0)

    return self.LifeTime > 0
end

local beamcol = Color(255, 255, 180, 255) -- Main beam color (Purple)
local glowcol = Color(255, 128, 50, 200) -- Extra purple glow

function EFFECT:Render()
    if self.InValid then return false end
    self.StartPos = self:GetTracerShootPos(self.StartPos, self.WeaponEnt, self.Attachment)
    local startPos = self.StartPos
    local endPos = self.EndPos

    -- Clamp distance to prevent infinite beams
    local distance = (endPos - startPos):Length()
    if distance > self.MaxLength then
        endPos = startPos + (endPos - startPos):GetNormalized() * self.MaxLength
    end

    -- Adjust transparency over time
    beamcol.a = self.LifeTime / self.Life * 255
    self.rot = self.rot + FrameTime() * self.RotVelocity

    -- Impact point glow
    render.SetMaterial(Mat_Impact)
    render.DrawSprite(endPos, 10, 10, ColorAlpha(color_white, beamcol.a))

    -- Beam tracer effect
    render.SetMaterial(Mat_TracePart)
    for i = -60, 60, 30 do
        local tracerpos = Lerp(math.Clamp(self.LifeTime / self.Life + i / 300, 0, 1), endPos, startPos)
        render.DrawQuadEasy(tracerpos, self.Normal, 50 - i / 2, 50 - i / 2, glowcol, self.rot + i)
    end

    -- Core beam effect
    render.SetMaterial(Mat_Beam)
    render.DrawBeam(startPos, endPos, self.Thickness, 0 + beamcol.a / 128, endPos:Distance(startPos) / 64 + beamcol.a / 128, beamcol)

    -- Purple outer beam glow
    render.SetMaterial(self.Mat)
    render.DrawBeam(self.StartPos, endPos, 28, self.texcoord, self.texcoord + self.MaxLength / 256, beamcol)

    -- Add extra purple glow along the beam
    for i = 0, 100 do
        local effectPos = Lerp(i / 100, startPos, endPos)
        render.SetMaterial(Mat_Glow)
        render.DrawSprite(effectPos, 20, 20, glowcol)

        -- Create fire particles
        local particle = self.Emitter:Add("effects/energyball", effectPos)
        if particle then
            local sizeFactor = i / 100
            local startSize = Lerp(sizeFactor, 5, 30)
            local endSize = Lerp(sizeFactor, 0, 5)

            particle:SetVelocity(VectorRand() * 5)
            particle:SetDieTime(0.3)
            particle:SetStartAlpha(255)
            particle:SetEndAlpha(0)
            particle:SetStartSize(startSize)
            particle:SetEndSize(endSize)
            particle:SetRoll(math.Rand(0, 360))
            particle:SetRollDelta(math.Rand(-2, 2))
            particle:SetColor(255, 120, 50) -- Purple fire
            particle:SetLighting(false) -- Ensures proper color
        end
    end
end

-- Clean up the particle emitter
function EFFECT:OnRemove()
    if self.Emitter then
        self.Emitter:Finish()
    end
end
