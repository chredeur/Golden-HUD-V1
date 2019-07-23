--[[---------------------------------------------------------
	Icons made by: 
	Freepik from www.flaticon.com 
	Licensed under: CC BY 3.0;

	Icon Download
-----------------------------------------------------------]]
resource.AddFile("materials/golden_hud/health.png")
resource.AddFile("materials/golden_hud/armor.png")
resource.AddFile("materials/golden_hud/hunger.png")

if SERVER then
	resource.AddWorkshop("1810284433")
end

if SERVER then

	AddCSLuaFile( "sh_config.lua" )

	AddCSLuaFile( "cl/cl_init.lua" )

	
	include( "sh_config.lua" )


else

	include( "sh_config.lua" )

	include( "cl/cl_init.lua" )

end
