/*#################################################

###          GoldenHUDV1 By chredeur            ###

#################################################*/

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

    ["CHudCrosshair"] = GoldenHUDV1.EnableCrosshair,

    ["Cookingmod_Hunger"] = GoldenHUDV1.EnableCompatibilityACM,
	["Cookingmod_Thirst"] = GoldenHUDV1.EnableCompatibilityACM,

	["MedicMod_HUD"] = GoldenHUDV1.EnableAMMHealthStatus,
	["MedicMod_DeathPanel"] = GoldenHUDV1.EnableAMMDeathPanel,

	["VCMod_Health"] = GoldenHUDV1.EnableCompatibilityVCMod,
	["VCMod_Damage"] = GoldenHUDV1.EnableCompatibilityVCMod,
	["VCMod_ELS_Lights"] = GoldenHUDV1.EnableCompatibilityVCMod,
	["VCMod_ELS_Siren"] = GoldenHUDV1.EnableCompatibilityVCMod, 
	["VCMod_Fuel"] = GoldenHUDV1.EnableCompatibilityVCMod,
	["VCMod_Name"] = GoldenHUDV1.EnableCompatibilityVCMod,
	["VCMod_Icons"] = GoldenHUDV1.EnableCompatibilityVCMod,
}

local healthicon = Material( "golden_hud/health.png" )
local foodicon = Material( "golden_hud/hunger.png" )
local armoricon = Material( "golden_hud/armor.png" )
local thirsticon = Material( "golden_hud/water-bottle.png" )
local moneyicon = Material( "golden_hud/money-bag.png" )

local health = 0
local armor = 0
local food = 0
local thirst = 0
local wep, total, clip, nicename, weaponicon, ammoicon
hook.Add("HUDPaint","GoldenHudV1",function()

	local xthirst = 0
	local xmoney = 0
	local xthristnomodif = 0

	local ply = LocalPlayer()

	health = Lerp( FrameTime(), health, ply:Health())
	armor = Lerp( FrameTime(), armor, ply:Armor())
	food = Lerp( FrameTime(), food, ply:getDarkRPVar("Energy") or 0)

	if GoldenHUDV1.EnableCompatibilityACM then
		xthirst = 35
		thirst = Lerp( FrameTime(), thirst, ply:getDarkRPVar("Thirst") or 0)
	end

	if GoldenHUDV1.MoneyBar then
		xmoney = 36
		xthristnomodif = 36
		money = ply:getDarkRPVar("money")
	end

-- Heatlh Bar --
	if GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == true and GoldenHUDV1.HeatlhBar == true and GoldenHUDV1.HealthPicture == true then
		draw.RoundedBox(5, 20, ScrH() - 123 - xthirst - xmoney, 295, 32, Color(0, 0, 0, 225))
		draw.RoundedBox(5, 60, ScrH() - 119.7 - xthirst - xmoney, math.Clamp(health, 0, 100) * 2.5, 25, GoldenHUDV1.HealthColor)
	elseif GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorBar == false and GoldenHUDV1.HeatlhBar == true and GoldenHUDV1.HealthPicture == true then
		draw.RoundedBox(5, 20, ScrH() - 123 - xthirst - xmoney, 295, 32, Color(0, 0, 0, 225))
	elseif GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == true and GoldenHUDV1.HealthPicture == false and GoldenHUDV1.HeatlhBar == true then 
		draw.RoundedBox(5, 20, ScrH() - 123 - xthirst - xmoney, 295, 32, Color(0, 0, 0, 225))
		draw.RoundedBox(5, 22.5, ScrH() - 119.7 - xthirst - xmoney, math.Clamp(health, 0, 100) * 2.9, 25, GoldenHUDV1.HealthColor)

	elseif GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == false and GoldenHUDV1.HealthPicture == true and GoldenHUDV1.HeatlhBar == true then 
		draw.RoundedBox(5, 20, ScrH() - 103 - xthirst - xmoney, 295, 32, Color(0, 0, 0, 225))
		draw.RoundedBox(5, 60, ScrH() - 100.4 - xthirst - xmoney, math.Clamp(health, 0, 100) * 2.5, 25, GoldenHUDV1.HealthColor)
	elseif GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == false and GoldenHUDV1.HealthPicture == false and GoldenHUDV1.HeatlhBar == true then 
		draw.RoundedBox(5, 20, ScrH() - 103 - xthirst - xmoney, 295, 32, Color(0, 0, 0, 225))
		draw.RoundedBox(5, 22.5, ScrH() - 100.4 - xthirst - xmoney, math.Clamp(health, 0, 100) * 2.9, 25, GoldenHUDV1.HealthColor)

	elseif GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorBar == true and GoldenHUDV1.HealthPicture == true and GoldenHUDV1.HeatlhBar == true then 
		draw.RoundedBox(5, 20, ScrH() - 103 - xthirst - xmoney, 295, 32, Color(0, 0, 0, 225))
		draw.RoundedBox(5, 60, ScrH() - 100.4 - xthirst - xmoney, math.Clamp(health, 0, 100) * 2.5, 25, GoldenHUDV1.HealthColor)
	elseif GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorBar == true and GoldenHUDV1.HealthPicture == false and GoldenHUDV1.HeatlhBar == true then 
		draw.RoundedBox(5, 20, ScrH() - 103 - xthirst - xmoney, 295, 32, Color(0, 0, 0, 225))
		draw.RoundedBox(5, 22.5, ScrH() - 100.4 - xthirst - xmoney, math.Clamp(health, 0, 100) * 2.9, 25, GoldenHUDV1.HealthColor)
	end

-- Food --
	if GoldenHUDV1.ArmorBar == true and GoldenHUDV1.FoodBar == true and GoldenHUDV1.FoodPicture == true then 
		draw.RoundedBox(5, 20, ScrH() - 50 - xthirst - xmoney, 295, 32, Color(0, 0, 0, 225))
		draw.RoundedBox(5, 60, ScrH() - 46.6 - xthirst - xmoney, food * 2.5, 25, GoldenHUDV1.FoodColor)
	elseif GoldenHUDV1.ArmorBar == true and GoldenHUDV1.FoodPicture == false and GoldenHUDV1.FoodBar == true then 
		draw.RoundedBox(5, 20, ScrH() - 50 - xthirst - xmoney, 295, 32, Color(0, 0, 0, 225))
		draw.RoundedBox(5, 22.5, ScrH() - 46.6 - xthirst - xmoney, food * 2.9, 25, Color(1, 142, 8, 150))
	elseif GoldenHUDV1.ArmorBar == false and GoldenHUDV1.FoodPicture == false and GoldenHUDV1.FoodBar == true then 
		draw.RoundedBox(5, 20, ScrH() - 66 - xthirst - xmoney, 295, 32, Color(0, 0, 0, 225))
		draw.RoundedBox(5, 22.5, ScrH() - 63 - xthirst - xmoney, food * 2.9, 25, Color(1, 142, 8, 150))
	elseif GoldenHUDV1.ArmorBar == false and GoldenHUDV1.FoodBar == true and GoldenHUDV1.FoodPicture == true then 
		draw.RoundedBox(5, 20, ScrH() - 66 - xthirst - xmoney, 295, 32, Color(0, 0, 0, 225))
		draw.RoundedBox(5, 60, ScrH() - 63 - xthirst - xmoney, food * 2.5, 25, GoldenHUDV1.FoodColor)
	end

-- Armor --
	if GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == true and GoldenHUDV1.ArmorPicture == true then 
		draw.RoundedBox(5, 20, ScrH() - 86 - xthirst - xmoney, 295, 32, Color(0, 0, 0, 225))
		draw.RoundedBox(5, 60, ScrH() - 83 - xthirst - xmoney, math.Clamp(armor, 0, 100) * 2.5, 25, GoldenHUDV1.ArmorColor)
	elseif GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorPicture == false and GoldenHUDV1.ArmorBar == true then 
		draw.RoundedBox(5, 20, ScrH() - 86 - xthirst - xmoney, 295, 32, Color(0, 0, 0, 225))
		draw.RoundedBox(5, 22.5, ScrH() - 83 - xthirst - xmoney, math.Clamp(armor, 0, 100) * 2.9, 25, GoldenHUDV1.ArmorColor)
	elseif GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorBar == true and GoldenHUDV1.ArmorPicture == true then 
		draw.RoundedBox(5, 20, ScrH() - 66 - xthirst - xmoney, 295, 32, Color(0, 0, 0, 225))
		draw.RoundedBox(5, 60, ScrH() - 62.7 - xthirst - xmoney, math.Clamp(armor, 0, 100) * 2.5, 25, GoldenHUDV1.ArmorColor)
	elseif GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorPicture == false and GoldenHUDV1.ArmorBar == true then 
		draw.RoundedBox(5, 20, ScrH() - 66 - xthirst - xmoney, 295, 32, Color(0, 0, 0, 225))
		draw.RoundedBox(5, 22.5, ScrH() - 62.7 - xthirst - xmoney, math.Clamp(armor, 0, 100) * 2.9, 25, GoldenHUDV1.ArmorColor)
	end

-- Text Health --
	if GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == true and GoldenHUDV1.HeatlhBar == true and GoldenHUDV1.HealthNumber == true and GoldenHUDV1.HealthPicture == true then 
		draw.SimpleText(math.Round(health), "GoldenHudV1Font", 179, ScrH() - 119.5 - xthirst - xmoney, GoldenHUDV1.HealthNumberColor, TEXT_ALIGN_CENTER)
	elseif GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorBar == false and GoldenHUDV1.HeatlhBar == true and GoldenHUDV1.HealthNumber == true and GoldenHUDV1.HealthPicture == true then 
		draw.SimpleText("Pourquoi veut tu un hud bg ;D", "GoldenHudV1Font", 175, ScrH() - 119.5 - xthirst - xmoney, GoldenHUDV1.HealthNumberColor, TEXT_ALIGN_CENTER)
	elseif GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == true and GoldenHUDV1.HeatlhBar == true and GoldenHUDV1.HealthPicture == false and GoldenHUDV1.HealthNumber == true then  
		draw.SimpleText(math.Round(health), "GoldenHudV1Font", 163, ScrH() - 119.5 - xthirst - xmoney, GoldenHUDV1.HealthNumberColor, TEXT_ALIGN_CENTER)

	elseif GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == false and GoldenHUDV1.HeatlhBar == true and GoldenHUDV1.HealthPicture == false and GoldenHUDV1.HealthNumber == true then  
		draw.SimpleText(math.Round(health), "GoldenHudV1Font", 163, ScrH() - 100.5 - xthirst - xmoney, GoldenHUDV1.HealthNumberColor, TEXT_ALIGN_CENTER)
	elseif GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == false and GoldenHUDV1.HeatlhBar == true and GoldenHUDV1.HealthPicture == true and GoldenHUDV1.HealthNumber == true then  
		draw.SimpleText(math.Round(health), "GoldenHudV1Font", 179, ScrH() - 100.5 - xthirst - xmoney, GoldenHUDV1.HealthNumberColor, TEXT_ALIGN_CENTER)

	elseif GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorBar == true and GoldenHUDV1.HeatlhBar == true and GoldenHUDV1.HealthPicture == false and GoldenHUDV1.HealthNumber == true then  
		draw.SimpleText(math.Round(health), "GoldenHudV1Font", 163, ScrH() - 100.5 - xthirst - xmoney, GoldenHUDV1.HealthNumberColor, TEXT_ALIGN_CENTER)
	elseif GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorBar == true and GoldenHUDV1.HeatlhBar == true and GoldenHUDV1.HealthPicture == true and GoldenHUDV1.HealthNumber == true then  
		draw.SimpleText(math.Round(health), "GoldenHudV1Font", 179, ScrH() - 100.5 - xthirst - xmoney, GoldenHUDV1.HealthNumberColor, TEXT_ALIGN_CENTER)
	end

-- Text Armor --
	if GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == true and GoldenHUDV1.ArmorNumber == true and GoldenHUDV1.ArmorPicture == true then 
		draw.SimpleText(math.Round(armor), "GoldenHudV1Font", 179, ScrH() - 83 - xthirst - xmoney, GoldenHUDV1.ArmorNumberColor, TEXT_ALIGN_CENTER)
	elseif GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == true and GoldenHUDV1.ArmorPicture == false and GoldenHUDV1.ArmorNumber == true then 
		draw.SimpleText(math.Round(armor), "GoldenHudV1Font", 163, ScrH() - 83 - xthirst - xmoney, GoldenHUDV1.ArmorNumberColor, TEXT_ALIGN_CENTER)

	elseif GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorBar == true and GoldenHUDV1.ArmorNumber == true and GoldenHUDV1.ArmorPicture == true then 
		draw.SimpleText(math.Round(armor), "GoldenHudV1Font", 179, ScrH() - 63 - xthirst - xmoney, GoldenHUDV1.ArmorNumberColor, TEXT_ALIGN_CENTER)
	elseif GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorBar == true and GoldenHUDV1.ArmorPicture == false and GoldenHUDV1.ArmorNumber == true then 
		draw.SimpleText(math.Round(armor), "GoldenHudV1Font", 163, ScrH() - 63 - xthirst - xmoney, GoldenHUDV1.ArmorNumberColor, TEXT_ALIGN_CENTER)
	end

-- Text Food --
	if GoldenHUDV1.ArmorBar == true and GoldenHUDV1.FoodBar == true and GoldenHUDV1.FoodNumber == true and GoldenHUDV1.FoodPicture == true then 
		draw.SimpleText(math.Round(food), "GoldenHudV1Font", 179, ScrH() - 46.3 - xthirst - xmoney, GoldenHUDV1.FoodNumberColor, TEXT_ALIGN_CENTER)
	elseif GoldenHUDV1.ArmorBar == true and GoldenHUDV1.FoodBar == true and GoldenHUDV1.FoodPicture == false and GoldenHUDV1.FoodNumber == true then 
		draw.SimpleText(math.Round(food), "GoldenHudV1Font", 163, ScrH() - 46.3 - xthirst - xmoney, Color(255, 255, 255, 150), TEXT_ALIGN_CENTER)

	elseif GoldenHUDV1.ArmorBar == false and GoldenHUDV1.FoodBar == true and GoldenHUDV1.FoodNumber == true and GoldenHUDV1.FoodPicture == true then 
		draw.SimpleText(math.Round(food), "GoldenHudV1Font", 179, ScrH() - 63 - xthirst - xmoney, GoldenHUDV1.FoodNumberColor, TEXT_ALIGN_CENTER)
	elseif GoldenHUDV1.ArmorBar == false and GoldenHUDV1.FoodBar == true and GoldenHUDV1.FoodPicture == false and GoldenHUDV1.FoodNumber == true then 
		draw.SimpleText(math.Round(food), "GoldenHudV1Font", 163, ScrH() - 63 - xthirst - xmoney, Color(255, 255, 255, 150), TEXT_ALIGN_CENTER)
	end

-- thirst --
	if GoldenHUDV1.EnableCompatibilityACM then
		if GoldenHUDV1.CAMCPicture == true and GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == true then
			draw.RoundedBox(5, 20, ScrH() - 48, 295, 32, Color(0, 0, 0, 225))
			draw.RoundedBox(5, 60, ScrH() - 45.5, math.Clamp(thirst, 0, 100) * 2.5, 25, GoldenHUDV1.CAMCColor)

			surface.SetMaterial( thirsticon )
    		surface.SetDrawColor(255, 255, 255, 250) 
			surface.DrawTexturedRect( 25, ScrH() - 11 - xthirst, 27, 28 )
		elseif GoldenHUDV1.CAMCPicture == false and GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == true then
			draw.RoundedBox(5, 20, ScrH() - 48, 295, 32, Color(0, 0, 0, 225))
			draw.RoundedBox(5, 22.5, ScrH() - 45.5, math.Clamp(thirst, 0, 100) * 2.9, 25, GoldenHUDV1.CAMCColor)
		elseif GoldenHUDV1.CAMCPicture == false and GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorBar == true then
			draw.RoundedBox(5, 20, ScrH() - 64, 295, 32, Color(0, 0, 0, 225))
			draw.RoundedBox(5, 22.5, ScrH() - 61.3, math.Clamp(thirst, 0, 100) * 2.9, 25, GoldenHUDV1.CAMCColor)
		elseif GoldenHUDV1.CAMCPicture == false and GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == false then
			draw.RoundedBox(5, 20, ScrH() - 64, 295, 32, Color(0, 0, 0, 225))
			draw.RoundedBox(5, 22.5, ScrH() - 61.3, math.Clamp(thirst, 0, 100) * 2.9, 25, GoldenHUDV1.CAMCColor)
		elseif GoldenHUDV1.CAMCPicture == true and GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorBar == true then
			draw.RoundedBox(5, 20, ScrH() - 64, 295, 32, Color(0, 0, 0, 225))
			draw.RoundedBox(5, 60, ScrH() - 61.3, math.Clamp(thirst, 0, 100) * 2.5, 25, GoldenHUDV1.CAMCColor)

			surface.SetMaterial( thirsticon )
    		surface.SetDrawColor(255, 255, 255, 250) 
			surface.DrawTexturedRect( 25, ScrH() - 27 - xthirst, 27, 28 )
		elseif GoldenHUDV1.CAMCPicture == true and GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == false then
			draw.RoundedBox(5, 20, ScrH() - 64, 295, 32, Color(0, 0, 0, 225))
			draw.RoundedBox(5, 60, ScrH() - 61.3, math.Clamp(thirst, 0, 100) * 2.5, 25, GoldenHUDV1.CAMCColor)

			surface.SetMaterial( thirsticon )
    		surface.SetDrawColor(255, 255, 255, 250) 
			surface.DrawTexturedRect( 25, ScrH() - 27 - xthirst, 27, 28 )
		end	

		if GoldenHUDV1.CCAMCNumber == true then
			if GoldenHUDV1.CAMCPicture == true and GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == true then
				draw.SimpleText(math.Round(thirst), "GoldenHudV1Font", 179, ScrH() - 44, GoldenHUDV1.CAMCNumberColor, TEXT_ALIGN_CENTER)
			elseif GoldenHUDV1.CAMCPicture == false and GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == true then
				draw.SimpleText(math.Round(thirst), "GoldenHudV1Font", 163, ScrH() - 44, GoldenHUDV1.CAMCNumberColor, TEXT_ALIGN_CENTER)
			elseif GoldenHUDV1.CAMCPicture == true and GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorBar == true then
				draw.SimpleText(math.Round(thirst), "GoldenHudV1Font", 179, ScrH() - 60, GoldenHUDV1.CAMCNumberColor, TEXT_ALIGN_CENTER)
			elseif GoldenHUDV1.CAMCPicture == false and GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorBar == true then
				draw.SimpleText(math.Round(thirst), "GoldenHudV1Font", 163, ScrH() - 60, GoldenHUDV1.CAMCNumberColor, TEXT_ALIGN_CENTER)
			elseif GoldenHUDV1.CAMCPicture == true and GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == false then
				draw.SimpleText(math.Round(thirst), "GoldenHudV1Font", 179, ScrH() - 60, GoldenHUDV1.CAMCNumberColor, TEXT_ALIGN_CENTER)
			elseif GoldenHUDV1.CAMCPicture == false and GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == false then
				draw.SimpleText(math.Round(thirst), "GoldenHudV1Font", 163, ScrH() - 60, GoldenHUDV1.CAMCNumberColor, TEXT_ALIGN_CENTER)
			end
		end
	end

-- Money --
	if GoldenHUDV1.MoneyBar then
		if GoldenHUDV1.MoneyPicture == true and GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == true then
			draw.RoundedBox(5, 20, ScrH() - 50 - xthirst, 295, 32, Color(0, 0, 0, 225))
			draw.RoundedBox(5, 60, ScrH() - 47.5 - xthirst, 250, 25, GoldenHUDV1.MoneyColor)

			surface.SetMaterial( moneyicon )
    		surface.SetDrawColor(255, 255, 255, 250) 
			surface.DrawTexturedRect( 25, ScrH() - 12 - xthristnomodif - xthirst, 27, 28 )
		elseif GoldenHUDV1.MoneyPicture == false and GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == true then
			draw.RoundedBox(5, 20, ScrH() - 50 - xthirst, 295, 32, Color(0, 0, 0, 225))
			draw.RoundedBox(5, 22.5, ScrH() - 47.5 - xthirst, 288, 25, GoldenHUDV1.MoneyColor)
		elseif GoldenHUDV1.MoneyPicture == false and GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorBar == true then
			draw.RoundedBox(5, 20, ScrH() - 66 - xthirst, 295, 32, Color(0, 0, 0, 225))
			draw.RoundedBox(5, 22.5, ScrH() - 63.3 - xthirst, 288, 25, GoldenHUDV1.MoneyColor)
		elseif GoldenHUDV1.MoneyPicture == false and GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == false then
			draw.RoundedBox(5, 20, ScrH() - 66 - xthirst, 295, 32, Color(0, 0, 0, 225))
			draw.RoundedBox(5, 22.5, ScrH() - 63.3 - xthirst, 288, 25, GoldenHUDV1.MoneyColor)
		elseif GoldenHUDV1.MoneyPicture == true and GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorBar == true then
			draw.RoundedBox(5, 20, ScrH() - 66 - xthirst, 295, 32, Color(0, 0, 0, 225))
			draw.RoundedBox(5, 60, ScrH() - 63.3 - xthirst, 250, 25, GoldenHUDV1.MoneyColor)

			surface.SetMaterial( moneyicon )
    		surface.SetDrawColor(255, 255, 255, 250) 
			surface.DrawTexturedRect( 25, ScrH() - 28 - xthristnomodif - xthirst, 27, 28 )
		elseif GoldenHUDV1.MoneyPicture == true and GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == false then
			draw.RoundedBox(5, 20, ScrH() - 66 - xthirst, 295, 32, Color(0, 0, 0, 225))
			draw.RoundedBox(5, 60, ScrH() - 63.3 - xthirst, 250, 25, GoldenHUDV1.MoneyColor)

			surface.SetMaterial( moneyicon )
    		surface.SetDrawColor(255, 255, 255, 250) 
			surface.DrawTexturedRect( 25, ScrH() - 28 - xthristnomodif - xthirst, 27, 28 )
		end	

		if GoldenHUDV1.MoneyNumber == true then
			if GoldenHUDV1.MoneyBar == true and GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == true then
				draw.SimpleText(DarkRP.formatMoney(money), "GoldenHudV1Font", 179, ScrH() - 46 - xthirst, GoldenHUDV1.MoneyNumberColor, TEXT_ALIGN_CENTER)
			elseif GoldenHUDV1.MoneyBar == false and GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == true then
				draw.SimpleText(DarkRP.formatMoney(money), "GoldenHudV1Font", 163, ScrH() - 46 - xthirst, GoldenHUDV1.MoneyNumberColor, TEXT_ALIGN_CENTER)
			elseif GoldenHUDV1.MoneyBar == true and GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorBar == true then
				draw.SimpleText(DarkRP.formatMoney(money), "GoldenHudV1Font", 179, ScrH() - 62 - xthirst, GoldenHUDV1.MoneyNumberColor, TEXT_ALIGN_CENTER)
			elseif GoldenHUDV1.MoneyBar == false and GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorBar == true then
				draw.SimpleText(DarkRP.formatMoney(money), "GoldenHudV1Font", 163, ScrH() - 62 - xthirst, GoldenHUDV1.MoneyNumberColor, TEXT_ALIGN_CENTER)
			elseif GoldenHUDV1.MoneyBar == true and GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == false then
				draw.SimpleText(DarkRP.formatMoney(money), "GoldenHudV1Font", 179, ScrH() - 62 - xthirst, GoldenHUDV1.MoneyNumberColor, TEXT_ALIGN_CENTER)
			elseif GoldenHUDV1.MoneyBar == false and GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == false then
				draw.SimpleText(DarkRP.formatMoney(money), "GoldenHudV1Font", 163, ScrH() - 62 - xthirst, GoldenHUDV1.MoneyNumberColor, TEXT_ALIGN_CENTER)
			end
		end
	end


-- Icon Food --
	if GoldenHUDV1.ArmorBar == true and GoldenHUDV1.FoodPicture == true and GoldenHUDV1.FoodBar == true then
    	surface.SetMaterial( foodicon )
    	surface.SetDrawColor(255, 255, 255, 170)
		surface.DrawTexturedRect( 25, ScrH() - 49 - xthirst - xmoney, 28, 29 )

	elseif GoldenHUDV1.ArmorBar == false and GoldenHUDV1.FoodPicture == true and GoldenHUDV1.FoodBar == true then
    	surface.SetMaterial( foodicon )
    	surface.SetDrawColor(255, 255, 255, 170)
		surface.DrawTexturedRect( 25, ScrH() - 65 - xthirst - xmoney, 28, 29 )
	end

-- Icon Armor --
	if GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorPicture == true and GoldenHUDV1.ArmorBar == true then
    	surface.SetMaterial( armoricon )
    	surface.SetDrawColor(255, 255, 255, 170)
		surface.DrawTexturedRect( 25, ScrH() - 84.8 - xthirst - xmoney, 28, 29 )

	elseif GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorPicture == true and GoldenHUDV1.ArmorBar == true then
    	surface.SetMaterial( armoricon )
    	surface.SetDrawColor(255, 255, 255, 170)
		surface.DrawTexturedRect( 25, ScrH() - 65 - xthirst - xmoney, 28, 29 )
	end

-- Icon Health --
	if GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == true and GoldenHUDV1.HealthPicture == true and GoldenHUDV1.HeatlhBar == true then 
    	surface.SetMaterial( healthicon )
    	surface.SetDrawColor(255, 255, 255, 170) 
		surface.DrawTexturedRect( 25, ScrH() - 122 - xthirst - xmoney, 28, 30 )

	elseif GoldenHUDV1.FoodBar == true and GoldenHUDV1.ArmorBar == false and GoldenHUDV1.HealthPicture == true and GoldenHUDV1.HeatlhBar == true then
		surface.SetMaterial( healthicon )
    	surface.SetDrawColor(255, 255, 255, 170) 
		surface.DrawTexturedRect( 25, ScrH() - 102 - xthirst - xmoney, 28, 30 )

	elseif GoldenHUDV1.FoodBar == false and GoldenHUDV1.ArmorBar == true and GoldenHUDV1.HealthPicture == true and GoldenHUDV1.HeatlhBar == true then
		surface.SetMaterial( healthicon )
    	surface.SetDrawColor(255, 255, 255, 170) 
		surface.DrawTexturedRect( 25, ScrH() - 102 - xthirst - xmoney, 28, 30 )
	end

end )

hook.Add("HUDPaint","GoldenHudV1.Ammo",function()

-- Crosshair --
	if GoldenHUDV1.EnableCrosshair == true then
		ply = LocalPlayer()
		if ply:InVehicle() then return end
		if not ply:Alive() then return end
		draw.RoundedBox( 3, ScrW() / 2 - 3, ScrH() / 2 - 3, 7, 7, GoldenHUDV1.CrosshairColor)
	end

-- Ammo --
	if GoldenHUDV1.EnableAmmoBar then
		local ply = LocalPlayer()
		if !IsValid(ply:GetActiveWeapon()) then return end
		wep = ply:GetActiveWeapon()
		total = ply:GetAmmoCount(wep:GetPrimaryAmmoType())
		clip = wep:Clip1()
		nicename = wep:GetPrintName()
		if clip < 0 or table.HasValue( GoldenHUDV1.BlackListWeapon or "weapon_physcannon", wep:GetClass() ) then return end
		if string.len(nicename) > 15 then nicename = string.Left( nicename, 13 ) .. "..." end
		if GoldenHUDV1.EnableNameWeapon then
			draw.RoundedBox( 5, 328, ScrH() - 70, 150 - 2, 25, GoldenHUDV1.HeaderAmmo )
		end
			draw.RoundedBox( 5, 328, ScrH() - 43, 150 - 2, 25, GoldenHUDV1.BackgroundAmmo )
		if GoldenHUDV1.EnableNameWeapon then
		  	draw.RoundedBox( 0, 328, ScrH() - 45, 150 - 2, 2, GoldenHUDV1.AmmoBar )
		end
		draw.SimpleText( "/", "GoldenHudV1Font", 400, ScrH() - 43, GoldenHUDV1.AmmoTextColor, TEXT_ALIGN_CENTER )
		draw.SimpleText( clip, "GoldenHudV1Font", 390, ScrH() - 43, GoldenHUDV1.AmmoTextColor, 2 )
		draw.SimpleText( total, "GoldenHudV1Font", 410, ScrH() - 43, GoldenHUDV1.AmmoTextColor, 0 )
		if GoldenHUDV1.EnableNameWeapon then
			draw.SimpleText( nicename, "GoldenHudV1Font", 400, ScrH() - 69, GoldenHUDV1.AmmoTextColor, TEXT_ALIGN_CENTER ) 
		end
	end
end )

local function HideElements( element )
	if HideElementsTable[ element ] then
		return false
	end
end
hook.Add( "HUDShouldDraw", "HideElements", HideElements )

hook.Add( "HUDDrawTargetID", "ByeTargetIdHUD", function()
    return false
end )
