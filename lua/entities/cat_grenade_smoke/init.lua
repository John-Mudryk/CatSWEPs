ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Smoke Grenade"
ENT.Author = "The Cat"
ENT.Spawnable = false
ENT.AdminSpawnable = true

-- Grenade properties
ENT.Model = "models/muschi/weapons/muschi_grenade_smoke.mdl"
ENT.FuseTime = 5
ENT.SmokeDuration = 60
ENT.MaxSmokeRadius = 300
ENT.SmokeGrowthTime = 10
ENT.StickOnImpact = false
ENT.IsImpact = false

util.AddNetworkString("StartSmokeEffect")
util.AddNetworkString("StopSmokeEffect")

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

local ActiveSmokeGrenades = {}

function ENT:Initialize()
    self:SetModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_NONE)
    self:SetRenderMode(RENDERMODE_NORMAL)

    self.SmokeID = self:EntIndex()
    self.CurrentSmokeRadius = 100 -- Initial radius

    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:SetMass(1)
        phys:Wake()
    end

end

function ENT:PhysicsCollide(data, phys)
    if data.Speed > 60 then
        self:EmitSound("physics/metal/metal_grenade_impact_hard" .. math.random(1, 3) .. ".wav")
    end

    if self.IsImpact and IsValid(self) then
        self:StartSmoke()
    end

    -- Optional: Stick to surface
    if self.StickOnImpact then
        phys:EnableMotion(false)
        self:SetMoveType(MOVETYPE_NONE)
    end
end

function ENT:Think()
    -- Handle explosion timing
    if self.KaboomTime and CurTime() >= self.KaboomTime then
        self:StartSmoke()
        self.KaboomTime = nil -- Prevent double-triggering
    end

    -- Water check for auto-removal
    if self:WaterLevel() > 0 then
        local effectdata = EffectData()
        effectdata:SetOrigin(self:GetPos())
        util.Effect("WaterSplash", effectdata)
        self:Remove()
    end
end

function ENT:TriggerSmokeEffect(smokePos)
    -- Emit sound and trigger the smoke effect
    self:EmitSound("weapons/smokegrenade/sg_explode.wav", 100, 100)

    net.Start("StartSmokeEffect")
    net.WriteUInt(self.SmokeID, 16)
    net.WriteVector(smokePos)  -- Use the grounded position
    net.WriteFloat(self.SmokeDuration)
    net.WriteFloat(self.MaxSmokeRadius)
    net.Broadcast()

    -- Grow the smoke over time
    timer.Create("SmokeGrow_" .. self.SmokeID, 0.1, math.ceil(self.SmokeGrowthTime / 0.1), function()
        if not IsValid(self) then return end
        local growthRate = self.MaxSmokeRadius / (self.SmokeGrowthTime / 0.1)
        self.CurrentSmokeRadius = math.min(self.CurrentSmokeRadius + growthRate, self.MaxSmokeRadius)
    end)

    -- NPC check logic during smoke duration
    timer.Create("SmokeGrenadeCheck_" .. self.SmokeID, 0.5, 0, function()
        if not IsValid(self) then return end
        if CurTime() >= self.SmokeEndTime then
            self:StopSmokeEffect()
            self:Remove()
            return
        end
        self:CheckLineOfSightBlock()
    end)
end

-- Start the smoke effect
function ENT:StartSmoke()
    self.SmokeEndTime = CurTime() + self.SmokeDuration
    ActiveSmokeGrenades[self.SmokeID] = self

    -- Wait for ground contact before starting smoke
    self:FreezeOnGround()
end


-- Check if a trace passes through the smoke
function ENT:IsTraceBlockedBySmoke(startPos, endPos)
    if not self.CurrentSmokeRadius then return false end
    local direction = (endPos - startPos):GetNormalized()
    local distance = startPos:Distance(endPos)
    local steps = math.ceil(distance / 50)

    for i = 1, steps do
        local point = startPos + direction * (i * 50)
        if point:Distance(self:GetPos()) <= self.CurrentSmokeRadius then
            return true
        end
    end
    return false
end

-- Global check if any smoke grenade blocks LOS
local function IsBlockedByAnySmoke(startPos, endPos)
    for _, grenade in pairs(ActiveSmokeGrenades) do
        if grenade:IsTraceBlockedBySmoke(startPos, endPos) then
            return true
        end
    end
    return false
end

-- Check line of sight for NPCs and block if smoke is present
function ENT:CheckLineOfSightBlock()
    for _, npc in ipairs(ents.FindByClass("npc_*")) do
        if not IsValid(npc) then continue end

        for _, ply in ipairs(player.GetAll()) do
            if not ply:Alive() then continue end

            local isBlocked = IsBlockedByAnySmoke(npc:EyePos(), ply:EyePos())

            if isBlocked then
                if not npc.SmokeBlocked then
                    -- VJ Base NPCs
                    if npc.IsVJBaseSNPC then
                        npc:SetEnemy(nil)
                        npc:SetState(VJ_STATE_FREEZE)
                        npc:StopMoving()
                        npc.DoingTask = false
                    else
                        npc:SetEnemy(nil)
                        npc:AddEntityRelationship(ply, D_NU, 99)
                        npc:SetSchedule(SCHED_NPC_FREEZE)
                    end
                    npc.SmokeBlocked = true
                end
            elseif npc.SmokeBlocked then
                -- Restore behavior only if no other smoke is blocking LOS
                if not IsBlockedByAnySmoke(npc:EyePos(), ply:EyePos()) then
                    if npc.IsVJBaseSNPC then
                        npc:SetState(VJ_STATE_ALERT)
                        npc:SetEnemy(ply)
                        npc:VJ_ACT_PLAYACTIVITY(ACT_IDLE, true, 0, false)
                    else
                        npc:AddEntityRelationship(ply, D_HT, 99)
                        npc:SetEnemy(ply)
                        npc:SetSchedule(SCHED_ALERT_STAND)
                    end
                    npc.SmokeBlocked = false
                end
            end
        end
    end
end

-- Stop the smoke effect for this grenade
function ENT:StopSmokeEffect()
    net.Start("StopSmokeEffect")
    net.WriteUInt(self.SmokeID, 16)
    net.Broadcast()

    timer.Remove("SmokeGrenadeCheck_" .. self.SmokeID)
    timer.Remove("SmokeGrow_" .. self.SmokeID)
    ActiveSmokeGrenades[self.SmokeID] = nil
end

-- Freeze grenade only after it touches the ground
function ENT:FreezeOnGround()
    timer.Create("WaitForGround_" .. self:EntIndex(), 0.1, 0, function()
        if not IsValid(self) then 
            timer.Remove("WaitForGround_" .. self:EntIndex())
            return 
        end

        -- Trace downward to check for ground
        local trace = util.TraceLine({
            start = self:GetPos(),
            endpos = self:GetPos() - Vector(0, 0, 100), -- Trace further down to ensure a solid ground hit
            filter = self,
            mask = MASK_SOLID
        })

        -- Once it hits the ground, position and freeze it
        if trace.Hit then
            -- Move grenade to ground position
            self:SetPos(trace.HitPos)

            -- Freeze grenade physics
            local phys = self:GetPhysicsObject()
            if IsValid(phys) then
                phys:EnableMotion(false)
                self:SetMoveType(MOVETYPE_NONE)
            end

            -- Start the smoke effect exactly at the ground position
            self:TriggerSmokeEffect(trace.HitPos)

            timer.Remove("WaitForGround_" .. self:EntIndex())
        end
    end)
end


-- Clean up on grenade removal
function ENT:OnRemove()
    timer.Remove("WaitForGround_" .. self:EntIndex())
    self:StopSmokeEffect()
end
