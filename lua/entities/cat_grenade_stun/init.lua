ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Stun Grenade"
ENT.Author = "The Cat"
ENT.Spawnable = false
ENT.AdminSpawnable = true

-- Custom grenade properties
ENT.Model = "models/muschi/weapons/muschi_grenade_light.mdl"
ENT.FuseTime = 5
ENT.Damage = 0
ENT.Radius = 350
ENT.StickOnImpact = true
ENT.IsImpact = false

if SERVER then
    util.AddNetworkString("StunGrenadeEffect")
end

-- Stun durations (in seconds)
ENT.PlayerStunDuration = 20
ENT.NPCStunDuration = 10
ENT.StunnedNPCs = {} -- Track stunned NPCs for restoring behavior

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_NONE)
    self:SetHealth(10)

    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:SetMass(1)
        phys:Wake()
    end

    -- Set explosion timer
    timer.Simple(self.FuseTime, function()
        if IsValid(self) then
            self:Explode()
        end
    end)

    self:EmitSound("weapons/pinpull.wav", 75, 100)
end

-- Handle collision behavior
function ENT:PhysicsCollide(data, phys)
    if data.Speed > 60 then
        self:EmitSound("physics/metal/metal_grenade_impact_hard" .. math.random(1, 3) .. ".wav")
    end

    if self.IsImpact and IsValid(self) then
        self:Explode()
        return
    end

    if self.StickOnImpact then
        self:EmitSound("phx/epicmetal_hard.wav", 75, 100)
        local hitEnt = data.HitEntity

        if IsValid(hitEnt) then
            self:SetParent(hitEnt)
            local localPos = hitEnt:WorldToLocal(self:GetPos())
            self:SetLocalPos(localPos)

            phys:EnableMotion(false)
            self:SetMoveType(MOVETYPE_NONE)
        else
            phys:EnableMotion(false)
        end
    end
end

function ENT:Think()
    if self.KaboomTime and CurTime() >= self.KaboomTime then
        self:Explode()
    end

    if self:WaterLevel() > 0 then
        local effectdata = EffectData()
        effectdata:SetOrigin(self:GetPos())
        util.Effect("WaterSplash", effectdata)
        self:Remove()
    end
end

-- Explosion behavior
function ENT:Explode()
    if not IsValid(self) then return end

    local pos = self:GetPos()

    -- Visual and Sound Effects
    local effectdata = EffectData()
    effectdata:SetOrigin(pos)
    effectdata:SetScale(2)
    util.Effect("cball_explode", effectdata)
    util.Effect("cat_flash_explosion", effectdata)

    -- Sound Effect
    self:EmitSound("weapons/flashbang/flashbang_explode2.wav", 100, 100, 1)
    self:EmitSound("weapons/flashbang/flashbang_explode1.wav", 100, 100, 1)
    self:EmitSound("phx/explode04.wav", 100, 50, 1)

    -- Stun players and NPCs
    self:StunPlayers(pos, self.Radius)
    self:StunNPCs(pos, self.Radius)

    self:Remove()
end

-- Stun players if grenade is in their view
function ENT:StunPlayers(pos, radius)
    for _, ply in pairs(ents.FindInSphere(pos, radius)) do
        if ply:IsPlayer() and ply:Alive() then
            local eyePos = ply:EyePos()
            local viewDir = ply:GetAimVector()
            local toGrenade = (pos - eyePos):GetNormalized()

            -- 1. Check if player is looking at the grenade (FOV check)
            local dot = viewDir:Dot(toGrenade)
            local fovThreshold = 0.5 -- Adjust for stricter or wider angle (0.5 ~60°, 0 ~90°, -1 = 180°)

            -- 2. Check if grenade is visible (LOS check)
            local trace = util.TraceLine({
                start = eyePos,
                endpos = pos,
                filter = ply,
                mask = MASK_SOLID -- Only trace solid objects
            })

            if dot >= fovThreshold and not trace.Hit then
                -- Calculate stun duration based on distance (optional for realism)
                local distance = pos:Distance(eyePos)
                local stunDuration = math.Clamp(self.PlayerStunDuration * (1 - (distance / radius)), 2, self.PlayerStunDuration)

                -- Apply the stun effect
                net.Start("StunGrenadeEffect")
                net.WriteFloat(stunDuration)
                net.Send(ply)
            end
        end
    end
end


-- Stun NPCs (Both GMod and VJ Base)
function ENT:StunNPCs(pos, radius)
    for _, npc in pairs(ents.FindInSphere(pos, radius)) do
        if npc:IsNPC() then
            -- Store original state for restoration later
            local originalEnemy = npc:GetEnemy()

            -- Apply stun behavior
            if npc.IsVJBaseSNPC then
                npc:SetState(VJ_STATE_FREEZE)
                npc:StopMoving()
                npc.DoingTask = false
            else
                npc:SetNPCState(NPC_STATE_IDLE)
                npc:SetSchedule(SCHED_NPC_FREEZE)
            end

            -- Timer to restore NPC behavior after stun
            timer.Simple(self.NPCStunDuration, function()
                if IsValid(npc) then
                    -- Restore behavior for VJ Base NPCs
                    if npc.IsVJBaseSNPC then
                        npc:SetState(VJ_STATE_ALERT)
                        npc:VJ_ACT_PLAYACTIVITY(ACT_IDLE, true, 0, false)
                        npc.CanPerformRangeAttack = true
                        npc.CanPerformMeleeAttack = true
                    else
                        -- Restore for base GMod NPCs
                        npc:SetNPCState(NPC_STATE_ALERT)
                        npc:SetSchedule(SCHED_IDLE_STAND)
                    end

                    -- Restore original enemy if still valid
                    if IsValid(originalEnemy) then
                        npc:SetEnemy(originalEnemy)
                    end
                end
            end)
        end
    end
end

