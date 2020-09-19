/*#################################################
###												###
###          GoldenHUDV1 config file            ###
###				    By chredeur					###
#################################################*/
GoldenHUDV1 = {}

-- Language
GoldenHUDV1.ConfigLanguage = "en" -- en, fr 

-- Head hud
GoldenHUDV1.EnableHead = true -- Activate disable the Head hud

-- Notification
GoldenHUDV1.EnableNotif = true -- Activate disable the Notification

-- Wanted
GoldenHUDV1.EnableWanted = true
GoldenHUDV1.WantedColorTitle = Color(0, 132, 255, 255) -- Change the color of the Title
GoldenHUDV1.WantedColorText = Color(255, 255, 255, 150) -- Change the color of the Text
GoldenHUDV1.WantedColor = Color(0, 0, 0, 225) -- Change the color of the Wanted

-- Lockdown
GoldenHUDV1.EnableLockdown = true -- Activate disable the Lockdown
GoldenHUDV1.LockdownColor = Color(0, 0, 0, 225) -- Change the color of the Lockdown
GoldenHUDV1.LockdownColorTitle = Color(255, 96, 96, 150) -- Change the color of the Title
GoldenHUDV1.LockdownColorText = Color(255, 255, 255, 150) -- Change the color of the Text

-- Agenda
GoldenHUDV1.EnableAgenda = true -- Activate disable the Agenda
GoldenHUDV1.AgendaColor = Color(0, 0, 0, 225) -- Change the color of the Agenda
GoldenHUDV1.AgendaColorTitle = Color(255, 255, 255, 255) -- Change the color of the Title
GoldenHUDV1.AgendaColorText = Color(255, 255, 255, 255) -- Change the color of the Text
GoldenHUDV1.AgendaPosX = 40 -- Change position x
GoldenHUDV1.AgendaPosY = 75 -- Change position y

-- Crosshair
GoldenHUDV1.EnableCrosshair = true -- Activate disable the Crosshair
GoldenHUDV1.CrosshairColor = Color(255, 255, 255, 255) -- Change the color of the Crosshair

-- Health Bar
GoldenHUDV1.HealthColor = Color(255, 100, 62, 150) -- Change the color of the life bar 
GoldenHUDV1.HeatlhBar = true  -- Activate disable the life bar
GoldenHUDV1.HealthNumber = true -- Activate disable the number of life
GoldenHUDV1.HealthNumberColor = Color(255, 255, 255, 150) -- Change the color of the number of life
GoldenHUDV1.HealthPicture = true -- Enable disable image

-- Armor Bar
GoldenHUDV1.ArmorColor = Color(31, 126, 208, 150) -- Change the color of the armor bar
GoldenHUDV1.ArmorBar = true -- Activate disable armor bar
GoldenHUDV1.ArmorNumber = true -- Activate disable the number of armor
GoldenHUDV1.ArmorNumberColor = Color(255, 255, 255, 150) -- Change the color of the number of armor
GoldenHUDV1.ArmorPicture = true -- Enable disable image
 
-- Food Bar
GoldenHUDV1.FoodColor = Color(1, 142, 8, 150) -- Change the color of the food bar
GoldenHUDV1.FoodBar = true -- Activate deactivate the food bar
GoldenHUDV1.FoodNumber = true -- Activate disable the number of food
GoldenHUDV1.FoodNumberColor = Color(255, 255, 255, 150) -- Change the color of the number of food
GoldenHUDV1.FoodPicture = true -- Enable disable image

-- Ammo Bar 
GoldenHUDV1.EnableAmmoBar = true -- Activate disable ammo bar
GoldenHUDV1.HeaderAmmo = Color(0, 0, 0, 225) -- Change the color the header
GoldenHUDV1.BackgroundAmmo = Color(0, 0, 0, 225) -- Change the color of the background
GoldenHUDV1.AmmoBar = Color(255, 255, 255, 255)	-- Change the color of the ammo bar
GoldenHUDV1.AmmoTextColor = Color(255, 255, 255, 255) -- Change the color of the text
GoldenHUDV1.EnableNameWeapon = true 
GoldenHUDV1.BlackListWeapon = { -- Blacklist the weapon
	"weapon_keypadchecker",
	"weapon_physcannon",
	"weapon_bugbait",
	"weapon_slam",
	"sent_bong",
	"sent_messure", 
	"sent_sniffer", 	
	"sent_tablet",
	"pass_police_nationale_1"
}

-- Language
GoldenHUDV1.Language = {														
	["fr"] = {																					
		["wanted"] = "Rechercher",										
		["wanted info"] = "Vous éte recherché par la police",			
		["lockdown"] = "Couvre-feu",															
	},																	
	["en"] = {																							
		["wanted"] = "Wanted",											
		["wanted info"] = "You are wanted by police",				
		["lockdown"] = 'Lockdown',																																
	}																	
}	
