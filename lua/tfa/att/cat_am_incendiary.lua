if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Incendiary Ammunition"
ATTACHMENT.ShortName = "FIRE" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.Attachments.Colors["="], "Load incendiary ammunition", TFA.Attachments.Colors["+"], "Damage over time", "Increased damage", TFA.Attachments.Colors["-"], "Increased recoil", "Increased spread"  }
ATTACHMENT.Icon = "entities/incendiary_bullet.png"
ATTACHMENT.TFADataVersion = TFA.LatestDataVersion

ATTACHMENT.WeaponTable = {
	["TracerName"] = function( wep, stat ) return "tfa_tracer_incendiary" end,
	["Primary"] = {
		["DamageType"] = function(wep,stat) return DMG_PLASMA end,
		["Damage"] = function( wep, stat ) return stat * 1.05 end,
		["Spread"] = function( wep, stat ) return stat * 1.05 end,
		["IronAccuracy"] = function( wep, stat ) return stat * 1.05 end,
		["KickUp"] = function( wep, stat ) return stat * 1.1 end,
		["KickDown"] = function( wep, stat ) return stat * 1.1 end,
		["KickHorizontal"] = function( wep, stat ) return stat * 1.1 end
	},
}

-- Function to apply DoT damage and ignite
local function ApplyIgniteAndDoT(target, attacker, totalDuration, tickInterval, tickDamage)
	if not IsValid(target) or (not target:IsNPC() and not target:IsPlayer()) then return end
	
	local timerName = "IncendiaryDOT_" .. tostring(target:EntIndex())

	-- Prevent stacking multiple timers on the same target
	if timer.Exists(timerName) then return end

	target:Ignite(totalDuration, 0) -- Ignite the target

	local ticks = math.floor(totalDuration / tickInterval)

	timer.Create(timerName, tickInterval, ticks, function()
		if not IsValid(target) or not target:Alive() then
			timer.Remove(timerName)
			return
		end

		local dmginfo = DamageInfo()
		dmginfo:SetDamage(tickDamage)
		dmginfo:SetDamageType(DMG_BURN)
		dmginfo:SetAttacker(IsValid(attacker) and attacker or game.GetWorld())

		-- Set inflictor safely
		if IsValid(attacker) and IsValid(attacker:GetActiveWeapon()) then
			dmginfo:SetInflictor(attacker:GetActiveWeapon())
		else
			dmginfo:SetInflictor(game.GetWorld()) -- Fallback to avoid NULL entity error
		end

		target:TakeDamageInfo(dmginfo)
	end)
end

-- Custom bullet callback for ignition and DoT
function ATTACHMENT:CustomBulletCallback(wep, attacker, trace, dmginfo)
	local target = trace.Entity
	if IsValid(target) and (target:IsNPC() or target:IsPlayer()) then
		local totalDuration = 10 -- Ignite for 10 seconds
		local tickInterval = 1 -- Tick every second
		local tickDamage = dmginfo:GetDamage() * 0.1 -- 10% of the initial damage per tick

		ApplyIgniteAndDoT(target, attacker, totalDuration, tickInterval, tickDamage)
	end
end

function ATTACHMENT:Attach(wep)
	wep:Unload()
end

function ATTACHMENT:Detach(wep)
	wep:Unload()
end
if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
