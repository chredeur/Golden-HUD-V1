hook.Add("HUDPaint", "GoldenHudV1.lockdown", function()
	if GoldenHUDV1.EnableLockdown then
    	if GetGlobalBool("DarkRP_LockDown") then
        	local shouldDraw = hook.Call("HUDShouldDraw", GAMEMODE, "DarkRP_LockdownHUD")
        	if shouldDraw == false or !DarkRP then return end
        	local y = 75
        	draw.RoundedBox(5, ScrW() - 20 - 490, y, 490, 70 , GoldenHUDV1.LockdownColor)
        	draw.DrawNonParsedText(DarkRP.getPhrase("lockdown_started"), "GoldenHudV1FontLockdown2", ScrW() - 35, y+40, GoldenHUDV1.LockdownColorText, TEXT_ALIGN_RIGHT)
        	draw.SimpleText(GoldenHUDV1.Language[ GoldenHUDV1.ConfigLanguage ][ "lockdown" ], "GoldenHudV1FontLockdown", ScrW() - 263, y+5, GoldenHUDV1.LockdownColorTitle, TEXT_ALIGN_CENTER)
    	end
    end
end)