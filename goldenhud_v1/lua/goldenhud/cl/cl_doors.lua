--[[ HUD Doors  --------------------------------------------------------------------------------------

HUD Doors made by Numerix (https://steamcommunity.com/id/numerix/) 

Modified by chredeur thank you Numerix for your help.

--------------------------------------------------------------------------------------------------]]

local Door = {
    ["prop_door_rotating"] = true,
    ["func_door"] = true,
    ["func_door_rotating"] = true,
}

local function GetDrawPosAng(door)
    local dimens = door:OBBMaxs() - door:OBBMins()
    local center = door:OBBCenter()
    local min, j 
    local lpos, lang

    for i=1, 3 do
        if !min or dimens[i] <= min then
            j = i
            min = dimens[i]
        end
    end

    local norm = Vector()
    norm[j] = 1

    local lang = Angle( 0, norm:Angle().y + 90, 90 )

    if door:GetClass() == "prop_door_rotating" then
        lpos = Vector( center.x, center.y, center.z + 25 ) + lang:Up() * (min / 8)
    else
        lpos = center + Vector( 0, 0, 20 ) + lang:Up() * ((min / 2) - 0.1)
    end

    local ang = door:LocalToWorldAngles( lang )
    local dot = ang:Up():Dot( LocalPlayer():GetShootPos() - door:WorldSpaceCenter() )

    if dot < 0 then
        lang:RotateAroundAxis( lang:Right(), 180 )

        if door:GetClass() == "prop_door_rotating" then
            lpos = Vector( center.x - min/6 - 0.1, center.y, center.z + 25 ) + lang:Up() * (min / 10^9)
        else
            lpos = center + Vector( 0, 0, 20 ) + lang:Up() * ((min / 2) - 0.1)
        end
        ang = door:LocalToWorldAngles( lang )

    end

    local pos = door:LocalToWorld( lpos )
    local scale = 0.05

    return pos, ang, scale
end

hook.Add("PostDrawTranslucentRenderables", "GoldenHudV1.DoorHUD", function()
	if GoldenHUDV1.DoorHUD then
    	local ShouldDraw = hook.Call("HUDShouldDraw", GAMEMODE, "DoorHUD")

    	if ShouldDraw == false or !DarkRP then return end

    	for k, v in pairs( ents.GetAll() ) do
        	if Door[v:GetClass()] and LocalPlayer():GetPos():DistToSqr(v:GetPos()) < 500000 then

            	cam.Start3D2D(GetDrawPosAng(v))
                	v:drawDoorInfo()
            	cam.End3D2D()

        	end
    	end
	end
end)

local Entity = FindMetaTable("Entity")

function Entity:drawDoorInfo()
    
    local ply = LocalPlayer()
    local blocked = self:getKeysNonOwnable()
    local superadmin = ply:IsSuperAdmin()
    local doorTeams = self:getKeysDoorTeams()
    local doorGroup = self:getKeysDoorGroup()
    local playerOwned = self:isKeysOwned() or table.GetFirstValue(self:getKeysCoOwners() or {}) ~= nil
    local owned = playerOwned or doorGroup or doorTeams

    local doorInfo = {}

    local title = self:getKeysTitle()
    if title then 
        surface.SetFont("GoldenHudV1Doorstitle")
        local w = surface.GetTextSize(title) + 10
        surface.DrawRect(-w/2,50,w,150)
        draw.SimpleText(title, "GoldenHudV1Doorstitle", 0, 50+150/2, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    if owned then
        table.insert(doorInfo, GoldenHUDV1.Language[ GoldenHUDV1.ConfigLanguage ][ "keys_owned_by" ])
    end

    if playerOwned then
        if self:isKeysOwned() then table.insert(doorInfo, self:getDoorOwner():Nick()) end
        for k in pairs(self:getKeysCoOwners() or {}) do
            local ent = Player(k)
            if not IsValid(ent) or not ent:IsPlayer() then continue end
            table.insert(doorInfo, ent:Nick())
        end

        local allowedCoOwn = self:getKeysAllowedToOwn()
        if allowedCoOwn and not fn.Null(allowedCoOwn) then

            for k in pairs(allowedCoOwn) do
                local ent = Player(k)
                if not IsValid(ent) or not ent:IsPlayer() then continue end
                table.insert(doorInfo, ent:Nick())
            end
        end
    elseif doorGroup then
        table.insert(doorInfo, doorGroup)
    elseif doorTeams then
        for k, v in pairs(doorTeams) do
            if not v or not RPExtraTeams[k] then continue end

            table.insert(doorInfo, RPExtraTeams[k].name)
        end
    elseif not blocked then
        table.insert(doorInfo, GoldenHUDV1.Language[ GoldenHUDV1.ConfigLanguage ][ "Unowned" ])
    end

    local text = table.concat(doorInfo, "\n")
    surface.SetFont("GoldenHudV1Doors")

    local w = surface.GetTextSize(text) + 10
    local h = table.Count(doorInfo) * 80

    if #doorInfo > 0 then
        draw.DrawNonParsedText(text, "GoldenHudV1Doors", 0 , 200 + 10 , Color(255,255,255,255), TEXT_ALIGN_CENTER)
    end

end

hook.Add("HUDDrawDoorData", "GoldenHudV1.RemoveDoorHUD", function(ent)

    local ShouldDraw = hook.Call("HUDShouldDraw", GAMEMODE, "DoorStateHUD")

    if ShouldDraw == false then return GoldenHUDV1.DoorHUD end

    if ent:getKeysNonOwnable() and LocalPlayer():IsSuperAdmin() then
        draw.DrawNonParsedText(DarkRP.getPhrase("keys_allow_ownership"), "TargetID", ScrW()/2, ScrH()/1.1, Color(255,255,255,255), 1)
    end
    
    return GoldenHUDV1.DoorHUD
end)