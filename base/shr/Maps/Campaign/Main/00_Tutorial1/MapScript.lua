--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Map Name : 	CM01_00_Tutorial1
-- Author : 	Frank "dread_man" Hoffmeister and Andreas Suika
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

Script.Load( "Data\\Script\\MapTools\\Main.lua" )
Script.Load("Data\\Script\\MapTools\\WeatherSets.lua")

function GameCallback_OnGameStart() 	

	-- Include global tool script functions
	Script.Load( "Data\\Script\\MapTools\\GlobalMissionScripts.lua" )
	Script.Load( "Data\\Script\\MapTools\\AI\\Support.lua" )
	Script.Load( "Data\\Script\\MapTools\\Comfort.lua" )
	Script.Load( "Data\\Script\\MapTools\\Information.lua" )
	Script.Load( "Data\\Script\\MapTools\\String.lua" )
	
	-- Include map Scripts

    if Framework.CheckIDV() then
    
	    Script.Load( "Data\\Maps\\Singleplayer\\00_Tutorial1\\Cutscenes.lua" )
	    Script.Load( "Data\\Maps\\Singleplayer\\00_Tutorial1\\Quest.lua" )
	
    	Script.Load( "Data\\Maps\\Singleplayer\\00_Tutorial1\\briefing_helias.lua" )
	
	    Script.Load( "Data\\Maps\\Singleplayer\\00_Tutorial1\\Mentor.lua" )
	    Script.Load( "Data\\Maps\\Singleplayer\\00_Tutorial1\\Cutscene_Control.lua" )

    else
    
	    Script.Load( "Data\\Maps\\Campaign\\Main\\00_Tutorial1\\Cutscenes.lua" )
	    Script.Load( "Data\\Maps\\Campaign\\Main\\00_Tutorial1\\Quest.lua" )
	
    	Script.Load( "Data\\Maps\\Campaign\\Main\\00_Tutorial1\\briefing_helias.lua" )
	
	    Script.Load( "Data\\Maps\\Campaign\\Main\\00_Tutorial1\\Mentor.lua" )
	    Script.Load( "Data\\Maps\\Campaign\\Main\\00_Tutorial1\\Cutscene_Control.lua" )

    end
	
	gvMission = {}
	
	--Init global variables
	gvMission.MentorFlag 				= 0
	gvMission.MentorWaitTime 			= 0	
	gvMission.CurrentCameraPosEntity 	= 0
	gvMission.StandardID				= 0
	gvMission.LeaderID 					= 0
	gvMission.Bandit1ID					= 0
	gvMission.Bandit2ID					= 0
	gvMission.BehindWaterfall			= Logic.GetEntityIDByName("Switch_PlayerID")
	gvMission.EricID					= Logic.GetEntityIDByName("Erec")
	gvMission.PilgrimID					= Logic.GetEntityIDByName("Pilgrim")
	gvMission.NPCID						= Logic.GetEntityIDByName("NPC_Hint")		
	gvMission.HeliasGridID				= Logic.GetEntityIDByName("HeliasGrid")			
	gvMission.HeliasID					= Logic.GetEntityIDByName("helias")	
	gvMission.HeliasPosition = {}
	Tools.GetEntityPosition(gvMission.HeliasID, gvMission.HeliasPosition)
	gvMission.HeliasGuardPos1			= Logic.GetEntityIDByName("P5_HeliasGuard1")	
	gvMission.HeliasGuardPos2			= Logic.GetEntityIDByName("P5_HeliasGuard2")	
	gvMission.BlackKnightPos			= Logic.GetEntityIDByName("P8_BlackKnightSpawn")	
	gvMission.BlackLeaderPos			= Logic.GetEntityIDByName("P8_BlackKnightLeaderSpawn")	
	
	gvMission.NearP5TownPos1			= Logic.GetEntityIDByName("NearP5Town1")	
	gvMission.NearP5TownPos2			= Logic.GetEntityIDByName("NearP5Town2")	
	gvMission.P5TownGuardPos			= Logic.GetEntityIDByName("P5_TownGuard")		
	gvMission.StartPos 					= Logic.GetEntityIDByName("StartPos")
	gvMission.BuildUpPos 				= Logic.GetEntityIDByName("BuildUp_Pos")
	gvMission.BuildUpPosition = {}
	Tools.GetEntityPosition(gvMission.BuildUpPos, gvMission.BuildUpPosition)
	gvMission.GoTo1 					= Logic.GetEntityIDByName("GoTo_1")
	gvMission.GoTo2 					= Logic.GetEntityIDByName("GoTo_2")
	gvMission.GoTo3 					= Logic.GetEntityIDByName("GoTo_3")
	gvMission.GoTo4 					= Logic.GetEntityIDByName("GoTo_4")
	gvMission.BuildPos					= Logic.GetEntityIDByName("Gathering_Point")
	gvMission.StartResource				= Logic.GetEntityIDByName("smallclay_03")
	gvMission.ClayMine					= Logic.GetEntityIDByName("clay_mine")	
	gvMission.ExplainVillageCenterID	= Logic.GetEntityIDByName("ExplainVillageCenter")	
	gvMission.ExplainVillageCenterPosition = {}
	Tools.GetEntityPosition(gvMission.ExplainVillageCenterID, gvMission.ExplainVillageCenterPosition)
	
	
	gvMission.HighlightButton 			= {0,0,0,0,0}
	gvMission.HighlightButtonCounter 	= 1
	
	gvMission.UpdateCamera = 1
	
	
	gvMission.StartPos_x, gvMission.StartPos_y = Logic.EntityGetPos(gvMission.StartPos)		
	
	--Register Triggers
	Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND, NIL, "Mission_EverySecond", 1)	
	
	
	--preload all models
	Display.LoadAllModels()
	
	Mission_InitMission()	
	Mission_InitCutscenes()
	
	
	Input.KeyBindDown(Keys.T,   "DBG_Test()",true)
	
	Mission_InitWeather()

	-- Only summer weather period
	Logic.AddWeatherElement(1, 5, 1, 1, 5, 10)
	
	Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND, NIL, "Mission_Mentor", 1)
	Mission_TutorialKeyBindings()
	
	String.Init("CM01_00_Tutorial1_Txt")
	createBriefingHelias()
	gvMission.ErecDieTrigger = StartJob("ErecDied")
	
end


--------------------------------------------------------------------------------
-- Give money, set camera and light, set diplomacy
function
Mission_InitMission()
	--Get Player ID
	gvMission.PlayerID = GUI.GetPlayerID()	
	
	gvMission.WoodCurrentAmount = 0
	
	-- Init player colors
	Display.SetPlayerColorMapping(1, GetPlayerPreferredColor())
	Display.SetPlayerColorMapping(2, PLAYER_FRIEND_COLOR)
	Display.SetPlayerColorMapping(3, ROBBERS_COLOR)
	Display.SetPlayerColorMapping(8, KERBEROS_COLOR)

	-- Init weather gfx
	Display.SetRenderUseGfxSets(1)
	WeatherSets_SetupNormal(1)

	-- Init diplomacy
	Logic.SetDiplomacyState( 1, 2, Diplomacy.Friendly )	
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )		
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile )		
	Logic.SetShareExplorationWithPlayerFlag(1,2,1)

	Mission_InitGroups()	
	Mission_InitTechnolgies()

	--Set start position	
	Camera.ScrollGameTimeSynced(gvMission.StartPos_x, gvMission.StartPos_y)
	
	--Create Script entity to check distance to start position
	--The position of this entity will be moved synchron with the camera pos
	gvMission.CurrentCameraPosEntity = Logic.CreateEntity(Entities.XD_ScriptEntity, gvMission.StartPos_x, gvMission.StartPos_y,0,1)
	
	--Explore Waterfall	
	Logic.SetEntityExplorationRange(Logic.GetEntityIDByName("Waterfall"),20)
	
	Logic.PlayerSetIsHumanFlag( gvMission.PlayerID, 1 )
	Logic.PlayerSetGameStateToPlaying( gvMission.PlayerID )
		
	
end

function 
Mission_OnSaveGameLoaded()
	Mission_TutorialKeyBindings()
	
	Mission_StartText( gvMission.LastText[1], gvMission.LastText[2] )
	gvMission.MentorWaitTime = 0
	Mission_InitWeather()
	
	-- Init player colors
	Display.SetPlayerColorMapping(1, GetPlayerPreferredColor())
	Display.SetPlayerColorMapping(2, PLAYER_FRIEND_COLOR)
	Display.SetPlayerColorMapping(3, ROBBERS_COLOR)
	Display.SetPlayerColorMapping(8, KERBEROS_COLOR)
end

function
Mission_InitWeather()
	-- Use gfx sets
	Display.SetRenderUseGfxSets(1)
	
	WeatherSets_SetupNormal(1)
	WeatherSets_SetupRain(2)
	WeatherSets_SetupSnow(3)
	-- Init with gfx set 1
	Logic.SetupGfxSet(1)
end


function 
Mission_TutorialKeyBindings()
	Input.KeyBindDown(Keys.Enter ,			"MakeOneStep()", 2)		
end

--------------------------------------------------------------------------------
-- Create Leaders and attach Soldiers
function
Mission_InitGroups()
	
	--Generate players groups
	local P1_Spawn = Logic.GetEntityIDByName("P1_Military_Spawn")
	local P1_Spawn_x, P1_Spawn_y = Logic.EntityGetPos(P1_Spawn)	
	gvMission.LeaderID = GlobalMissionScripting.CreateGroup(1, Entities.PU_LeaderSword1, 8, P1_Spawn_x, P1_Spawn_y, 135 )
	Logic.SetEntitySelectableFlag(gvMission.LeaderID,0)	
	
	--Generate bandits
	local P3_Spawn_1 = Logic.GetEntityIDByName("P3_Bandits_1")
	local P3_Spawn_1_X, P3_Spawn_1_Y = Logic.EntityGetPos( P3_Spawn_1 )	
	gvMission.Bandit1ID = GlobalMissionScripting.CreateGroup(3, Entities.CU_BanditLeaderSword1, 6, P3_Spawn_1_X, P3_Spawn_1_Y, 90 )	
	Logic.SettlerDefend(gvMission.Bandit1ID)
	
	
	--local P3_Spawn_2 = Logic.GetEntityIDByName("P3_Bandits_2")
	local P5_Spawn_Guard1_X, P5_Spawn_Guard1_Y = Logic.EntityGetPos( gvMission.HeliasGuardPos1 )	
	gvMission.HeliasGuard1ID = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderPoleArm2, 4, P5_Spawn_Guard1_X, P5_Spawn_Guard1_Y, 315 )	
	
	local P5_Spawn_Guard2_X, P5_Spawn_Guard2_Y = Logic.EntityGetPos( gvMission.HeliasGuardPos2 )	
	gvMission.HeliasGuard2ID = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderSword2, 4, P5_Spawn_Guard2_X, P5_Spawn_Guard2_Y, 315 )	
	
	local P5_Spawn_Guard3_X, P5_Spawn_Guard3_Y = Logic.EntityGetPos( gvMission.P5TownGuardPos )	
	gvMission.TownGuardID = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderBow2, 4, P5_Spawn_Guard3_X, P5_Spawn_Guard3_Y, 315 )	
	
	
end
--Switch_PlayerID

--------------------------------------------------------------------------------
-- Init Technologies
function
Mission_InitTechnolgies()

	
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Market,0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Monastery,0)	
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.GT_Literacy,3)	
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_AdjustTaxes,2)
	
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.UP1_University,0)	
	
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.GT_Mercenaries,0)	
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.GT_Construction,0)	
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.GT_Alchemy,0)		
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.UP1_Residence,0)	
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_OnlineHelp,0)	
	--Update all buttons in the visible container
	XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)
	
	Logic.SetPlayerPaysLeaderFlag(1,0)
	
	
end

--------------------------------------------------------------------------------
-- Function, that is called each second


function
Mission_EverySecond()
	
	
	-- decrement the counter for the wait time
	if gvMission.MentorWaitTime >= 1 then
				
		if gvMission.MentorWaitTime == gvMission.StreamDuration then
			GUI.AddStaticNote(XGUIEng.GetStringTableText("CM01_00_Tutorial1_Txt/space"))		
		end
		gvMission.MentorWaitTime = gvMission.MentorWaitTime - 1
	end
	
	if gvMission.MentorWaitTime == 0 then
		XGUIEng.ShowWidget("TutorialMessageBG",0)	
		GUI.ClearNotes()
	end
	
	
	if	gvMission.HighlightButton[1] ~= 0 then
	
		gvMission.HighlightButtonCounter = 1 - gvMission.HighlightButtonCounter 
	
		if gvMission.HighlightButtonCounter == 1 then	
			for i=0, 4,1
			do
				XGUIEng.SetMaterialColor(gvMission.HighlightButton[1],i, gvMission.HighlightButton[2],gvMission.HighlightButton[3],gvMission.HighlightButton[4],gvMission.HighlightButton[5])		
			end			
		end		
		if gvMission.HighlightButtonCounter == 0 then
			for i=0, 4,1
			do
				
				if gvMission.HighlightButton[1] == "TutorialResourceHighlighter" then
					XGUIEng.SetMaterialColor(gvMission.HighlightButton[1],i, 255,255,255,0)		
				else
					XGUIEng.SetMaterialColor(gvMission.HighlightButton[1],i, 255,255,255,gvMission.HighlightButton[5])		
				end
			end
			
		end
		
		
	end
	
	
	if gvMission.UpdateCamera == 1 then
		Mission_UpdateCameraEntityPos()
	end
	
	
	Mission_UpdateCutscene1()
	
end

function
Mission_StopHighlighting()
	
	for i=0,4,1
	do
		if gvMission.HighlightButton[1] == "TutorialResourceHighlighter" then
			XGUIEng.SetMaterialColor(gvMission.HighlightButton[1],i, 255,255,255,0)		
		else
			XGUIEng.SetMaterialColor(gvMission.HighlightButton[1],i, 255,255,255,gvMission.HighlightButton[5])		
		end
	end
	
	gvMission.HighlightButton = {0,0,0,0,0}
end

--------------------------------------------------------------------------------
-- Checks and updates


function
Mission_UpdateCameraEntityPos()
 	 	
 	if gvMission.CurrentCameraPosEntity ~= 0 then 		
 		local camera_x, camera_y = Camera.ScrollGetLookAt() 		
 		if camera_x >= 0 and camera_x <= 51200
 		and camera_y >= 0 and camera_y <= 51200 then
 			Logic.DestroyEntity(gvMission.CurrentCameraPosEntity)
 			gvMission.CurrentCameraPosEntity = Logic.CreateEntity(Entities.XD_ScriptEntity, camera_x, camera_y,0,1) 		
 		end
  	end
  	
end


function
MakeOneStep()
	if gvMission.MentorWaitTime ~= -1 then
		gvMission.MentorWaitTime = 0	
	end
end



function
Mission_StartText( _keyname, _waitflag )
	
	Stream.Start("Voice\\CM01_00_Tutorial1_Txt\\" .. _keyname ..".mp3", 127)
	local Duration = Stream.GetDuration()
	
	if _waitflag == 1 then
		gvMission.MentorWaitTime = math.floor(Duration + 2)
		gvMission.StreamDuration = math.floor(Duration )
	else
		gvMission.MentorWaitTime = -1
	end
	
	GUI.ClearNotes()
	GUI.AddStaticNote(XGUIEng.GetStringTableText("CM01_00_Tutorial1_Txt/".._keyname))				
	XGUIEng.ShowWidget("TutorialMessageBG",1)	
	gvMission.LastText = { _keyname, _waitflag}
	
end



function
Condition_ErecDied()
	return 	 IsDead(gvMission.EricID)
	
end


function
Action_ErecDied()	
	--mark player as winner
	if Logic.PlayerGetGameState(gvMission.PlayerID) == 1 then					
		Logic.PlayerSetGameStateToLost(gvMission.PlayerID)						
	end
	return true
	
end
