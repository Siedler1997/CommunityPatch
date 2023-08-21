--	Input.KeyBindDown (Keys.NumPad9, "EnableDebugging()")

-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )

CP_Difficulty = 0

--Script.Load( "Data\\Script\\MapTools\\Main.lua" )

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
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 1, 6, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 1, 8, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 3, 5, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 4, 5, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 4, 7, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 2, 7, Diplomacy.Hostile )

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

	---custom colors --

	BLUE = 1
	RED = 2

	Display.SetPlayerColorMapping(1, KERBEROS_COLOR)
	Display.SetPlayerColorMapping(6, ROBBERS_COLOR)
	Display.SetPlayerColorMapping(7, KERBEROS_COLOR)
	Display.SetPlayerColorMapping(8, NPC_COLOR)	
	
	if CP_Difficulty < 2 then
		Display.SetPlayerColorMapping(2, PLAYER_COLOR)
		Display.SetPlayerColorMapping(3, PLAYER_COLOR)
		Display.SetPlayerColorMapping(4, PLAYER_COLOR)
		Display.SetPlayerColorMapping(5, 15)
	else
		Display.SetPlayerColorMapping(2, NEPHILIM_COLOR)
		Display.SetPlayerColorMapping(3, NEPHILIM_COLOR)
		Display.SetPlayerColorMapping(4, NEPHILIM_COLOR)
		Display.SetPlayerColorMapping(5, 16)
	end
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Tavern, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Beautification01, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_ThiefSabotage,3)

	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		local animalTech2 = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			animalTech2 = true
		end
		ResearchAnimalTechs(2, animalTech2)
		ResearchAnimalTechs(3, animalTech2)
		ResearchAnimalTechs(4, animalTech2)
		ResearchAnimalTechs(5, animalTech2)
		ResearchAnimalTechs(6, animalTech2)
		ResearchAnimalTechs(7, animalTech2)

		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(3)
		ResearchAllMilitaryTechsAddOn(4)
		ResearchAllMilitaryTechsAddOn(5)
		ResearchAllMilitaryTechsAddOn(6)
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

	Display.SetRenderUseGfxSets(1)
	
	WeatherSets_SetupNormal(1)
	WeatherSets_SetupRain(2)
	WeatherSets_SetupSnow(3)
	WeatherSets_SetupNormal(4, 0, 1)
	WeatherSets_SetupRain(5, 1, 1)
	WeatherSets_SetupSnow(6, 0, 0)
	WeatherSets_SetupSnow(7, 1, 0)
	WeatherSets_SetupSnow(8, 1, 1)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

--	Logic.AddWeatherElement(1, 700, 1, 1, 5, 10)	-- Sommer
--	Logic.AddWeatherElement(2, 140, 1, 2, 5, 10)	-- Foggy with Rain
--	Logic.AddWeatherElement(1, 320, 1, 1, 5, 10)	-- Sommer
--	Logic.AddWeatherElement(2, 60, 1, 2, 5, 10)		-- Foggy with Rain
	Logic.AddWeatherElement(3, 60, 1, 5, 5, 10)		-- Foggy with Rain and Snow
	Logic.AddWeatherElement(3, 60, 1, 4, 5, 10)		-- Foggy with Snow
	Logic.AddWeatherElement(3, 320, 1, 3, 5, 10)	-- Winter with Snow
	Logic.AddWeatherElement(3, 120, 1, 6, 5, 10)		-- Winter
	Logic.AddWeatherElement(3, 200, 1, 3, 5, 10)	-- Winter with Snow
	Logic.AddWeatherElement(3, 90, 1, 8, 5, 10)		-- Winter with Rain and Snow
	Logic.AddWeatherElement(3, 60, 1, 7, 5, 10)		-- Winter with Rain
	Logic.AddWeatherElement(3, 90, 1, 2, 5, 10)		-- Foggy with Snow
--	Logic.AddWeatherElement(1, 300, 1, 1, 5, 10)		-- Sommer
--	Logic.AddWeatherElement(2, 130, 1, 2, 5, 10)	-- Foggy with Rain

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
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_BlackKnight_LeaderMace2, 3, ResourceType.Iron, 300)
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_Barbarian_LeaderClub2, 3, ResourceType.Iron, 250)
	Logic.AddMercenaryOffer(mercenaryId, Entities.PU_Scout, 5, ResourceType.Gold, 150)
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_BanditLeaderBow2, 3, ResourceType.Gold, 200)
end

	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

--	IncludeLocals("Cutscene_Control")

	-- Load mission files
	String.Init("CM05_04_DarknessUprise")


	IncludeLocals("gameControl")
	IncludeLocals("player_1")
	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_4")
	IncludeLocals("player_5")
	IncludeLocals("player_7")
	IncludeLocals("player_8")
	IncludeLocals("caravans")
	IncludeLocals("quest_1")
	IncludeLocals("quest_2")
	IncludeLocals("quest_3")
	IncludeLocals("army_defend")
	IncludeLocals("briefing_pilgrim")
	IncludeLocals("briefing_bandit")
	IncludeLocals("briefing_thief")
	IncludeLocals("briefing_lowerbridge")
	IncludeLocals("briefing_bridgedown")
	IncludeLocals("quest_defeat")
	IncludeLocals("army_defend")
	IncludeLocals("army_spawn")
    IncludeLocals("briefing_thiefdead")
	IncludeLocals("briefing_tavernkeeper")
	IncludeLocals("briefing_q3")
	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_q2")

	createPlayer1()
	createPlayer2()
	createPlayer3()
	createPlayer4()

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
	CreateChestOpener("varg")



--
	StartChestQuest()


	
	-- Start prelude

	--EnableDebugging()

	


	start1stQuest()
	SetPlayerName(2, String.Key("_Player2Name"))	
	--SetPlayerName(2, "Darios Truppen")
		
	if CP_Difficulty > 0 then
		if CP_Difficulty == 2 then
			GUI.SetTaxLevel(1)
		end

		local towers1 = { Logic.GetPlayerEntities(2, Entities.PB_Tower2, 20, 0) }
		for i = 2, table.getn(towers1) do
			if IsExisting(towers1[i]) then
				ReplaceEntity(towers1[i], Entities.PB_Tower3)
			end
		end
		local towers2 = { Logic.GetPlayerEntities(3, Entities.PB_Tower2, 5, 0) }
		for i = 2, table.getn(towers2) do
			if IsExisting(towers2[i]) then
				ReplaceEntity(towers2[i], Entities.PB_Tower3)
			end
		end
		local towers3 = { Logic.GetPlayerEntities(4, Entities.PB_Tower2, 5, 0) }
		for i = 2, table.getn(towers3) do
			if IsExisting(towers3[i]) then
				ReplaceEntity(towers3[i], Entities.PB_Tower3)
			end
		end
	else
		CreateRandomChests()
	end
	if CP_Difficulty < 2 then
		Display.SetPlayerColorMapping(2, PLAYER_COLOR)
		Display.SetPlayerColorMapping(3, PLAYER_COLOR)
		Display.SetPlayerColorMapping(4, PLAYER_COLOR)
		Display.SetPlayerColorMapping(5, 15)
	else
		Display.SetPlayerColorMapping(2, NEPHILIM_COLOR)
		Display.SetPlayerColorMapping(3, NEPHILIM_COLOR)
		Display.SetPlayerColorMapping(4, NEPHILIM_COLOR)
		Display.SetPlayerColorMapping(5, 16)
	end
	RaidersCreate({player = 6, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 6, pos = "bearpos2", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})

	--Tools.ExploreArea(-1, -1, 900)
	--StartSimpleJob("GetMousePos")
end
