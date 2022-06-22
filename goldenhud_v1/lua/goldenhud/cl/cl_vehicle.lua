local speedometericon = Material( "golden_hud/speedometer.png" )
local fuelicon = Material( "golden_hud/fuel.png" )
local engineicon = Material( "golden_hud/engine.png" )

local fuel = 0
local fuelmax = 0
local health = 0

local mphtext, speed

hook.Add("HUDPaint", "GoldenHudV1.Vehicle", function()
	if GoldenHUDV1.VehicleEnable == false && GoldenHUDV1.SpeedometerHud == false then return end

	local y = ScrW() - 100
	local x = ScrH() - 155

	local colorhealth = Color(255, 255, 255, 255)
	local colorfuel = Color(255, 255, 255, 255)

	local vehicley = 0
	local vehicley2 = 0

	local ply = LocalPlayer()
	
	if not ply:InVehicle() then return end
	if GoldenHUDV1.VehicleEnable && GoldenHUDV1.Vehicle == "svmod" && SVMOD:GetAddonState() then hook.Remove("HUDPaint", "SV_HUDPaint") end

	local veh = ply:GetVehicle()
	local vehs = ply:GetVehicle()

	if veh:GetDriver() == NULL then return end
	if veh:GetClass() == "prop_vehicle_prisoner_pod" then
		veh = veh:GetParent()
		if not IsValid(veh) then return end
	end

	if vehs:GetClass() == "prop_vehicle_prisoner_pod" then return end

	if GoldenHUDV1.VehicleEnable && GoldenHUDV1.Vehicle == "svmod" && SVMOD:GetAddonState() && SVMOD:IsVehicle(LocalPlayer():GetVehicle()) then
		if not SVMOD:IsVehicle(vehs) then return end
		fuel = math.Round(vehs:SV_GetFuel())
		fuelmax = vehs:SV_GetMaxFuel()
		health = math.Round(vehs:SV_GetHealth())
		vehicley = vehicley + 37
		vehicley2 = vehicley2 + 37
	elseif GoldenHUDV1.VehicleEnable && GoldenHUDV1.Vehicle == "vcmod" && VC then
		fuel = math.Round(vehs:VC_fuelGet(false))
		fuelmax = vehs:VC_fuelGetMax()
		health = math.Round(vehs:VC_getHealth(true))
		vehicley = vehicley + 37
		vehicley2 = vehicley2 + 37
	end

	if health < 50 then
		colorhealth = Color(209, 162, 72, 255)
	end

	if health < 20 then
		colorhealth = Color(217, 47, 47, 255)
	end

	if fuel < 6 then
		colorfuel = Color(217, 47, 47, 255)
	end

	if GoldenHUDV1.SpeedometerHud then

		if GoldenHUDV1.MPHCounter then
			speed = math.floor(veh:GetVelocity():Length() * 0.0568188)
			mphtext = "MPH"
		else
			speed = math.floor(veh:GetVelocity():Length() * 0.09144)
			mphtext = "KM/H"
		end

		draw.RoundedBox( 5, y - 73, x + 106 - vehicley - vehicley2, 144, 32, GoldenHUDV1.VehicleBackgroundColor )

		if speed < 10 then speed = "0" .. speed end
		draw.SimpleText(speed.." "..mphtext, "GoldenHudV1Font", y - 30, x + 111 - vehicley - vehicley2, Color(255, 255, 255, 255))

		surface.SetMaterial( speedometericon )
	    surface.SetDrawColor(255, 255, 255, 250) 
		surface.DrawTexturedRect( y - 67, x + 107 - vehicley - vehicley2, 25, 25 )

	end

	if GoldenHUDV1.VehicleEnable && GoldenHUDV1.Vehicle == "vcmod" or GoldenHUDV1.VehicleEnable && GoldenHUDV1.Vehicle == "svmod" then

		draw.RoundedBox( 5, y - 73, x + 106 - vehicley2, 144, 32, GoldenHUDV1.VehicleBackgroundColor )

		draw.SimpleText(health.." %", "GoldenHudV1Font", y - 30, x + 111 - vehicley2, colorhealth)

		surface.SetMaterial( engineicon )
		surface.SetDrawColor(255, 255, 255, 250) 
		surface.DrawTexturedRect( y - 66, x + 110 - vehicley2, 25, 25 )

		draw.RoundedBox( 5, y - 73, x + 106, 144, 32, GoldenHUDV1.VehicleBackgroundColor )

		draw.SimpleText(fuel.."/"..fuelmax.." l", "GoldenHudV1Font", y - 30, x + 111, colorfuel, TEXT_ALIGN_LEFT)

		surface.SetMaterial( fuelicon )
		surface.SetDrawColor(255, 255, 255, 250) 
		surface.DrawTexturedRect( y - 66, x + 110, 25, 25 )
	end
end)