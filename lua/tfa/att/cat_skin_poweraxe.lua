if not ATTACHMENT then ATTACHMENT = {} end

ATTACHMENT.Name = "Power Axe Forge"
ATTACHMENT.Description = {
	TFA.Attachments.Colors["="], "Customize axe blade, back blade, and decoration",
	TFA.Attachments.Colors["+"], "Press RELOAD + USE to open menu",
	TFA.Attachments.Colors["+"], "Then detach to apply"
}
ATTACHMENT.Icon = "entities/skinforge.png"
ATTACHMENT.ShortName = "FORGE"

function table.Range(a, b)
	local t = {}
	for i = a, b do t[#t+1] = i end
	return t
end

-- Config for axe forge
local axe_config = {
	["cat_legacy_poweraxe"] = {
		element = "poweraxe",
		blade = table.Range(0, 5),
		backblade = table.Range(0, 3),
		decor = table.Range(0, 5),
	},
	["cat_legacy_poweraxeshield"] = {
		element = "poweraxe",
		blade = table.Range(0, 5),
		backblade = table.Range(0, 3),
		decor = table.Range(0, 5),
	},
	["cat_legacy_powerhalberd"] = {
		element = "powerhalberd",
		blade = table.Range(0, 5),
		backblade = table.Range(0, 3),
		decor = table.Range(0, 5),
	},
	["cat_legacy_forceaxe"] = {
		element = "forceaxe",
		blade = table.Range(0, 3),
		backblade = table.Range(0, 3),
		decor = table.Range(0, 5),
	},
	["cat_legacy_forcehalberd"] = {
		element = "powerhalberd",
		blade = table.Range(0, 3),
		backblade = table.Range(0, 3),
		decor = table.Range(0, 5),
	}
}

-- Name maps
local blade_names = {
	[0] = "Reaper Axehead",
	[1] = "Reaper Battleaxe",
	[2] = "Legatine Edge",
	[3] = "Proteus Blade",
	[4] = "Butcher Executioner",
	[5] = "Butcher Cleaver",
}

local backblade_names = {
	[0] = "None",
	[1] = "Back Blade",
	[2] = "Piercing Spike",
	[3] = "Hind Butcher"
}

local decor_names = {
	[0] = "Plain",
	[1] = "Skull",
	[2] = "Winged Skull",
	[3] = "Soaring Skull",
	[4] = "Imperialis",
	[5] = "Aquila"
}

-- Apply bodygroups
local function ApplyBodygroups(wep, elem_name, blade, backblade, decor)
	local v_elem = wep.VElements and wep.VElements[elem_name]
	local w_elem = wep.WElements and wep.WElements[elem_name]

	for _, elem in pairs({v_elem, w_elem}) do
		if elem then
			elem.bodygroup = elem.bodygroup or {}
			if blade then elem.bodygroup[1] = blade end
			if backblade then elem.bodygroup[2] = backblade end
			if decor then elem.bodygroup[4] = decor end
		end
	end

	timer.Simple(0, function()
		for _, elem in pairs({v_elem, w_elem}) do
			if IsValid(elem and elem.modelEnt) then
				if blade then elem.modelEnt:SetBodygroup(1, blade) end
				if backblade then elem.modelEnt:SetBodygroup(2, backblade) end
				if decor then elem.modelEnt:SetBodygroup(4, decor) end
			end
		end
	end)

	if wep.CreateModels then
		wep:CreateModels(wep.VElements)
		wep:CreateModels(wep.WElements)
	end
end

local function GetHookID(wep)
	return "TFA_AxeForge_" .. tostring(wep:EntIndex())
end

-- Menu
local function OpenAxeForgeMenu(wep)
	local class = wep:GetClass()
	local config = axe_config[class]
	if not config then return end

	local blade = wep.SelectedBlade or config.blade[1] or 0
	local backblade = wep.SelectedBack or config.backblade[1] or 0
	local decor = wep.SelectedDecor or config.decor[1] or 0

	local frame = vgui.Create("DFrame")
	frame:SetTitle("")
	frame:SetSize(660, 520)
	frame:Center()
	frame:MakePopup()
	frame:SetDraggable(false)
	frame:ShowCloseButton(false)
	frame.Paint = function(self, w, h)
		draw.RoundedBox(8, 0, 0, w, h, Color(20, 20, 20, 240))
		draw.SimpleTextOutlined("Customize Power Axe", "Trebuchet24", w / 2, 10, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, color_black)
	end

	local close = vgui.Create("DButton", frame)
	close:SetText("×")
	close:SetFont("Trebuchet24")
	close:SetSize(32, 32)
	close:SetPos(frame:GetWide() - 42, 10)
	close.DoClick = function() frame:Close() end
	close.Paint = function(self, w, h)
		draw.SimpleText("×", "Trebuchet24", w / 2, h / 2, Color(255, 80, 80), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	local function CreateScrollList(parent, title, options, selected, update)
		local label = vgui.Create("DLabel", parent)
		label:SetText(title)
		label:SetFont("DermaDefaultBold")
		label:SetPos(20, 50)
		label:SizeToContents()

		local scroll = vgui.Create("DScrollPanel", parent)
		scroll:SetSize(200, 360)
		scroll:SetPos(20, 70)

		for _, id in ipairs(options) do
			local name = (title == "Blade") and blade_names[id] or (title == "Back Blade" and backblade_names[id]) or decor_names[id] or (title .. " " .. id)
			local btn = vgui.Create("DButton", scroll)
			btn:Dock(TOP)
			btn:SetTall(36)
			btn:SetText("")

			btn.Paint = function(self, w, h)
				local isSel = (id == selected())
				local bgColor = isSel and Color(60, 160, 255, 180) or Color(40, 40, 40, 180)
				local textColor = isSel and color_white or Color(200, 200, 200)
				if self:IsHovered() then
					bgColor = Color(bgColor.r + 10, bgColor.g + 10, bgColor.b + 10)
				end
				draw.RoundedBox(6, 0, 0, w, h, bgColor)
				draw.SimpleText(name, "DermaDefaultBold", w / 2, h / 2, textColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end

			btn.DoClick = function()
				update(id)
			end
		end

		return scroll
	end

	CreateScrollList(frame, "Blade", config.blade, function() return blade end, function(v) blade = v end):SetPos(20, 70)
	CreateScrollList(frame, "Back Blade", config.backblade, function() return backblade end, function(v) backblade = v end):SetPos(230, 70)
	CreateScrollList(frame, "Decoration", config.decor, function() return decor end, function(v) decor = v end):SetPos(440, 70)

	local apply = vgui.Create("DButton", frame)
	apply:SetSize(160, 36)
	apply:SetPos(frame:GetWide() / 2 - 80, frame:GetTall() - 50)
	apply:SetText("")
	apply.Paint = function(self, w, h)
		draw.RoundedBox(6, 0, 0, w, h, Color(40, 120, 255, 180))
		draw.SimpleText("Apply Customization", "DermaDefaultBold", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	apply.DoClick = function()
		local ply = wep:GetOwner()
		if IsValid(ply) then
			ply:SetNWInt("Axe_Blade_" .. class, blade)
			ply:SetNWInt("Axe_Back_" .. class, backblade)
			ply:SetNWInt("Axe_Decor_" .. class, decor)
		end

		wep.SelectedBlade = blade
		wep.SelectedBack = backblade
		wep.SelectedDecor = decor

		ApplyBodygroups(wep, config.element, blade, backblade, decor)

		surface.PlaySound("buttons/button15.wav")
		frame:Close()
	end
end

function ATTACHMENT:Attach(wep)
	local class = wep:GetClass()
	local config = axe_config[class]
	if not config then return end

	local ply = wep:GetOwner()
	if not IsValid(ply) then return end

	local blade = ply:GetNWInt("Axe_Blade_" .. class, config.blade[1] or 0)
	local back = ply:GetNWInt("Axe_Back_" .. class, config.backblade[1] or 0)
	local decor = ply:GetNWInt("Axe_Decor_" .. class, config.decor[1] or 0)

	wep.SelectedBlade = blade
	wep.SelectedBack = back
	wep.SelectedDecor = decor

	timer.Simple(0, function()
		if IsValid(wep) then
			ApplyBodygroups(wep, config.element, blade, back, decor)
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
				OpenAxeForgeMenu(wep)
				wep._NextForgeMenu = CurTime() + 0.5
			end
		end
	end)

	hook.Add("HUDPaint", GetHookID(wep) .. "_HUD", function()
		if LocalPlayer():GetActiveWeapon() ~= wep then return end

		local blade = wep.SelectedBlade
		local back = wep.SelectedBack
		local decor = wep.SelectedDecor
		local class = wep:GetClass()

		if blade then
			draw.SimpleTextOutlined(
				"Blade: " .. (blade_names[blade] or blade),
				"DermaLarge",
				ScrW() / 2,
				ScrH() - 120,
				color_white,
				TEXT_ALIGN_CENTER,
				TEXT_ALIGN_CENTER,
				1,
				color_black
			)
		end

		if axe_config[class] and axe_config[class].backblade then
			draw.SimpleTextOutlined(
				"Back: " .. (backblade_names[back] or back),
				"DermaLarge",
				ScrW() / 2,
				ScrH() - 90,
				color_white,
				TEXT_ALIGN_CENTER,
				TEXT_ALIGN_CENTER,
				1,
				color_black
			)
		end

		local decor_display = decor_names[decor] or ("Decor " .. tostring(decor))
		draw.SimpleTextOutlined(
			"Decor: " .. decor_display,
			"DermaLarge",
			ScrW() / 2,
			ScrH() - 60,
			color_white,
			TEXT_ALIGN_CENTER,
			TEXT_ALIGN_CENTER,
			1,
			color_black
		)
	end)
end


function ATTACHMENT:Detach(wep)
	hook.Remove("Think", GetHookID(wep) .. "_Menu")
	hook.Remove("HUDPaint", GetHookID(wep) .. "_HUD")
	wep.SelectedBlade = nil
	wep.SelectedBack = nil
	wep.SelectedDecor = nil
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
