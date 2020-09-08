/*#################################################
###												###
###          GoldenHUDV1 config file            ###
###				    By chredeur					###
#################################################*/
GoldenHUDV1 = {}

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
