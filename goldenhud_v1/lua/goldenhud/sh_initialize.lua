--[[---------------------------------------------------------
	Icons made by: 
	Freepik from www.flaticon.com 
	Licensed under: CC BY 3.0;

	Icon Download
-----------------------------------------------------------]]
resource.AddFile("materials/golden_hud/health.png")
resource.AddFile("materials/golden_hud/armor.png")
resource.AddFile("materials/golden_hud/hunger.png")

resource.AddFile("materials/golden_hud/cleanup.png")
resource.AddFile("materials/golden_hud/error.png")
resource.AddFile("materials/golden_hud/generic.png")
resource.AddFile("materials/golden_hud/undo.png")
resource.AddFile("materials/golden_hud/hint.png")

AddCSLuaFile( "sh_config.lua" )
AddCSLuaFile( "cl/cl_init.lua" )
AddCSLuaFile( "cl/cl_notifications.lua" )


if SERVER then
	resource.AddWorkshop("1810284433")

	Msg( "///////////////////////////////\n" )
	Msg( "//   Golden Hud V1 Library   //\n" )
	Msg( "///////////////////////////////\n" )
	Msg( "// Loading...                //\n" )
	Msg( "//  goldenhud/sh_config.lua  //\n" )
	include( "sh_config.lua" )
	Msg( "// Load Complete!            //\n" )
	Msg( "///////////////////////////////\n" )

else

	include( "sh_config.lua" )

	include( "cl/cl_init.lua" )
	include( "cl/cl_notifications.lua" )

end
