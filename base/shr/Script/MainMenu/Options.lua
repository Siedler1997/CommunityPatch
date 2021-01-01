----------------------------------------------------------------------------------------------------
-- Options menu page ids:
--
-- 00: Main options - GENERIC - NOT USED ANYMORE!!!
-- 10: User options screen
-- 20: Controls options screen
-- 30: Graphics options screen
-- 40: Sound options screen
-- 50: Network options screen
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- Globals
----------------------------------------------------------------------------------------------------
-- Table containing ALL options menu stuff
OptionsMenu = {}


----------------------------------------------------------------------------------------------------
-- Global functions
----------------------------------------------------------------------------------------------------
-- Init data - called when main menu is created!

function 
OptionsMenu.System_InitMenuStatics()

	-- Init screen ID - thats where we start
	OptionsMenu.GEN_ScreenID = 10
	
	if not GDB.IsKeyValid( "Config\\User\\Callsign" ) then
		GDB.SetString( "Config\\User\\Callsign", XGUIEng.GetStringTableText("InGameMessages/GUI_Player"))
	end 
end


----------------------------------------------------------------------------------------------------
-- 00 - generic
----------------------------------------------------------------------------------------------------
-- To options main menu screen - 00

function 
OptionsMenu.S00_Start()

	-- Activate screen
	XGUIEng.ShowAllSubWidgets( "Screens", 0 )
	XGUIEng.ShowWidget( "OptionsMenu00", 1 )
	
	if OptionsMenu.GEN_ScreenID == 10 then
		OptionsMenu.S10_Start()
	elseif OptionsMenu.GEN_ScreenID == 20 then
		OptionsMenu.S20_Start()
	elseif OptionsMenu.GEN_ScreenID == 30 then
		OptionsMenu.S30_Start()
	elseif OptionsMenu.GEN_ScreenID == 40 then
		OptionsMenu.S40_Start()
	elseif OptionsMenu.GEN_ScreenID == 50 then
		OptionsMenu.S50_Start()
	else 
		OptionsMenu.S10_Start()
	end
	
end

----------------------------------------------------------------------------------------------------
-- To start screen

function 
OptionsMenu.S00_Button_ToStart()

	-- To start menu
	XGUIEng.ShowAllSubWidgets( "Screens", 0 )
	XGUIEng.ShowWidget( "StartMenu00", 1 )

	-- Set screen ID
	--OptionsMenu.GEN_ScreenID = 0

end


----------------------------------------------------------------------------------------------------
-- Screen 10
----------------------------------------------------------------------------------------------------
-- To options user menu screen - 10

function 
OptionsMenu.S10_Start()

	-- Activate screen
	XGUIEng.ShowAllSubWidgets( "Screens", 0 )
	XGUIEng.ShowWidget( "OptionsMenu10", 1 )
	
	-- Set screen ID
	OptionsMenu.GEN_ScreenID = 10
	
	-- Init user name
	OptionsMenu10_NameStringInputDone( nil, 0 )
	
end

----------------------------------------------------------------------------------------------------
-- Update name

function 
OptionsMenu10_NameStringInputDone( _Name, _WidgetID )
	
	-- Valid?
	if _Name ~= nil and _Name ~= "" then
		
		-- Yeap: save string
		GDB.SetString( "Config\\User\\Callsign", _Name )
		
	else
	
		-- Nope: reset name
		
		-- Get user name
		local UserName = XGUIEng.GetStringTableText("InGameMessages/GUI_Player")
		if GDB.IsKeyValid( "Config\\User\\Callsign" ) then
			UserName = GDB.GetString( "Config\\User\\Callsign" )
		end
	
		-- Pass to GUI
		XGUIEng.SetStringInputCustomWidgetString( "OptionsMenu10_UserNameInput_CustomWidget", UserName )
	
	end
	
end

----------------------------------------------------------------------------------------------------
-- Name input done - ok pressed

function 
OptionsMenu.S10_NameOk()

	-- Get inputed name
	local Name = XGUIEng.GetStringInputCustomWidgetString( "OptionsMenu10_UserNameInput_CustomWidget" )

	-- Pass it!
	OptionsMenu10_NameStringInputDone( Name, 0 )
	
end


----------------------------------------------------------------------------------------------------
-- Get user's sex

function 
OptionsMenu.S10_Tool_GetSex()

	local Sex = 0
	
	if GDB.IsKeyValid( "Config\\User\\Sex" ) then
		Sex = GDB.GetValue( "Config\\User\\Sex" )
	end

	return Sex
	
end

----------------------------------------------------------------------------------------------------
-- Set user's sex

function 
OptionsMenu.S10_SetSex( _Sex )
	
	GDB.SetValue( "Config\\User\\Sex", _Sex )
	
end

----------------------------------------------------------------------------------------------------
-- Update sex button

function 
OptionsMenu.S10_UpdateSex( _Sex )

	local HighLightFlag = 0
	
	if 	OptionsMenu.S10_Tool_GetSex() == _Sex then
		HighLightFlag = 1
	end
	
	XGUIEng.HighLightButton( XGUIEng.GetCurrentWidgetID(), HighLightFlag )

end


----------------------------------------------------------------------------------------------------
-- Screen 20
----------------------------------------------------------------------------------------------------
-- To options controls menu screen - 20

function 
OptionsMenu.S20_Start()

	-- Activate screen
	XGUIEng.ShowAllSubWidgets( "Screens", 0 )
	XGUIEng.ShowWidget( "OptionsMenu20", 1 )
	
	-- Set screen ID
	OptionsMenu.GEN_ScreenID = 20
	
end


----------------------------------------------------------------------------------------------------
-- Screen 30
----------------------------------------------------------------------------------------------------
-- To options graphics menu screen - 30

function 
OptionsMenu.S30_Start()

	-- Activate screen
	XGUIEng.ShowAllSubWidgets( "Screens", 0 )
	XGUIEng.ShowWidget( "OptionsMenu30", 1 )
	
	-- Set screen ID
	OptionsMenu.GEN_ScreenID = 30
	
end

----------------------------------------------------------------------------------------------------
-- Screen 31
----------------------------------------------------------------------------------------------------
-- To options graphics menu screen - 31

function 
OptionsMenu.S31_Start()

	-- Activate screen
	XGUIEng.ShowAllSubWidgets( "Screens", 0 )
	XGUIEng.ShowWidget( "OptionsMenu31", 1 )
	
	-- Set screen ID
	OptionsMenu.GEN_ScreenID = 31
	
end

function
OptionsMenu.S31_ClickOk( _value )

	OptionsMenu.S30_Start()

end

----------------------------------------------------------------------------------------------------
-- Screen 40
----------------------------------------------------------------------------------------------------
-- To options sound menu screen - 40

function 
OptionsMenu.S40_Start()

	-- Activate screen
	XGUIEng.ShowAllSubWidgets( "Screens", 0 )
	XGUIEng.ShowWidget( "OptionsMenu40", 1 )
	
	-- Set screen ID
	OptionsMenu.GEN_ScreenID = 40
		
end

----------------------------------------------------------------------------------------------------
-- Screen 41
----------------------------------------------------------------------------------------------------
-- To options graphics menu screen - 41

function 
OptionsMenu.S41_Start()

	-- Activate screen
	XGUIEng.ShowAllSubWidgets( "Screens", 0 )
	XGUIEng.ShowWidget( "OptionsMenu41", 1 )
	
	-- Set screen ID
	OptionsMenu.GEN_ScreenID = 41
	
end

function
OptionsMenu.S41_ClickOk( _value )

	OptionsMenu.S40_Start()

end

----------------------------------------------------------------------------------------------------
-- Screen 50
----------------------------------------------------------------------------------------------------
-- To network options menu screen - 50

function 
OptionsMenu.S50_Start()

	-- Activate screen
	XGUIEng.ShowAllSubWidgets( "Screens", 0 )
	XGUIEng.ShowWidget( "OptionsMenu50", 1 )
	
	-- Set screen ID
	OptionsMenu.GEN_ScreenID = 50
		
end

----------------------------------------------------------------------------------------------------
-- Set connection type

function
OptionsMenu.S50_SetConnectionType( _ConnectionType )
	GDB.SetValue( "Config\\Internet\\Connection", _ConnectionType )
end

----------------------------------------------------------------------------------------------------
-- Update connection type

function
OptionsMenu.S50_UpdateConnectionTypeButton( _ConnectionType )

	local ConnectionType = 0
	if GDB.IsKeyValid( "Config\\Internet\\Connection" ) then
		ConnectionType = GDB.GetValue( "Config\\Internet\\Connection" )
	end
	
	local HighLightFlag = 0
	
	if ConnectionType == _ConnectionType then
		HighLightFlag = 1
	end
	
	XGUIEng.HighLightButton( XGUIEng.GetCurrentWidgetID(), HighLightFlag )

end

----------------------------------------------------------------------------------------------------
                                                                                                                                                                                                                                                                                    