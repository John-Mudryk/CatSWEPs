
if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Combi-Melta"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = {  TFA.AttachmentColors["+"], "E+Click to select melta mode", "Emits a superheated beam", "Melts through armor and vehicles", TFA.AttachmentColors["+"], "Extremely high damage at close range", TFA.AttachmentColors["-"], "Very limited range",  TFA.AttachmentColors["-"], "Consumes a large amount of fuel per shot" }

ATTACHMENT.Icon = "entities/cat_under_melta.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "MELTA"

ATTACHMENT.Damage = 100
ATTACHMENT.Ammo = "smg1"
ATTACHMENT.Automatic = false
ATTACHMENT.ClipSize = 10
ATTACHMENT.DefaultClip = 3
ATTACHMENT.Delay = 1
ATTACHMENT.Sound = Sound("weapons/ar2/ar2_altfire.wav")
ATTACHMENT.Pellets = 25 -- Number of pellets to fire
ATTACHMENT.Spread = 0.1 -- Spread for shotgun mode
ATTACHMENT.DamageType = DMG_DISSOLVE
ATTACHMENT.Range = 600

ATTACHMENT.RecoilV = -5
ATTACHMENT.RecoilH = -2.5

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["MGSound"] = function(wep,stat)
			return stat or wep:GetStat("Secondary.Sound") or wep:GetStat("Primary.Sound")
		end,
		["KickUp"] = function(wep,stat) return stat * 1 end,
		["KickDown"] = function(wep,stat) return stat * 1 end,
		["Spread"] = function(wep,stat) return stat * 1 end,
		["IronAccuracy"] = function(wep,stat) return stat * 1 end
	},
	["Secondary"] = {
		["ClipSize"] = ATTACHMENT.ClipSize,
		["Ammo"] = function(wep,stat) return wep:GetStat("Primary.Ammo") end,
	},
	["IronSightsPos"] = function(wep,val)
		if wep:MGDeployed() then
			return wep.IronSightsPos_MG, true, true
		else
			return val, false, true
		end
	end,
	["IronSightsAng"] = function(wep,val)
		if wep:MGDeployed() then
			return wep.IronSightsAng_MG, true, true
		else
			return val, false, true
		end
	end,
	["MoveSpeed"] = function(wep,stat) return stat * 0.975 end,
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.975 end,
	["VElements"] = {
		["bolterGC"] = {
			["bodygroup"] = {[1] = 3},
		},
		["bolterTC2"] = {
			["bodygroup"] = {[1] = 1},
		},
		["bolterCHC"] = {
			["bodygroup"] = {[1] = 2},
		},

	},
	["WElements"] = {
		["bolterGC"] = {
			["bodygroup"] = {[1] = 3},
		},
		["bolterTC2"] = {
			["bodygroup"] = {[1] = 1},
		},
		["bolterCHC"] = {
			["bodygroup"] = {[1] = 2},
		},
	},
}

function ATTACHMENT:Attach( wep )
	
local range	
local function cb( a, b, c )
	if b.HitPos:Distance( a:GetShootPos() ) > range then return end
	c:SetDamageType(DMG_DISSOLVE)
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

	if SERVER and not wep.HasBeenGivenMGAmmo then
		wep:SetClip2( math.Clamp( self.DefaultClip,0,1 ) )
		wep.Owner:GiveAmmo( math.max( self.DefaultClip - 1, 0 ), self.Ammo )
		wep.HasBeenGivenMGAmmo = 1
	end

	wep:SetNW2Bool("MGDeployed",false)

	function wep:MGDeployed()
		return wep:GetNW2Bool("MGDeployed")
	end

wep.PrimaryAttackOld_MG = wep.PrimaryAttackOld_MG or wep.PrimaryAttack
    wep.PrimaryAttack = function(myself, ...)
        if myself.Owner:KeyPressed(IN_ATTACK) and myself.Owner:KeyDown(IN_USE) and TFA.Enum.ReadyStatus[myself:GetStatus()] and not myself:GetSprinting() then
            myself:SetNW2Bool("MGDeployed", not myself:GetNW2Bool("MGDeployed"))
            if CurTime() > myself:GetNextPrimaryFire() then
                if myself:GetNW2Bool("MGDeployed") then
                    local _, tanim = myself:SendViewModelSeq("mgsetup_in")
                    myself:SetNextPrimaryFire(CurTime() + wep:GetActivityLength(tanim))
                else
                    local _, tanim = myself:SendViewModelSeq("mgsetup_out")
                    myself:SetNextPrimaryFire(CurTime() + wep:GetActivityLength(tanim))
                end
            end
        elseif myself.Owner:KeyDown(IN_USE) then
            return
        elseif myself:MGDeployed() then
            if (myself.Owner:KeyPressed(IN_ATTACK) or self.Automatic) then
                myself:SecondaryAttack(myself, true)
            end
        else
            wep.PrimaryAttackOld_MG(myself, ...)
        end
    end

    wep.Reload_MGOld = wep.Reload_MGOld or wep.Reload
    wep.Reload = function(myself, ...)
        if myself:MGDeployed() then
            return wep.Reload2(myself, ...)
        else
            return wep.Reload_MGOld(myself, ...)
        end
    end

    wep.CompleteReload_MGOld = wep.CompleteReload_MGOld or wep.CompleteReload

    wep.CompleteReload = function(myself, ...)
        if myself:MGDeployed() then
            local maxclip = self.ClipSize
            local curclip = myself:Clip2()
            local amounttoreplace = math.min(maxclip - curclip, myself:Ammo2())
            myself:TakeSecondaryAmmo(amounttoreplace * -1)
            myself:TakeSecondaryAmmo(amounttoreplace, true)
        else
            return wep.CompleteReload_MGOld(myself, ...)
        end
    end

    wep.SecondaryAttack_MGOld = wep.SecondaryAttack_MGOld or wep.SecondaryAttack

    wep.SecondaryAttack = function(myself, gogogo, ...)
        if myself:MGDeployed() then
            if not gogogo then return end
            if CurTime() > myself:GetNextPrimaryFire() and TFA.Enum.ReadyStatus[myself:GetStatus()] and not myself:GetSprinting() then
                myself.LuaShellEject_Old = myself.LuaShellEject
                myself.LuaShellEject = false
                local c1 = myself:Clip1()
                myself:SetClip1(myself:Clip2())
                myself:ChooseShootAnim()
                myself:SetClip1(c1)
                if myself:Clip2() > 0 then
                    myself:EmitSound(self.Sound)
                    myself:SetNextPrimaryFire(CurTime() + self.Delay)

	    	    local underDamage = myself:GetStat("Primary.Damage") * 0.35

                    local bullet = {}
		    bullet.Distance = 600
                    bullet.Num = self.Pellets
                    bullet.Src = myself.Owner:GetShootPos()
                    bullet.Dir = myself.Owner:GetAimVector()
                    bullet.Spread = Vector(self.Spread, self.Spread, 0)
                    bullet.Tracer = 1
                    bullet.TracerName = "tracer_laser_melta"
                    bullet.Force = 1
                    bullet.Damage = underDamage
                    bullet.Callback =  function(attacker, tr, dmginfo)
                dmginfo:SetDamageType(self.DamageType)
		if tr.HitPos:Distance( attacker:GetShootPos() ) > self.Range then return end
            end

                    myself.Owner:FireBullets(bullet)
                    myself:SetNextPrimaryFire(CurTime() + self.Delay)
                    myself:SetClip2(math.max(myself:Clip2() - 5, 0))
                    if IsFirstTimePredicted() then
                        myself:EmitSound(myself:GetStat("Primary.MGSound"))
                    end
                    myself.Owner:ViewPunch(Angle(self.RecoilV, self.RecoilH, self.RecoilH / 2))
                end
            else
                return wep.SecondaryAttack_MGOld(myself, gogogo, ...)
            end
        end
    end
    wep:ChooseIdleAnim()
    if game.SinglePlayer() then
        wep:CallOnClient("ChooseIdleAnim", "")
    end
end

function ATTACHMENT:Detach( wep )

	wep:SetNW2Bool("MGDeployed",false)
	wep.PrimaryAttack = wep.PrimaryAttackOld_MG or wep.PrimaryAttack
	wep.Reload = wep.Reload_MGOld or wep.Reload
	wep.CompleteReload = wep.CompleteReload_MGOld or wep.CompleteReload
	wep.SecondaryAttack = wep.SecondaryAttack_MGOld or wep.SecondaryAttack

	wep.PrimaryAttackOld_MG = nil
	wep.Reload_MGOld = nil
	wep.CompleteReload_MGOld = nil
	wep.SecondaryAttack_MGOld = nil
	wep:ChooseIdleAnim()
	if game.SinglePlayer() then
		wep:CallOnClient("ChooseIdleAnim","")
	end
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
