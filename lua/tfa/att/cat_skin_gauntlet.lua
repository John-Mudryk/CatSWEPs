if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Gauntlet Paint"
ATTACHMENT.Description = {
	TFA.Attachments.Colors["="], "Change paint colour",
	TFA.Attachments.Colors["+"], "Press RELOAD + USE to select paint",
	TFA.Attachments.Colors["+"], "Then detatch to apply"
}
ATTACHMENT.Icon = "entities/skingauntlet.png"
ATTACHMENT.ShortName = "PAINT"

local max_skin = 19

local target_elements = {
	"powerfist", "powerfistC",
	"powerclaw_l", "powerclaw_r",
	"powerclaw_lC", "powerclaw_rC"
}

local skin_names = {
	[0] = "Crimson Regalia",
	[1] = "Azure Alloy",
	[2] = "Auric Vanguard",
	[3] = "Void Black",
	[4] = "Obsidian Honor",
	[5] = "Pale Gold",
	[6] = "Imperator's Wrath",
	[7] = "Gilded Ivory",
	[8] = "Ember Sigil",
	[9] = "Hazard Pattern IV",
	[10] = "Steelbone",
	[11] = "Bloodforged Silver",
	[12] = "Martian Iron",
	[13] = "Bronzed Relic",
	[14] = "Verdant Sigil",
	[15] = "Secutarii Alloy",
	[16] = "Forgebrass",
	[17] = "Antiquis Bronze",
	[18] = "Ceramite Shadow",
	[19] = "Blessed Argent",
}

local function ApplySkinToElements(wep, skin, color)
	color = color or Color(255, 255, 255)

	for _, name in ipairs(target_elements) do
		-- Remove old element entirely to force TFA to rebuild it cleanly
		if wep.VElements and wep.VElements[name] then
			if IsValid(wep.VElements[name].modelEnt) then
				wep.VElements[name].modelEnt:Remove()
			end

			-- Fully redefine the element with updated values
			local base = table.Copy(wep.VElements[name])
			base.skin = skin
			base.color = color
			base.modelEnt = nil
			wep.VElements[name] = base
		end

		if wep.WElements and wep.WElements[name] then
			if IsValid(wep.WElements[name].modelEnt) then
				wep.WElements[name].modelEnt:Remove()
			end

			local base = table.Copy(wep.WElements[name])
			base.skin = skin
			base.color = color
			base.modelEnt = nil
			wep.WElements[name] = base
		end

		if wep.Elements and wep.Elements[name] then
			wep.Elements[name].skin = skin
			wep.Elements[name].color = color
		end
	end

	if wep.CreateModels then
		wep:CreateModels(wep.VElements)
		wep:CreateModels(wep.WElements)
	end
end




local function GetHookID(wep)
	return "TFA_SkinCycle_" .. tostring(wep:EntIndex())
end

local function OpenSkinMenu(wep)
	if not IsValid(wep) then return end

	local saved_skin = wep.PowerfistSkinIndex or 0
	local current_color = wep.PowerfistColor or Color(255, 255, 255)
	local selected_skin = saved_skin
	local selected_color = current_color

	local frame = vgui.Create("DFrame")
	frame:SetTitle("")
	frame:SetSize(360, 520)
	frame:Center()
	frame:MakePopup()
	frame:DockPadding(10, 10, 10, 10)
	frame:SetDraggable(false)
	frame:ShowCloseButton(false)
	frame.Paint = function(self, w, h)
		draw.RoundedBox(8, 0, 0, w, h, Color(20, 20, 20, 240))
		draw.SimpleTextOutlined("Select Gauntlet Skin", "Trebuchet24", w / 2, 10, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, color_black)
	end

	-- Close button
	local closeButton = vgui.Create("DButton", frame)
	closeButton:SetText("×")
	closeButton:SetFont("Trebuchet24")
	closeButton:SetSize(32, 32)
	closeButton:SetPos(frame:GetWide() - 42, 10)
	closeButton.DoClick = function() frame:Close() end
	closeButton.Paint = function(self, w, h)
		draw.SimpleText("×", "Trebuchet24", w / 2, h / 2, Color(255, 80, 80), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	-- Color mixer
	local mixer = vgui.Create("DColorMixer", frame)
	mixer:Dock(TOP)
	mixer:SetPalette(true)
	mixer:SetAlphaBar(false)
	mixer:SetWangs(true)
	mixer:SetColor(current_color)
	mixer:SetTall(100)
	mixer:DockMargin(0, 40, 0, 10)

	-- Skin list
	local scroll = vgui.Create("DScrollPanel", frame)
	scroll:Dock(FILL)
	scroll:DockMargin(0, 0, 0, 50) -- Leave space at bottom for apply button

	for i = 0, max_skin do
		local skin_name = skin_names[i] or ("Skin " .. i)
		local btn = vgui.Create("DButton", scroll)
		btn:Dock(TOP)
		btn:DockMargin(0, 0, 0, 5)
		btn:SetTall(36)
		btn:SetText("")

		btn.Paint = function(self, w, h)
			local isSelected = (i == selected_skin)
			local bgColor = isSelected and Color(60, 160, 255, 180) or Color(40, 40, 40, 180)
			local textColor = isSelected and color_white or Color(200, 200, 200)

			if self:IsHovered() then
				bgColor = Color(bgColor.r + 10, bgColor.g + 10, bgColor.b + 10)
			end

			draw.RoundedBox(6, 0, 0, w, h, bgColor)
			draw.SimpleText(skin_name, "DermaDefaultBold", w / 2, h / 2, textColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		btn.DoClick = function()
			selected_skin = i
		end
	end

	-- Apply customization button
	local apply = vgui.Create("DButton", frame)
	apply:SetSize(160, 36)
	apply:SetPos(frame:GetWide() / 2 - 80, frame:GetTall() - 46)
	apply:SetText("")
	apply.Paint = function(self, w, h)
		draw.RoundedBox(6, 0, 0, w, h, Color(40, 120, 255, 180))
		draw.SimpleText("Apply Customization", "DermaDefaultBold", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	apply.DoClick = function()
		local ply = wep:GetOwner()
		if not IsValid(ply) then return end

		selected_color = mixer:GetColor()

		wep.PowerfistSkinIndex = selected_skin
		wep.PowerfistColor = selected_color

		ApplySkinToElements(wep, selected_skin, selected_color)

		ply:SetNWInt("PowerfistSkin_" .. wep:GetClass(), selected_skin)
		ply:SetNWVector("PowerfistColor_" .. wep:GetClass(), Vector(selected_color.r, selected_color.g, selected_color.b))

		surface.PlaySound("buttons/button15.wav")
		frame:Close()
	end
end


function ATTACHMENT:Attach(wep)
	if not IsValid(wep) then return end

	local ply = wep:GetOwner()

	local saved = 0
	local saved_color = Color(255, 255, 255)

	-- Load saved skin selection (defaults to 0)
	if IsValid(ply) then
		saved = ply:GetNWInt("PowerfistSkin_" .. wep:GetClass(), 0)

		local color_vec = ply:GetNWVector("PowerfistColor_" .. wep:GetClass(), Vector(255, 255, 255))
		saved_color = Color(color_vec.x, color_vec.y, color_vec.z)
	end


	wep.PowerfistSkinIndex = saved
	wep.PowerfistColor = saved_color
	wep.NextSkinSwitch = 0

	-- Delay to ensure modelEnts are created
	timer.Simple(0, function()
		if IsValid(wep) then
			ApplySkinToElements(wep, saved, saved_color)
		end
	end)

	if SERVER then return end

	-- Think hook: open menu on RELOAD + USE
	hook.Add("Think", GetHookID(wep) .. "_Menu", function()
		if not IsValid(wep) or not wep:OwnerIsValid() then return end
		local ply = wep:GetOwner()
		if not IsValid(ply) then return end
		if ply:GetActiveWeapon() ~= wep then return end
		
		if ply:KeyDown(IN_RELOAD) and ply:KeyDown(IN_USE) then
			if not wep._NextSkinMenu or CurTime() > wep._NextSkinMenu then
				OpenSkinMenu(wep)
				wep._NextSkinMenu = CurTime() + 0.5
			end
		end
	end)

	-- HUD feedback: show current skin
	hook.Add("HUDPaint", GetHookID(wep) .. "_HUD", function()
		local ply = LocalPlayer()
		if not IsValid(ply) then return end
		local active = ply:GetActiveWeapon()
		if active ~= wep then return end
		if not wep.PowerfistSkinIndex then return end

		local skin_name = skin_names[wep.PowerfistSkinIndex] or ("Skin " .. wep.PowerfistSkinIndex)

		draw.SimpleTextOutlined(
			"Gauntlet Skin: " .. skin_name,
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

	-- Save final selected skin
	if IsValid(ply) and wep.PowerfistColor then
		local c = wep.PowerfistColor
		ply:SetNWVector("PowerfistColor_" .. wep:GetClass(), Vector(c.r, c.g, c.b))
	end

	-- Clean up hooks
	hook.Remove("Think", GetHookID(wep) .. "_Menu")
	hook.Remove("HUDPaint", GetHookID(wep) .. "_HUD")

	wep.PowerfistSkinIndex = nil
	wep.NextSkinSwitch = nil
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
