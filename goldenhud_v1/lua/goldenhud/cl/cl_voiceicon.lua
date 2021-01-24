local VoiceIcon1 = Material("golden_hud/speaker.png")
local VoiceIcon2 = Material("golden_hud/microphone.png")
local VoiceIsActived = false
local Icon

if GoldenHUDV1.VoiceHUDTheme == 1 then
	Icon = VoiceIcon1
elseif GoldenHUDV1.VoiceHUDTheme == 2 then
	Icon = VoiceIcon2
end

function draw.RotatedBox( x, y, w, h )

	local Rotating = math.sin(CurTime() * 3)
        local backwards = 0

        if Rotating < 0 then
            Rotating = 1 - (1 + Rotating)
           backwards = 180
       end
		
	surface.SetMaterial(Icon)
	surface.SetDrawColor(GoldenHUDV1.VoiceHUDColor)
	surface.DrawTexturedRectRotated( x, y, Rotating * 64 * GoldenHUDV1.VoiceHUDScale, 64 * GoldenHUDV1.VoiceHUDScale, backwards )
end

hook.Add( "HUDPaint", "GoldenHudV1.VoiceHUD", function()
	if GoldenHUDV1.VoiceHUD == false then return end
	if VoiceIsActived then
		draw.RotatedBox( ScrW()-55, ScrH()/2-32, 64, 64)
	end
end )

--[[----------------
	Radar: Voice
----------------]]--

hook.Add("PlayerStartVoice", "GoldenHudV1.VoiceHUD_EnableVoice", function(ply)
	if GoldenHUDV1.VoiceHUD == false then return end
	Material("voice/icntlk_pl"):SetFloat("$alpha", 0)
	if ply == LocalPlayer() then
		VoiceIsActived = true
	end
end)

hook.Add("PlayerEndVoice", "GoldenHudV1.VoiceHUD_DisableVoice", function(ply)
	if GoldenHUDV1.VoiceHUD == false then return end
	if ply == LocalPlayer() then
		VoiceIsActived = false
	end
end)