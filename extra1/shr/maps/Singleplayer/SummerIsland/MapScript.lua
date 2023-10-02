--------------------------------------------------------------------------------
-- MapName: Old Kings Castle
--
-- Author: Peter Sprys
--
--------------------------------------------------------------------------------

	Input.KeyBindDown (Keys.NumPad9, "EnableDebugging()")


-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()
	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 6, Diplomacy.Hostile )

--	Logic.SetDiplomacyState( 4, 2, Diplomacy.Hostile )
--	Logic.SetDiplomacyState( 4, 6, Diplomacy.Hostile )

--	Logic.SetDiplomacyState( 3, 2, Diplomacy.Hostile )
--	Logic.SetDiplomacyState( 3, 6, Diplomacy.Hostile )

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()

	-- Set Colors
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if p1color == 1 then
		Display.SetPlayerColorMapping(2, 2)	
		Display.SetPlayerColorMapping(3, BARMECIA_COLOR)	
	elseif p1color == 2 then
		Display.SetPlayerColorMapping(2, BARBARIAN_COLOR)	
		Display.SetPlayerColorMapping(3, BARMECIA_COLOR)	
	else
		Display.SetPlayerColorMapping(2, 2)	
		Display.SetPlayerColorMapping(3, PLAYER_FRIEND_COLOR)	
	end

	--Display.SetPlayerColorMapping(2, ENEMY_COLOR1)		
	Display.SetPlayerColorMapping(6, 6)		

	--Display.SetPlayerColorMapping(3, BARMECIA_COLOR)		
	Display.SetPlayerColorMapping(4, CLEYCOURT_COLOR)		

	Display.SetPlayerColorMapping(8, 6)
	
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
	ResearchAllMilitaryTechsAddOn(5)
	ResearchAllMilitaryTechsAddOn(6)
	ResearchAllMilitaryTechsAddOn(7)
	ResearchAllMilitaryTechsAddOn(8)
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

	Logic.AddWeatherElement(1, 700, 1, 1, 5, 10)	-- Sommer
	Logic.AddWeatherElement(2, 180, 1, 2, 5, 10)	-- Foggy with Rain
	Logic.AddWeatherElement(1, 280, 1, 1, 5, 10)	-- Sommer
	Logic.AddWeatherElement(2, 180, 1, 2, 5, 10)		-- Foggy with Rain
	Logic.AddWeatherElement(3, 640, 1, 3, 5, 10)	-- Winter with Snow
	Logic.AddWeatherElement(2, 60, 1, 2, 5, 10)		-- Foggy with Rain
	Logic.AddWeatherElement(1, 60, 1, 1, 5, 10)		-- Sommer
	Logic.AddWeatherElement(2, 180, 1, 2, 5, 10)	-- Foggy with Rain

end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

	IncludeLocals("Cutscene_Control")

	-- Load mission files
	IncludeLocals("army_p2attack")
	IncludeLocals("army_p2cavalryattack")
	IncludeLocals("army_p2defense")
	IncludeLocals("army_p3defense")
	IncludeLocals("army_p4defense")
	IncludeLocals("army_p6defense")

	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_iron")
	IncludeLocals("briefing_ironPaid")
	IncludeLocals("briefing_sulfur")

	IncludeLocals("gameControl")

	IncludeLocals("player_1")
	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_4")
	IncludeLocals("player_6")

	IncludeLocals("quest_iron")
	IncludeLocals("quest_sulfur")
	IncludeLocals("quest_Player2ToFriend")
	IncludeLocals("quest_Player3ToFriend")
	IncludeLocals("quest_Player4ToFriend")
	IncludeLocals("quest_Player6ToFriend")

	String.Init("SP01_03_SummerIsland")


	-- set player names
	
		Logic.SetPlayerName(GetHumanPlayer(), String.MainKey.."_Player1Name")
		Logic.SetPlayerName(2, String.MainKey.."_Player2Name")
		Logic.SetPlayerName(3, String.MainKey.."_Player3Name")
		Logic.SetPlayerName(4, String.MainKey.."_Player4Name")
		Logic.SetPlayerName(6, String.MainKey.."_Player6Name")


	--	chest handling

		CreateChestOpener("Dario")
--		CreateChestOpener("Erec")
--		CreateChestOpener("Helias")
		CreateChestOpener("Ari")
		CreateChestOpener("Pilgrim")
		CreateChestOpener("Salim")
	
		CreateRandomChests()
		
		StartChestQuest()

	-- Set Music-Set
		LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
		LocalMusic.UseSet = MEDITERANEANMUSIC

	-- Start time line

		TimeLine.Start()
	
	-- Start prelude

--LuaDebugger.Break()

		start1stQuest()

		--Tools.ExploreArea(-1, -1, 900)
end
