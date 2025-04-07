if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Power Maul Forge"
ATTACHMENT.Description = {
	TFA.Attachments.Colors["="], "Customize maul head",
	TFA.Attachments.Colors["+"], "Press RELOAD + USE to select parts",
	TFA.Attachments.Colors["+"], "Then detatch to apply",
}
ATTACHMENT.Icon = "entities/skingauntlet.png"
ATTACHMENT.ShortName = "FORGE"

local hammer_config = {
	["cat_legacy_thunderhammer"] = {
		element = "thunderhammer",
		options = {
			[0] = "Heavy Head",
			[1] = "Stormlord Pattern",
			[2] = "Skullbreaker",
			[3] = "Crucis Striker",
			[4] = "Thunder Eagle"
		}
	},
	["cat_legacy_powermaul"] = {
		element = "powermaul",
		options = {
			[0] = "Meridius Pattern",
			[1] = "Pulverizer",
			[2] = "Spiked Mace"
		}
	},
	["cat_legacy_crozius"] = {
		element = "crozius",
		options = {
			[0] = "Skull Eagle",
			[1] = "Spiked Skull Eagle",
			[2] = "Aquilan Mace",
			[3] = "Spiked Aquilan Mace",
			[4] = "Aquila Crest",
			[5] = "Imperialis Skull",
			[6] = "Primaris Sanctifier"
	
		}
	},
	["cat_chaos_legacy_crozius"] = {
		element = "crozius",
		options = {
			[0] = "Mace of Ruin",
			[1] = "Sphere of Torment",
			[2] = "Star of Devotion",
			[3] = "Staff of Piety"
		}
	}
}

local function ApplyBodygroup(wep, elem, value)
	local v_elem = wep.VElements and wep.VElements[elem]
	local w_elem = wep.WElements and wep.WElements[elem]

	for _, part in pairs({v_elem, w_elem}) do
		if part then
			part.bodygroup = part.bodygroup or {}
			part.bodygroup[1] = value
		end
	end

	timer.Simple(0, function()
		for _, part in pairs({v_elem, w_elem}) do
			if IsValid(part and part.modelEnt) then
				part.modelEnt:SetBodygroup(1, value)
			end
		end
	end)

	if wep.CreateModels then
		wep:CreateModels(wep.VElements)
		wep:CreateModels(wep.WElements)
	end
end

local function GetHookID(wep)
	return "TFA_HammerForge_" .. tostring(wep:EntIndex())
end

local function OpenHammerMenu(wep)
	local class = wep:GetClass()
	local config = hammer_config[class]
	if not config then return end

	local selected = wep.SelectedHead or 0

	local frame = vgui.Create("DFrame")
	frame:SetTitle("")
	frame:SetSize(400, 400)
	frame:Center()
	frame:MakePopup()
	frame:SetDraggable(false)
	frame:ShowCloseButton(false)
	frame.Paint = function(self, w, h)
		draw.RoundedBox(8, 0, 0, w, h, Color(20, 20, 20, 240))
		draw.SimpleTextOutlined("Customize Hammer Head", "Trebuchet24", w / 2, 10, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, color_black)
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

	local scroll = vgui.Create("DScrollPanel", frame)
	scroll:SetSize(360, 280)
	scroll:SetPos(20, 50)

	for id, name in pairs(config.options) do
		local btn = vgui.Create("DButton", scroll)
		btn:Dock(TOP)
		btn:SetTall(36)
		btn:SetText("")
		btn.Paint = function(self, w, h)
			local isSel = (id == selected)
			local bgColor = isSel and Color(60, 160, 255, 180) or Color(40, 40, 40, 180)
			local textColor = isSel and color_white or Color(200, 200, 200)
			if self:IsHovered() then
				bgColor = Color(bgColor.r + 10, bgColor.g + 10, bgColor.b + 10)
			end
			draw.RoundedBox(6, 0, 0, w, h, bgColor)
			draw.SimpleText(name, "DermaDefaultBold", w / 2, h / 2, textColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		btn.DoClick = function()
			selected = id
		end
	end

	local apply = vgui.Create("DButton", frame)
	apply:SetSize(160, 36)
	apply:SetPos(frame:GetWide() / 2 - 80, frame:GetTall() - 50)
	apply:SetText("")
	apply.Paint = function(self, w, h)
		draw.RoundedBox(6, 0, 0, w, h, Color(40, 120, 255, 180))
		draw.SimpleText("Apply Customization", "DermaDefaultBold", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	apply.DoClick = function()
		wep.SelectedHead = selected
		local ply = wep:GetOwner()
		if IsValid(ply) then
			ply:SetNWInt("Hammer_Head_" .. class, selected)
		end

		ApplyBodygroup(wep, config.element, selected)
		surface.PlaySound("buttons/button15.wav")
		frame:Close()
	end
end

function ATTACHMENT:Attach(wep)
	local class = wep:GetClass()
	local config = hammer_config[class]
	if not config then return end

	local ply = wep:GetOwner()
	if not IsValid(ply) then return end

	local selected = ply:GetNWInt("Hammer_Head_" .. class, 0)
	wep.SelectedHead = selected

	timer.Simple(0, function()
		if IsValid(wep) then
			ApplyBodygroup(wep, config.element, selected)
		end
	end)

	if SERVER then return end

	hook.Add("Think", GetHookID(wep) .. "_Menu", function()
		if not IsValid(wep) or not wep:OwnerIsValid() then return end
		local ply = wep:GetOwner()
		if not IsValid(ply) then return end
		if ply:GetActiveWeapon() ~= wep then return end

		if ply:KeyDown(IN_RELOAD) and ply:KeyDown(IN_USE) then
			if not wep._NextHammerMenu or CurTime() > wep._NextHammerMenu then
				OpenHammerMenu(wep)
				wep._NextHammerMenu = CurTime() + 0.5
			end
		end
	end)

	hook.Add("HUDPaint", GetHookID(wep) .. "_HUD", function()
		if LocalPlayer():GetActiveWeapon() ~= wep then return end
		local id = wep.SelectedHead or 0
		local name = config.options[id] or ("Head " .. id)

		draw.SimpleTextOutlined("Hammer Head: " .. name, "DermaLarge", ScrW() / 2, ScrH() - 100, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, color_black)
	end)
end

function ATTACHMENT:Detach(wep)
	if not IsValid(wep) then return end
	hook.Remove("Think", GetHookID(wep) .. "_Menu")
	hook.Remove("HUDPaint", GetHookID(wep) .. "_HUD")
	wep.SelectedHead = nil
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
