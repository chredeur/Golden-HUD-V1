
AddCSLuaFile( 'goldenhud/sh_config.lua' )
AddCSLuaFile( 'goldenhud/sh_initialize.lua' )

include( 'goldenhud/sh_initialize.lua' )
Msg( "[goldenhudv1] sh_initialize.lua load !\n" )

local GoldenVersion = "1.3"

if SERVER then

util.AddNetworkString( "goldenhudversion" )

hook.Add( "PlayerInitialSpawn", "OuvertureCentralFpsSpawn", function(ply)
timer.Simple(5, function()
if !IsValid(ply) then return end
net.Start("goldenhudversion") 
net.Send(ply)
if !ply:IsSuperAdmin() then return end
http.Fetch( "https://raw.githubusercontent.com/goldensdevs/goldenhudv1-etc/master/goldenhudv1-version.txt", function( body, len, headers, code )
local GoldenReceive = string.gsub( body, "\n", "" )
if (GoldenReceive != "400: Invalid request") and (GoldenReceive != "404: Not Found") and (GoldenReceive != GoldenVersion) then 
ply:ChatPrint( "[SuperAdmin Alert] Obsolete version of Golden Hud V1, Version : " ..GoldenVersion.. " , download the latest version on Github or Workshop or mtxserv resources, Version: " ..GoldenReceive )
end
end,
function( error )
print("GoldenHudV1 HTTP (error) : " , error)
end)
end)
end)

end