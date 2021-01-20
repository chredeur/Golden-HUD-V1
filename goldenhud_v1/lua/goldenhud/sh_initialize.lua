--[[---------------------------------------------------------
	Icons made by: 
	Freepik from www.flaticon.com 
	Licensed under: CC BY 3.0;

	Icon Download
-----------------------------------------------------------]]

include("sh_config.lua")

if SERVER then


	if GoldenHUDV1.WorkShopDL then
		resource.AddWorkshop("1813097750")
	end

	AddCSLuaFile( "sh_config.lua" )
	AddCSLuaFile( "cl/cl_init.lua" )
	AddCSLuaFile( "cl/cl_notifications.lua" )
	AddCSLuaFile( "cl/cl_agenda.lua" )
	AddCSLuaFile( "cl/cl_lockdown.lua" )
	AddCSLuaFile( "cl/cl_font.lua" )
	AddCSLuaFile( "cl/cl_wanted.lua" )
	AddCSLuaFile( "cl/cl_headplayer.lua" )
	AddCSLuaFile( "cl/cl_doors.lua" )
	AddCSLuaFile( "cl/cl_props.lua" )
	AddCSLuaFile( "cl/cl_vehicle.lua" )

	if GoldenHUDV1.FastDL then
		resource.AddFile("materials/golden_hud/health.png")
		resource.AddFile("materials/golden_hud/armor.png")
		resource.AddFile("materials/golden_hud/hunger.png")
		resource.AddFile("materials/golden_hud/cleanup.png")
		resource.AddFile("materials/golden_hud/error.png")
		resource.AddFile("materials/golden_hud/generic.png")
		resource.AddFile("materials/golden_hud/undo.png")
		resource.AddFile("materials/golden_hud/hint.png")
		resource.AddFile("materials/golden_hud/head.png")
		resource.AddFile("materials/golden_hud/water-bottle.png")
		resource.AddFile("materials/golden_hud/surface.png")
		resource.AddFile("materials/golden_hud/speedometer.png")
		resource.AddFile("materials/golden_hud/fuel.png")
		resource.AddFile("materials/golden_hud/engine.png")
	end

	Msg( "\n" )
	Msg( "\n" )
	Msg( "///////////////////////////////\n" )
	Msg( "//   Golden Hud V1 Library   //\n" )
	Msg( "///////////////////////////////\n" )
	Msg( "// Loading...                //\n" )
	Msg( "//  goldenhud/sh_config.lua  //\n" )
	include( "sh_config.lua" )
	Msg( "// Load Complete!            //\n" )
	Msg( "///////////////////////////////\n" )
	Msg( "\n" )
	Msg( "\n" )

elseif CLIENT then

	include( "cl/cl_agenda.lua")
	include( "cl/cl_init.lua" )
	include( "cl/cl_notifications.lua" )
	include( "cl/cl_lockdown.lua" )
	include( "cl/cl_font.lua" )
	include( "cl/cl_wanted.lua" )
	include( "cl/cl_headplayer.lua" )
	include( "cl/cl_doors.lua" )
	include( "cl/cl_props.lua" )
	include( "cl/cl_vehicle.lua" )

end
