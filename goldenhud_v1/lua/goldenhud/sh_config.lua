/*#################################################
###												###
###          GoldenHUDV1 config file            ###
###				    By chredeur					###
#################################################*/

GoldenHUDV1 = GoldenHUDV1 or {}

-- FastDL --
GoldenHUDV1.FastDL = true -- Activate disable the FastDL

-- WorkShopDL --
GoldenHUDV1.WorkShopDL = true -- Activate disable the WorkShopDL

-- Language --
GoldenHUDV1.ConfigLanguage = "en" -- en, fr 

-- Speedometer Hud --
GoldenHUDV1.SpeedometerHud = true -- Activate disable the Speedometer Hud
GoldenHUDV1.MPHCounter = true -- true = MPH system / false = KM/H system
GoldenHUDV1.SpeedometerBackgroundColor = Color(0, 0, 0, 225) -- Change the color of the Background

-- Compatibility VCMod --
GoldenHUDV1.EnableCompatibilityVCMod = false -- Activate disable the Compatibility VCMod
GoldenHUDV1.CVCModBackgroundColor = Color(0, 0, 0, 225) -- Change the color of the Background

-- Props Hud --
GoldenHUDV1.PropsHUD = true -- Activate disable the Props Hud
GoldenHUDV1.PropsBackgroundColor = Color(0, 0, 0, 225) -- Change the color of the Background
GoldenHUDV1.PropsTextColor = Color(255, 255, 255, 255) -- Change the color of the text

-- Compatibility Advanced Cooking Mod --
GoldenHUDV1.EnableCompatibilityACM = false -- Activate disable the Compatibility Advanced Cooking Mod
GoldenHUDV1.CCAMCNumber = true -- Activate disable the number of the CAMC
GoldenHUDV1.CAMCPicture = true -- Enable disable image of the CAMC
GoldenHUDV1.CAMCColor = Color(74, 179, 242, 150) -- Change the color of the CAMC bar 
GoldenHUDV1.CAMCNumberColor = Color(255, 255, 255, 255) -- Change the color of the number

-- Door Hud --
GoldenHUDV1.DoorHUD = true -- Activate disable the Door Hud

-- Head hud --
GoldenHUDV1.EnableHead = true -- Activate disable the Head hud

-- Notification --
GoldenHUDV1.EnableNotif = true -- Activate disable the Notification

-- Wanted --
GoldenHUDV1.EnableWanted = true
GoldenHUDV1.WantedColorTitle = Color(0, 132, 255, 255) -- Change the color of the Title
GoldenHUDV1.WantedColorText = Color(255, 255, 255, 150) -- Change the color of the Text
GoldenHUDV1.WantedColor = Color(0, 0, 0, 225) -- Change the color of the Wanted

-- Lockdown --
GoldenHUDV1.EnableLockdown = true -- Activate disable the Lockdown
GoldenHUDV1.LockdownColor = Color(0, 0, 0, 225) -- Change the color of the Lockdown
GoldenHUDV1.LockdownColorTitle = Color(255, 96, 96, 150) -- Change the color of the Title
GoldenHUDV1.LockdownColorText = Color(255, 255, 255, 150) -- Change the color of the Text

-- Agenda --
GoldenHUDV1.EnableAgenda = true -- Activate disable the Agenda
GoldenHUDV1.AgendaColor = Color(0, 0, 0, 225) -- Change the color of the Agenda
GoldenHUDV1.AgendaColorTitle = Color(255, 255, 255, 255) -- Change the color of the Title
GoldenHUDV1.AgendaColorText = Color(255, 255, 255, 255) -- Change the color of the Text
GoldenHUDV1.AgendaPosX = 40 -- Change position x
GoldenHUDV1.AgendaPosY = 75 -- Change position y

-- Crosshair --
GoldenHUDV1.EnableCrosshair = true -- Activate disable the Crosshair
GoldenHUDV1.CrosshairColor = Color(255, 255, 255, 255) -- Change the color of the Crosshair

-- Health Bar --
GoldenHUDV1.HealthColor = Color(255, 100, 62, 150) -- Change the color of the life bar 
GoldenHUDV1.HeatlhBar = true  -- Activate disable the life bar
GoldenHUDV1.HealthNumber = true -- Activate disable the number of life
GoldenHUDV1.HealthNumberColor = Color(255, 255, 255, 150) -- Change the color of the number of life
GoldenHUDV1.HealthPicture = true -- Enable disable image

-- Armor Bar --
GoldenHUDV1.ArmorColor = Color(31, 126, 208, 150) -- Change the color of the armor bar
GoldenHUDV1.ArmorBar = true -- Activate disable armor bar
GoldenHUDV1.ArmorNumber = true -- Activate disable the number of armor
GoldenHUDV1.ArmorNumberColor = Color(255, 255, 255, 150) -- Change the color of the number of armor
GoldenHUDV1.ArmorPicture = true -- Enable disable image
 
-- Food Bar --
GoldenHUDV1.FoodColor = Color(1, 142, 8, 150) -- Change the color of the food bar
GoldenHUDV1.FoodBar = true -- Activate deactivate the food bar
GoldenHUDV1.FoodNumber = true -- Activate disable the number of food
GoldenHUDV1.FoodNumberColor = Color(255, 255, 255, 150) -- Change the color of the number of food
GoldenHUDV1.FoodPicture = true -- Enable disable image

-- Ammo Bar --
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

-- Language --
GoldenHUDV1.Language = {
	["fr"] = {
		["wanted"] = "Rechercher",
		["wanted info"] = "Vous êtes rechercher par la police",
		["lockdown"] = "Couvre-feu",
		["Unowned"] = "A vendre (F2)",
		["keys_owned_by"] = "Porte Vendue\nOwner: ",
		["props"] = "Objets:",
		["version_1"] = "[Alerte SuperAdmin GoldenHudV1] Version obsolète de GoldenHudV1, Version: ",
		["version_2"] = " , téléchargez la dernière version sur Github, Workshop ou mtxserv resources, Version: ",
	},
	["en"] = {
		["wanted"] = "Wanted",
		["wanted info"] = "You are wanted by police",
		["lockdown"] = "Lockdown",
		["Unowned"] = "For Sale (F2)",
		["keys_owned_by"] = "Sold Door\nOwner: ",
		["props"] = "Props:",
		["version_1"] = "[GoldenHudV1 SuperAdmin Alert] Obsolete version of Golden Hud V1, Version : ",
		["version_2"] = " , download the latest version on Github, Workshop or mtxserv resources, Version: ",
	}
}

-- Version --
GoldenHUDV1.GoldenV1Version = "2.0" -- NEVER TOUCH THIS!