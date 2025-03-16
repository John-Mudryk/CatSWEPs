
if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Combi-Flamer"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["="], "Utilized flamer attachment", TFA.AttachmentColors["+"], "E+Click to select flamer mode", "Burns enemies in close range", TFA.AttachmentColors["-"], "Limited range", "Low Fuel Capacity" }
ATTACHMENT.Icon = "entities/cat_under_flamer.png" 
ATTACHMENT.ShortName = "FLAMER"

ATTACHMENT.Damage = 50
ATTACHMENT.Ammo = "smg1"
ATTACHMENT.Automatic = true
ATTACHMENT.ClipSize = 50
ATTACHMENT.DefaultClip = 100
ATTACHMENT.Delay = 0.05
ATTACHMENT.Sound = Sound("weapons/ar2/ar2_altfire.wav")
ATTACHMENT.SoundStart = Sound("weapons/flamer/wpn_flamer_fire_2d_loop.wav")
ATTACHMENT.SoundLoop = Sound("waw_flamer/fire_loop.wav")
ATTACHMENT.SoundEnd = Sound("waw_flamer/fire_end.wav")
ATTACHMENT.Pellets = 1 -- Number of pellets to fire
ATTACHMENT.Spread = 0.001 -- Spread for shotgun mode
ATTACHMENT.DamageType = DMG_BURN
ATTACHMENT.Range = 300

ATTACHMENT.RecoilV = 0
ATTACHMENT.RecoilH = 0

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["SGSound"] = function(wep,stat)
			return stat or wep:GetStat("Secondary.Sound") or wep:GetStat("Primary.Sound")
		end,
	},
	["Secondary"] = {
		["ClipSize"] = ATTACHMENT.ClipSize,
		["Ammo"] = function(wep,stat) return wep:GetStat("Primary.Ammo") end,
	},
	["IronSightsPos"] = function(wep,val)
		if wep:SGDeployed() then
			return wep.IronSightsPos_SG, true, true
		else
			return val, false, true
		end
	end,
	["IronSightsAng"] = function(wep,val)
		if wep:SGDeployed() then
			return wep.IronSightsAng_SG, true, true
		else
			return val, false, true
		end
	end,
	["MoveSpeed"] = function(wep,stat) return stat * 0.975 end,
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.975 end,
	["VElements"] = {
		["bolterGC"] = {
			["bodygroup"] = {[1] = 2},
		},
		["bolterCHC"] = {
			["bodygroup"] = {[1] = 4},
		},

	},
	["WElements"] = {
		["bolterGC"] = {
			["bodygroup"] = {[1] = 2},
		},
		["bolterCHC"] = {
			["bodygroup"] = {[1] = 4},
		},
	},
}

function ATTACHMENT:Attach( wep )

local range	
local function cb( a, b, c )
	if b.HitPos:Distance( a:GetShootPos() ) > range then return end
	c:SetDamageType(DMG_BURN)
	if IsValid(b.Entity) and b.Entity.Ignite and not b.Entity:IsWorld() then
		b.Entity:Ignite( c:GetDamage(), 16 )
	end
end



function CustomTracer(startPos, endPos, color)
    local tracer = {}
    tracer.StartPos = startPos
    tracer.EndPos = endPos
    tracer.Color = color

    -- Customize the tracer behavior here
    -- For example, you can draw a line or use a particle effect
    hook.Add("PostDrawTranslucentRenderables", "CustomTracerEffect", function()
        render.SetMaterial(Material("trails/laser"))
        render.DrawBeam(tracer.StartPos, tracer.EndPos, 2, 0, 1, tracer.Color)
    end)
end

	wep.SetNW2Bool = wep.SetNW2Bool or wep.SetNWBool
	wep.GetNW2Bool = wep.GetNW2Bool or wep.GetNWBool

	if SERVER and not wep.HasBeenGivenSGAmmo then
		wep:SetClip2( math.Clamp( self.DefaultClip,0,1 ) )
		wep.Owner:GiveAmmo( math.max( self.DefaultClip - 1, 0 ), self.Ammo )
		wep.HasBeenGivenSGAmmo = 1
	end

	wep:SetNW2Bool("SGDeployed",false)

	function wep:SGDeployed()
		return wep:GetNW2Bool("SGDeployed")
	end

	wep.PrimaryAttackOld_SG = wep.PrimaryAttackOld_SG or wep.PrimaryAttack
wep.PrimaryAttack = function(myself, ...)
    if myself.Owner:KeyPressed(IN_ATTACK) and myself.Owner:KeyDown(IN_USE) and TFA.Enum.ReadyStatus[myself:GetStatus()] and not myself:GetSprinting() then
        myself:SetNW2Bool("SGDeployed", not myself:GetNW2Bool("SGDeployed"))
        if CurTime() > myself:GetNextPrimaryFire() then
            if myself:GetNW2Bool("SGDeployed") then
                local _, tanim = myself:SendViewModelSeq("sgsetup_in")
                myself:SetNextPrimaryFire(CurTime() + wep:GetActivityLength(tanim))
            else
                local _, tanim = myself:SendViewModelSeq("sgsetup_out")
                myself:SetNextPrimaryFire(CurTime() + wep:GetActivityLength(tanim))
            end
        end
    elseif myself.Owner:KeyDown(IN_USE) then
        return
    elseif myself:SGDeployed() then
        if (myself.Owner:KeyPressed(IN_ATTACK) or self.Automatic) then
            myself:SecondaryAttack(myself, true)
        end

        -- Set a timer to call StopFlame 0.1 seconds after attack key is released
        timer.Create("StopFlameTimer_" .. myself:EntIndex(), 0.1, 1, function()
            if IsValid(myself) and myself:SGDeployed() then
                myself:StopFlame()
            end
        end)
    else
        wep.PrimaryAttackOld_SG(myself, ...)
    end
end

wep.Reload_SGOld = wep.Reload_SGOld or wep.Reload
wep.Reload = function(myself, ...)
    if myself:SGDeployed() then
        return wep.Reload2(myself, ...)
    else
        return wep.Reload_SGOld(myself, ...)
    end
end

wep.CompleteReload_SGOld = wep.CompleteReload_SGOld or wep.CompleteReload
wep.CompleteReload = function(myself, ...)
    if myself:SGDeployed() then
        local maxclip = self.ClipSize
        local curclip = myself:Clip2()
        local amounttoreplace = math.min(maxclip - curclip, myself:Ammo2())
        myself:TakeSecondaryAmmo(amounttoreplace * -1)
        myself:TakeSecondaryAmmo(amounttoreplace, true)
    else
        return wep.CompleteReload_SGOld(myself, ...)
    end
end

wep.SecondaryAttack_SGOld = wep.SecondaryAttack_SGOld or wep.SecondaryAttack
wep.SecondaryAttack = function(myself, gogogo, ...)
    if myself:SGDeployed() then
        if not gogogo then return end
        if CurTime() > myself:GetNextPrimaryFire() and TFA.Enum.ReadyStatus[myself:GetStatus()] and not myself:GetSprinting() then

	if myself:Clip2() > 0 then

            myself:EmitSound(self.SoundStart)

            local fx = EffectData()
            fx:SetEntity(myself)
            fx:SetAttachment(1)
            util.Effect("cat_flame", fx)
            if myself:IsFirstPerson() then
                ParticleEffectAttach("cat_flamethrower", PATTACH_POINT_FOLLOW, myself.OwnerViewModel, 1)
            else
                ParticleEffectAttach("cat_flamethrower", PATTACH_POINT_FOLLOW, myself, 1)
            end
            --[[ timer.Create("FlameSoundLoop", SoundDuration(self.SoundLoop) - 1, 0, function()
                myself:EmitSound(self.SoundLoop)
            end) ]]--

            myself:SetNextPrimaryFire(CurTime() + self.Delay)

	    local underDamage = myself:GetStat("Primary.Damage") * 0.2

            local bullet = {}
	    bullet.Distance = 700
	    bullet.HullSize = 10
            bullet.Num = 1
            bullet.Src = myself.Owner:GetShootPos()
            bullet.Dir = myself.Owner:GetAimVector()
            bullet.Spread = Vector(self.Spread, self.Spread, 0)
            bullet.Tracer = 0
            bullet.Force = 1
            bullet.Damage = underDamage
            bullet.Callback = function(attacker, tr, dmginfo)
                    dmginfo:SetDamageType(self.DamageType)
                    if tr.HitPos:Distance(attacker:GetShootPos()) > self.Range then return end
                end
            myself.Owner:FireBullets(bullet)
            myself:SetClip2(math.max(myself:Clip2() - 1, 0))

            if myself:Clip2() <= 0 then
                myself:StopFlame()
            end


            myself.Owner:ViewPunch(Angle(self.RecoilV, self.RecoilH, self.RecoilH / 2))
        end
    else
        return wep.SecondaryAttack_SGOld(myself, gogogo, ...)
    end
end
end

function wep:StopFlame()
    self:EmitSound("waw_flamer/fire_end.wav")
    timer.Remove("FlameSoundLoop")
    self:StopSound("waw_flamer/fire_loop.wav")
    self:CleanParticles()
end

function wep:CleanParticles()
    if self:IsFirstPerson() then
        self.OwnerViewModel:StopParticles()
    else
        self:StopParticles()
    end
end



	wep:ChooseIdleAnim()
	if game.SinglePlayer() then
		wep:CallOnClient("ChooseIdleAnim", "")
	end
end

function ATTACHMENT:Detach( wep )

	wep:SetNW2Bool("SGDeployed",false)
	wep.PrimaryAttack = wep.PrimaryAttackOld_SG or wep.PrimaryAttack
	wep.Reload = wep.Reload_SGOld or wep.Reload
	wep.CompleteReload = wep.CompleteReload_SGOld or wep.CompleteReload
	wep.SecondaryAttack = wep.SecondaryAttack_SGOld or wep.SecondaryAttack

	wep.PrimaryAttackOld_SG = nil
	wep.Reload_SGOld = nil
	wep.CompleteReload_SGOld = nil
	wep.SecondaryAttack_SGOld = nil

	wep:ChooseIdleAnim()
	if game.SinglePlayer() then
		wep:CallOnClient("ChooseIdleAnim","")
	end
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
