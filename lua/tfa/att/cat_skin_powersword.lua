if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Power Sword Forge"
ATTACHMENT.Description = {
	TFA.Attachments.Colors["="], "Customize sword blade & guard",
	TFA.Attachments.Colors["+"], "Press RELOAD + USE to select parts",
	TFA.Attachments.Colors["+"], "Then detatch to apply",
}
ATTACHMENT.Icon = "entities/skinforge.png"
ATTACHMENT.ShortName = "FORGE"

function table.Range(a, b)
	local t = {}
	for i = a, b do t[#t+1] = i end
	return t
end

-- Define per-weapon bodygroup limits
local sword_config = {
	["cat_legacy_powersword"] = {
		element = "powersword",
		blade = {0, 2, 4, 6, 16, 18},
		guard = table.Range(0, 21),
	},
	["cat_legacy_powerswordshield"] = {
		element = "powersword",
		blade = {0, 2, 4, 6, 12, 14, 16, 18},
		guard = table.Range(0, 21),
	},
	["cat_legacy_powergladius"] = {
		element = "powergladius",
		blade = {12, 14},
		guard = {8, 9, 10, 11, 15},
	},
	["cat_legacy_powergreatsword"] = {
		element = "powergreatsword",
		blade = {8, 10}, -- Static blade
		guard = table.Range(0, 21),
	},
	["cat_legacy_forcesword"] = {
		element = "forcesword",
		blade = {0, 2, 4, 6, 8}, -- Static blade
		guard = table.Range(0, 15),
	},
	["cat_legacy_forcesabre"] = {
		element = "forcesabre",
		blade = {0, 2, 4, 6, 8}, -- Static blade
		guard = table.Range(0, 15),
	},
	["cat_legacy_boltpistolpowersword"] = {
		element = "powersword",
		blade = {0, 2, 4, 6, 16, 18},
		guard = table.Range(0, 21),
	},
}

local blade_names = {
	[0] = "Proteus",
	[2] = "Calibanite",
	[4] = "Broadsword",
	[6] = "Tartaros",
	[8] = "Ingelldina",
	[10] = "Claymore",
	[12] = "Shortsword",
	[14] = "Gladius",
	[16] = "Nocturne",
	[18] = "Encarmine"
}

local guard_names = {
	["cat_legacy_powersword"] = {
		[0] = "Proteus Guard",
		[1] = "Templar Skull",
		[2] = "Double-Lock",
		[3] = "Extended Quillons",
		[4] = "Imperialis",
		[5] = "Grand Imperialis",
		[6] = "Aquila",
		[7] = "Grand Aquila",
		[8] = "Imperialis Short",
		[9] = "Gladius Round",
		[10] = "Gladius Straight",
		[11] = "Aquila Gladius",
		[12] = "Sabre Imperialis",
		[13] = "Utility Sabre",
		[14] = "Imperialis Ultra",
		[15] = "Gladius Ultra",
		[16] = "Blood Tear",
		[17] = "Eye of Terra",
		[18] = "Fenrisian Jewel",
		[19] = "Calibanite Livery",
		[20] = "Wings of Terror",
		[21] = "Templar Cross"
	},

	["cat_legacy_powerswordshield"] = {
		[0] = "Proteus Guard",
		[1] = "Templar Skull",
		[2] = "Double-Lock",
		[3] = "Extended Quillons",
		[4] = "Imperialis",
		[5] = "Grand Imperialis",
		[6] = "Aquila",
		[7] = "Grand Aquila",
		[8] = "Imperialis Short",
		[9] = "Gladius Round",
		[10] = "Gladius Straight",
		[11] = "Aquila Gladius",
		[12] = "Sabre Imperialis",
		[13] = "Utility Sabre",
		[14] = "Imperialis Ultra",
		[15] = "Gladius Ultra",
		[16] = "Blood Tear",
		[17] = "Eye of Terra",
		[18] = "Fenrisian Jewel",
		[19] = "Calibanite Livery",
		[20] = "Wings of Terror",
		[21] = "Templar Cross"
	},

	["cat_legacy_powergladius"] = {
		[8] = "Imperialis Short",
		[9] = "Gladius Round",
		[10] = "Gladius Straight",
		[11] = "Aquila Gladius",
		[15] = "Gladius Ultra"
	},

	["cat_legacy_powergreatsword"] = {
		[0] = "Proteus Guard",
		[1] = "Templar Skull",
		[2] = "Double-Lock",
		[3] = "Extended Quillons",
		[4] = "Imperialis",
		[5] = "Grand Imperialis",
		[6] = "Aquila",
		[7] = "Grand Aquila",
		[8] = "Imperialis Short",
		[9] = "Gladius Round",
		[10] = "Gladius Straight",
		[11] = "Aquila Gladius",
		[12] = "Sabre Imperialis",
		[13] = "Utility Sabre",
		[14] = "Imperialis Ultra",
		[15] = "Gladius Ultra",
		[16] = "Blood Tear",
		[17] = "Eye of Terra",
		[18] = "Fenrisian Jewel",
		[19] = "Calibanite Livery",
		[20] = "Wings of Terror",
		[21] = "Templar Cross"
	},

	["cat_legacy_forcesword"] = {
		[0] = "Proteus Guard",
		[1] = "Templar Skull",
		[2] = "Double-Lock",
		[3] = "Extended Quillons",
		[4] = "Imperialis",
		[5] = "Grand Imperialis",
		[6] = "Aquila",
		[7] = "Grand Aquila",
		[8] = "Sabre Imperialis",
		[9] = "Utility Sabre",
		[10] = "Imperialis Ultra",
		[11] = "Blood Tear",
		[12] = "Eye of Terra",
		[13] = "Fenrisian Jewel",
		[14] = "Calibanite Livery",
		[15] = "Wings of Terror",
	},

	["cat_legacy_forcesabre"] = {
		[0] = "Proteus Guard",
		[1] = "Templar Skull",
		[2] = "Double-Lock",
		[3] = "Extended Quillons",
		[4] = "Imperialis",
		[5] = "Grand Imperialis",
		[6] = "Aquila",
		[7] = "Grand Aquila",
		[8] = "Sabre Imperialis",
		[9] = "Utility Sabre",
		[10] = "Imperialis Ultra",
		[11] = "Blood Tear",
		[12] = "Eye of Terra",
		[13] = "Fenrisian Jewel",
		[14] = "Calibanite Livery",
		[15] = "Wings of Terror",
	},

	["cat_legacy_boltpistolpowersword"] = {
		[0] = "Proteus Guard",
		[1] = "Templar Skull",
		[2] = "Double-Lock",
		[3] = "Extended Quillons",
		[4] = "Imperialis",
		[5] = "Grand Imperialis",
		[6] = "Aquila",
		[7] = "Grand Aquila",
		[8] = "Imperialis Short",
		[9] = "Gladius Round",
		[10] = "Gladius Straight",
		[11] = "Aquila Gladius",
		[12] = "Sabre Imperialis",
		[13] = "Utility Sabre",
		[14] = "Imperialis Ultra",
		[15] = "Gladius Ultra",
		[16] = "Blood Tear",
		[17] = "Eye of Terra",
		[18] = "Fenrisian Jewel",
		[19] = "Calibanite Livery",
		[20] = "Wings of Terror",
		[21] = "Templar Cross"
	},
}

-- Apply bodygroups to VElement
local function ApplyBodygroups(wep, element_name, blade, guard)
	local v_elem = wep.VElements and wep.VElements[element_name]
	local w_elem = wep.WElements and wep.WElements[element_name]

	if v_elem then
		v_elem.bodygroup = v_elem.bodygroup or {}
		if guard ~= nil then v_elem.bodygroup[1] = guard end
		if blade ~= nil then v_elem.bodygroup[2] = blade end
	end

	if w_elem then
		w_elem.bodygroup = w_elem.bodygroup or {}
		if guard ~= nil then w_elem.bodygroup[1] = guard end
		if blade ~= nil then w_elem.bodygroup[2] = blade end
	end

	timer.Simple(0, function()
		if v_elem and IsValid(v_elem.modelEnt) then
			if guard ~= nil then v_elem.modelEnt:SetBodygroup(1, guard) end
			if blade ~= nil then v_elem.modelEnt:SetBodygroup(2, blade) end
		end
		if w_elem and IsValid(w_elem.modelEnt) then
			if guard ~= nil then w_elem.modelEnt:SetBodygroup(1, guard) end
			if blade ~= nil then w_elem.modelEnt:SetBodygroup(2, blade) end
		end
	end)

	if wep.CreateModels then
		wep:CreateModels(wep.VElements)
		wep:CreateModels(wep.WElements)
	end
end


local function GetHookID(wep)
	return "TFA_SwordForge_" .. tostring(wep:EntIndex())
end

local function OpenSwordForgeMenu(wep)
	if not IsValid(wep) then return end

	local class = wep:GetClass()
	local config = sword_config[class]
	if not config then return end

	local element = config.element
	local blade_options = config.blade or {}
	local guard_options = config.guard or {}

	local saved_blade = wep.SelectedBlade or blade_options[1] or 0
	local saved_guard = wep.SelectedGuard or guard_options[1] or 0

	local frame = vgui.Create("DFrame")
	frame:SetTitle("")
	frame:SetSize(520, 500)
	frame:Center()
	frame:MakePopup()
	frame:SetDraggable(false)
	frame:ShowCloseButton(false)
	frame.Paint = function(self, w, h)
		draw.RoundedBox(8, 0, 0, w, h, Color(20, 20, 20, 240))
		draw.SimpleTextOutlined("Customize Power Sword", "Trebuchet24", w / 2, 10, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, color_black)
	end

	-- Close Button
	local closeButton = vgui.Create("DButton", frame)
	closeButton:SetText("×")
	closeButton:SetFont("Trebuchet24")
	closeButton:SetSize(32, 32)
	closeButton:SetPos(frame:GetWide() - 42, 10)
	closeButton.DoClick = function() frame:Close() end
	closeButton.Paint = function(self, w, h)
		draw.SimpleText("×", "Trebuchet24", w / 2, h / 2, Color(255, 80, 80), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	-- Blade Column
	local bladeLabel = vgui.Create("DLabel", frame)
	bladeLabel:SetText("Blade Style")
	bladeLabel:SetFont("DermaDefaultBold")
	bladeLabel:SetPos(30, 50)
	bladeLabel:SizeToContents()

	local bladeScroll = vgui.Create("DScrollPanel", frame)
	bladeScroll:SetSize(220, 320)
	bladeScroll:SetPos(20, 70)

	for _, blade in ipairs(blade_options) do
		local name = blade_names[blade] or ("Blade " .. blade)
		local btn = vgui.Create("DButton", bladeScroll)
		btn:Dock(TOP)
		btn:SetTall(36)
		btn:SetText("")

		btn.Paint = function(self, w, h)
			local isSelected = (blade == saved_blade)
			local bgColor = isSelected and Color(60, 160, 255, 180) or Color(40, 40, 40, 180)
			local textColor = isSelected and color_white or Color(200, 200, 200)
			if self:IsHovered() then
				bgColor = Color(bgColor.r + 10, bgColor.g + 10, bgColor.b + 10)
			end

			draw.RoundedBox(6, 0, 0, w, h, bgColor)
			draw.SimpleText(name, "DermaDefaultBold", w / 2, h / 2, textColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		btn.DoClick = function()
			saved_blade = blade
		end
	end

	-- Guard Column
	local guardLabel = vgui.Create("DLabel", frame)
	guardLabel:SetText("Guard Style")
	guardLabel:SetFont("DermaDefaultBold")
	guardLabel:SetPos(280, 50)
	guardLabel:SizeToContents()

	local guardScroll = vgui.Create("DScrollPanel", frame)
	guardScroll:SetSize(220, 320)
	guardScroll:SetPos(270, 70)

	for _, guard in ipairs(guard_options) do
		local name = (guard_names[class] and guard_names[class][guard]) or ("Guard " .. guard)
		local btn = vgui.Create("DButton", guardScroll)
		btn:Dock(TOP)
		btn:SetTall(36)
		btn:SetText("")

		btn.Paint = function(self, w, h)
			local isSelected = (guard == saved_guard)
			local bgColor = isSelected and Color(60, 160, 255, 180) or Color(40, 40, 40, 180)
			local textColor = isSelected and color_white or Color(200, 200, 200)
			if self:IsHovered() then
				bgColor = Color(bgColor.r + 10, bgColor.g + 10, bgColor.b + 10)
			end

			draw.RoundedBox(6, 0, 0, w, h, bgColor)
			draw.SimpleText(name, "DermaDefaultBold", w / 2, h / 2, textColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		btn.DoClick = function()
			saved_guard = guard
		end
	end

	-- Apply Button
	local apply = vgui.Create("DButton", frame)
	apply:SetSize(160, 36)
	apply:SetPos(frame:GetWide() / 2 - 80, frame:GetTall() - 50)
	apply:SetText("")
	apply.Paint = function(self, w, h)
		draw.RoundedBox(6, 0, 0, w, h, Color(40, 120, 255, 180))
		draw.SimpleText("Apply Customization", "DermaDefaultBold", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	apply.DoClick = function()
		wep.SelectedGuard = saved_guard
		wep.SelectedBlade = saved_blade

		local ply = wep:GetOwner()
		if IsValid(ply) then
			ply:SetNWInt("Sword_Guard_" .. class, saved_guard)
			ply:SetNWInt("Sword_Blade_" .. class, saved_blade)
		end

		ApplyBodygroups(wep, element, saved_blade, saved_guard)

		surface.PlaySound("buttons/button15.wav")
		frame:Close()
	end
end




function ATTACHMENT:Attach(wep)
	if not IsValid(wep) then return end

	local ply = wep:GetOwner()
	if not IsValid(ply) then return end

	local class = wep:GetClass()
	local config = sword_config[class]
	if not config then return end

	local saved_guard = ply:GetNWInt("Sword_Guard_" .. class, config.guard[1] or 0)
	local saved_blade = ply:GetNWInt("Sword_Blade_" .. class, config.blade[1] or 0)

	wep.SelectedGuard = saved_guard
	wep.SelectedBlade = saved_blade

	timer.Simple(0, function()
		if IsValid(wep) then
			ApplyBodygroups(wep, config.element, saved_blade, saved_guard)
		end
	end)

	if SERVER then return end

	hook.Add("Think", GetHookID(wep) .. "_Menu", function()
		if not IsValid(wep) or not wep:OwnerIsValid() then return end
		local ply = wep:GetOwner()
		if not IsValid(ply) then return end
		if ply:GetActiveWeapon() ~= wep then return end

		if ply:KeyDown(IN_RELOAD) and ply:KeyDown(IN_USE) then
			if not wep._NextForgeMenu or CurTime() > wep._NextForgeMenu then
				OpenSwordForgeMenu(wep)
				wep._NextForgeMenu = CurTime() + 0.5
			end
		end
	end)

	-- HUD feedback: show current guard + blade
	hook.Add("HUDPaint", GetHookID(wep) .. "_HUD", function()
		local ply = LocalPlayer()
		if not IsValid(ply) then return end
		local active = ply:GetActiveWeapon()
		if active ~= wep then return end

		local guard = wep.SelectedGuard
		local blade = wep.SelectedBlade
	
		if not guard and not blade then return end

		local guard_name = (guard_names[class] and guard_names[class][guard]) or ("Guard " .. tostring(guard))
		local blade_name = blade_names[blade] or ("Blade " .. tostring(blade))

		draw.SimpleTextOutlined(
			"Guard: " .. guard_name,
			"DermaLarge",
			ScrW() / 2,
			ScrH() - 130,
			color_white,
			TEXT_ALIGN_CENTER,
			TEXT_ALIGN_CENTER,
			1,
			color_black
		)

		draw.SimpleTextOutlined(
			"Blade: " .. blade_name,
			"DermaLarge",
			ScrW() / 2,
			ScrH() - 100,
			color_white,
			TEXT_ALIGN_CENTER,
		TEXT_ALIGN_CENTER,
			1,
			color_black
		)
	end)
end

function ATTACHMENT:Detach(wep)
	if not IsValid(wep) then return end

	hook.Remove("Think", GetHookID(wep) .. "_Menu")
	hook.Remove("HUDPaint", GetHookID(wep) .. "_HUD")

	wep.SelectedBlade = nil
	wep.SelectedGuard = nil
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
