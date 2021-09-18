local ScreenPos = ScrH()/ 1.2
local ForegroundColor = Color( 255, 255, 255 )
local BackgroundColor = Color( 35, 35, 35 )
local chredeurcolor = Color(0, 0, 0, 225)
local LoadingColor = Color( 255, 255, 255 )
local LoadingIcon = Material( "golden_hud/loading.png" )

local Colors = {}
Colors[ NOTIFY_GENERIC ] = Color( 255, 255, 255 )
Colors[ NOTIFY_ERROR ] = Color( 255, 255, 43 )
Colors[ NOTIFY_UNDO ] = Color( 255, 255, 255 )
Colors[ NOTIFY_HINT ] = Color( 255, 255, 255 )
Colors[ NOTIFY_CLEANUP ] = Color( 255, 255, 255 )
local Icons = {}
Icons[ NOTIFY_GENERIC ] = Material( "golden_hud/generic.png" )
Icons[ NOTIFY_ERROR ] = Material( "golden_hud/error.png" )
Icons[ NOTIFY_UNDO ] = Material( "golden_hud/undo.png" )
Icons[ NOTIFY_HINT ] = Material( "golden_hud/hint.png" )
Icons[ NOTIFY_CLEANUP ] = Material( "golden_hud/cleanup.png" )

local Notifications = {}
if GoldenHUDV1.EnableNotif then
local function DrawNotification( x, y, w, h, text, icon, col, progress )
	draw.RoundedBoxEx( 5, x, y, h, h + 5, chredeurcolor, true, false, true, false )
	draw.RoundedBoxEx( 5, x + h, y, w - h, h + 5, chredeurcolor, false, true, false, true )

	surface.SetDrawColor( Color( 255, 255, 255, 255 ) )
	draw.SimpleText( text, "GoldenHudV1Font", x + 32 + 10, y + h / 2, ForegroundColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

	surface.SetDrawColor( ForegroundColor )
	surface.SetMaterial( icon )

	if progress then
		surface.DrawTexturedRectRotated( x + 16, y + h / 2, 16, 16, -CurTime() * 360 % 360 )
	else
		surface.DrawTexturedRect( x + 7, y + 5, 25, 25 )
	end
end

function notification.AddLegacy( text, type, time )
	surface.SetFont( "GoldenHudV1Font" )

	local w = surface.GetTextSize( text ) + 20 + 32
	local h = 32
	local x = ScrW()
	local y = ScreenPos

	table.insert( Notifications, 1, {
		x = x,
		y = y,
		w = w,
		h = h,

		text = text,
		col = Colors[ type ],
		icon = Icons[ type ],
		time = CurTime() + time,

		progress = false,
	} )
end

function notification.AddProgress( id, text )
	surface.SetFont( "GoldenHudV1Font" )

	local w = surface.GetTextSize( text ) + 20 + 32
	local h = 32
	local x = ScrW()
	local y = ScreenPos

	table.insert( Notifications, 1, {
		x = x,
		y = y,
		w = w,
		h = h,

		id = id,
		text = text,
		col = LoadingColor,
		icon = LoadingIcon,
		time = math.huge,

		progress = true,
	} )	
end

function notification.Kill( id )
	for k, v in ipairs( Notifications ) do
		if v.id == id then v.time = 0 end
	end
end

hook.Add( "HUDPaint", "DrawNotifications", function()
	for k, v in ipairs( Notifications ) do
		DrawNotification( math.floor( v.x ), math.floor( v.y ), v.w, v.h, v.text, v.icon, v.col, v.progress )

		v.x = Lerp( FrameTime() * 6, v.x, v.time > CurTime() and ScrW() - v.w - 11 or ScrW() + 1 )
		v.y = Lerp( FrameTime() * 10, v.y , ScreenPos - ( k - 1  ) * ( v.h + 11 ) )
	end

	for k, v in ipairs( Notifications ) do
		if v.x >= ScrW() and v.time < CurTime() then
			table.remove( Notifications, k )
		end
	end
end )

end
