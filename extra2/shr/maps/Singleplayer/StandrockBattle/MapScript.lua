
-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )

IncludeLocals("gameControl")
IncludeLocals("briefing_prelude")
IncludeLocals("Chapter1")
IncludeLocals("Chapter2")
IncludeLocals("Chapter3")
IncludeLocals("briefing_PrincessDies")
IncludeLocals("NPCFather")
IncludeLocals("briefing_Unite")
IncludeLocals("NPCErec")
IncludeLocals("NPCSalim")
IncludeLocals("NPCPilgrim")
IncludeLocals("NPCCavalry")
IncludeLocals("briefing_Enemies")
IncludeLocals("quest_defeat")
IncludeLocals("quest_victory")
IncludeLocals("briefing_Cavalry")
IncludeLocals("briefing_Pilgrim")
IncludeLocals("briefing_Salim")
IncludeLocals("briefing_Erec")
IncludeLocals("briefing_Noble")
IncludeLocals("NPCMiner")
IncludeLocals("briefing_Miner")

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 2, 3, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 2, 4, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 2, 5, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 2, 7, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 3, 4, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 3, 5, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 3, 7, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 4, 5, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 4, 7, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 5, 7, Diplomacy.Neutral )



	end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Foundry		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Tower		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Stables		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.GT_Tactics		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.GT_Strategies		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.UP2_Headquarter	, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.GT_Binocular		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.GT_Mathematics	, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Bridge		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_GunsmithWorkshop	, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_MasterBuilderWorkshop, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Tavern		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.GT_PulledBarrel	, 0)


	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_EnhancedGunPowder	, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_BlisteringCannonballs, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_WeatherForecast	, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_ChangeWeather	, 0)

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

	Logic.AddWeatherElement(1, 800, 1, 1, 5, 10)	-- Sommer
	Logic.AddWeatherElement(2, 100, 1, 2, 5, 10)	-- Foggy with Rain

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
 	-- set player colors
	 
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	
	Display.SetPlayerColorMapping(2, 4)
	if p1color == 3 then
		Display.SetPlayerColorMapping(3, 1)
	end
	Display.SetPlayerColorMapping(4, 5)
	Display.SetPlayerColorMapping(5, 9)

end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

		String.Init("SP_Standrock_Battle")

	--	chest handling

		CreateChestOpener("Dario")
		CreateChestOpener("Erec")
		CreateChestOpener("Helias")
		CreateChestOpener("Ari")
		CreateChestOpener("Pilgrim")
		CreateChestOpener("Salim")
	
		CreateRandomGoldChests()
		CreateRandomChests()
		
		StartChestQuest()
	
	--	exploring
	
	--	Logic.SetShareExplorationWithPlayerFlag(1, 3, 1)

	--	resources
	
		AddGold(1500)
		AddWood(1500)
		AddClay(2000)
		AddStone(2000)
		AddIron(1500)
		AddSulfur(1000)
	
	--	Variables
	
		ErecIsOn 	= 0
		PilgrimIsOn 	= 0
		SalimIsOn 	= 0
		GoToAttack	= 0
		NowYouCanWin 	= 0

		CacatDeBug	= 0


        --      Create Armies



	-- Set Music-Set
	
		--LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
		LocalMusic.UseSet = DARKMOORMUSIC
		--SetPlayerName(7, "Eindringende Armeen")
		SetPlayerName(7, String.Key("_Player7Name"))
	
	--	start quest
	
		start1stChapter()

	--	Debug

	--	EnableDebugging()
   	--	Game.GameTimeReset()
		   
	Tools.ExploreArea(-1, -1, 900)
end

