
-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0

--Include cutscenes
Cutscenes = {}
Cutscenes[INTROCUTSCENE] = "INTRO"
Cutscenes[MISSIONCOMPLETECUTSCENE] = "MISSIONCOMPLETE"

IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])

--Include briefings

IncludeLocals("briefing_prelude")
IncludeLocals("briefing_HelpErec")
IncludeLocals("briefing_PilDead")
IncludeLocals("briefing_SendMess")
IncludeLocals("briefing_MessReceived")
IncludeLocals("briefing_MMLeader")
IncludeLocals("briefing_YukiArrival")
IncludeLocals("briefing_DestroyPart1")
IncludeLocals("briefing_Doors")
IncludeLocals("briefing_Trader")
IncludeLocals("briefing_GoCaravans")
IncludeLocals("briefing_TargetTowers")
IncludeLocals("briefing_ThiefDead")
IncludeLocals("briefing_3PartsDown")
IncludeLocals("briefing_FinalGate")
IncludeLocals("briefing_NPCKeys")
IncludeLocals("briefing_SpeakAri")
IncludeLocals("briefing_FinalAttack")

--Include the rest of the files

IncludeLocals("gameControl")
IncludeLocals("Chapter1")
IncludeLocals("Chapter2")
IncludeLocals("Chapter3")
IncludeLocals("Chapter4")
IncludeLocals("Chapter5")
IncludeLocals("Chapter6")
IncludeLocals("Chapter7")
IncludeLocals("MountainMenFollowers")
IncludeLocals("NPCMMLeader")
IncludeLocals("player_2")
IncludeLocals("player_3")
IncludeLocals("player_4")
IncludeLocals("player_5")
IncludeLocals("player_6")
IncludeLocals("player_7")
IncludeLocals("AttacksPartOne")
IncludeLocals("ErecArmy")
IncludeLocals("DrakeArmy")
IncludeLocals("AriArmy")
IncludeLocals("NPCCaravans")
IncludeLocals("Caravan1")
IncludeLocals("Caravan2")
IncludeLocals("Caravan3")
IncludeLocals("AttacksPartTwo")
IncludeLocals("AttacksPartThree")
IncludeLocals("AttacksPartFour")
IncludeLocals("AttacksPartFive")
IncludeLocals("quest_defeat")
IncludeLocals("NPCKeys")
IncludeLocals("NPCAri")
IncludeLocals("SpawnHelp")
IncludeLocals("SpawnHelp1")
IncludeLocals("SpawnHelp2")

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 1, 6, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 8, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 2, 3, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 2, 4, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 2, 5, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 2, 6, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 2, 7, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 2, 8, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 3, 4, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 3, 5, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 3, 6, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 3, 7, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 3, 8, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 4, 5, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 4, 6, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 4, 7, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 4, 8, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 5, 6, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 5, 7, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 5, 8, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 6, 7, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 6, 8, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 7, 8, Diplomacy.Neutral )

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
	-- Set Colors

		Display.SetPlayerColorMapping(2, BARBARIAN_COLOR)	
		Display.SetPlayerColorMapping(3, NEPHILIM_COLOR)
		Display.SetPlayerColorMapping(4, FRIENDLY_COLOR2)
		Display.SetPlayerColorMapping(5, ARIS_ROBBERS)		
		Display.SetPlayerColorMapping(6, BARBARIAN_COLOR)	
		Display.SetPlayerColorMapping(7, BARBARIAN_COLOR)	
		Display.SetPlayerColorMapping(8, NPC_COLOR)		
	
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()

end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_ThiefSabotage     	,3 )
	
	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
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
	WeatherSets_SetupNormal(4, 0, 1)
	WeatherSets_SetupRain(5, 1, 1)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

	Logic.AddWeatherElement(1, 700, 1, 1, 5, 10)	-- Sommer
	Logic.AddWeatherElement(2, 100, 1, 2, 5, 10)	-- Foggy with Rain

end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	-- Text Tool String
		String.Init("CM04_05_EmeraldFields")
		

	--	String.Init("SP_Lightridge")
		Logic.SetShareExplorationWithPlayerFlag(1, 3, 1)
		Logic.SetShareExplorationWithPlayerFlag(1, 4, 1)
		Logic.SetShareExplorationWithPlayerFlag(1, 5, 1)

	--	resources
	
		AddGold(1000)
		AddWood(1000)
		AddClay(1500)
		AddStone(1000)
		AddIron(1000)
		AddSulfur(1000)

	--	Variables

		Messenger1Close		=0
		Messenger2Close		=0
		Mess1Spoken		=0
		MessageDelivered	=0
		FollowersAreDead	=0
		Chapter2IsDone		=0
		TowerStanding1		=0
		TowerStanding2		=0
		TowerStanding3		=0
		KeyTaken		=0
		FinGate			=0

		ChapterCount		=0
		ChapterCount1 = ChapterCount

	--	Invulnerables

		MakeInvulnerable("Messenger1")
		MakeInvulnerable("Messenger2")
		MakeInvulnerable("P2_Build1")
		MakeInvulnerable("P2_Build15")
		MakeInvulnerable("P2_Build16")
		MakeInvulnerable("P2_Build2")
		MakeInvulnerable("P2_Build4")
		MakeInvulnerable("P3_Build2")
		MakeInvulnerable("P3_Build1")
		MakeInvulnerable("P4_Build3")
		MakeInvulnerable("P4_Build14")
		MakeInvulnerable("GateMechanism1")
		MakeInvulnerable("GateMechanism2")
		MakeInvulnerable("GateMechanism3")

	--	Create players

		createPlayer2()
		createPlayer3()
		createPlayer4()
		createPlayer5()
		createPlayer6()
		createPlayer7()

		--SetPlayerName(2, "Scorillo")
		SetPlayerName(2, String.Key("_Player2Name"))
		--SetPlayerName(3, "Erec")
		SetPlayerName(3, String.Key("_Player3Name"))
		--SetPlayerName(4, "Drake")
		SetPlayerName(4, String.Key("_Player4Name"))
		--SetPlayerName(5, "Ari")
		SetPlayerName(5, String.Key("_Player5Name"))
		--SetPlayerName(6, "Barbaren")
		--SetPlayerName(6, String.Key("_Player6Name"))
		--SetPlayerName(7, "Barbaren")
		--SetPlayerName(7, String.Key("_Player7Name"))

	-- Set Music-Set

		LocalMusic.UseSet = EUROPEMUSIC
	
	-- Start quest

		StartCutscene(Cutscenes[INTROCUTSCENE],createBriefingPrelude)
		start1stChapter()

	-- Debugging stuff

	--	EnableDebugging()
   	--	Game.GameTimeReset()
		    	
		if CP_Difficulty > 0 then
			local vc1pos = GetPosition("vc_empty1") 	
			local vc2pos = GetPosition("vc_empty2") 	

			DestroyEntity("vc_empty1")
			DestroyEntity("vc_empty2")
			Logic.CreateEntity(Entities.XD_RuinMonastery2,vc1pos.X,vc1pos.Y,0,0)
		end
		--IncludeGlobals("MapEditorTools")
		--StartCountdown(15, EnemyFirstArmy, false)
		--Tools.ExploreArea(-1, -1, 900)
	end

