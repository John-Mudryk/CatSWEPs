if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Hellfire Bolts"
ATTACHMENT.Description = { TFA.AttachmentColors["="], "Load bolts that melt the target with acid", TFA.AttachmentColors["+"], "Damage over time", "Reduced recoil", TFA.Attachments.Colors["-"], "Reduced direct damage"}
ATTACHMENT.Icon = "entities/cat_ammo_paralyze.png"
ATTACHMENT.ShortName = "HELLFIRE"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["DamageType"] = function(wep,stat) return DMG_RADIATION end,
		["Damage"] = function(wep,stat) return stat * 0.9 end,
		["StaticRecoilFactor"] = function(wep,stat) return stat * 0.8 end,
	},
	["TracerName"] = "effect_t_boltgun_hellfire"
}

-- Function to apply DoT
local function ApplyHellfireDOT(target, attacker, inflictor, damage, duration, tickInterval)
	if not IsValid(target) or (not target:IsNPC() and not target:IsPlayer()) then return end
	if not IsValid(attacker) then return end

	local ticks = math.floor(duration / tickInterval)
	local tickDamage = damage * 0.25
	local timerName = "HellfireDOT_" .. tostring(target:EntIndex())

	if timer.Exists(timerName) then return end

	timer.Create(timerName, tickInterval, ticks, function()
		if not IsValid(target) or not target:Alive() then
			timer.Remove(timerName)
			return
		end

		if not IsValid(attacker) then return end
		if not IsValid(inflictor) then inflictor = attacker end -- Fallback if weapon becomes invalid

		local dmginfo = DamageInfo()
		dmginfo:SetDamage(tickDamage)
		dmginfo:SetDamageType(DMG_BURN)
		dmginfo:SetAttacker(attacker)
		dmginfo:SetInflictor(inflictor)
		target:TakeDamageInfo(dmginfo)
	end)
end

-- Custom bullet callback
function ATTACHMENT:CustomBulletCallback(wep, attacker, trace, dmginfo)
	if IsValid(trace.Entity) and (trace.Entity:IsNPC() or trace.Entity:IsPlayer()) then
		-- Capture the current weapon as the inflictor
		local inflictor = IsValid(wep) and wep or attacker
		ApplyHellfireDOT(trace.Entity, attacker, inflictor, dmginfo:GetDamage(), 10, 1) -- 10s duration, 1s tick
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
