local bleedinghearticon = Material( "golden_hud/blood-drop.png" )
local brokenboneicon = Material( "golden_hud/broken-bone.png" )
local heartattackicon = Material( "golden_hud/pulse.png" )
local poisonicon = Material( "golden_hud/poison.png" )
local syringeicon = Material( "golden_hud/syringe.png" )

local yi = ScrW() - 100
local xi = ScrH() - 239
hook.Add("HUDPaint", "GoldenHudV1.MedicMod", function() 
	local ply = LocalPlayer()
    if GoldenHUDV1.EnableCompatibilityAMM == false then return end
    if GoldenHUDV1.EnableAMMHealthStatus then 
        local nbStat = 1
    	if ply:IsBleeding() and not ply:InVehicle() or ply:IsPoisoned() and not ply:InVehicle() or ply:GetHeartAttack() and not ply:InVehicle() or ply:IsMorphine() and not ply:InVehicle() or ply:IsFractured() and not ply:InVehicle() then
    		draw.RoundedBox(5, yi - 73, xi + 106, 146, 127, Color(0, 0, 0, 225))
            draw.SimpleText(GoldenHUDV1.Language[ GoldenHUDV1.ConfigLanguage ][ "health_status" ], "GoldenHudV1Fontdeathpanel", yi - 1, xi + 119,Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    	end

        if ply:IsBleeding() and not ply:InVehicle() then
            draw.SimpleText(GoldenHUDV1.Language[ GoldenHUDV1.ConfigLanguage ][ "Bleeding" ], "GoldenHudV1AgendaText", yi - 42, xi + 142 * nbStat,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            surface.SetMaterial( bleedinghearticon )
            surface.SetDrawColor(255, 255, 255, 250) 
            surface.DrawTexturedRect( yi - 67, xi + 135 * nbStat, 20, 20 )
            nbStat = nbStat + 0.19
        end

        if ply:IsPoisoned() and not ply:InVehicle() then
            draw.SimpleText(GoldenHUDV1.Language[ GoldenHUDV1.ConfigLanguage ][ "Poisoned" ], "GoldenHudV1AgendaText", yi - 42, xi + 142 * nbStat,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            surface.SetMaterial( poisonicon )
            surface.SetDrawColor(255, 255, 255, 250) 
            surface.DrawTexturedRect( yi - 67, xi + 135 * nbStat, 20, 20 )
            nbStat = nbStat + 0.19
        end

        if ply:GetHeartAttack() and not ply:InVehicle() then
            draw.SimpleText(GoldenHUDV1.Language[ GoldenHUDV1.ConfigLanguage ][ "heartattack" ], "GoldenHudV1AgendaText", yi - 42, xi + 142 * nbStat,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            surface.SetMaterial( heartattackicon )
            surface.SetDrawColor(255, 255, 255, 250) 
            surface.DrawTexturedRect( yi - 67, xi + 135 * nbStat, 20, 20 )
            nbStat = nbStat + 0.19
        end

        if ply:IsMorphine() and not ply:InVehicle() then
            draw.SimpleText(GoldenHUDV1.Language[ GoldenHUDV1.ConfigLanguage ][ "morphine" ], "GoldenHudV1AgendaText",  yi - 42, xi + 142 * nbStat,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            surface.SetMaterial( syringeicon )
            surface.SetDrawColor(255, 255, 255, 250) 
            surface.DrawTexturedRect( yi - 67, xi + 135 * nbStat, 20, 20 )
            nbStat = nbStat + 0.19
        end

        if ply:IsFractured() and not ply:InVehicle() then
            draw.SimpleText(GoldenHUDV1.Language[ GoldenHUDV1.ConfigLanguage ][ "fracture" ], "GoldenHudV1AgendaText", yi - 42, xi + 142 * nbStat,Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            surface.SetMaterial( brokenboneicon )
            surface.SetDrawColor(255, 255, 255, 250) 
            surface.DrawTexturedRect( yi - 67, xi + 135 * nbStat, 20, 20 )
            nbStat = nbStat + 0.19
        end
    end

    if GoldenHUDV1.EnableAMMDeathPanel then
        if not LocalPlayer():Alive() and not IsValid(deathPanel) and MedicMod.seconds then
            if MedicMod.seconds < CurTime() and MedicMod.seconds != -1 then return end
            
            deathPanel = vgui.Create("DFrame")
            deathPanel:SetSize(ScrW()*0.25, ScrH()*0.125)
            deathPanel:SetTitle("")
            deathPanel:SetAlpha(0)
            deathPanel:AlphaTo(255,1.2)
            deathPanel:Center()
            deathPanel:ShowCloseButton(false)
            deathPanel.Paint = function(s,w,h)
                draw.RoundedBoxEx(8, 0, 0, w, h, Color(0, 0, 0, 225), true, true, true, true)
                draw.RoundedBoxEx(8, 0, 0, w, h*0.20, Color(66, 66, 66, 190), true, true, false, false)
                draw.SimpleText(ConfigurationMedicMod.Sentences["Death Notice"][ConfigurationMedicMod.Language], "GoldenHudV1Fontdeathpanel", w/2, h*0.20/2,Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(ConfigurationMedicMod.Sentences["You have lost consciousness."][ConfigurationMedicMod.Language],"GoldenHudV1Fontdeathpanel",w/2,h/2-17.5,Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
                draw.SimpleText(ConfigurationMedicMod.Sentences["You must be rescued by a medic, or wait."][ConfigurationMedicMod.Language] ,"GoldenHudV1Fontdeathpanel",w/2,h/2,Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
            end
            deathPanel.Think = function(s)
                if LocalPlayer():Alive() then
                    s:AlphaTo(0, 1.2, 0, function(data,pnl) pnl:Remove() end)
                end
            end
            local x,y = deathPanel:GetSize()
            local button1 = vgui.Create("DButton",deathPanel)
                button1:Dock(BOTTOM)
                button1:SetText("")
                button1:SetSize(0,y*0.25)
                button1.DoClick = function(s)
                    if MedicMod.seconds and MedicMod.seconds-CurTime() > 0 then return end
                    net.Start("MedicMod.Respawn")
                    net.SendToServer()
                end
                button1.Paint = function(s,w,h)
                    draw.RoundedBox(8, 0, 0, w, h, Color(66, 66, 66, 190))
                    if MedicMod.seconds-CurTime() > 0 then
                        draw.SimpleText(ConfigurationMedicMod.Sentences["Please wait"][ConfigurationMedicMod.Language].." "..math.Round(MedicMod.seconds-CurTime()).." "..ConfigurationMedicMod.Sentences["seconds to respawn."][ConfigurationMedicMod.Language], "GoldenHudV1Fontdeathpanel", w/2, h/2,Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    elseif MedicMod.seconds == -1 then
                        draw.SimpleText(ConfigurationMedicMod.Sentences["You're receiving CPR, you can't respawn."][ConfigurationMedicMod.Language], "GoldenHudV1Fontdeathpanel", w/2, h/2,Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    else
                        draw.SimpleText(ConfigurationMedicMod.Sentences["Click to respawn."][ConfigurationMedicMod.Language], "GoldenHudV1Fontdeathpanel", w/2, h/2,Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                end
        end
    end
end)
