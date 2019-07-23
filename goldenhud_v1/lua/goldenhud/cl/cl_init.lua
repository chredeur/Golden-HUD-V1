/*#################################################

###          GoldenHUDV1 By Chredeur            ###

#################################################*/

include("goldenhud/sh_config.lua")


local HideElementsTable = {
	["DarkRP_HUD"] = true,
	["DarkRP_ArrestedHUD"] = false,
	["DarkRP_EntityDisplay"] = false,
	["DarkRP_ZombieInfo"] = true,
	["DarkRP_LocalPlayerHUD"] = true,
	["DarkRP_Hungermod"] = true,
	["DarkRP_Agenda"] = true,
	 
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudSuitPower"] = true,
    ["CHudAmmo"] = true,
    ["CHudSecondaryAmmo"] = true,
}

local healthicon = Material( "golden_hud/health.png" )
local foodicon = Material( "golden_hud/hunger.png" )
local armoricon = Material( "golden_hud/armor.png" )
hook.Add( "HUDPaint", "ArmorImage", function()
if GoldenHUDV1.ArmorPicture == true and GoldenHUDV1.ArmorBar == true then
    surface.SetMaterial( armoricon )
    surface.SetDrawColor(255, 255, 255, 170)
	surface.DrawTexturedRect( 25, 683, 28, 29 )
end

if GoldenHUDV1.FoodPicture == true and GoldenHUDV1.FoodBar == true then
    surface.SetMaterial( foodicon )
    surface.SetDrawColor(255, 255, 255, 170)
	surface.DrawTexturedRect( 25, 720, 28, 29 )
end

if GoldenHUDV1.HealthPicture == true and GoldenHUDV1.HeatlhBar == true then 
    surface.SetMaterial( healthicon )
    surface.SetDrawColor(255, 255, 255, 170) 
	surface.DrawTexturedRect( 25, 647, 28, 30 )
end
end )

hook.Add("HUDPaint","GoldenHudV1True",function()
local health = LocalPlayer():Health()
if health < 0 then health = 0 elseif health > 100 then health = 100 end
local armor = LocalPlayer():Armor()
if armor < 0 then armor = 0 elseif armor > 100 then armor = 100 end 
local food = LocalPlayer():getDarkRPVar("Energy")
local healthe = LocalPlayer():Health()
local armore = LocalPlayer():Armor()

if GoldenHUDV1.HeatlhBar == true and GoldenHUDV1.HealthPicture == true then 
draw.RoundedBox(0, 20, ScrH() - 123, 295, 32, Color(0, 0, 0, 225))
draw.RoundedBox(0, 60, ScrH() - 119.5, health * 2.5, 25, GoldenHUDV1.HealthColor)
end

if GoldenHUDV1.FoodBar == true and GoldenHUDV1.FoodPicture == true then 
draw.RoundedBox(0, 20, ScrH() - 50, 295, 32, Color(0, 0, 0, 225))
draw.RoundedBox(0, 60, ScrH() - 46.3, food * 2.5, 25, GoldenHUDV1.FoodColor)
end

if GoldenHUDV1.ArmorBar == true and GoldenHUDV1.ArmorPicture == true then 
draw.RoundedBox(0, 20, ScrH() - 86, 295, 32, Color(0, 0, 0, 225))
draw.RoundedBox(0, 60, ScrH() - 83, armore * 2.5, 25, GoldenHUDV1.ArmorColor)
end

if GoldenHUDV1.HeatlhBar == true and GoldenHUDV1.HealthNumber == true and GoldenHUDV1.HealthPicture == true then 
draw.SimpleText(healthe, "Trebuchet24", 179, ScrH() - 119.5, GoldenHUDV1.HealthNumberColor, TEXT_ALIGN_CENTER)
end

if GoldenHUDV1.ArmorBar == true and GoldenHUDV1.ArmorNumber == true and GoldenHUDV1.ArmorPicture == true then 
draw.SimpleText(armore, "Trebuchet24", 179, ScrH() - 83, GoldenHUDV1.ArmorNumberColor, TEXT_ALIGN_CENTER)
end

if GoldenHUDV1.FoodBar == true and GoldenHUDV1.FoodNumber == true and GoldenHUDV1.FoodPicture == true then 
draw.SimpleText(food, "Trebuchet24", 179, ScrH() - 46.3, GoldenHUDV1.FoodNumberColor, TEXT_ALIGN_CENTER)
end
end )
 
hook.Add("HUDPaint","GoldenHudV1False",function()
local health = LocalPlayer():Health()
if health < 0 then health = 0 elseif health > 100 then health = 100 end
local armor = LocalPlayer():Armor()
if armor < 0 then armor = 0 elseif armor > 100 then armor = 100 end 
local food = LocalPlayer():getDarkRPVar("Energy")
local healthe = LocalPlayer():Health()
local armore = LocalPlayer():Armor()

if GoldenHUDV1.HealthPicture == false and GoldenHUDV1.HeatlhBar == true then 
draw.RoundedBox(0, 20, ScrH() - 123, 295, 32, Color(0, 0, 0, 225))
draw.RoundedBox(0, 22.5, ScrH() - 119.5, health * 2.9, 25, GoldenHUDV1.HealthColor)
end

if GoldenHUDV1.FoodPicture == false and GoldenHUDV1.FoodBar == true then 
draw.RoundedBox(0, 20, ScrH() - 50, 295, 32, Color(0, 0, 0, 225))
draw.RoundedBox(0, 22.5, ScrH() - 46.3, food * 2.9, 25, Color(1, 142, 8, 150))
end

if GoldenHUDV1.ArmorPicture == false and GoldenHUDV1.ArmorBar == true then 
draw.RoundedBox(0, 20, ScrH() - 86, 295, 32, Color(0, 0, 0, 225))
draw.RoundedBox(0, 22.5, ScrH() - 83, armore * 2.9, 25, GoldenHUDV1.ArmorColor)
end

if GoldenHUDV1.HealthPicture == false and GoldenHUDV1.HealthNumber == true then  
draw.SimpleText(healthe, "Trebuchet24", 163, ScrH() - 119.5, GoldenHUDV1.HealthNumberColor, TEXT_ALIGN_CENTER)
end

if GoldenHUDV1.ArmorPicture == false and GoldenHUDV1.ArmorNumber == true then 
draw.SimpleText(armore, "Trebuchet24", 163, ScrH() - 83, GoldenHUDV1.ArmorNumberColor, TEXT_ALIGN_CENTER)
end

if GoldenHUDV1.FoodPicture == false and GoldenHUDV1.FoodNumber == true then 
draw.SimpleText(food, "Trebuchet24", 163, ScrH() - 46.3, Color(255, 255, 255, 150), TEXT_ALIGN_CENTER)
end
end )

local function HideElements( element )
	if HideElementsTable[ element ] then
		return false
	end
end
hook.Add( "HUDShouldDraw", "HideElements", HideElements )

local ply = LocalPlayer()

hook.Add( "HUDPaint", "Ammo", GoldenHUDV1 )

local wep, total, clip, nicename, weaponicon, ammoicon
local function Ammo()
	ply = LocalPlayer()
	if !IsValid(ply:GetActiveWeapon()) then return end
	wep = ply:GetActiveWeapon()
	total = ply:GetAmmoCount(wep:GetPrimaryAmmoType())
	clip = wep:Clip1()
	nicename = wep:GetPrintName()
	if clip < 0 or table.HasValue( GoldenHUDV1.BlackListWeapon or "weapon_physcannon", wep:GetClass() ) then return end
	if string.len(nicename) > 21 then nicename = string.Left( nicename, 19 ) .. "..." end
	if GoldenHUDV1.EnableNameWeapon then
	draw.RoundedBoxEx( 0, ScrW() - 1040, ScrH() - 70, 150 - 2, 25, GoldenHUDV1.HeaderAmmo )
end
  	draw.RoundedBoxEx( 0, ScrW() - 1040, ScrH() - 43, 150 - 2, 25, GoldenHUDV1.BackgroundAmmo )
  	if GoldenHUDV1.EnableNameWeapon then
  	draw.RoundedBoxEx( 0, ScrW() - 1040, ScrH() - 45, 150 - 2, 2, GoldenHUDV1.AmmoBar )
  end
  	draw.SimpleText( "/", "Trebuchet24", ScrW() - 968, ScrH() - 43, GoldenHUDV1.AmmoTextColor, TEXT_ALIGN_CENTER )
  	draw.SimpleText( clip, "Trebuchet24", ScrW() - 979, ScrH() - 43, GoldenHUDV1.AmmoTextColor, 2 )
  	draw.SimpleText( total, "Trebuchet24", ScrW() - 958, ScrH() - 43, GoldenHUDV1.AmmoTextColor, 0 )
	if GoldenHUDV1.EnableNameWeapon then
		draw.SimpleText( nicename, "Trebuchet24", ScrW() - 965, ScrH() - 69, GoldenHUDV1.AmmoTextColor, TEXT_ALIGN_CENTER ) 
	end
end 

hook.Add("HUDPaint", "AlLifeAmmo", Ammo)