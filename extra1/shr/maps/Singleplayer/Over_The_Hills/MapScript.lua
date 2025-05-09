
-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )

IncludeLocals("gameControl")

IncludeLocals("player_2")
IncludeLocals("player_3")
IncludeLocals("player_4")
IncludeLocals("player_5")

IncludeLocals("briefing_prelude")
IncludeLocals("briefing_merchant1")
IncludeLocals("briefing_merchant2")

IncludeLocals("army_tools")
IncludeLocals("army_defend")
IncludeLocals("army_attack")

IncludeLocals("quest_defeat")
IncludeLocals("quest_victory")


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )	

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if p1color ~= 2 then
		Display.SetPlayerColorMapping(2, 2)		-- Landsberg
	else
		Display.SetPlayerColorMapping(2, 6)		-- Landsberg
	end
	
	if p1color ~= 5 then
		Display.SetPlayerColorMapping(3, BARBARIAN_COLOR)		-- Meuselwitz
	end
	if p1color == 4 then
		Display.SetPlayerColorMapping(4, MORTFICHET_COLOR)		-- Hohenturm
	end
	Display.SetPlayerColorMapping(5, NPC_COLOR)			-- H�ndler
	Display.SetPlayerColorMapping(7, ROBBERS_COLOR)	
	Display.SetPlayerColorMapping(8, KERBEROS_COLOR)	-- Walls
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()
	ResearchAllMilitaryTechsAddOn(2)
	ResearchAllMilitaryTechsAddOn(3)
	ResearchAllMilitaryTechsAddOn(4)
	ResearchAllMilitaryTechs(7)
	
	ResearchAnimalTechs(7)
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start to initialize ai for all ai players
function Mission_InitAI()
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game is loaded, setup your weather gfx
-- sets here
function Mission_InitWeatherGfxSets()

	-- Use gfx sets
	Display.SetRenderUseGfxSets(1)
	
	-- Use normal weather gfx set
	WeatherSets_SetupNormal(1)
	WeatherSets_SetupSnow(3)
	WeatherSets_SetupRain(2)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()
	
	-- Init with gfx set 1
	Logic.SetupGfxSet(1)
	Logic.AddWeatherElement(1, 5, 1, 1, 5, 10)
end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

	String.Init("SP01_05_OverTheHills")

	--EnableDebugging()

	--	chest handling

		CreateChestOpener("Dario")
		CreateChestOpener("Erec")
		CreateChestOpener("Pilgrim")
		CreateChestOpener("Salim")
		CreateChestOpener("Ari")
	
		CreateRandomChests()
		
		StartChestQuest()
	
	--	resources
		GlobalMissionScripting.GiveResouces(1, 800, 500, 400, 400, 350, 350)
	
	--	create players
	
		createPlayer2()
		createPlayer3()
		createPlayer4()
		createPlayer5()

	-- music set
		LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
		LocalMusic.UseSet = EUROPEMUSIC
		
	ScoutFoerster_gvScoutFoerster.GROWTH_LEVELS = table.getn(ScoutFoerster_SET_DarkTree)
	ScoutFoerster_gvScoutFoerster.treeSet = ScoutFoerster_SET_DarkTree
	
	--	start quest
		create1stQuest()
		    	
		RaidersCreate({player = 7, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1", "rudelpos1_wp2", "rudelpos1_wp3"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 10})
		RaidersCreate({player = 7, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1", "rudelpos2_wp2"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 10})
		RaidersCreate({player = 7, pos = "rudelpos3", revier = {"rudelpos3", "rudelpos3_wp1"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 10})
		RaidersCreate({player = 7, pos = "bearpos1", revier = 1000, range = 3500, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})
		RaidersCreate({player = 7, pos = "bearpos2", revier = {"bearpos2", "bearpos2_wp1"}, range = 3500, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})
		
		--Tools.ExploreArea(-1, -1, 900)
	end
