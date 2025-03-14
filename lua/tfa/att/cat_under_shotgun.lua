
if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Underbarrel Shotgun"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "E+Click to select shotgun", "10% less vertical recoil", TFA.AttachmentColors["-"], "5% higher spread", "5% lower accuracy" }
ATTACHMENT.Icon = "entities/cat_under_bolter_black.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "SHOTGUN"

ATTACHMENT.Damage = 60
ATTACHMENT.Ammo = "smg1"
ATTACHMENT.Automatic = false
ATTACHMENT.ClipSize = 1
ATTACHMENT.DefaultClip = 3
ATTACHMENT.Delay = 0.3
ATTACHMENT.Sound = Sound("weapons/ar2/ar2_altfire.wav")
ATTACHMENT.Pellets = 12 -- Number of pellets to fire
ATTACHMENT.Spread = 0.06 -- Spread for shotgun mode
ATTACHMENT.DamageType = DMG_SLASH

ATTACHMENT.RecoilV = -5
ATTACHMENT.RecoilH = -2.5

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["SGSound"] = function(wep,stat)
			return stat or wep:GetStat("Secondary.Sound") or wep:GetStat("Primary.Sound")
		end,
		["KickUp"] = function(wep,stat) return stat * 0.9 end,
		["KickDown"] = function(wep,stat) return stat * 0.9 end,
		["Spread"] = function(wep,stat) return stat * 1.05 end,
		["IronAccuracy"] = function(wep,stat) return stat * 1.05 end
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
}

function ATTACHMENT:Attach( wep )
	
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
        else
            wep.PrimaryAttackOld_SG(myself, ...)
        end
    end

	wep.Reload_SGOld = wep.Reload_SGOld or wep.Reload
	wep.Reload = function( myself, ... )
		if myself:SGDeployed() then
			return wep.Reload2( myself, ... )
		else
			return wep.Reload_SGOld( myself, ... )
		end
	end

	wep.CompleteReload_SGOld = wep.CompleteReload_SGOld or wep.CompleteReload

	wep.CompleteReload = function( myself, ... )
		if myself:SGDeployed() then
			local maxclip = self.ClipSize
			local curclip = myself:Clip2()
			local amounttoreplace = math.min(maxclip - curclip, myself:Ammo2())
			myself:TakeSecondaryAmmo(amounttoreplace * -1)
			myself:TakeSecondaryAmmo(amounttoreplace, true)
		else
			return wep.CompleteReload_SGOld( myself, ... )
		end
	end

	 wep.SecondaryAttack_SGOld = wep.SecondaryAttack_SGOld or wep.SecondaryAttack

    wep.SecondaryAttack = function(myself, gogogo, ...)
        if myself:SGDeployed() then
            if not gogogo then return end
            if CurTime() > myself:GetNextPrimaryFire() and TFA.Enum.ReadyStatus[myself:GetStatus()] and not myself:GetSprinting() then
		myself.LuaShellEject_Old = myself.LuaShellEject
		myself.LuaShellEject = false
		local c1 = myself:Clip1()
		myself:SetClip1( myself:Clip2() )
		myself:ChooseShootAnim( )
		myself:SetClip1( c1 )
	if myself:Clip2() > 0 then
                myself:EmitSound(self.Sound)
                myself:SetNextPrimaryFire(CurTime() + self.Delay)


	        local underDamage = myself:GetStat("Primary.Damage") * 0.5

                local bullet = {}
                bullet.Num = self.Pellets
                bullet.Src = myself.Owner:GetShootPos()
                bullet.Dir = myself.Owner:GetAimVector()
                bullet.Spread = Vector(self.Spread, self.Spread, 0)
                bullet.Tracer = 4
                bullet.Force = 1
                bullet.Damage = underDamage
		bullet.Callback = function(attacker, tr, dmginfo)
                        dmginfo:SetDamageType(self.DamageType)
                    end
                myself.Owner:FireBullets(bullet)
		myself:SetNextPrimaryFire( CurTime()  + self.Delay )
		myself:SetClip2( math.max( myself:Clip2() - 1, 0 ) )
		if IsFirstTimePredicted() then
			myself:EmitSound( myself:GetStat("Primary.SGSound") )
		end
		myself.Owner:ViewPunch( Angle( self.RecoilV, self.RecoilH, self.RecoilH / 2 ) )
            end
        else
            return wep.SecondaryAttack_SGOld(myself, gogogo, ...)
        end
    end
end
	wep:ChooseIdleAnim()
	if game.SinglePlayer() then
		wep:CallOnClient("ChooseIdleAnim","")
	end

	Weapon_act = wep:GetClass()
	if 	(	Weapon_act == "cat_custom_hellgunstandard" || 
			Weapon_act == "cat_custom_hellpistol"|| 
			Weapon_act == "."
		) then
		wep.Bodygroups_W = {
			[4] = 3
		}
		wep.Bodygroups_V = {
			[4] = 3
		}
	elseif 	(	Weapon_act == "cat_custom_lascarbine" || 
			Weapon_act == "cat_custom_lasgun"
			) then
		wep.Bodygroups_W = {
			[6] = 3
		}
		wep.Bodygroups_V = {
			[6] = 3
		}
	elseif 		Weapon_act == "cat_custom_shotgun"|| 
			Weapon_act == "cat_custom_stubber" 	then
		wep.Bodygroups_W = {
			[5] = 3
		}
		wep.Bodygroups_V = {
			[5] = 3
		}
	elseif 	(	Weapon_act == "cat_custom_autogun" 
			) then
		wep.Bodygroups_W = {
			[7] = 3
		}
		wep.Bodygroups_V = {
			[7] = 3
		}
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
if 	(	Weapon_act == "cat_custom_hellgunstandard" || 
			Weapon_act == "cat_custom_hellpistol"|| 
			Weapon_act == "."
		) then
		wep.Bodygroups_W = {
			[4] = 0
		}
		wep.Bodygroups_V = {
			[4] = 0
		}
	elseif 	(	Weapon_act == "cat_custom_lascarbine" || 
			Weapon_act == "cat_custom_lasgun"
			) then
		wep.Bodygroups_W = {
			[6] = 0
		}
		wep.Bodygroups_V = {
			[6] = 0
		}
	elseif 		Weapon_act == "cat_custom_shotgun"|| 
			Weapon_act == "cat_custom_stubber" then
		wep.Bodygroups_W = {
			[5] = 0
		}
		wep.Bodygroups_V = {
			[5] = 0
		}
	elseif 	(	Weapon_act == "cat_custom_autogun" 
			) then
		wep.Bodygroups_W = {
			[7] = 0
		}
		wep.Bodygroups_V = {
			[7] = 0
		}
	end
	wep:ChooseIdleAnim()
	if game.SinglePlayer() then
		wep:CallOnClient("ChooseIdleAnim","")
	end
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
