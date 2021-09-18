local speedometericon = Material( "golden_hud/speedometer.png" )
local fuelicon = Material( "golden_hud/fuel.png" )
local engineicon = Material( "golden_hud/engine.png" )
local mphtext, speed
hook.Add("HUDPaint", "GoldenHudV1.HudSpeedometer", function()
	if GoldenHUDV1.SpeedometerHud == false then return end
	local y = ScrW() - 100
	local x = ScrH() - 225
	local ply = LocalPlayer()
	if not ply:InVehicle() then return end
	local veh = ply:GetVehicle()
	local vehs = ply:GetVehicle()
	if veh:GetClass() == "prop_vehicle_prisoner_pod" then
		veh = veh:GetParent()
		if not IsValid(veh) then return end
	end

	if GoldenHUDV1.EnableCompatibilityVCMod == false and GoldenHUDV1.EnableCompatibilitySVMod == false then
 		x = ScrH() - 160
	end

	if ply:GetVehicle():GetClass() == "prop_vehicle_prisoner_pod" then return end

	if GoldenHUDV1.MPHCounter then
		speed = math.floor(veh:GetVelocity():Length() * 0.0568188)
		mphtext = "MPH"
	else
		speed = math.floor(veh:GetVelocity():Length() * 0.09144)
		mphtext = "KM/H"
	end

	draw.RoundedBox( 5, y - 73, x + 106, 144, 32, GoldenHUDV1.SpeedometerBackgroundColor )

	if speed < 10 then speed = "0" .. speed end
	draw.SimpleText(speed.." "..mphtext, "GoldenHudV1Font", y - 30, x + 111, Color(255, 255, 255, 255))

	surface.SetMaterial( speedometericon )
    surface.SetDrawColor(255, 255, 255, 250) 
	surface.DrawTexturedRect( y - 67, x + 107, 29, 29 )

end)

hook.Add("HUDPaint", "GoldenHudV1.VCMOD", function()
	if GoldenHUDV1.EnableCompatibilityVCMod == false then return end
	local y = ScrW() - 100
	local x = ScrH() - 187
	local ply = LocalPlayer()
	local colorhealth = Color(255, 255, 255, 255)
	local colorfuel = Color(255, 255, 255, 255)
	if not ply:InVehicle() then return end
	local veh = ply:GetVehicle()
	local vehs = ply:GetVehicle()
	if veh:GetDriver() == NULL then return end
	if veh:GetClass() == "prop_vehicle_prisoner_pod" then
		veh = veh:GetParent()
		if not IsValid(veh) then return end
	end
	if vehs:GetClass() == "prop_vehicle_prisoner_pod" then return end

	local fuel = math.Round(vehs:VC_fuelGet(false))
	local health = math.Round(vehs:VC_getHealth(true))
	
	if health < 50 then
		colorhealth = Color(209, 162, 72, 255)
	end

	if health < 20 then
		colorhealth = Color(217, 47, 47, 255)
	end

	draw.RoundedBox( 5, y - 73, x + 106, 144, 32, GoldenHUDV1.CVCModBackgroundColor )
	draw.SimpleText(health.." %", "GoldenHudV1Font", y - 30, x + 111, colorhealth)

	surface.SetMaterial( engineicon )
	surface.SetDrawColor(255, 255, 255, 250) 
	surface.DrawTexturedRect( y - 66, x + 110, 25, 25 )

	if fuel < 6 then
		colorfuel = Color(217, 47, 47, 255)
	end
	draw.RoundedBox( 5, y - 73, x + 144, 144, 32, GoldenHUDV1.CVCModBackgroundColor )
	draw.SimpleText(fuel.."/"..vehs:VC_fuelGetMax().." l", "GoldenHudV1Font", y - 30, x + 148, colorfuel)

	surface.SetMaterial( fuelicon )
	surface.SetDrawColor(255, 255, 255, 250) 
	surface.DrawTexturedRect( y - 66, x + 148, 25, 25 )

end)

hook.Add("HUDPaint", "GoldenHudV1.SVMOD", function()
	if GoldenHUDV1.EnableCompatibilitySVMod == false then return end
	local y = ScrW() - 100
	local x = ScrH() - 187
	local ply = LocalPlayer()
	local colorhealth = Color(255, 255, 255, 255)
	local colorfuel = Color(255, 255, 255, 255)
	if not ply:InVehicle() then return end
	local veh = ply:GetVehicle()
	local vehs = ply:GetVehicle()
	if veh:GetDriver() == NULL then return end
	if veh:GetClass() == "prop_vehicle_prisoner_pod" then
		veh = veh:GetParent()
		if not IsValid(veh) then return end
	end
	if vehs:GetClass() == "prop_vehicle_prisoner_pod" then return end

	local fuel = math.Round(vehs:SV_GetFuel())
	local health = math.Round(vehs:SV_GetHealth())
	
	if health < 50 then
		colorhealth = Color(209, 162, 72, 255)
	end

	if health < 20 then
		colorhealth = Color(217, 47, 47, 255)
	end

	draw.RoundedBox( 5, y - 73, x + 106, 144, 32, GoldenHUDV1.CSVModBackgroundColor )
	draw.SimpleText(health.." %", "GoldenHudV1Font", y - 30, x + 111, colorhealth)

	surface.SetMaterial( engineicon )
	surface.SetDrawColor(255, 255, 255, 250) 
	surface.DrawTexturedRect( y - 66, x + 110, 25, 25 )

	if fuel < 6 then
		colorfuel = Color(217, 47, 47, 255)
	end
	draw.RoundedBox( 5, y - 73, x + 144, 144, 32, GoldenHUDV1.CSVModBackgroundColor )
	draw.SimpleText(fuel.."/"..vehs:SV_GetMaxFuel().." l", "GoldenHudV1Font", y - 30, x + 148, colorfuel)

	surface.SetMaterial( fuelicon )
	surface.SetDrawColor(255, 255, 255, 250) 
	surface.DrawTexturedRect( y - 66, x + 148, 25, 25 )

end)