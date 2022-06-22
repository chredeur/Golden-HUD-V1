AddCSLuaFile( 'goldenhud/sh_config.lua' )
AddCSLuaFile( 'goldenhud/sh_initialize.lua' )

include( 'goldenhud/sh_initialize.lua' )
Msg( "[goldenhudv1] sh_initialize.lua load !\n" )


-- Version --
local GoldenV1Version = "2.3" -- NEVER TOUCH THIS!

if SERVER then
	util.AddNetworkString( "goldenhudversion" )

	hook.Add( "PlayerInitialSpawn", "GoldenHudV1.Version", function(ply)
		timer.Simple(5, function()
			if !IsValid(ply) then return end
			net.Start("goldenhudversion") 
			net.Send(ply)
			if !ply:IsSuperAdmin() then return end
			http.Fetch( "https://raw.githubusercontent.com/goldensdevs/goldenhudv1-etc/master/goldenhudv1-version.txt", function( body, len, headers, code )
				local GoldenReceive = string.gsub( body, "\n", "" )
				if (GoldenReceive != "400: Invalid request") and (GoldenReceive != "404: Not Found") and (GoldenReceive != GoldenV1Version) then 
					ply:ChatPrint( GoldenHUDV1.Language[ GoldenHUDV1.ConfigLanguage ][ "version_1" ] ..GoldenV1Version.. GoldenHUDV1.Language[ GoldenHUDV1.ConfigLanguage ][ "version_2" ] ..GoldenReceive )
				end
			end,
			function( error )
			print("GoldenHudV1 HTTP (error) : " , error)
			end)
		end)
	end)
end