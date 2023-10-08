--------------------------------------------------------------------------------
-- MapName: 10_Folklung
--
-- Author: Sebastian Rohde
--
--------------------------------------------------------------------------------

-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )
Script.Load(Folders.MapTools.."Technologies_ForbidAll.lua")	

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	
	gvMission.PlayerIDFortress			= 2
	gvMission.PlayerIDBarbarian			= 3
	gvMission.PlayerIDCoastBandits 	= 4
	gvMission.PlayerIDClerics 			= 5
	gvMission.PlayerIDRuinRobbers		= 6
	gvMission.PlayerIDTrader 				= 7
	gvMission.PlayerIDWalls 				= 8


	-- Set Diplomacy State
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDFortress, Diplomacy.Neutral )
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDBarbarian, Diplomacy.Hostile )
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDCoastBandits, Diplomacy.Hostile )
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDClerics, Diplomacy.Friendly )
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDRuinRobbers, Diplomacy.Hostile )
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDTrader, Diplomacy.Friendly )
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDWalls , Diplomacy.Neutral )
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
	-- Initial Resources 								(money, clay, wood, stone ,iron, sulfur )
	GlobalMissionScripting.GiveResouces(gvMission.PlayerID, 600, 1600, 1600, 1200, 800, 800)
	
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.UP2_Headquarter,0)	
	ResearchAllMilitaryTechs(2)
	ResearchAllMilitaryTechs(3)
	ResearchAllMilitaryTechs(4)
	ResearchAllMilitaryTechs(5)
	ResearchAllMilitaryTechs(6)
	ResearchAllMilitaryTechs(7)
	ResearchAllMilitaryTechs(8)
	
	ResearchAnimalTechs(4)
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
	gvMission.WinterLength = 240 	--in seconds
	gvMission.RainLength = 180 	--in seconds
	gvMission.SummerLength = 600	--in seconds
	
	Logic.SetupGfxSet(1)

	
	Logic.AddWeatherElement(1, 300, 0, 1, 5, 10)
		
	Logic.AddWeatherElement(3, gvMission.WinterLength, 1, 3, 5, 10)
	Logic.AddWeatherElement(1, gvMission.SummerLength, 1, 1, 5, 10)
	
	
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
	-- set player colors
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(gvMission.PlayerID, p1color)
	Display.SetPlayerColorMapping(gvMission.PlayerIDFortress, MORTFICHET_COLOR)		
	
	if p1color ~= 2 then
		Display.SetPlayerColorMapping(gvMission.PlayerIDBarbarian, BARBARIAN_COLOR)		
	else
		Display.SetPlayerColorMapping(gvMission.PlayerIDBarbarian, 6)		
	end
	Display.SetPlayerColorMapping(gvMission.PlayerIDCoastBandits, ROBBERS_COLOR)	
	
	if p1color ~= 9 then
		Display.SetPlayerColorMapping(gvMission.PlayerIDClerics, PLAYER_FRIEND_COLOR)	
	else
		Display.SetPlayerColorMapping(gvMission.PlayerIDClerics, 1)	
	end
	Display.SetPlayerColorMapping(gvMission.PlayerIDRuinRobbers, ROBBERS_COLOR)	
	
	if p1color ~= 4 then
		Display.SetPlayerColorMapping(gvMission.PlayerIDTrader, FRIENDLY_COLOR1)	
	else
		Display.SetPlayerColorMapping(gvMission.PlayerIDTrader, 3)	
	end
	Display.SetPlayerColorMapping(gvMission.PlayerIDWalls, FRIENDLY_COLOR2)	
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()
	-- Load mission files
	IncludeLocals("gameControl")
	
	-- Include Briefings
	IncludeLocals("briefing_Prelude")
	IncludeLocals("briefing_KidnapperQuest")
	IncludeLocals("briefing_SulphurQuest")
	IncludeLocals("briefing_HostageFreed")
	IncludeLocals("briefing_SulphurFinished")
	IncludeLocals("briefing_HelpTownguard")
	IncludeLocals("briefing_CityguardQuest")
	IncludeLocals("briefing_GraveyardCleansed")
	IncludeLocals("briefing_Helias")
	IncludeLocals("briefing_Mary")

	
	-- Include Quests
	IncludeLocals("quest_victory")
	IncludeLocals("quest_defeat")
	IncludeLocals("quest_rewards")
	IncludeLocals("quest_trader")
	IncludeLocals("quest_Sulphur")
	IncludeLocals("quest_Kidnapper")
	IncludeLocals("quest_RobbersKilled")
	IncludeLocals("quest_DestroyRock")

	
	-- Include Players
	IncludeLocals("player_1")
	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_4")
	IncludeLocals("player_5")
	IncludeLocals("player_6")
	IncludeLocals("player_7")
		
		
		
	-- Include Armies
	IncludeLocals("army_PlayerCoastBandits")
	IncludeLocals("army_PlayerBarbarian")
	IncludeLocals("army_Fortress")
	IncludeLocals("army_Robbers")
	
	
	-- Init stringtable
	String.Init("Demomap_txt")
	
	
	--	chest handling

	CreateChestOpener("Ari")
	CreateChestOpener("Pilgrim")
		
	CreateRandomChests()
		
	StartChestQuest()
			
		
	-- Set Music Set
	
	LocalMusic.UseSet = EUROPEMUSIC
	
		
	-- Start time line
	TimeLine.Start()
		
	-- Create All Players
	createPlayer1()
	createPlayer2()
	createPlayer3()
	createPlayer4()
	createPlayer5()
	createPlayer6()
	createPlayer7()
	
	-- Create Armies
	createArmyBarbarianHorde()
	createArmyCoastBandits()
	
	
	-- Include Cutscene control
	IncludeLocals("Cutscene_Control")
	
	--EnableDebugging()
	
	-- Added by NW after NPC_Sulfur's player ID was changed from 1 to 7, the exploration disappeared
	-- This code explores the area instantly and permanently
	Explore.Show("NPC_SulfurExploration", "NPCSulphur", 1000)
	
	RaidersCreate({player = 4, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1", "rudelpos1_wp2", "rudelpos1_wp3"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 10})
	RaidersCreate({player = 4, pos = "bearpos1", revier = 1000, range = 3500, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})

	StartCutscene("Intro", start1stQuest)
	
	--start1stQuest()
	
	StartSimpleJob("ControlEnemyHeroes")

	--Tools.ExploreArea(-1, -1, 900)
end


function ControlEnemyHeroes()
	if Counter.Tick2("ControlEnemyHeroes", 5) then
		--Varg
		--Deactivated for Varg because I'm too lazy to prevent him from drowning after usage
		if IsAlive("varg") then
			if AreEnemiesInArea(GetPlayer("varg"), GetPosition("varg"), 2000) then
				local HeroID = GetEntityId("varg")
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.9) then
					GUI.SettlerSummon(HeroID)
				end

				GUI.SettlerAffectUnitsInArea(HeroID)
			end
		end
		--Mary
		if IsAlive("Mary") then
			if AreEnemiesInArea(GetPlayer("Mary"), GetPosition("Mary"), 1000) then
				local HeroID = GetEntityId("Mary")
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.9) then
					GUI.SettlerAffectUnitsInArea(HeroID)
				end
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.8) then
					GUI.SettlerCircularAttack(HeroID)
				end
			end
		end
		--Kerberos
		if IsAlive("kerberos") then
			if AreEnemiesInArea(GetPlayer("kerberos"), GetPosition("kerberos"), 1000) then
				local HeroID = GetEntityId("kerberos")
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.9) then
					GUI.SettlerAffectUnitsInArea(HeroID)
				end
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.8) then
					GUI.SettlerInflictFear(HeroID)
				end
			end
		end
	end
end

function CreateDummyBriefing(_Callback, _Position)

	DummyBriefing =	{}	

	--	briefing finished callback function

		DummyBriefing.finished = _Callback

		local page = 0

	--	page
	
		page = page +1
	
		DummyBriefing [page] 					= 	{}
		DummyBriefing [page].title		= 	String.Key("DummyTitle")
		DummyBriefing [page].text			=		String.Key("DummyText")
		DummyBriefing [page].position 	= 	GetPosition(_Position)

	--	go!
	
		StartBriefing(DummyBriefing )
	
end





