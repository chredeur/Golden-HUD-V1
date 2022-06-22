local FMT = FindMetaTable("Player")
local head = Material("golden_hud/head.png")
	
if GoldenHUDV1.EnableHead then
	FMT.drawPlayerInfo = function(targ)
    	if not IsValid(targ) then return end
    	local Cteam = team.GetColor(targ:Team())
		local pos = targ:EyePos()	
		if LocalPlayer():GetPos():Distance( targ:GetPos() ) < GoldenHUDV1.DistanceHead then
    		pos.z = pos.z + 1
    		pos = pos:ToScreen()

            surface.SetMaterial(head)
            surface.SetDrawColor(Color(255, 255, 255, 250))
            surface.DrawTexturedRect(pos.x - 10, pos.y - 110, 65, 65)

        	local name, plyTeam = targ:Nick(), targ:Team()
        	draw.SimpleText(string.upper(name),"GoldenHudV1Fonthead1",pos.x + 70, pos.y - 100, Color(255, 255, 255, 250),TEXT_ALIGN_LEFT ,TEXT_ALIGN_CENTER)	
        	local Job = targ:getDarkRPVar("job") or team.GetName(targ:Team())
        	local Jobdq = team.GetColor(targ:Team())
            draw.SimpleText(Job,"GoldenHudV1AgendaText",pos.x + 70, pos.y - 75, Jobdq,TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end
 	end
 	
	FMT.drawWantedInfo = function(targ)
		if not targ:Alive() then return end
    	if(targ:GetPos():Distance(LocalPlayer():GetPos()) <= GoldenHUDV1.DistanceHead) then
			local pos = targ:EyePos()
			pos.z = pos.z + 1
			pos = pos:ToScreen()	
			local nick, plyTeam = targ:Nick(), targ:Team()
			draw.SimpleText("Wanted","GoldenHudV1AgendaText",pos.x + 70, pos.y - 58, Color(255, 0, 0, 250),TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)	
		end  
	end
end