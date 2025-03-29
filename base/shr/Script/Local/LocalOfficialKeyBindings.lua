--------------------------------------------------------------------------------
-- Key bindings
--------------------------------------------------------------------------------

function OfficialKeyBindings_Init()

	-----------------------------------------------------------------------------------------------
	-- Screen shot
	-----------------------------------------------------------------------------------------------
	-- Input.KeyBindDown(Keys.Print, "Game.SaveScreenShot()",7)
	
	-- Snapshot key event is received only if key released
	-- Input.KeyBindUp(Keys.Snapshot, "Game.SaveScreenShot()",7)
	
	-----------------------------------------------------------------------------------------------
	-- Game functions
	-----------------------------------------------------------------------------------------------
	Input.KeyBindDown(Keys[XGUIEng.GetStringTableText( "KeyBindings/PauseGame" )] ,			"KeyBindings_TogglePause()", 7)	
	Input.KeyBindDown(Keys.Escape ,		"Game.Escape()", 15)			
	Input.KeyBindDown(Keys.F8 ,			"KeyBindings_ToggleClock()", 2)
	Input.KeyBindDown(Keys.Space, 		"KeyBindings_JumpToLastHotSpot()",2)
	Input.KeyBindDown(Keys.Tab, 		"KeyBindings_ToggleOnScreenInformation()",2)	
	Input.KeyBindDown(Keys.ModifierAlt + Keys.F4, 		"KeyBindings_AltFFour()",2)
	Input.KeyBindDown(Keys.Multiply, "GUIAction_AdjustGameSpeed()", 2)
	Input.KeyBindDown(Keys.F10,     "GUIAction_OnlineHelp()", 2 )
	
	
	
	-----------------------------------------------------------------------------------------------
	-- Save, Load, windows
	-----------------------------------------------------------------------------------------------
	
	Input.KeyBindDown(Keys.F1,     "GUIAction_ToggleMenu( gvGUI_WidgetID.MainMenuWindow,-1)", 2 )
	Input.KeyBindDown(Keys.F2,     "GUIAction_ToggleMenu( gvGUI_WidgetID.DiplomacyWindow,-1)", 2 )
	Input.KeyBindDown(Keys.F3,     "GUIAction_ToggleMenu( gvGUI_WidgetID.TradeWindow,-1)", 2 )
	Input.KeyBindDown(Keys.F4,     "GUIAction_ToggleMenu( gvGUI_WidgetID.QuestWindow,-1)", 2 )
	Input.KeyBindDown(Keys.F5,     "GUIAction_ToggleMenu( gvGUI_WidgetID.StatisticsWindow,-1)", 2 )	
	Input.KeyBindDown(Keys.ModifierShift + Keys.F5,     "GUIAction_ToggleMenu( gvGUI_WidgetID.BuyHeroWindow,-1)",2 )
	Input.KeyBindDown(Keys.F6,     "QuickSave()", 2 )
	Input.KeyBindDown(Keys.F7,     "QuickLoad()", 2 )
	Input.KeyBindDown(Keys.ModifierShift + Keys.F4,     "GUIAction_ToggleMenu( gvGUI_WidgetID.NetworkWindow,-1)",2 )	
	
	-----------------------------------------------------------------------------------------------
	-- Sound
	-----------------------------------------------------------------------------------------------
	Input.KeyBindDown(Keys.F9 ,			"KeyBindings_ToggleSound(0)", 6)		
	Input.KeyBindDown(Keys.F11 ,			"KeyBindings_ToggleSound(2)", 6)
	Input.KeyBindDown(Keys.ModifierControl + Keys.Add,     		"KeyBindings_AdjustMusicVolume(0.1)",6 )
	Input.KeyBindDown(Keys.ModifierControl + Keys.Subtract,     "KeyBindings_AdjustMusicVolume(-0.1)",6 )
	
	-----------------------------------------------------------------------------------------------
	-- GUI 
	-----------------------------------------------------------------------------------------------	
	Input.KeyBindDown(Keys.ModifierControl + Keys.Space, "Camera.RotSetAngle(315)", 2)
	Input.KeyBindDown(Keys.ModifierAlt + Keys.I, "KeyBindings_FreeCamState()", 14, true)
		
	-----------------------------------------------------------------------------------------------
	-- Chat
	-----------------------------------------------------------------------------------------------
	Input.KeyBindDown(Keys[XGUIEng.GetStringTableText( "KeyBindings/ChatToAll" )], "Chat_Toggle(0)", 2)
	Input.KeyBindDown(Keys[XGUIEng.GetStringTableText( "KeyBindings/ChatToTeam" )], "Chat_Toggle(1)", 2)
	
	
	--ATTENTION: There are additinal keybinding that are only loaded in MP (MultiplayerTools.lua)


	-----------------------------------------------------------------------------------------------
	-- Assign Troops To Numbers
	-----------------------------------------------------------------------------------------------
	Input.KeyBindDown(Keys.ModifierControl + Keys.D1, "GroupSelection_AssignTroops(1)", 2)	
	Input.KeyBindDown(Keys.D1, "GroupSelection_SelectTroops(1)", 2)	
	
	Input.KeyBindDown(Keys.ModifierControl + Keys.D2, "GroupSelection_AssignTroops(2)", 2)	
	Input.KeyBindDown(Keys.D2, "GroupSelection_SelectTroops(2)", 2)	
	
	Input.KeyBindDown(Keys.ModifierControl + Keys.D3, "GroupSelection_AssignTroops(3)", 2)	
	Input.KeyBindDown(Keys.D3, "GroupSelection_SelectTroops(3)", 2)	
	
	Input.KeyBindDown(Keys.ModifierControl + Keys.D4, "GroupSelection_AssignTroops(4)", 2)	
	Input.KeyBindDown(Keys.D4, "GroupSelection_SelectTroops(4)", 2)	
	
	Input.KeyBindDown(Keys.ModifierControl + Keys.D5, "GroupSelection_AssignTroops(5)", 2)	
	Input.KeyBindDown(Keys.D5, "GroupSelection_SelectTroops(5)", 2)	
	
	Input.KeyBindDown(Keys.ModifierControl + Keys.D6, "GroupSelection_AssignTroops(6)", 2)	
	Input.KeyBindDown(Keys.D6, "GroupSelection_SelectTroops(6)", 2)	
	
	Input.KeyBindDown(Keys.ModifierControl + Keys.D7, "GroupSelection_AssignTroops(7)", 2)	
	Input.KeyBindDown(Keys.D7, "GroupSelection_SelectTroops(7)", 2)	
	
	Input.KeyBindDown(Keys.ModifierControl + Keys.D8, "GroupSelection_AssignTroops(8)", 2)	
	Input.KeyBindDown(Keys.D8, "GroupSelection_SelectTroops(8)", 2)	
	
	Input.KeyBindDown(Keys.ModifierControl + Keys.D9, "GroupSelection_AssignTroops(9)", 2)	
	Input.KeyBindDown(Keys.D9, "GroupSelection_SelectTroops(9)", 2)	
	
	Input.KeyBindDown(Keys.ModifierControl + Keys.D0, "GroupSelection_AssignTroops(10)", 2)	
	Input.KeyBindDown(Keys.D0, "GroupSelection_SelectTroops(10)", 2)	
	
	-----------------------------------------------------------------------------------------------
	-- Select buildings
	-----------------------------------------------------------------------------------------------
	Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectResidence" )], 	"KeyBindings_SelectUnit(UpgradeCategories.Residence,1)", 2)			
	Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectFarm" )], 			"KeyBindings_SelectUnit(UpgradeCategories.Farm,1)", 2)
	Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectVillage" )],		"KeyBindings_SelectUnit(UpgradeCategories.VillageCenter,1)", 2)

	Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectHeadquarter" )],	"KeyBindings_SelectUnit(UpgradeCategories.Headquarters,1)", 2)
	Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectUniversity" )], 	"KeyBindings_SelectUnit(UpgradeCategories.University,1)", 2)	
	Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectMarket" )], 		"KeyBindings_SelectUnit(UpgradeCategories.Market,1)", 2)
    Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectMonastery" )], 	"KeyBindings_SelectUnit(UpgradeCategories.Monastery,1)", 2) 
    Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectBank" )], 			"KeyBindings_SelectUnit(UpgradeCategories.Bank,1)", 2)   
	
	Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectBrickworks" )], 	"KeyBindings_SelectUnit(UpgradeCategories.Brickworks,1)", 2)
	Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectStoneMason" )], 	"KeyBindings_SelectUnit(UpgradeCategories.StoneMason,1)", 2)	
    Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectBlacksmith" )], 	"KeyBindings_SelectUnit(UpgradeCategories.Blacksmith,1)", 2)
    Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectAlchemist" )], 	"KeyBindings_SelectUnit(UpgradeCategories.Alchemist,1)", 2)
    Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectSawmill" )], 		"KeyBindings_SelectUnit(UpgradeCategories.Sawmill,1)", 2)
    
    --Input.KeyBindDown(Keys.A, 			"KeyBindings_SelectUnit(UpgradeCategories.ClayMine,1)", 2)
    --Input.KeyBindDown(Keys.S, 			"KeyBindings_SelectUnit(UpgradeCategories.StoneMine,1)", 2)
    --Input.KeyBindDown(Keys.D, 			"KeyBindings_SelectUnit(UpgradeCategories.IronMine,1)", 2)
    --Input.KeyBindDown(Keys.F, 			"KeyBindings_SelectUnit(UpgradeCategories.SulfurMine,1)", 2)
    
    Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectBarracks" )], 		"KeyBindings_SelectUnit(UpgradeCategories.Barracks,1)", 2)    
    Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectArchery" )], 		"KeyBindings_SelectUnit(UpgradeCategories.Archery,1)", 2)
    Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectFoundry" )], 		"KeyBindings_SelectUnit(UpgradeCategories.Foundry,1)", 2)    
    Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectStables" )], 		"KeyBindings_SelectUnit(UpgradeCategories.Stable,1)", 2)
    Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectTower" )], 			"KeyBindings_SelectUnit(UpgradeCategories.Tower,1)", 2)
    
    Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectWeatherTower" )], 		"KeyBindings_SelectUnit(UpgradeCategories.Weathermachine,1)", 2)
    Input.KeyBindDown(Keys.ModifierControl + Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectPowerPlant" )], 		"KeyBindings_SelectUnit(UpgradeCategories.PowerPlant,1)", 2)

	-----------------------------------------------------------------------------------------------
	-- Select Units
	-----------------------------------------------------------------------------------------------

	Input.KeyBindDown(Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectSerf" )],			"KeyBindings_SelectUnit(UpgradeCategories.Serf,0)", 2)
	Input.KeyBindDown(Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectIdleSerf" )],		"KeyBindings_FindIdleSerf()", 2)
	
	Input.KeyBindDown(Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectIdleUnit" )],		"KeyBindings_FindIdleUnit()", 2)
	
	Input.KeyBindDown(Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectNextHero" )],		"KeyBindings_NextHero()", 2)
	Input.KeyBindDown(Keys[XGUIEng.GetStringTableText( "KeyBindings/SelectPreviousHero" )],	"KeyBindings_PreviousHero()", 2)
	
	-----------------------------------------------------------------------------------------------
	-- CHEATS
	-----------------------------------------------------------------------------------------------
	
	Input.KeyBindDown(Keys.ModifierControl + Keys.F10, "Input.EnableDebugKeys(3)", 2)
	Input.KeyBindDown(Keys.ModifierControl + Keys.ModifierShift + Keys.F11, "Input.EnableDebugKeys(2)", 2)
	Input.KeyBindDown(Keys.ModifierControl + Keys.ModifierShift + Keys.F12, "Input.EnableDebugKeys(1)", 2)
	Input.KeyBindDown(Keys.ModifierControl + Keys.F12, "Input.EnableDebugKeys(-1)", 2)
	
	Input.KeyBindDown(Keys.ModifierControl + Keys.ModifierShift + Keys.F10, "OfficialKeyBindings_LoadDevKeys()")
	
	--init also New keybindings for AddOn
	if AOOfficialKeyBindings_Init ~= nil then
		AOOfficialKeyBindings_Init()
	end
	
end



--------------------------------------------------------------------------------
-- Local function binded to keys
--------------------------------------------------------------------------------

-- Load dev keys

function OfficialKeyBindings_LoadDevKeys()

    Script.Load("script\\development\\devkeybindings.lua")
    
end

-- Toggle pause

function KeyBindings_TogglePause()
    local Speed = Game.GameTimeGetFactor()
    if Speed == 0 then
        Game.GameTimeSetFactor( 1 )
        Stream.Pause(false)
        Sound.Pause3D(false)
    else
        Game.GameTimeSetFactor( 0 )
        Stream.Pause(true)
        Sound.Pause3D(true)
    end
	XGUIEng.SetText("GameSpeedButton", "@center x" .. Game.GameTimeGetFactor())
end

-- Callback that is executed when speed is changing

function GameCallback_GameSpeedChanged( _Speed )
    
    if _Speed == 0 then
        --GUI.AddNote( XGUIEng.GetStringTableText( "InGameMessages/Note_GamePaused" ) )
        XGUIEng.ShowWidget("PauseScreen",1)
    else
    	--GUI.AddNote( XGUIEng.GetStringTableText( "InGameMessages/Note_GameContinues" ) )
        XGUIEng.ShowWidget("PauseScreen",0)    
    end
end



--------------------------------------------------------------------------------
-- Escape
--------------------------------------------------------------------------------

function GameCallback_Escape()
	if IsBriefingActive == nil or not IsBriefingActive() then
		gvInterfaceCinematicSelectedEntites = {0}
		Camera.FollowEntity(0)
		Cutscene.Cancel()		
		
	elseif IsBriefingActive ~= nil then
		
		NextBriefingPage()
	end
	
end

--------------------------------------------------------------------------------
-- Enable / disable music
--------------------------------------------------------------------------------
function KeyBindings_ToggleSound(_SoundType)
	
	local test = _SoundType
	local test2 = Sound.GetVolumeAdjustment(_SoundType)
	
	if Sound.GetVolumeAdjustment(_SoundType) ~= 0 then
		Sound.SetVolumeAdjustment(_SoundType,0)
	else
		Sound.SetVolumeAdjustment(_SoundType,1)
	end
	
end

--------------------------------------------------------------------------------
-- Music
--------------------------------------------------------------------------------
function KeyBindings_AdjustMusicVolume(_volume)
	local MusicVolume = Music.GetVolumeAdjustment()
	MusicVolume = MusicVolume + _volume
	
	--if MusicVolume < 0 then
	--	Music.SetVolumeAdjustment(0)
	--	return
	--end
	Music.SetVolumeAdjustment(MusicVolume)
end

--------------------------------------------------------------------------------
-- Show/Hide Interface
--------------------------------------------------------------------------------
function KeyBindings_FreeCamState()
	if IsBriefingActive == nil or not IsBriefingActive() then
		if XGUIEng.IsWidgetShown("Normal") == 1 then
			XGUIEng.ShowWidget("Normal",0)
		else
			XGUIEng.ShowWidget("Normal",1)
		end
	end
end

--------------------------------------------------------------------------------
-- Toggle game clock
--------------------------------------------------------------------------------
gvKeyBindings_GameClockFlag = 1

function KeyBindings_ToggleClock()
	
	XGUIEng.ShowWidget(gvGUI_WidgetID.GameClock,gvKeyBindings_GameClockFlag)
	gvKeyBindings_GameClockFlag = 1 - gvKeyBindings_GameClockFlag
	
end

--------------------------------------------------------------------------------
-- quick Save game
--------------------------------------------------------------------------------

function QuickSave()

	if Logic.PlayerGetGameState(GUI.GetPlayerID())  ~= 1 then
		return
	end
	
	local MapName= Framework.GetCurrentMapName()
	if MapName == "00_Tutorial1"  then
		return
	end 
	

	if XNetwork == nil or XNetwork.Manager_DoesExist() == 0 then
		local Desc = "(*) - " .. MainWindow_SaveGame_CreateSaveGameDescription()
		local success = Framework.SaveGame("quicksave", Desc)
        if success then
		    GUI.AddNote( XGUIEng.GetStringTableText( "InGameMessages/GUI_GameSaved" ) )
        end
	end
end

--------------------------------------------------------------------------------
-- quick Load game
--------------------------------------------------------------------------------
function QuickLoad()
	
	if Logic.PlayerGetGameState(GUI.GetPlayerID())  ~= 1 then
		return
	end
		
	local MapName= Framework.GetCurrentMapName()
	if MapName == "00_Tutorial1" then
		return
	end 
	
	if XNetwork == nil or XNetwork.Manager_DoesExist() == 0 then
		Framework.LoadGame("quicksave")
		GUI.AddNote( XGUIEng.GetStringTableText( "InGameMessages/GUI_GameLoaded" ) )
	end
end


--------------------------------------------------------------------------------
-- Quit game (Triggerfix by mcb)
--------------------------------------------------------------------------------
function QuitGame()
	Trigger.DisableTriggerSystem(1)
	-- Network game?
	if XNetwork ~= nil and XNetwork.Manager_IsGameRunning() == 1 then

		-- Is network system hanging?	
		if XNetwork.GameSystem_IsHanging() == 1 then
			--LuaDebugger.Break()		
			-- Yes: do 'hard' exit
			
			-- Update game result structure
			Framework.GameResult_Update()
		
			-- TEST - shut down network
			do
			
				-- Ubi.com existing?
				if XNetworkUbiCom ~= nil and XNetworkUbiCom.Manager_DoesExist() == 1 then
			    
					-- Stop Ubi.com
					-- XNetworkUbiCom.Manager_Destroy()

				end
				
				-- Network existing?
				if XNetwork ~= nil and XNetwork.Manager_DoesExist() == 1 then

					-- Stop broadcast
					XNetwork.Broadcast_Stop()
					
					-- Stop network
					XNetwork.Manager_Stop()
					
					-- Destroy network
					XNetwork.Manager_Destroy()

				end	
				
			end
		
			-- Close game directly
			Framework.CloseGame()
						
		else
		
			-- Nope: normal way
			
			-- Pass to network
			XNetwork.Manager_LocalPlayerWantsToLeaveGame()
		
		end
			
	else
	
		-- Update game result structure
		Framework.GameResult_Update()
	
		-- Close game directly
		Framework.CloseGame()
		
	end

end



--------------------------------------------------------------------------------
-- Quit application (Triggerfix by mcb)
--------------------------------------------------------------------------------
function QuitApplication()
	Trigger.DisableTriggerSystem(1)
    if Framework.CheckIDV() then
		QuitGame()
    else
		Framework.ExitGame()	
    end
end


--------------------------------------------------------------------------------
-- Toggle through units
--------------------------------------------------------------------------------

gvKeyBindings_LastSelectedEntityPos = 0

function KeyBindings_SelectUnit(_UpgradeCategory,_type,_SecondCategory)
	-- Do not jump in cutscene!
	if gvInterfaceCinematicFlag == 1 then
		return
	end
	
	local EntityTable ={}

	if _UpgradeCategory == UpgradeCategories.LeaderBow then
		local BowTable = {}
		BowTable[1] = {Logic.GetPlayerEntities( GUI.GetPlayerID(), Entities.PU_LeaderBow1, 24 )}
		BowTable[2] = {Logic.GetPlayerEntities( GUI.GetPlayerID(), Entities.PU_LeaderBow2, 24 )}
		BowTable[3] = {Logic.GetPlayerEntities( GUI.GetPlayerID(), Entities.PU_LeaderBow3, 24 )}
		BowTable[4] = {Logic.GetPlayerEntities( GUI.GetPlayerID(), Entities.PU_LeaderBow4, 24 )}
		BowTable[5] = {Logic.GetPlayerEntities( GUI.GetPlayerID(), Entities.PU_LeaderBow2a, 24 )}
		for i=1,5,1 do
			for j=2,table.getn(BowTable[i]),1 do
				table.insert (EntityTable, BowTable[i][j])	
			end
		end
	else
		local UpgradeTypeTable = {}	
		local SecondTypeTable = {}	
	
		if _type == 1 then	
			UpgradeTypeTable = {Logic.GetBuildingTypesInUpgradeCategory(_UpgradeCategory)}
			if _SecondCategory ~= nil then
				SecondTypeTable = {Logic.GetBuildingTypesInUpgradeCategory(_SecondCategory)}
			end
		else 
			UpgradeTypeTable = {Logic.GetSettlerTypesInUpgradeCategory(_UpgradeCategory)}
			if _SecondCategory ~= nil then
				SecondTypeTable = {Logic.GetSettlerTypesInUpgradeCategory(_SecondCategory)}
			end
		end
	
		local AmountOfUpgradeTypes = UpgradeTypeTable[1]	
		local AmountOfSecondTypes = SecondTypeTable[1]	
		for i = 1, AmountOfUpgradeTypes, 1 do
			-- Get ID of upgradecategory of player
			local TempTable = {Logic.GetPlayerEntities( GUI.GetPlayerID(), UpgradeTypeTable[i+1], 48 )	}
			local number = TempTable[1]		
			for j = 1, number, 1 do
				table.insert(EntityTable,TempTable[j+1])
			end	
		end
		for i = 1, AmountOfSecondTypes, 1 do
			-- Get ID of upgradecategory of player
			local TempTable = {Logic.GetPlayerEntities( GUI.GetPlayerID(), SecondTypeTable[i+1], 48 )	}
			local number = TempTable[1]		
			for j = 1, number, 1 do
				table.insert(EntityTable,TempTable[j+1])
			end	
		end
	end


	if table.getn(EntityTable) == 0 then
		return
	end

	local counter = gvKeyBindings_LastSelectedEntityPos
	
	--Counter at the end of table?
	counter = counter + 1
	if counter >= table.getn(EntityTable) then
		counter = 0
	end
	
	gvKeyBindings_LastSelectedEntityPos = counter
	
	local EntityID = EntityTable[ 1 + counter ]
		
	local IDPosX, IDPosY, IDPosZ = Logic.EntityGetPos( EntityID )
	Camera.ScrollSetLookAt(IDPosX, IDPosY)	
	
	GUI.SetSelectedEntity( EntityID  )	
end

function
KeyBindings_SelectCannons()
	
	local CannonTable = {}
	
	CannonTable[1] = {Logic.GetPlayerEntities( GUI.GetPlayerID(), Entities.PV_Cannon1, 20 )}
	CannonTable[2] = {Logic.GetPlayerEntities( GUI.GetPlayerID(), Entities.PV_Cannon2, 20 )}
	CannonTable[3] = {Logic.GetPlayerEntities( GUI.GetPlayerID(), Entities.PV_Cannon3, 20 )}
	CannonTable[4] = {Logic.GetPlayerEntities( GUI.GetPlayerID(), Entities.PV_Cannon3a, 20 )}
	CannonTable[5] = {Logic.GetPlayerEntities( GUI.GetPlayerID(), Entities.PV_Cannon4, 20 )}
	CannonTable[6] = {Logic.GetPlayerEntities( GUI.GetPlayerID(), Entities.PV_Cannon4a, 20 )}
	
	local AllCannons = {}
	
	for i=1,6,1
	do
		for j=2,table.getn(CannonTable[i]),1
		do
			table.insert (AllCannons, CannonTable[i][j])	
		end
	end
	
	
	if table.getn(AllCannons) == 0 then
		return
	end

	local counter = gvKeyBindings_LastSelectedEntityPos
	
	--Counter at the end of table?
	counter = counter + 1
	if counter >= table.getn(AllCannons) then
		counter = 0
	end
	
	gvKeyBindings_LastSelectedEntityPos = counter
	
	
	local EntityID = AllCannons[ 1 + counter ]
		
	local IDPosX, IDPosY, IDPosZ = Logic.EntityGetPos( EntityID )
	Camera.ScrollSetLookAt(IDPosX, IDPosY)	
	
	GUI.SetSelectedEntity( EntityID  )	
	
	
end

function
KeyBindings_FindIdleSerf()

	local PlayerID = GUI.GetPlayerID()	
	local CurrentSerfID = Logic.GetNextIdleSerf(PlayerID, gvInterface_LastSerfID)	
	local IdleSerfAmount = Logic.GetNumberOfIdleSerfs(PlayerID) 
	
	if IdleSerfAmount > 0 then
		if CurrentSerfID ~= 0 then		
			
			GUI.ClearSelection()
			local IDPosX, IDPosY, IDPosZ = Logic.EntityGetPos( CurrentSerfID )
			Camera.ScrollSetLookAt(IDPosX, IDPosY)	
			--GUIAction_FlyToEntity(CurrentSerfID)
			GUI.SelectEntity( CurrentSerfID )	
		end
			
		gvInterface_LastSerfID = CurrentSerfID

	end
end

function
KeyBindings_JumpToLastHotSpot()

	local x,y = GUI.ShortMessages_GetLastPosition()
	
	if x ~= 0 and y ~= 0 then
		Camera.ScrollSetLookAt(x,y)	
	end
end


gvInterface_LastLeaderID = 0

function
KeyBindings_FindIdleUnit()
	
	local PlayerID = GUI.GetPlayerID()	
	

	local CurrentLeaderID = Logic.GetNextLeader(PlayerID, gvInterface_LastLeaderID)	
	local LeaderAmount = Logic.GetNumberOfLeader(PlayerID) 
	
	if LeaderAmount > 0 then
		if CurrentLeaderID ~= 0 then		
			
			GUI.ClearSelection()
			local IDPosX, IDPosY, IDPosZ = Logic.EntityGetPos( CurrentLeaderID )
			Camera.ScrollSetLookAt(IDPosX, IDPosY)	
			--GUIAction_FlyToEntity(CurrentSerfID)
			GUI.SelectEntity( CurrentLeaderID )	
		end
			
		gvInterface_LastLeaderID = CurrentLeaderID

	end
	
end


gvKeyBindings_OnScreenInformationFlag = 1

--------------------------------------------------------------------------------
-- Toggle On Screen Information
--------------------------------------------------------------------------------

function KeyBindings_ToggleOnScreenInformation()
	GUI.Debug_OnScreenInformation_ShowAllInformation(gvKeyBindings_OnScreenInformationFlag)
	gvKeyBindings_OnScreenInformationFlag = 1 - gvKeyBindings_OnScreenInformationFlag	
end

function
KeyBindings_MPTaunt(_message,_AlliedOnly)

	local PlayerID = GUI.GetPlayerID()

	local string = "#"

	if _message < 10 then
		string = string .."0"
	end
	
	string = string .. _message
	
		
	if XNetwork ~= nil and XNetwork.Manager_DoesExist() == 1 then
		if _AlliedOnly == 1 then
			XNetwork.Chat_SendMessageToAllied( string )
		else
			XNetwork.Chat_SendMessageToAll( string )
		end
	else
		MPGame_ApplicationCallback_ReceivedChatMessage( string, _AlliedOnly, GUI.GetPlayerID() )
    end
    

end


function
KeyBindings_AltFFour()
	GUIAction_ToggleMenu( "MainMenuBoxQuitAppWindow",1)
end

--------------------------------------------------------------------------------
-- Traverse heroes in selection
--------------------------------------------------------------------------------

function KeyBindings_NextHero()

	HeroSelection_Next()
	
	local HeroID = HeroSelection_GetCurrentSelectedHeroID()
	if HeroID ~= 0 then
		HeroWidgetUpdate_ShowHeroWidget(HeroSelection_GetCurrentSelectedHeroID())
	end
end

function KeyBindings_PreviousHero()

	HeroSelection_Previous()
	
	local HeroID = HeroSelection_GetCurrentSelectedHeroID()
	if HeroID ~= 0 then
		HeroWidgetUpdate_ShowHeroWidget(HeroSelection_GetCurrentSelectedHeroID())
	end
end