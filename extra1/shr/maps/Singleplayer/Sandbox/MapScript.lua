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
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()

	-- Set Colors
		local p1color = GetPlayerPreferredColor()
		Display.SetPlayerColorMapping(1, p1color)
		if p1color ~= 2 then
			Display.SetPlayerColorMapping(3, 2)	
		else
			Display.SetPlayerColorMapping(3, BARBARIAN_COLOR)	
		end

		--Display.SetPlayerColorMapping(3, ENEMY_COLOR1)		
		Display.SetPlayerColorMapping(5, KERBEROS_COLOR)		

		Display.SetPlayerColorMapping(2, 4)		
		Display.SetPlayerColorMapping(4, 15)		

		Display.SetPlayerColorMapping(7, ROBBERS_COLOR)		
	
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()
	ResearchAllMilitaryTechsAddOn(3)
	ResearchAllMilitaryTechsAddOn(5, true)
	ResearchAllMilitaryTechsAddOn(7)
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

	Logic.AddWeatherElement(1, 700, 1, 1, 5, 10)	-- Summer
	Logic.AddWeatherElement(2, 90, 1, 2, 5, 10)		-- Foggy with Rain
	Logic.AddWeatherElement(1, 430, 1, 1, 5, 10)	-- Summer
	Logic.AddWeatherElement(3, 730, 1, 3, 5, 10)	-- Winter with Snow
	Logic.AddWeatherElement(2, 60, 1, 2, 5, 10)		-- Foggy with Rain
	Logic.AddWeatherElement(1, 60, 1, 1, 5, 10)		-- Summer
	Logic.AddWeatherElement(2, 90, 1, 2, 5, 10)	-- Foggy with Rain

end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

	IncludeLocals("Cutscene_Control")

	-- Load mission files
	IncludeLocals("army_p3defense")
	IncludeLocals("army_p5troops")
	IncludeLocals("army_p7intruders")

	IncludeLocals("briefing_prelude")

	IncludeLocals("gameControl")

	IncludeLocals("quest_destroycathedral")
	IncludeLocals("quest_buysulfur")

	IncludeLocals("player_1")
	IncludeLocals("player_3")
	IncludeLocals("player_5")
	IncludeLocals("player_7")

	IncludeLocals("quest_Player3ToFriend")

	String.Init("SP01_01_Sandbox_Txt")

	-- Set Music-Set
	LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
	LocalMusic.UseSet = EUROPEMUSIC

	-- Start time line

	TimeLine.Start()
	
	
	ScoutFoerster_gvScoutFoerster.GROWTH_LEVELS = table.getn(ScoutFoerster_SET_DarkTree)
	ScoutFoerster_gvScoutFoerster.treeSet = ScoutFoerster_SET_DarkTree
	
	-- set player names
	
		Logic.SetPlayerName(3, String.MainKey.."_Player3Name")
		Logic.SetPlayerName(5, String.MainKey.."_Player5Name")
		Logic.SetPlayerName(7, String.MainKey.."_Player7Name")


	--	chest handling

	-- This heroes can open chests	

		CreateChestOpener("Dario")
--		CreateChestOpener("Erec")
		CreateChestOpener("Helias")
		CreateChestOpener("Ari")
		CreateChestOpener("Pilgrim")
--		CreateChestOpener("Salim")
	
		CreateRandomChests()
		
		StartChestQuest()


	-- Start prelude

	start1stQuest()

	--Tools.ExploreArea(-1, -1, 900)

end
