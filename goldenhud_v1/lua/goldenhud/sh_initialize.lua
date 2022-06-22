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
	
	Msg( "\n" )
	Msg( "\n" )
	Msg( "////////////////////////////////////////\n" )
	Msg( "//       Golden Hud V1 Library        //\n" )
	Msg( "////////////////////////////////////////\n" )
	Msg( "// Loading...                         //\n" )
	Msg( "//  goldenhud/sh_config.lua           //\n" )
	AddCSLuaFile( "sh_config.lua" )
	include( "sh_config.lua" )
	Msg( "// Load Complete!                     //\n" )
	Msg( "// Loading...                         //\n" )
	Msg( "//  goldenhud/cl_init.lua             //\n" )
	AddCSLuaFile( "cl/cl_init.lua" )
	Msg( "// Load Complete!                     //\n" )
	Msg( "// Loading...                         //\n" )
	Msg( "//  goldenhud/cl_font.lua             //\n" )
	AddCSLuaFile( "cl/cl_font.lua" )
	Msg( "// Load Complete!                     //\n" )
	Msg( "// Loading...                         //\n" )
	Msg( "//  goldenhud/cl_lockdown.lua         //\n" )
	AddCSLuaFile( "cl/cl_lockdown.lua" )
	Msg( "// Load Complete!                     //\n" )
	Msg( "// Loading...                         //\n" )
	Msg( "//  goldenhud/cl_props.lua            //\n" )
	AddCSLuaFile( "cl/cl_props.lua" )
	Msg( "// Load Complete!                     //\n" )
	Msg( "// Loading...                         //\n" )
	Msg( "//  goldenhud/cl_agenda.lua           //\n" )
	AddCSLuaFile( "cl/cl_agenda.lua" )
	Msg( "// Load Complete!                     //\n" )
	Msg( "// Loading...                         //\n" )
	Msg( "//  goldenhud/cl_vehicle.lua          //\n" )
	AddCSLuaFile( "cl/cl_vehicle.lua" )
	Msg( "// Load Complete!                     //\n" )
	Msg( "// Loading...                         //\n" )
	Msg( "//  goldenhud/cl_wanted.lua           //\n" )
	AddCSLuaFile( "cl/cl_wanted.lua" )
	Msg( "// Load Complete!                     //\n" )
	Msg( "// Loading...                         //\n" )
	Msg( "//  goldenhud/cl_notifications.lua    //\n" )
	AddCSLuaFile( "cl/cl_notifications.lua" )
	Msg( "// Load Complete!                     //\n" )
	Msg( "// Loading...                         //\n" )
	Msg( "//  goldenhud/cl_headplayer.lua       //\n" )
	AddCSLuaFile( "cl/cl_headplayer.lua" )
	Msg( "// Load Complete!                     //\n" )
	Msg( "// Loading...                         //\n" )
	Msg( "//  goldenhud/cl_doors.lua            //\n" )
	AddCSLuaFile( "cl/cl_doors.lua" )
	Msg( "// Load Complete!                     //\n" )
	Msg( "// Loading...                         //\n" )
	Msg( "//  goldenhud/cl_voiceicon.lua        //\n" )
	AddCSLuaFile( "cl/cl_voiceicon.lua" )
	Msg( "// Load Complete!                     //\n" )
	Msg( "// Loading...                         //\n" )
	Msg( "//  goldenhud/cl_medicmod.lua         //\n" )
	AddCSLuaFile( "cl/cl_medicmod.lua" )
	Msg( "// Load Complete!                     //\n" )
	Msg( "////////////////////////////////////////\n" )
	Msg( "\n" )
	Msg( "\n" )

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
		resource.AddFile("materials/golden_hud/blood-drop.png")
		resource.AddFile("materials/golden_hud/broken-bone.png")
		resource.AddFile("materials/golden_hud/pulse.png")
		resource.AddFile("materials/golden_hud/poison.png")
		resource.AddFile("materials/golden_hud/syringe.png")
		resource.AddFile("materials/golden_hud/speaker.png")
		resource.AddFile("materials/golden_hud/microphone.png")
		resource.AddFile("materials/golden_hud/money-bag.png")
		resource.AddFile("materials/golden_hud/loading.png")

	end

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
	include( "cl/cl_medicmod.lua" )
	include( "cl/cl_voiceicon.lua" )

end
