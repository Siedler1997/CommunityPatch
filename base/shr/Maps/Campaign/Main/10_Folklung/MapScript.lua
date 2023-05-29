--------------------------------------------------------------------------------
-- MapName: 10_Folklung
--
-- Author: Sebastian Rohde
--
--------------------------------------------------------------------------------

-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )
Script.Load(Folders.MapTools.."Technologies_ForbidAll.lua")	

CP_Difficulty = 0

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	
	gvMission.PlayerIDFolklung	= 2
	gvMission.PlayerIDBesieger	= 5
	gvMission.PlayerIDBigBadGuy = 3
	gvMission.PlayerIDRobbersSwamp = 4




	-- Set Diplomacy State
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDFolklung, Diplomacy.Friendly )
	Logic.SetDiplomacyState( gvMission.PlayerIDFolklung, gvMission.PlayerIDBesieger, Diplomacy.Hostile )
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDBesieger, Diplomacy.Hostile )
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDBigBadGuy, Diplomacy.Friendly )
	Logic.SetDiplomacyState( gvMission.PlayerIDFolklung, gvMission.PlayerIDBigBadGuy, Diplomacy.Friendly )
	Logic.SetDiplomacyState( gvMission.PlayerIDBesieger, gvMission.PlayerIDBigBadGuy, Diplomacy.Friendly )
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDRobbersSwamp, Diplomacy.Hostile)
	Logic.SetDiplomacyState( gvMission.PlayerIDFolklung, gvMission.PlayerIDRobbersSwamp, Diplomacy.Neutral)
	
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
	-- Initial Resources 								(money, clay, wood, stone ,iron, sulfur )
	GlobalMissionScripting.GiveResouces(gvMission.PlayerID, 500, 800, 900, 700, 600, 500)
	
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.UP2_Headquarter,0)	
	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		local animalTech2 = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			animalTech2 = true
		end
		ResearchAnimalTechs(2, animalTech2)
		ResearchAnimalTechs(4, animalTech2)
		ResearchAnimalTechs(5, animalTech2)

		ResearchAllMilitaryTechs(2)
		ResearchAllMilitaryTechs(4)
		ResearchAllMilitaryTechs(5)
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
	gvMission.WinterLength = 300 	--in seconds
	gvMission.SummerLength = 300	--in seconds

	
	Logic.SetupGfxSet(1)
	
	Logic.AddWeatherElement(1, gvMission.SummerLength, 1, 1, 5, 10)
	Logic.AddWeatherElement(3, gvMission.WinterLength, 1, 3, 5, 10)
	Logic.SetWeatherOffset(gvMission.SummerLength - 10)
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
 	
	-- set player colors
	
		Display.SetPlayerColorMapping(gvMission.PlayerIDFolklung, PLAYER_FRIEND_COLOR)		
		Display.SetPlayerColorMapping(gvMission.PlayerIDBesieger, BARBARIAN_COLOR)		
		Display.SetPlayerColorMapping(gvMission.PlayerIDBigBadGuy, ENEMY_COLOR2)		
		Display.SetPlayerColorMapping(gvMission.PlayerIDRobbersSwamp, ROBBERS_COLOR)	
		Display.SetPlayerColorMapping(gvMission.PlayerID, PLAYER_COLOR)	
		
		if CP_Difficulty == 2 then
			Display.SetPlayerColorMapping(1, ENEMY_COLOR1)
		end
		
end

 
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	-- Load mission files
	IncludeLocals("gameControl")
	
	-- Include Briefings
	IncludeLocals("briefing_Prelude")
	IncludeLocals("briefing_Escaped")
	IncludeLocals("briefing_SwampNPC")
	IncludeLocals("briefing_FolklungReached")
	IncludeLocals("briefing_FolklungCastleReached")
	IncludeLocals("briefing_Rock1Destroyed")
	IncludeLocals("briefing_Rock2Destroyed")
	IncludeLocals("briefing_EnemyLeaderCaptured")

	
	-- Include Quests
	IncludeLocals("quest_Defeat")
	IncludeLocals("quest_MilitaryWon")
	IncludeLocals("quest_ReachFolklung")
	IncludeLocals("quest_ReachFolklungCastle")
	IncludeLocals("quest_CaptureEnemyLeader")
	IncludeLocals("quest_DestroyRock")
	

	
	-- Include Players
	IncludeLocals("player_1")
	IncludeLocals("player_2")
	IncludeLocals("player_4")
	IncludeLocals("player_5")
		
	-- Include Armies
	IncludeLocals("army_Besieger")
	IncludeLocals("army_Folklung")
	IncludeLocals("army_Cutscene")
	IncludeLocals("army_Robbers")
	IncludeLocals("army_PlayerAttack")
	IncludeLocals("army_DefendBase")
	
	String.Init("CM01_10_Folklung_Txt")
		
	
	--	chest handling

	CreateChestOpener("Dario")
	CreateChestOpener("Ari")
	CreateChestOpener("Helias")
	CreateChestOpener("Erec")
		
		
	StartChestQuest()
			
		
	-- Set Music Set
	
	LocalMusic.UseSet = HIGHLANDMUSIC
	
		
	-- Start time line
	TimeLine.Start()
		
	-- Create All Players
	createPlayer1()
	createPlayer2()
	createPlayer4()
	createPlayer5()
	
	
	-- Include Cutscene control
	IncludeLocals("Cutscene_Control")
	
	--EnableDebugging()

	createArmyFolklungA()

	StartCutscene("Intro", start1stQuest)
		
	--BurningHouse
	Logic.HurtEntity(GetID("BurningHouse"),400)

	CreateRandomChests()	
	if CP_Difficulty == 0 then
		local hqpos = GetPosition("Pl5_SpawnPos")
		DestroyEntity("Pl5_SpawnPos")
		SetEntityName(Logic.CreateEntity(Entities.CB_RobberyTower1,hqpos.X,hqpos.Y,0,5), "Pl5_SpawnPos")
	else
		if CP_Difficulty == 1 then
			Logic.CreateEntity(Entities.PB_Tower2, 11200, 23900, 0, 5);
			Logic.CreateEntity(Entities.PB_Tower2, 5200, 35700, 0, 5);
			Logic.CreateEntity(Entities.PB_Tower2, 5700, 26300, 0, 5);
			Logic.CreateEntity(Entities.PB_Tower2, 15900, 24500, 0, 5);
			Logic.CreateEntity(Entities.PB_Tower2, 9700, 29800, 0, 5);
		else
			Logic.CreateEntity(Entities.PB_Tower3, 11200, 23900, 0, 5);
			Logic.CreateEntity(Entities.PB_Tower3, 5200, 35700, 0, 5);
			Logic.CreateEntity(Entities.PB_Tower3, 5700, 26300, 0, 5);
			Logic.CreateEntity(Entities.PB_Tower3, 15900, 24500, 0, 5);
			Logic.CreateEntity(Entities.PB_Tower3, 9700, 29800, 0, 5);

			Display.SetPlayerColorMapping(1, ENEMY_COLOR1)
			GUI.SetTaxLevel(1)
			
			DestroyEntity("TheRock")
			createArmyAttackPlayerA()
			StartCountdown(15 * 60, MakeArmyAttackPlayerAggressive, false)
		end
		--[[
		local vcpos = GetPosition("vc_empty")
		DestroyEntity("vc_empty")
		Logic.CreateEntity(Entities.XD_RuinResidence2,vcpos.X,vcpos.Y,270,0)
		--]]
	end

	RaidersCreate({player = 4, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 4000, types = RaidersDefaultSets.Highland, samount = (3 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})		
	RaidersCreate({player = 4, pos = "rudelpos2", revier = 3000, range = 4000, types = RaidersDefaultSets.Highland, samount = (3 + CP_Difficulty), ramount = (7 + CP_Difficulty * 2)})

	RaidersCreate({player = 4, pos = "bearpos1", revier = 500, range = 4000, types = { Entities.CU_AggressivePolarBear }, samount = 1, ramount = 1})
	
	-- Create Armies
	createArmyCutscene()
	createArmyRobbers()
	StartCountdown(60, createArmyBesiegerA, false)
	createArmyDefendBase()

	StartSimpleJob("GetMousePos")
	Tools.ExploreArea(-1, -1, 900)
end

function StartOldCutscene()
	--Briefing	
	-- Include OLD Cutscene Script for Demonstration Purposes 
	Script.Load( "Data\\Maps\\Campaign\\Main\\10_Folklung\\Cutscenes.lua" )
	Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND, NIL, "Mission_UpdateCutscene", 1)
	MissionCamera_Init()
end

CompleteCutscene = function()
	StartCutscene("MissionComplete")
end

IntermediateCutscene = function()
	StartCutscene("Cutscene1")
end

StartNewIntro = function()
	StartCutscene("Intro")
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





