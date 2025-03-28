-- Global utility to handle 3D + 2D fallback scope setup
function SetupScopeMode(wep, data)
	if not IsValid(wep) then return end

	local use3D = CLIENT and GetConVar("cl_tfa_3dscopes") and GetConVar("cl_tfa_3dscopes"):GetBool()

	if use3D then
		wep.Scoped = true
		wep.Secondary.RTScope = true
		wep.Secondary.RTScopeAttachment = data.Attachment or 1
		wep.Secondary.RTScopeFOV = data.FOV or 5
		wep.Secondary.RTScopeReticle = data.Reticle or Material("scope/gdcw_scopesightonly")
		wep.Secondary.RTScopeReticleScale = data.ReticleScale or 1
		wep.Secondary.RTScopeDrawBorder = false
		wep.Secondary.RTScopeBlackBox = false

		-- Remove 2D fallback if any
		wep.Secondary.ScopeZoom = nil
		wep.Secondary.ScopeTable = nil
		wep.ScopeZoom = nil
		wep.ScopeTable = nil
	else
		-- Fallback to 2D scope
		wep.Scoped = true
		wep.Secondary.ScopeZoom = data.FOV or 5
		wep.Secondary.ScopeTable = data.ScopeTable or {
			reticle = "scope/gdcw_scopesightonly",
			scopename = "2d_scope"
		}

		wep.Secondary.RTScope = false
	end
end
