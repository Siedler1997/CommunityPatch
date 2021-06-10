
--	Input.KeyBindDown (Keys.NumPad9, "EnableDebugging()")


-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )

CP_Difficulty = 0

--Include cutscenes

Cutscenes = {}
Cutscenes[INTROCUTSCENE] = "INTRO"
Cutscenes[MISSIONCOMPLETECUTSCENE] = "MISSIONCOMPLETE"

IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()
Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )
Logic.SetDiplomacyState( 2, 8, Diplomacy.Hostile )
Logic.SetDiplomacyState( 3, 8, Diplomacy.Hostile )
Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )
Logic.SetDiplomacyState( 1, 8, Diplomacy.Neutral )
Logic.SetDiplomacyState( 1, 5, Diplomacy.Neutral )

	end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
	-- Set Colors

--PLAYER_COLOR 		= 1

--FRIENDLY_COLOR1		= 5
--FRIENDLY_COLOR2		= 3
--FRIENDLY_COLOR3		= 13

--ENEMY_COLOR1		= 6
--ENEMY_COLOR2		= 4

--NEPHILIM_COLOR		= 2
--EVIL_GOVERNOR_COLOR	= 9
--KERBEROS_COLOR 		= 12
--ROBBERS_COLOR		= 14

--NPC_COLOR			= 11

---cusom colors --

BLUE = 1
RED = 2


		Display.SetPlayerColorMapping(1, KERBEROS_COLOR)	
		Display.SetPlayerColorMapping(2,BLUE)		
		Display.SetPlayerColorMapping(3, BLUE)
		Display.SetPlayerColorMapping(5, 15)
		Display.SetPlayerColorMapping(7, BLUE)
		Display.SetPlayerColorMapping(6, NPC_COLOR)
		Display.SetPlayerColorMapping(8, NPC_COLOR)
		
	
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

--	local HumanPlayer = GUI.GetPlayerID()
--	ForbidAllUniversityTechnologies(HumanPlayer)
--	Logic.SetTechnologyState(HumanPlayer,Technologies.GT_StandingArmy,1)
--	Logic.SetTechnologyState(HumanPlayer,Technologies.GT_Metallurgy,1)
	
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Beautification01, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_University, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Farm, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Residence, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Barracks,3)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Archery,3)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Blacksmith,3)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Sawmill,3)

	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(3)
		ResearchAllMilitaryTechsAddOn(7)
	end

	
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start to initialize ai for all ai players
function Mission_InitAI()
	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game is loaded, setup your weather gfx
-- sets here
function Mission_InitWeatherGfxSets()

--	Display.SetRenderUseGfxSets(1)
	SetupSteppeWeatherGfxSet()
	
--	WeatherSets_SetupNormal(1)
--	WeatherSets_SetupRain(2)
--	WeatherSets_SetupSnow(3)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

	Logic.AddWeatherElement(2, 500, 1, 2, 5, 10)	-- Foggy with Rain
	Logic.AddWeatherElement(1, 400, 1, 1, 5, 10)	-- Sommer

	end

 
		-- [fun]  AddWeatherElement
		--          Add weather period on end of periods.
		-- Param1: Weather State of period, 1 = normal, 2 = rain, 3 = snow
		-- Param2: Duration of period in seconds
		-- Param3: Is periodic, 1 for (normal)periodic weather element else 0 for weather machine effects
		-- Param4: Gfx Set of this weather element
		-- Param5: Gfx Set forerun (gfx transition start some time before logic state change), time in seconds
		-- Param6: duration of Gfx Set transition

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

function Mission_InitMerchants()
	
	local mercenaryId = Logic.GetEntityIDByName("merchant")
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_BlackKnight_LeaderMace1, 3, ResourceType.Iron, 300)
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_Barbarian_LeaderClub1, 3, ResourceType.Iron, 300)
	Logic.AddMercenaryOffer(mercenaryId, Entities.PU_Scout, 5, ResourceType.Gold, 150)
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_BanditLeaderBow1, 3, ResourceType.Gold, 250)
	
	
end

	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

--	IncludeLocals("Cutscene_Control")

	-- Load mission files
	String.Init("CM05_02_SecuringThePath")
	
	IncludeGlobals("MapEditorTools")

	IncludeLocals("gameControl")
	IncludeLocals("player_1")
	IncludeLocals("player_2")
	IncludeLocals("player_3")

	IncludeLocals("armyPatrool_1")
	IncludeLocals("armyPatrool_2")
	IncludeLocals("armyPatrool_3")
	IncludeLocals("armyPatrool_4")
	IncludeLocals("armyPatrool_5")
	IncludeLocals("armyPatrool_6")
	IncludeLocals("armyPatrool_7")
	IncludeLocals("armyPatrool_8")
	IncludeLocals("armyPatrool_9")
	IncludeLocals("armyPatrool_10")
	IncludeLocals("armyPatrool_11")
	IncludeLocals("armyPatrool_12")
	IncludeLocals("armyPatrool_13")
	IncludeLocals("armyPatrool_14")
	IncludeLocals("armyPatrool_15")
	IncludeLocals("armyPatrool_16")
	IncludeLocals("armyPatrool_17")
	IncludeLocals("armyPatrool_18")
	IncludeLocals("armyPatrool_19")
	IncludeLocals("army_spawn")

	IncludeLocals("quest_1")
	IncludeLocals("quest_2")
	IncludeLocals("quest_defeat")

	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_thiefgo")
	IncludeLocals("briefing_quest2")
	IncludeLocals("briefing_quest2_end")


	createPlayer1()
	createPlayer2()
	createPlayer3()


	Mission_InitMerchants()
	
	-- set player names
	
		-- Logic.SetPlayerName(1, String.MainKey.."_Player1Name")

	-- Set Music-Set

		LocalMusic.UseSet = DARKMOORMUSIC

	-- Start time line

		TimeLine.Start()

	--	chest stuff
		
		--	the openers
		
			CreateChestOpener("kerberos")
			CreateChestOpener("mary")


	
	for i = 1,5,1 do
	local pos = GetPosition("RandomChest"..i)
	CreateChest(pos,chestCallbackG)
	end
	for i = 6,8,1 do
	local pos = GetPosition("RandomChest"..i)
	CreateChest(pos,chestCallbackI)
	end
	for i = 9,11,1 do
	local pos = GetPosition("RandomChest"..i)
	CreateChest(pos,chestCallbackG)
	end

	
			
	--	CreateRandomChests()

		StartChestQuest()
	
	-- Start prelude

	-- debugging stuff
	--EnableDebugging()
    --Game.GameTimeReset()

	
	start1stQuest()	

	--SetPlayerName(2, "Darios Truppen")
	SetPlayerName(2, String.Key("_Player2Name"))
	
	if CP_Difficulty > 0 then
		local towers1 = { Logic.GetPlayerEntities(2, Entities.PB_Tower2, 20, 0) }
		for i = 2, table.getn(towers1) do
			if IsExisting(towers1[i]) then
				ReplaceEntity(towers1[i], Entities.PB_Tower3)
			end
		end
	end

	--Tools.ExploreArea(-1, -1, 900)
end

chestCallbackG = function()
	local gold = Logic.GetRandom(800) + 500
	Message(XGUIEng.GetStringTableText("Support/ChestGold2a")..gold..XGUIEng.GetStringTableText("Support/ChestGold2b") )
	AddGold(gold)
end

chestCallbackI = function()
	local iron = Logic.GetRandom(500) + 400
	Message(XGUIEng.GetStringTableText("CM05_02_SecuringThePath/ChestIron2a")..iron..XGUIEng.GetStringTableText("CM05_02_SecuringThePath/ChestIron2b") )
	AddIron(iron)
end



