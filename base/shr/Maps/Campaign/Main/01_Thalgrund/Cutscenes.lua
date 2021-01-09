--------------------------------------------------------------------------------
-- CM01_01_Thalgrund_Cutscenes
--
-- Author: Thomas Friedmann
--
-- Last update: 28.05.2004
--------------------------------------------------------------------------------

function Mission_InitCutscenes()
	
	gvCamera_CutsceneStartTime = -1
	gvMission_FirstFlyByStarted = 0

	gvMission_Note = "npc_npc_dummy"
	
	-- Init Cameraposition
	gvMission_CameraPos1 		= {22993, 21979, -45, 4927, 42}
	gvMission_CameraPos2 		= {0, 0, 0, 0, 0}
	gvMission_CameraDuration 	= 0

	-- Intro
	--------------
	gvMission_Camera_Intro_Pos1 			= {15350.11, 20467.55, 116.33, 1200, 22} 
	gvMission_Camera_Intro_Pos2 		        = {15350.11, 20467.55, -69, 1200, 22}    
	gvMission_Camera_Intro_Duration 	        = 8                                      


	-- Hero Meets Serfs
	--------------
	gvMission_Camera_HeroMeetsSerfs_Pos1 		= {18278.56, 15515.40, 155.89, 2900, 13}
	gvMission_Camera_HeroMeetsSerfs_Pos2 		= {18278.56, 15515.40, 160, 1600, 13}
	gvMission_Camera_HeroMeetsSerfs_Duration 	= 10


	
	-- burning village to cathedral
	--------------
	gvMission_Camera_Village_To_Cathedral_Pos1 		= {23596, 22404, -45, 3294, 36} 
	gvMission_Camera_Village_To_Cathedral_Pos2 		= {27000, 34435, -45, 5580, 44}
	gvMission_Camera_Village_To_Cathedral_Duration 		= 10
	
	-- Johannes to endposition
	--------------
	gvMission_Camera_Johannes_To_Endposition_Pos1 		= {27000, 34435, -45, 5580, 44}
	gvMission_Camera_Johannes_To_Endposition_Pos2 		= {45572, 20745, -80, 5580, 44}
	gvMission_Camera_Johannes_To_Endposition_Duration 	= 10
	
	

	-- todo: First_Attack_At_Village2_Pos1 
	--------------
	gvMission_Camera_First_Attack_At_Village2_Pos1 		= {32772, 11968, 150, 5580, 44}
	gvMission_Camera_First_Attack_At_Village2_Pos2 		= {32250, 7952, -43, 1600, 42}
	gvMission_Camera_First_Attack_At_Village2_Duration 	= 10
	
	-- NPC_Market1
	--------------
	x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("NPC_Market1"))
	gvMission_Camera_NPC_Market1_Pos1 		= {x, y, -20, 1100, 28}
	gvMission_Camera_NPC_Market1_Pos2 		= {x+50, y+50, -10, 800, 15}
	gvMission_Camera_NPC_Market1_Duration 	= 5


	-- NPC_NeutralVillage1
	--------------
	x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("NPC_NeutralVillage1"))
	gvMission_Camera_NPC_NeutralVillage1_Pos1 		= {x, y, -29, 1100, 33}
	gvMission_Camera_NPC_NeutralVillage1_Pos2 		= {x, y, -29, 800, 25}
	gvMission_Camera_NPC_NeutralVillage1_Duration 	= 5
	
	-- NPC_NeutralVillage2
	--------------
	x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("NPC_NeutralVillage2"))
	gvMission_Camera_NPC_NeutralVillage2_Pos1 		= {x, y, -29, 1100, 33}
	gvMission_Camera_NPC_NeutralVillage2_Pos2 		= {x, y, -29, 800, 25}
	gvMission_Camera_NPC_NeutralVillage2_Duration 	= 5

	-- NPC_Forrest1
	--------------
	x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("NPC_Forrest1"))
	gvMission_Camera_NPC_Forrest1_Pos1 		= {x, y, -29, 1100, 33}
	gvMission_Camera_NPC_Forrest1_Pos2 		= {x, y, -29, 800, 25}
	gvMission_Camera_NPC_Forrest1_Duration 	= 5
	
	-- NPC_Forrest2
	--------------
	x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("NPC_Forrest2"))
	gvMission_Camera_NPC_Forrest2_Pos1 		= {x, y, -29, 1100, 33}
	gvMission_Camera_NPC_Forrest2_Pos2 		= {x, y, -29, 800, 25}
	gvMission_Camera_NPC_Forrest2_Duration 	= 5
	
	-- NPC_Waterfall1
	--------------
	x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("NPC_Waterfall1"))
	gvMission_Camera_NPC_Waterfall1_Pos1 		= {x, y, -59, 1100, 6}
	gvMission_Camera_NPC_Waterfall1_Pos2 		= {x-100, y,   20, 400, 4}
	gvMission_Camera_NPC_Waterfall1_Duration 	= 5
	
	-- NPC_Exit1
	--------------
	x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("NPC_Exit1"))
	gvMission_Camera_NPC_Exit1_Pos1 		= {x, y, -60, 1100, 20}
	gvMission_Camera_NPC_Exit1_Pos2 		= {x, y, -70, 800, 9}
	gvMission_Camera_NPC_Exit1_Duration 	= 5
	
	-- NPC_Village2_1
	--------------
	x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("NPC_Village2_1"))
	gvMission_Camera_NPC_Village2_1_Pos1 		= {x, y, -145, 1700, 25}
	gvMission_Camera_NPC_Village2_1_Pos2 		= {x, y, -85, 600, 15}
	gvMission_Camera_NPC_Village2_1_Duration 	= 5
	
	-- NPC_Village2_2
	--------------
	x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("NPC_Village2_2"))
	gvMission_Camera_NPC_Village2_2_Pos1 		= {x, y, 		-60, 1600, 13}
	gvMission_Camera_NPC_Village2_2_Pos2 		= {x+50, y+50, 	-45, 900, 10}
	gvMission_Camera_NPC_Village2_2_Duration 	= 5
	
	-- NPC_Village2_3
	--------------
	x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("NPC_Village2_3"))
	gvMission_Camera_NPC_Village2_3_Pos1 		= {x, y, -65, 2000, 15}
	gvMission_Camera_NPC_Village2_3_Pos2 		= {x, y, -45, 900, 15}
	gvMission_Camera_NPC_Village2_3_Duration 	= 5
	
	-- NPC_River1
	--------------
	x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("NPC_River1"))
	gvMission_Camera_NPC_River1_Pos1 		= {x, y, -29, 1100, 33}
	gvMission_Camera_NPC_River1_Pos2 		= {x, y, -29, 800, 25}
	gvMission_Camera_NPC_River1_Duration 	= 5
		
	
	
	
--TF	gvHQ_ID = Logic.GetEntityIDByName("Headquarter")

	--Get Player ID
	gvMission_PlayerID = GUI.GetPlayerID()	

	-- Set Player's name
	-- Logic.SetPlayerName(gvMission_PlayerID, "E3_DemoMap_Txt/robbers_name")

--	Mission_InitKeyBindings()
end


--------------------------------------------------------------------------------------
-- Init Key bindings (will also be called after loading the map)
--------------------------------------------------------------------------------------
function Mission_InitKeyBindings()

	Input.KeyBindDown(Keys.NumPad1,  "Mission_StartCutscene_Intro()")
	Input.KeyBindDown(Keys.NumPad2,  "Mission_StartCutscene_NPC_NeutralVillage1()")
	Input.KeyBindDown(Keys.NumPad3,  "Mission_StartCutscene_NPC_NeutralVillage2()")
	Input.KeyBindDown(Keys.NumPad4,  "Mission_StartCutscene_NPC_Forrest1()")
	Input.KeyBindDown(Keys.NumPad5,  "Mission_StartCutscene_NPC_Waterfall1()")
	Input.KeyBindDown(Keys.NumPad6,  "Mission_StartCutscene_NPC_Exit1()")
	Input.KeyBindDown(Keys.NumPad7,  "Mission_StartCutscene_NPC_Village2_1()")
	Input.KeyBindDown(Keys.NumPad8,  "Mission_StartCutscene_NPC_Village2_2()")
	Input.KeyBindDown(Keys.NumPad9,  "Mission_StartCutscene_NPC_Village2_3()")
	Input.KeyBindDown(Keys.NumPad0,  "Mission_StartCutscene_HeroMeetsSerfs()")

end



--------------------------------------------------------------------------------------
-- Update Cutscenes (complete List of all)
--------------------------------------------------------------------------------------
function Mission_UpdateCutscenes()

	Mission_UpdateCutscene()
	
end



--------------------------------------------------------------------------------------
-- Start Cutscenes
--------------------------------------------------------------------------------------

------------------------------
-- Start Cutscene in general
------------------------------
function Mission_StartCutscene()

    Display.SetFogColor (152,172,182)
    Display.SetFogStartAndEnd (1000, 15000)
    Display.SetRenderFog (1)

	Display_SetSummerValues()

	-- Set View distance
	Display.SetFarClipPlaneMinAndMax(0, 20000) 


	-- Set camera to start position	  		
	Mission_SetCamera(gvMission_CameraPos1)

	-- Set Cinematic mode
	Interface_SetCinematicMode(1)
    	
	-- Take time when Camera flight starts
	gvCamera_CutsceneStartTime = Logic.GetTime()
	

end


------------------------------
-- Start Cutscenes for NPCs
------------------------------

-- Intro
function Mission_StartCutscene_Intro()

	-- Any Cutscene already started? If yes, return
	if gvCamera_CutsceneStartTime >= 0 then
		return
	end	
	
	-- Set Camera Values
	gvMission_CameraPos1 		= gvMission_Camera_Intro_Pos1 		
	gvMission_CameraPos2 		= gvMission_Camera_Intro_Pos2 		
	gvMission_CameraDuration 	= gvMission_Camera_Intro_Duration 	
	
	-- Set camera to start position	  		
	Mission_SetCamera(gvMission_CameraPos1)
	
	-- Set text for note
	gvMission_Note = "mainquest_cm01_note"

	-- Start Cutscene
	Mission_StartCutscene()
	
end


-- Dario meets Serfs at mountain row
function Mission_StartCutscene_HeroMeetsSerfs()

	-- Any Cutscene already started? If yes, return
	if gvCamera_CutsceneStartTime >= 0 then
		return
	end	
	
	-- Set Camera Values
	gvMission_CameraPos1 		= gvMission_Camera_HeroMeetsSerfs_Pos1 		
	gvMission_CameraPos2 		= gvMission_Camera_HeroMeetsSerfs_Pos2 		
	gvMission_CameraDuration 	= gvMission_Camera_HeroMeetsSerfs_Duration 	

	-- Set text for note
	gvMission_Note = "mainquest_cm01_note2"

	-- Start Cutscene
	Mission_StartCutscene()
end

-- burning village to cathedral
function Mission_StartCutscene_Village_To_Cathedral()
	-- Any Cutscene already started? If yes, return
	if gvCamera_CutsceneStartTime >= 0 then
		return
	end	
	
	-- Set Camera Values
	gvMission_CameraPos1 		= gvMission_Camera_Village_To_Cathedral_Pos1
	gvMission_CameraPos2 		= gvMission_Camera_Village_To_Cathedral_Pos2
	gvMission_CameraDuration 	= gvMission_Camera_Village_To_Cathedral_Duration

	-- Set text for note
	gvMission_Note = "Village_To_Cathedral"

	-- Start Cutscene
	Mission_StartCutscene()
end

-- Johannes to endposition
function Mission_StartCutscene_Johannes_To_Endposition()
	-- Any Cutscene already started? If yes, return
	if gvCamera_CutsceneStartTime >= 0 then
		return
	end	
	
	-- Set Camera Values
	gvMission_CameraPos1 		= gvMission_Camera_Johannes_To_Endposition_Pos1
	gvMission_CameraPos2 		= gvMission_Camera_Johannes_To_Endposition_Pos2
	gvMission_CameraDuration 	= gvMission_Camera_Johannes_To_Endposition_Duration

	-- Set text for note
	gvMission_Note = "Village_To_Cathedral"

	-- Start Cutscene
	Mission_StartCutscene()
end


-- Village attacked
function Mission_StartCutscene_First_Attack_At_Village2()
	-- Any Cutscene already started? If yes, return
	if gvCamera_CutsceneStartTime >= 0 then
		return
	end	
	
	-- Set Camera Values
	gvMission_CameraPos1 		= gvMission_Camera_First_Attack_At_Village2_Pos1
	gvMission_CameraPos2 		= gvMission_Camera_First_Attack_At_Village2_Pos2
	gvMission_CameraDuration 	= gvMission_Camera_First_Attack_At_Village2_Duration

	-- Set text for note
	gvMission_Note = "First_Attack_At_Village2"

	-- Start Cutscene
	Mission_StartCutscene()
end


function Mission_StartCutscene_NPC_Market1()
	-- Any Cutscene already started? If yes, return
	if gvCamera_CutsceneStartTime >= 0 then
		return
	end	
	
	-- Set Camera Values
	gvMission_CameraPos1 		= gvMission_Camera_NPC_Market1_Pos1
	gvMission_CameraPos2 		= gvMission_Camera_NPC_Market1_Pos2
	gvMission_CameraDuration 	= gvMission_Camera_NPC_Market1_Duration

	-- Set text for note
	gvMission_Note = "npc_npc_market1"

	-- Start Cutscene
	Mission_StartCutscene()
end

function Mission_StartCutscene_NPC_NeutralVillage1()
	-- Any Cutscene already started? If yes, return
	if gvCamera_CutsceneStartTime >= 0 then
		return
	end	
	
	-- Set Camera Values
	gvMission_CameraPos1 		= gvMission_Camera_NPC_NeutralVillage1_Pos1
	gvMission_CameraPos2 		= gvMission_Camera_NPC_NeutralVillage1_Pos2
	gvMission_CameraDuration 	= gvMission_Camera_NPC_NeutralVillage1_Duration

	-- Set text for note
	gvMission_Note = "npc_npc_neutralvillage1"

	-- Start Cutscene
	Mission_StartCutscene()
end

function Mission_StartCutscene_NPC_NeutralVillage2()
	-- Any Cutscene already started? If yes, return
	if gvCamera_CutsceneStartTime >= 0 then
		return
	end	
	
	-- Set Camera Values
	gvMission_CameraPos1 		= gvMission_Camera_NPC_NeutralVillage2_Pos1
	gvMission_CameraPos2 		= gvMission_Camera_NPC_NeutralVillage2_Pos2
	gvMission_CameraDuration 	= gvMission_Camera_NPC_NeutralVillage2_Duration

	-- Set text for note
	gvMission_Note = "npc_npc_neutralvillage2"

	-- Start Cutscene
	Mission_StartCutscene()
end

function Mission_StartCutscene_NPC_Forrest1()
	-- Any Cutscene already started? If yes, return
	if gvCamera_CutsceneStartTime >= 0 then
		return
	end	
	
	-- Set Camera Values
	gvMission_CameraPos1 		= gvMission_Camera_NPC_Forrest1_Pos1
	gvMission_CameraPos2 		= gvMission_Camera_NPC_Forrest1_Pos2
	gvMission_CameraDuration 	= gvMission_Camera_NPC_Forrest1_Duration

	-- Set text for note
	gvMission_Note = "npc_npc_forrest1"

	-- Start Cutscene
	Mission_StartCutscene()
end

function Mission_StartCutscene_NPC_Forrest2()
	-- Any Cutscene already started? If yes, return
	if gvCamera_CutsceneStartTime >= 0 then
		return
	end	
	
	-- Set Camera Values
	gvMission_CameraPos1 		= gvMission_Camera_NPC_Forrest2_Pos1
	gvMission_CameraPos2 		= gvMission_Camera_NPC_Forrest2_Pos2
	gvMission_CameraDuration 	= gvMission_Camera_NPC_Forrest2_Duration

	-- Set text for note
	gvMission_Note = "npc_npc_forrest2"

	-- Start Cutscene
	Mission_StartCutscene()
end

function Mission_StartCutscene_NPC_Waterfall1()
	-- Any Cutscene already started? If yes, return
	if gvCamera_CutsceneStartTime >= 0 then
		return
	end	
	
	-- Set Camera Values
	gvMission_CameraPos1 		= gvMission_Camera_NPC_Waterfall1_Pos1
	gvMission_CameraPos2 		= gvMission_Camera_NPC_Waterfall1_Pos2
	gvMission_CameraDuration 	= gvMission_Camera_NPC_Waterfall1_Duration

	-- Set text for note
	gvMission_Note = "npc_npc_waterfall1"


	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("NPC_Waterfall1"))
	Mission_ExploreArea(x-50, y-20, 30)

	-- Start Cutscene
	Mission_StartCutscene()
end

function Mission_StartCutscene_NPC_Exit1()
	-- Any Cutscene already started? If yes, return
	if gvCamera_CutsceneStartTime >= 0 then
		return
	end	
	
	-- Set Camera Values
	gvMission_CameraPos1 		= gvMission_Camera_NPC_Exit1_Pos1
	gvMission_CameraPos2 		= gvMission_Camera_NPC_Exit1_Pos2
	gvMission_CameraDuration 	= gvMission_Camera_NPC_Exit1_Duration

	-- Set text for note
	gvMission_Note = "npc_npc_exit1"

	-- Start Cutscene
	Mission_StartCutscene()
end

function Mission_StartCutscene_NPC_Village2_1()
	-- Any Cutscene already started? If yes, return
	if gvCamera_CutsceneStartTime >= 0 then
		return
	end	
	
	-- Set Camera Values
	gvMission_CameraPos1 		= gvMission_Camera_NPC_Village2_1_Pos1
	gvMission_CameraPos2 		= gvMission_Camera_NPC_Village2_1_Pos2
	gvMission_CameraDuration 	= gvMission_Camera_NPC_Village2_1_Duration

	-- Set text for note
	gvMission_Note = "npc_npc_village2_1"

	-- Start Cutscene
	Mission_StartCutscene()
end

function Mission_StartCutscene_NPC_Village2_2()
	-- Any Cutscene already started? If yes, return
	if gvCamera_CutsceneStartTime >= 0 then
		return
	end	
	
	-- Set Camera Values
	gvMission_CameraPos1 		= gvMission_Camera_NPC_Village2_2_Pos1
	gvMission_CameraPos2 		= gvMission_Camera_NPC_Village2_2_Pos2
	gvMission_CameraDuration 	= gvMission_Camera_NPC_Village2_2_Duration

	-- Set text for note
	gvMission_Note = "npc_npc_village2_2"

	-- Start Cutscene
	Mission_StartCutscene()
end

function Mission_StartCutscene_NPC_Village2_3()
	-- Any Cutscene already started? If yes, return
	if gvCamera_CutsceneStartTime >= 0 then
		return
	end	
	
	-- Set Camera Values
	gvMission_CameraPos1 		= gvMission_Camera_NPC_Village2_3_Pos1
	gvMission_CameraPos2 		= gvMission_Camera_NPC_Village2_3_Pos2
	gvMission_CameraDuration 	= gvMission_Camera_NPC_Village2_3_Duration

	-- Set text for note
	gvMission_Note = "npc_npc_village2_3"

	-- Start Cutscene
	Mission_StartCutscene()
end

function Mission_StartCutscene_NPC_River1()
	-- Any Cutscene already started? If yes, return
	if gvCamera_CutsceneStartTime >= 0 then
		return
	end	
	
	-- Set Camera Values
	gvMission_CameraPos1 		= gvMission_Camera_NPC_River1_Pos1
	gvMission_CameraPos2 		= gvMission_Camera_NPC_River1_Pos2
	gvMission_CameraDuration 	= gvMission_Camera_NPC_River1_Duration

	-- Set text for note
	gvMission_Note = "npc_npc_river1"

	-- Start Cutscene
	Mission_StartCutscene()
end





------------------------------
-- Update Cutscene 
------------------------------
function Mission_UpdateCutscene()

	-- Started? If not, return 1 means destroy trigger
	if gvCamera_CutsceneStartTime < 0 then
		return 1
	end
	
	-- Get time since start
	local InCutSceneSecond = Logic.GetTime() - gvCamera_CutsceneStartTime
	-- Duration of Cutscene
	local WaitAtTheEndDuration 	= 2
	local CutsceneLength 		= 	gvMission_CameraDuration + WaitAtTheEndDuration
	
	-- Cut scene done?	
	if InCutSceneSecond > CutsceneLength then
		Mission_EndCutscene()
		-- return 1 means destroy trigger
		return 1
	end
	
	--update camera
	do
		if 	InCutSceneSecond >= 0 and 
			gvMission_FirstFlyByStarted == 0 then
			
			Mission_CameraFlyby(gvMission_CameraPos2, gvMission_CameraDuration)
			gvMission_FirstFlyByStarted = 1
		end
		
--		if 	InCutSceneSecond >= FlightDuration1	and 
--			gvMission_FirstFlyByStarted == 1 then
--			
--			Mission_CameraFlyby(gvMission_Camera_NPC_Market1_Pos3, FlightDuration2)
--			gvMission_FirstFlyByStarted = 2
--			
--		end
	end
	-- continue updating cutscene
	return 0
end



------------------------------
-- End Cutscene 
------------------------------
function Mission_EndCutscene()
	
	-- Cut scene really started?
	if gvCamera_CutsceneStartTime < 0 then
		return
	end
	
	-- disable Cutscene mode
	Display_SetDefaultValues()
	Interface_SetCinematicMode(0)
	
--	-- Reset camera
--	Camera.RotSetAngle( -45 )                
--	Camera.RotSetFlipBack( 1 )

	gvMission_FirstFlyByStarted = 0
	-- Invalidate start time
	gvCamera_CutsceneStartTime = -1
	
	-- Display a note
	local DestinationName = "CM01_01_Thalgrund_Txt/" .. gvMission_Note
	GUI.AddNote(XGUIEng.GetStringTableText(DestinationName))
	Sound.Play2DSound( Sounds.fanfare, 0 )

end



--------------------------------------------------------------------------------------
-- Unsorted functions
--------------------------------------------------------------------------------------
-- Set start camera
function Mission_SetCamera(_CameraTable)

	local CameraLookAt_x 	= _CameraTable[1]
	local CameraLookAt_y 	= _CameraTable[2]
	local RotAngel			= _CameraTable[3]
	local ZoomDistance		= _CameraTable[4]
	local ZoomAngel			= _CameraTable[5]

	Camera.ScrollUpdateZMode(0)
	Camera.ZoomSetDistance(ZoomDistance)
	Camera.RotSetAngle(RotAngel)	
	Camera.ZoomSetAngle(ZoomAngel)			
	Camera.ScrollSetLookAt(CameraLookAt_x, CameraLookAt_y)	
end

-- Interpolate Camera Flight from Current Position to Target Position in _Time seconds
function Mission_CameraFlyby(_CameraTable, _Duration)

	local CameraLookAt_x 	= _CameraTable[1]
	local CameraLookAt_y 	= _CameraTable[2]
	local RotAngel			= _CameraTable[3]
	local ZoomDistance		= _CameraTable[4]
	local ZoomAngel			= _CameraTable[5]
         
	Camera.ZoomSetDistanceFlight(ZoomDistance, _Duration)
	Camera.ZoomSetAngleFlight(ZoomAngel, _Duration)
	Camera.FlyToLookAt(CameraLookAt_x, CameraLookAt_y, _Duration)
	Camera.RotFlight(RotAngel, _Duration)

end



-- Explore Area
function Mission_ExploreArea(_x, _y, _Range)
	local ViewCenter = Logic.CreateEntity(Entities.XD_ScriptEntity, _x, _y, 0, 1)
	Logic.SetEntityExplorationRange(ViewCenter, _Range)
end


