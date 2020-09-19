hook.Add("HUDPaint", "wanted", function()
	local wanted = LocalPlayer():getDarkRPVar( "wanted" )
	if wanted and GoldenHUDV1.EnableWanted and GetGlobalBool("DarkRP_LockDown") then
        local y = 160
        draw.RoundedBox(5, ScrW() - 20 - 490, y, 490, 70 , GoldenHUDV1.WantedColor)
        draw.DrawNonParsedText(GoldenHUDV1.Language[ GoldenHUDV1.ConfigLanguage ][ "wanted info" ], "GoldenHudV1FontLockdown2", ScrW() - 263, y+40, GoldenHUDV1.WantedColorText, TEXT_ALIGN_CENTER)
        draw.SimpleText(GoldenHUDV1.Language[ GoldenHUDV1.ConfigLanguage ][ "wanted" ], "GoldenHudV1FontLockdown", ScrW() - 263, y+5, GoldenHUDV1.WantedColorTitle, TEXT_ALIGN_CENTER)
	elseif wanted and GoldenHUDV1.EnableWanted then
        local y = 75
        draw.RoundedBox(5, ScrW() - 20 - 490, y, 490, 70 , GoldenHUDV1.WantedColor)
        draw.DrawNonParsedText(GoldenHUDV1.Language[ GoldenHUDV1.ConfigLanguage ][ "wanted info" ], "GoldenHudV1FontLockdown2", ScrW() - 263, y+40, GoldenHUDV1.WantedColorText, TEXT_ALIGN_CENTER)
        draw.SimpleText(GoldenHUDV1.Language[ GoldenHUDV1.ConfigLanguage ][ "wanted" ], "GoldenHudV1FontLockdown", ScrW() - 263, y+5, GoldenHUDV1.WantedColorTitle, TEXT_ALIGN_CENTER)
    end
end)