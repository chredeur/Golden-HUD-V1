local ply, wep
local surfaceicon = Material( "golden_hud/surface.png" )
local weapon_props = {
	"weapon_physgun",
	"gmod_tool",
	"weapon_physcannon"
}
hook.Add("HUDPaint","GoldenHudV1.HudProps",function()
	if GoldenHUDV1.PropsHUD == false then return end
	local x = ScrH() - 73
	local y = 330
	ply = LocalPlayer()
	if ply:InVehicle() then return end 
	local props = ply:GetCount("ragdolls") + ply:GetCount("props") + ply:GetCount("effects") + ply:GetCount("vehicles") + ply:GetCount("sents") + ply:GetCount("npcs")
	if !IsValid(ply:GetActiveWeapon()) then return end
	wep = ply:GetActiveWeapon()
	if table.HasValue( weapon_props, wep:GetClass() ) then
		draw.RoundedBox( 5, y, x + 25, 150, 32, GoldenHUDV1.PropsBackgroundColor)
		draw.SimpleText( GoldenHUDV1.Language[ GoldenHUDV1.ConfigLanguage ][ "props" ].." "..props, "GoldenHudV1Font", y + 42, x + 29, GoldenHUDV1.PropsTextColor, TEXT_ALIGN_LEFT ) 

		surface.SetMaterial( surfaceicon )
    	surface.SetDrawColor(255, 255, 255, 250) 
		surface.DrawTexturedRect( y+8, x+27, 24, 26 )
	end

end)