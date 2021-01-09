--------------------------------------------------------------------------------
-- MapName: 08_Barmecia
--
-- Author: Sebastian Rohde
--
--------------------------------------------------------------------------------

-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua")
Script.Load(Folders.MapTools.."Technologies_ForbidAll.lua")	

CP_Difficulty = 0

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()
	-- Good Guys ;-)
	gvMission.PlayerIDTrader 		= 2
	gvMission.PlayerIDBarmecia	= 3
	gvMission.PlayerIDCleycourt	= 4
	gvMission.PlayerIDPilgrim 	= 7

	-- PlayerIDs of bands of robbers
	gvMission.PlayerIDRobbers1	= 5
	gvMission.PlayerIDRobbers2	= 6
	gvMission.PlayerIDAttacker	= 8

	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDTrader, Diplomacy.Friendly )
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDBarmecia, Diplomacy.Neutral )
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDCleycourt, Diplomacy.Neutral )
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDPilgrim, Diplomacy.Neutral )
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDRobbers1, Diplomacy.Neutral )
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDRobbers2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDAttacker, Diplomacy.Hostile )

end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
	GlobalMissionScripting.GiveResouces(gvMission.PlayerID, 500, 500, 800, 500, 500, 500)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()
	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
		ResearchAllMilitaryTechs(5)
		ResearchAllMilitaryTechs(6)
		ResearchAllMilitaryTechs(8)
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
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
 	-- set player colors
	
		Display.SetPlayerColorMapping(gvMission.PlayerID, PLAYER_COLOR)	
		Display.SetPlayerColorMapping(gvMission.PlayerIDTrader, FRIENDLY_COLOR1)		
		Display.SetPlayerColorMapping(gvMission.PlayerIDBarmecia, BARMECIA_COLOR)		
		Display.SetPlayerColorMapping(gvMission.PlayerIDCleycourt, CLEYCOURT_COLOR)		
		Display.SetPlayerColorMapping(gvMission.PlayerIDPilgrim, PLAYER_FRIEND_COLOR)	
		Display.SetPlayerColorMapping(gvMission.PlayerIDRobbers1, ROBBERS_COLOR)	
		Display.SetPlayerColorMapping(gvMission.PlayerIDRobbers2, ROBBERS_COLOR)	
		Display.SetPlayerColorMapping(gvMission.PlayerIDAttacker, ENEMY_COLOR1)	
		
		
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()
	
	Logic.SetupGfxSet(1)
	Logic.AddWeatherElement(1, 300, 1, 1, 5, 10)	
	Logic.AddWeatherElement(2, 150, 1, 2, 5, 10)	
end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	-- Load mission files
	IncludeLocals("gameControl")
	
	-- Include Briefings
	IncludeLocals("briefing_Prelude")
	IncludeLocals("briefing_BuildMarket2")
	IncludeLocals("briefing_Market1Rescue")
	IncludeLocals("briefing_Kidnapper")
	IncludeLocals("briefing_SulfurMineBuilt")
	IncludeLocals("briefing_BuildSulfurMine")
	IncludeLocals("briefing_TraderFreed")
	IncludeLocals("briefing_Market2Built")
	
	-- Include Quests
	IncludeLocals("quest_BuildMarket2")
	IncludeLocals("quest_MeetMarket2")
	IncludeLocals("quest_MeetMarket1")
	IncludeLocals("quest_market1Rescue")
	IncludeLocals("quest_Mainquest")
	IncludeLocals("quest_BuildSulfurMine")
	IncludeLocals("quest_Defeat")
	IncludeLocals("quest_ReachCleycourt")
	IncludeLocals("quest_ReachBarmecia")
	
	-- Include Players
	IncludeLocals("player_1")
	IncludeLocals("player_3")
	IncludeLocals("player_4")
	IncludeLocals("player_5")
	IncludeLocals("player_6")
		
	-- Include Armies
	IncludeLocals("army_kidnapper")
	IncludeLocals("army_robberseast")
	
	-- Include Cutscene control
	IncludeLocals("Cutscene_Control")
	
	String.Init("CM01_08_Barmecia_Txt")
		
	

	--	chest handling

		CreateChestOpener("Dario")
		CreateChestOpener("Ari")
		CreateChestOpener("Helias")
		CreateChestOpener("Erec")
		
		CreateRandomChests()
		
		StartChestQuest()
	
	
	
	-- Create Players
	createPlayer1()
	--createPlayer3()
	--createPlayer4()
	createPlayer5()
	createPlayer6()
	
	-- Create Armies
	createArmyKidnapper()
	createArmyRobbersEast()

	Logic.SetCurrentMaxNumWorkersInBuilding(Logic.GetEntityIDByName("Quarry1"), 0)
	Logic.SetCurrentMaxNumWorkersInBuilding(Logic.GetEntityIDByName("Quarry2"), 0)
	Logic.SetCurrentMaxNumWorkersInBuilding(Logic.GetEntityIDByName("Quarry3"), 0)
	
	--EnableDebugging()
	--Start prelude1
	LocalMusic.UseSet = EUROPEMUSIC

	StartCutscene("Intro", start1stQuest)
	
end



function CreateDummyBriefing(_Callback, _Position)

	DummyBriefing =	{}	

	--	briefing finished callback function

		DummyBriefing.finished = _Callback

		local page = 0

	--	page
	
		page = page +1
	
		DummyBriefing [page] 					= 	{}
		DummyBriefing [page].title		= 	"Briefing"
		DummyBriefing [page].text			=	"Here will a briefing be inserted!"
		DummyBriefing [page].position 	= 	_Position

	--	go!
	
		StartBriefing(DummyBriefing )
	
end

