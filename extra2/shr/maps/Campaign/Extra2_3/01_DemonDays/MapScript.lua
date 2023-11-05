
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
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 1, 8, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 3, 5, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 4, 5, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 6, Diplomacy.Hostile )

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

	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, KERBEROS_COLOR)	
	if p1color ~= 2 then
		Display.SetPlayerColorMapping(2, NEPHILIM_COLOR)	
	else
		Display.SetPlayerColorMapping(2, ENEMY_COLOR1)	
	end
	Display.SetPlayerColorMapping(3, p1color)
	Display.SetPlayerColorMapping(4, p1color)
	Display.SetPlayerColorMapping(5, NPC_COLOR)
	Display.SetPlayerColorMapping(6, ROBBERS_COLOR)
	Display.SetPlayerColorMapping(7, NPC_COLOR)
	if p1color ~= 5 then
		Display.SetPlayerColorMapping(8, BARBARIAN_COLOR)	
	else
		Display.SetPlayerColorMapping(8, 3)	
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
	
	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		local animalTech2 = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			animalTech2 = true
		end
		ResearchAnimalTechs(2, animalTech2)
		ResearchAnimalTechs(3, animalTech2)
		ResearchAnimalTechs(4, animalTech2)
		ResearchAnimalTechs(6, animalTech2)
		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(3)
		ResearchAllMilitaryTechsAddOn(4)
		ResearchAllMilitaryTechsAddOn(6)
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
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

	Logic.AddWeatherElement(1, 900, 1, 1, 5, 10)	-- Sommer
	Logic.AddWeatherElement(2, 80, 1, 2, 5, 10)	-- Foggy with Rain

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
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_BlackKnight_LeaderMace2, 5, ResourceType.Iron, 250)
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_Barbarian_LeaderClub2, 2, ResourceType.Iron, 220)
	Logic.AddMercenaryOffer(mercenaryId, Entities.PU_Scout, 5, ResourceType.Gold, 150)
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_BanditLeaderBow2, 3, ResourceType.Gold, 250)
	
	
end

	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

--	IncludeLocals("Cutscene_Control")

	-- Load mission files
	String.Init("CM05_01_DemonDays")


	IncludeLocals("gameControl")
	IncludeLocals("player_1")
	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_4")
--	IncludeLocals("player_5")
	IncludeLocals("player_7")
	IncludeLocals("player_8")
	IncludeLocals("quest_1")
	IncludeLocals("quest_2")
	IncludeLocals("quest_3")
	IncludeLocals("quest_4")
	IncludeLocals("quest_5")
	IncludeLocals("quest_6")
	IncludeLocals("quest_7")
	IncludeLocals("init_NPC")
	IncludeLocals("quest_defeat")
	IncludeLocals("army_defend")
	IncludeLocals("army_spawn")
        IncludeLocals("briefing_peasantrun")
        IncludeLocals("briefing_victim")
	IncludeLocals("briefing_monastery")
	IncludeLocals("briefing_archery")
	IncludeLocals("briefing_mary")
	IncludeLocals("briefing_safemary")
	IncludeLocals("briefing_shepard")
	IncludeLocals("briefing_varg")
	IncludeLocals("briefing_thief")
	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_scriptorium")
	
	
	ScoutFoerster_gvScoutFoerster.GROWTH_LEVELS = table.getn(ScoutFoerster_SET_DarkTree)
	ScoutFoerster_gvScoutFoerster.treeSet = ScoutFoerster_SET_DarkTree

	createPlayer1()
	createPlayer2()
	createPlayer3()
	createPlayer4()
--	createPlayer5()
	createPlayer7()
	createPlayer8()

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


			StartChestQuest()


	
	-- Start prelude

		--EnableDebugging()
	
		start1stQuest()	

	--SetPlayerName(2, "Nephilim")
	SetPlayerName(2, String.Key("_Player2Name"))
	--SetPlayerName(3, "Darios Truppen")
	SetPlayerName(3, String.Key("_Player3Name"))
	SetPlayerName(8, String.Key("_Player8Name"))

	if CP_Difficulty > 0 then
		if CP_Difficulty == 2 then
			GUI.SetTaxLevel(1)
			
			ReplaceEntity("p7_7", Entities.PB_Blacksmith1)
		else
			CreateRandomChests()
		end

		local towers1 = { Logic.GetPlayerEntities(3, Entities.PB_Tower2, 48, 0) }
		for i = 2, table.getn(towers1) do
			if IsExisting(towers1[i]) then
				ReplaceEntity(towers1[i], Entities.PB_Tower3)
			end
		end
	else
		CreateRandomChests()
	end

	RaidersCreate({player = 6, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 4)})
	RaidersCreate({player = 6, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 6, pos = "bearpos2", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})

	--Tools.ExploreArea(-1, -1, 900)
	--StartSimpleJob("GetMousePos")
end
