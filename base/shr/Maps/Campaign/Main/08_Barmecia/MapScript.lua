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
	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		local animalTech2 = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			animalTech2 = true
		end
		ResearchAnimalTechs(5, animalTech2)
		ResearchAnimalTechs(6, animalTech2)
		ResearchAnimalTechs(8, animalTech2)

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
	
	--Display.SetPlayerColorMapping(gvMission.PlayerID, PLAYER_COLOR)		
	Display.SetPlayerColorMapping(gvMission.PlayerIDCleycourt, CLEYCOURT_COLOR)		
	Display.SetPlayerColorMapping(gvMission.PlayerIDRobbers1, ROBBERS_COLOR)	
	Display.SetPlayerColorMapping(gvMission.PlayerIDRobbers2, ROBBERS_COLOR)	
	Display.SetPlayerColorMapping(gvMission.PlayerIDAttacker, ENEMY_COLOR1)	
		
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if p1color ~= 3 then
		Display.SetPlayerColorMapping(gvMission.PlayerIDTrader, 3)		
		Display.SetPlayerColorMapping(gvMission.PlayerIDBarmecia, 3)	
	else
		Display.SetPlayerColorMapping(gvMission.PlayerIDTrader, 1)		
		Display.SetPlayerColorMapping(gvMission.PlayerIDBarmecia, 1)	
	end
	if p1color ~= 9 then
		Display.SetPlayerColorMapping(gvMission.PlayerIDPilgrim, 9)		
	else
		Display.SetPlayerColorMapping(gvMission.PlayerIDPilgrim, 4)		
	end
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
		
		
		StartChestQuest()
	
	
	
	-- Create Players
	createPlayer1()
	--createPlayer3()
	--createPlayer4()
	createPlayer5()
	createPlayer6()
	
	Logic.SetPlayerName(gvMission.PlayerIDBarmecia, String.MainKey.."_Player3Name")
	Logic.SetPlayerName(gvMission.PlayerIDCleycourt, String.MainKey.."_Player4Name")
	
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

	if CP_Difficulty > 0 then
		if CP_Difficulty == 2 then
			GUI.SetTaxLevel(1)
		else
			CreateRandomChests()
		end
		
		local vcpos = GetPosition("vc_empty1")
		DestroyEntity("vc_empty1")
		Logic.CreateEntity(Entities.XD_RuinMonastery2,vcpos.X,vcpos.Y,90,0)
	else
		CreateRandomChests()
	end

	local bossID1 = SetEntityName(AI.Entity_CreateFormation(5,Entities.CU_LeaderOutlaw1,0,0,4300,19600,0,0,3,0), "kidnapper_boss")
	local bossID2 = SetEntityName(AI.Entity_CreateFormation(6,Entities.CU_LeaderOutlaw1,0,0,47900,18800,0,0,3,0), "robber_boss")
	LookAt("kidnapper_boss", "campfire_kidnapper")
	LookAt("robber_boss", "campfire_robber")

	LookAt("TraderMarket1", "campfire_kidnapper")

	RaidersCreate({player = 6, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 3500, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (5 + CP_Difficulty * 2)})
	RaidersCreate({player = 6, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1", "rudelpos2_wp2"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (3 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	
	--StartSimpleJob("GetMousePos")
	--Tools.ExploreArea(-1, -1, 900)
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

