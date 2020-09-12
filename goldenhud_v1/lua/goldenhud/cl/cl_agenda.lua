surface.CreateFont("Title", {
    font = "Righteous",
    size = 25, 
    weight = 20
})

surface.CreateFont("Text", {
    font = "Righteous",
    size = 20, 
    weight = 20
})

local ply
hook.Add("HUDPaint", "hudagenda", function()
    if GoldenHUDV1.EnableAgenda then
        local shouldDraw = hook.Call("HUDShouldDraw", GAMEMODE, "GoldenHudV1Agenda")
        if shouldDraw == false or !DarkRP then return end

        ply = LocalPlayer()
        local x = ScrH()/GoldenHUDV1.AgendaPosX
        local y = GoldenHUDV1.AgendaPosY
        local agenda = ply:getAgendaTable()
        if not agenda then return end
        local agendaText = DarkRP.textWrap((ply:getDarkRPVar("agenda") or ""):gsub("//", "\n"):gsub("\\n", "\n"), "GoldenHudV1Font", 440)

        draw.RoundedBox(5, x, y, 426, 106, GoldenHUDV1.AgendaColor)

        draw.DrawNonParsedText(agenda.Title, "Title", x + 10, y + 5, GoldenHUDV1.AgendaColorTitle, 0)
        draw.DrawNonParsedText(agendaText, "Text", x + 10, y + 40, GoldenHUDV1.AgendaColorText, 0)
    end
end)