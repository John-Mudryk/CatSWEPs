if not ATTACHMENT then
    ATTACHMENT = {}
end

ATTACHMENT.Name = "Active Targetting Sight"
--ATTACHMENT.ID = "base" normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["="], "Attach an active laser sight", "Adds visible aiming laser", TFA.AttachmentColors["+"], "Increased recoil control", "Decreased spread" }
ATTACHMENT.Icon = "entities/laser_icon.png" --Revers to label, please give it an icon though! This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "LASER"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["SpreadIncrement"] = function( wep, stat ) return stat * 0.85 end,
		["SpreadRecovery"] = function( wep, stat ) return stat * 1.15 end,
		["Spread"] = function(wep,stat) return stat * 0.7 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.8 end
	},
	-- ["DrawCrosshairIS"] = function(wep,stat) return true end,
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.95 end,
	["VElements"] = {
		["laser"] = {
			active = true,
		},

	},
	["WElements"] = {
		["laser"] = {
			active = true,
		}, 
	},
}

if CLIENT then
    local LaserMaterial = Material("sprites/physg_glow1")

    hook.Add("PostDrawTranslucentRenderables", "TFA_Laser_Render", function()
        local ply = LocalPlayer()
        local wep = ply:GetActiveWeapon()

        -- Check if the laser is active
        if IsValid(wep) and wep.LaserActive then
            local laserAttachment
            local attachment

            -- Determine whether to use the viewmodel or worldmodel
            if ply == wep:GetOwner() and ply:ShouldDrawLocalPlayer() == false then
                -- First-person mode: Use the viewmodel
                local vm = ply:GetViewModel()
                if IsValid(vm) then
                    laserAttachment = vm:LookupAttachment("muzzle")
                    attachment = vm:GetAttachment(laserAttachment)
                end
            else
                -- Third-person mode: Use the worldmodel
                laserAttachment = wep:LookupAttachment("muzzle")
                attachment = wep:GetAttachment(laserAttachment)
            end

            if not attachment then return end

            -- Perform a trace from the laser attachment
            local startPos = attachment.Pos
            local aimVector = ply:GetAimVector()
            local tr = util.TraceLine({
                start = startPos,
                endpos = startPos + (aimVector * 10000),
                filter = function(ent)
                    return ent ~= ply
                end,
            })

            -- Render the laser sprite
            render.SetMaterial(LaserMaterial)
            render.DrawSprite(tr.HitPos, 16, 16, Color(255, 0, 0))
        end
    end)
end

function ATTACHMENT:Attach(wep)

    Weapon_act = wep:GetClass()
    if (Weapon_act == "cat_custom_lasgun" or
        Weapon_act == "cat_custom_autogun" or
        Weapon_act == "cat_custom_autopistol" or
        Weapon_act == "cat_custom_boltpistol" or
        Weapon_act == "cat_custom_boltpistolastartes" or
        Weapon_act == "cat_custom_hellgunstandard" or
        Weapon_act == "cat_custom_hellpistol" or
        Weapon_act == "cat_custom_lascarbine" or
        Weapon_act == "cat_custom_laspistol" or
        Weapon_act == "cat_custom_longlas" or
        Weapon_act == "cat_custom_shotgun" or
        Weapon_act == "cat_custom_stubber" or
        Weapon_act == "cat_custom_heavystubber") then
        wep.Bodygroups_W = { [1] = 1 }
        wep.Bodygroups_V = { [1] = 1 }
    elseif Weapon_act == "cat_custom_autorifle" then
        wep.Bodygroups_W = { [0] = 1 }
        wep.Bodygroups_V = { [0] = 1 }
    end

    JamChance = wep["JamChance"]
    wep.JamChance = JamChance - 0.10 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.

    wep.LaserActive = true

end

function ATTACHMENT:Detach(wep)
    Weapon_act = wep:GetClass()

    if (Weapon_act == "cat_custom_lasgun" or
        Weapon_act == "cat_custom_autogun" or
        Weapon_act == "cat_custom_autopistol" or
        Weapon_act == "cat_custom_boltpistol" or
        Weapon_act == "cat_custom_boltpistolastartes" or
        Weapon_act == "cat_custom_hellgunstandard" or
        Weapon_act == "cat_custom_hellpistol" or
        Weapon_act == "cat_custom_lascarbine" or
        Weapon_act == "cat_custom_laspistol" or
        Weapon_act == "cat_custom_longlas" or
        Weapon_act == "cat_custom_shotgun" or
        Weapon_act == "cat_custom_stubber" or
        Weapon_act == "cat_custom_heavystubber") then
        wep.Bodygroups_W = { [1] = 0 }
        wep.Bodygroups_V = { [1] = 0 }
    elseif Weapon_act == "cat_custom_autorifle" then
        wep.Bodygroups_W = { [0] = 0 }
        wep.Bodygroups_V = { [0] = 0 }
    end

wep.LaserActive = false

end

if not TFA_ATTACHMENT_ISUPDATING then
    TFAUpdateAttachments()
end