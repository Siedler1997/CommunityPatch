----------------------------------------------------------------------------------------------------
-- Start menu stuff
----------------------------------------------------------------------------------------------------
-- Table
StartMenu = {}


----------------------------------------------------------------------------------------------------
-- Start main menu

function
StartMenu.Start( _StartVideoFlag )

	-- Make page active
	XGUIEng.ShowAllSubWidgets( "Screens", 0 )
	XGUIEng.ShowWidget( "StartMenu00", 1 )
	
	if ( XGUIEng.GetStringTableText("MainMenu/StartOnlineGame") == "DISABLE" ) then
	    XGUIEng.ShowWidget( "StartMenu00_StartOnline", 0 )
	end

	-- Set up environment
	StartMenu.DoInitStuff( _StartVideoFlag )

	-- Keys
	Input.KeyBindDown(Keys.ModifierAlt + Keys.F4, "StartMenu_KeyBindings_AltFFour()",2)

end

----------------------------------------------------------------------------------------------------
-- Init start menu generics - also used by post game screen

function
StartMenu.DoInitStuff( _StartVideoFlag )


	--if AddOn is started (checked by a function only used in the addon
	if SPMenu.S00_ToAOCampaignMenu ~= nil then
		local MusicPath = "music\\"
		local SongNumber = XGUIEng.GetRandom( 2 )
		
		if SongNumber == 0 then
			MusicPath = MusicPath .. "42_Extra1_DarkMoor_Theme2.mp3"
		elseif SongNumber == 1 then
			MusicPath = MusicPath .. "41_Extra1_DarkMoor_Theme1.mp3"
		else
			MusicPath = MusicPath .. "40_Extra1_BridgeBuild.mp3"
		end
		
		Music.Start( MusicPath  , 100, 1 )

	else
		local MusicPath = "music\\"
		local SongNumber = 1 + XGUIEng.GetRandom( 1 )
		
		Music.Start( MusicPath .. "0" .. SongNumber .. "_MainTheme" .. SongNumber ..".mp3" , 100, 1 )
	end
	
	Mouse.CursorSet(10)
	
	-- Init frame counter
	StartMenu.GEN_FrameCounter = 0
	StartMenu.GEN_StartVideoFlag = _StartVideoFlag
	StartMenu.GEN_VideoRunning = 0
	
end


----------------------------------------------------------------------------------------------------
-- Button action functions
----------------------------------------------------------------------------------------------------
-- On new game button

function
StartMenu.S00_ToSingleplayerMenu()
	XGUIEng.ShowAllSubWidgets( "Screens", 0 )
	XGUIEng.ShowWidget("SPMenu00", 1)	
end



----------------------------------------------------------------------------------------------------
-- On load game button

function
StartMenu.OnLoadGame()
	LoadSaveGame.Show()
end

----------------------------------------------------------------------------------------------------
-- On start multi player button

function
StartMenu.OnStartMP()
	MPMenu.Screen_ToMain()
end

----------------------------------------------------------------------------------------------------
-- End game

function
StartMenu.OnEndGame()

	if Demo_Menu.Initialized == nil then
		XGUIEng.ShowWidget( "QuitGameOverlayScreen", 1 )
		-- Framework.ExitGame()		
	else
		XGUIEng.ShowWidget( "DemoPostScreen", 1 )
	end

end


----------------------------------------------------------------------------------------------------
-- Globals
----------------------------------------------------------------------------------------------------
-- Generic update function

function
StartMenu.GEN_Update()

	-- Increment frame counter
	StartMenu.GEN_FrameCounter = StartMenu.GEN_FrameCounter + 1
	
	
	-- Start video
	if StartMenu.GEN_FrameCounter == 2 then
		if StartMenu.GEN_StartVideoFlag == 1 then
			if StartMenu.GEN_VideoRunning == 0 then
				XGUIEng.StartVideoPlayback( "StartMenu_BG_Video", "data\\graphics\\videos\\Menu\\FightScene.bik", 1 )	
				StartMenu.GEN_VideoRunning = 1 
			end
			StartMenu.GEN_StartVideoFlag = 0
		end
	end

end

----------------------------------------------------------------------------------------------------
-- Update version widget
function StartMenu.S00_Update_VersionInformation()

	-- Init text	
	local Text = "@center"
		
	-- Add version string
	Text = Text .. " " .. Framework.GetVName()
	
	-- Set text
	XGUIEng.SetText( XGUIEng.GetCurrentWidgetID(), Text )

end

	
----------------------------------------------------------------------------------------------------
-- Update version widget

function StartMenu.S00_Update_VersionNumber()

	-- Init text	
	local Text = "@ra"
		
	-- Add version string
	Text = Text .. " " .. Framework.GetProgramVersion() .. " | CP 1.0"
	
	-- Set text
	XGUIEng.SetText( XGUIEng.GetCurrentWidgetID(), Text )
end

----------------------------------------------------------------------------------------------------

function
StartMenu.UpdateNetworkButtons()

	
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()

	--local GetVersion = Framework.GetVersion()
	--if GetVersion == then
	--	XGUIEng.DisableButton(CurrentWidgetID,0)
	--else
	--	XGUIEng.DisableButton(CurrentWidgetID,1)
	--end
	
end

----------------------------------------------------------------------------------------------------

function
StartMenu.UpdateMainMenuButtons()
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()

	if XNetwork.Manager_IsAcceptedInvitePending() then
		XGUIEng.DisableButton(CurrentWidgetID,1)
	else
		XGUIEng.DisableButton(CurrentWidgetID,0)
	end	
end

----------------------------------------------------------------------------------------------------
-- Keys
----------------------------------------------------------------------------------------------------
-- Quit

function
StartMenu_KeyBindings_AltFFour()
	
	if Demo_Menu.Initialized == nil then
		XGUIEng.ShowWidget( "QuitGameOverlayScreen", 1 )
	else
		XGUIEng.ShowWidget( "DemoPostScreen", 1 )		
	end
end

----------------------------------------------------------------------------------------------------
-- Quit game screen
----------------------------------------------------------------------------------------------------

function
QuitGame_Button_Quit()
	Framework.ExitGame()
end

----------------------------------------------------------------------------------------------------

function
QuitGame_Button_Cancel()
	XGUIEng.ShowWidget( "QuitGameOverlayScreen", 0 )
end