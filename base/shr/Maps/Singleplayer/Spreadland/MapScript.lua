
-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )

IncludeLocals("gameControl")

IncludeLocals("player_2")
IncludeLocals("player_3")
IncludeLocals("player_4")
IncludeLocals("player_5")
IncludeLocals("player_7")

IncludeLocals("briefing_bigBattle")
IncludeLocals("briefing_destroyTowers")
IncludeLocals("briefing_magicFoundry")
IncludeLocals("briefing_siege")
IncludeLocals("briefing_bigArmy")
IncludeLocals("briefing_supportArmy")
IncludeLocals("briefing_merchant1Dialog")
IncludeLocals("briefing_merchant2Dialog")

IncludeLocals("army_tools")
IncludeLocals("army_hostile1")
IncludeLocals("army_hostile2")
IncludeLocals("army_hostile3")
IncludeLocals("army_cannons")
IncludeLocals("army_big")
IncludeLocals("army_friendly1")
IncludeLocals("army_friendly2")
IncludeLocals("army_defend1")
IncludeLocals("army_defend2")
IncludeLocals("army_defend3")
IncludeLocals("army_defend4")
IncludeLocals("army_defendBase")
IncludeLocals("army_bandits1")
IncludeLocals("army_support")

IncludeLocals("quest_cannons")
IncludeLocals("quest_towers")
IncludeLocals("quest_victory")
IncludeLocals("quest_defeat")
IncludeLocals("quest_bigBattle")
IncludeLocals("quest_bigArmy")
IncludeLocals("quest_supportArmy")


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Friendly)
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 2,	3, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 2,	4, Diplomacy.Friendly)
	Logic.SetDiplomacyState( 3, 4, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 3, 5, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 8, Diplomacy.Hostile )

	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
	local p1color = GetPlayerPreferredColor()
	if p1color ~= 3 then
		Display.SetPlayerColorMapping(1, p1color)
	else
		Display.SetPlayerColorMapping(1, 8)
	end

	if p1color == 2 then
		Display.SetPlayerColorMapping(2, ENEMY_COLOR2)		-- Dartmoor
		Display.SetPlayerColorMapping(4, ENEMY_COLOR2)		-- Dartmoor
		Display.SetPlayerColorMapping(5, ENEMY_COLOR2)		-- Dartmoor Serfs
	else
		Display.SetPlayerColorMapping(2, ENEMY_COLOR1)		-- Dartmoor
		Display.SetPlayerColorMapping(4, ENEMY_COLOR1)		-- Dartmoor
		Display.SetPlayerColorMapping(5, ENEMY_COLOR1)		-- Dartmoor Serfs
	end

	--Display.SetPlayerColorMapping(2, ENEMY_COLOR1)		-- Dartmoor
	Display.SetPlayerColorMapping(3, BARMECIA_COLOR)		-- Yellowstone
	--Display.SetPlayerColorMapping(4, ENEMY_COLOR1)		-- Dartmoor
	--Display.SetPlayerColorMapping(5, ENEMY_COLOR1)		-- Dartmoor Serfs
		
	Display.SetPlayerColorMapping(6, NPC_COLOR)
	Display.SetPlayerColorMapping(7, ROBBERS_COLOR)
	Display.SetPlayerColorMapping(8, ROBBERS_COLOR)
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()
	ResearchAllMilitaryTechs(2)
	ResearchAllMilitaryTechs(3)
	ResearchAllMilitaryTechs(4)
	ResearchAllMilitaryTechs(5)
	ResearchAllMilitaryTechs(7)
	ResearchAllMilitaryTechs(8)

	ResearchAnimalTechs(8)
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

	
	Logic.SetupGfxSet(1)
	
	Logic.AddWeatherElement(1, 600, 1, 1, 5, 10)
	Logic.AddWeatherElement(2,  90, 1, 2, 5, 10)
  
 
		-- [fun]  AddWeatherElement
		--          Add weather period on end of periods.
		-- Param1: Weather State of period, 1 = normal, 2 = rain, 3 = snow
		-- Param2: Duration of period in seconds
		-- Param3: Is periodic, 1 for (normal)periodic weather element else 0 for weather machine effects
		-- Param4: Gfx Set of this weather element
		-- Param5: Gfx Set forerun (gfx transition start some time before logic state change), time in seconds
		-- Param6: duration of Gfx Set transition
 
end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

	String.Init("SP01_02_Spreadland")

	mainQuestCount = 1
	
	uniqueTributeCount = 1
	
	armyPlayer2Count = 1
	
	armyPlayer3Count = 1

--	EnableDebugging()

	--	chest handling

		CreateChestOpener("Dario")
		CreateChestOpener("Erec")
		CreateChestOpener("Pilgrim")
		CreateChestOpener("Salim")
		CreateChestOpener("Anton")
	
		CreateRandomGoldChests()
		
		StartChestQuest()

	-- Set Music-Set
	
		LocalMusic.UseSet = EUROPEMUSIC
	
	--	exploring
	
		Logic.SetShareExplorationWithPlayerFlag(1, 3, 1)

	--	resources
	
		GlobalMissionScripting.GiveResouces(1, 8000, 1500, 1000, 1000, 500, 500)
	
	--	create players
	
		createPlayer2()
		createPlayer3()
		createPlayer4()
		createPlayer5()
		createPlayer7()
	
	--	start quest
	
		create1stQuest()
		
		RaidersCreate({player = 8, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1", "rudelpos1_wp2", "rudelpos1_wp3", "rudelpos1_wp4"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 12})
		--RaidersCreate({player = 8, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1", "rudelpos2_wp2", "rudelpos2_wp3"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 10})
		RaidersCreate({player = 8, pos = "rudelpos3", revier = {"rudelpos3", "rudelpos3_wp1", "rudelpos3_wp2", "rudelpos3_wp3"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 10})
		RaidersCreate({player = 8, pos = "rudelpos4", revier = {"rudelpos4", "rudelpos4_wp1", "rudelpos4_wp2"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 8})
		RaidersCreate({player = 8, pos = "bearpos1", revier = 1000, range = 3500, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})
		--RaidersCreate({player = 8, pos = "bearpos2", revier = 3000, range = 3500, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})
		   
		--Tools.ExploreArea(-1, -1, 900)
	end
