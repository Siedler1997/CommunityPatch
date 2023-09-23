
-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )

IncludeLocals("gameControl")

IncludeLocals("player_2")
IncludeLocals("player_3")
IncludeLocals("player_4")

IncludeLocals("briefing_siege")
IncludeLocals("briefing_Intro")


IncludeLocals("pl6army")
IncludeLocals("Countdown")
IncludeLocals("Countdown2")
IncludeLocals("Countdown3")
IncludeLocals("OpenGates")
IncludeLocals("armyAI2")
IncludeLocals("armyAI3")
IncludeLocals("armyAI4")
IncludeLocals("MinesToPlayer")
IncludeLocals("CheckPlayer2")
IncludeLocals("CheckPlayer3")
IncludeLocals("CheckPlayer4")
IncludeLocals("CheckPlayer23")
IncludeLocals("CheckPlayer24")
IncludeLocals("CheckPlayer34")
IncludeLocals("Pl2Attack")
IncludeLocals("Pl3Attack")
IncludeLocals("Pl4Attack")
IncludeLocals("DefensePl2")
IncludeLocals("DefensePl3")
IncludeLocals("DefensePl4")

IncludeLocals("quest_destroypl6")
IncludeLocals("quest_defpl6")
IncludeLocals("quest_rewards")
IncludeLocals("quest_defeat")
IncludeLocals("quest_victory")

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )
        Logic.SetDiplomacyState( 1, 4, Diplomacy.Hostile )
        Logic.SetDiplomacyState( 1, 6, Diplomacy.Hostile )
        Logic.SetDiplomacyState( 1, 7, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 2, 3, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 2, 4, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 2, 6, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 2, 7, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 3, 4, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 3, 6, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 3, 7, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 4, 6, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 4, 7, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 6, 7, Diplomacy.Neutral )

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
	ResearchAllMilitaryTechsAddOn(6)
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
	WeatherSets_SetupNormal(4, 0, 1)
	WeatherSets_SetupRain(5, 1, 1)
	WeatherSets_SetupSnow(6, 0, 0)
	WeatherSets_SetupSnow(7, 1, 0)
	WeatherSets_SetupSnow(8, 1, 1)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

	Logic.AddWeatherElement(1, 700, 1, 1, 5, 10)	-- Sommer
	Logic.AddWeatherElement(2, 140, 1, 2, 5, 10)	-- Foggy with Rain
	Logic.AddWeatherElement(1, 320, 1, 1, 5, 10)	-- Sommer
	Logic.AddWeatherElement(2, 60, 1, 2, 5, 10)	-- Foggy with Rain
	Logic.AddWeatherElement(2, 60, 1, 5, 5, 10)	-- Foggy with Rain and Snow
	Logic.AddWeatherElement(2, 60, 1, 4, 5, 10)	-- Foggy with Snow
	Logic.AddWeatherElement(3, 320, 1, 3, 5, 10)	-- Winter with Snow
	Logic.AddWeatherElement(3, 120, 1, 6, 5, 10)	-- Winter
	Logic.AddWeatherElement(3, 200, 1, 3, 5, 10)	-- Winter with Snow
	Logic.AddWeatherElement(3, 90, 1, 8, 5, 10)	-- Winter with Rain and Snow
	Logic.AddWeatherElement(3, 60, 1, 7, 5, 10)	-- Winter with Rain
	Logic.AddWeatherElement(2, 90, 1, 2, 5, 10)	-- Foggy with Rain
	Logic.AddWeatherElement(1, 300, 1, 1, 5, 10)	-- Sommer
	Logic.AddWeatherElement(2, 130, 1, 2, 5, 10)	-- Foggy with Rain

end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
 	-- set player colors
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	Display.SetPlayerColorMapping(6, 10)
	Display.SetPlayerColorMapping(7, 15)
	if p1color == 1 then
		Display.SetPlayerColorMapping(2, 2)
		Display.SetPlayerColorMapping(3, 3)
	elseif p1color == 2 then
		Display.SetPlayerColorMapping(2, 6)
		Display.SetPlayerColorMapping(3, 3)
	else
		Display.SetPlayerColorMapping(2, 2)
		Display.SetPlayerColorMapping(3, 8)
		Display.SetPlayerColorMapping(8, 11)
	end
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

	String.Init("SP_Siege")

	--	chest handling

		CreateChestOpener("Dario")
		CreateChestOpener("Erec")
		CreateChestOpener("Helias")
		CreateChestOpener("Ari")
		CreateChestOpener("Pilgrim")
		CreateChestOpener("Salim")
	
	--	CreateRandomGoldChests()
		CreateRandomChests()
		
	--	StartChestQuest()
	
	--	exploring
	
	--	Logic.SetShareExplorationWithPlayerFlag(1, 3, 1)

	--	resources
	
		GlobalMissionScripting.GiveResouces(1, 1500, 1000, 1000, 1000, 800, 600)
	
	--	create players
	
		createPlayer2()
                createPlayer3()
                createPlayer4()


        --      Create Armies

                setuppl6army()

                DefensePl2()
                DefensePl3()
                DefensePl4()
                CheckPlayer2()
                CheckPlayer3()
                CheckPlayer4()
                CheckPlayer23()
                CheckPlayer24()
                CheckPlayer34()
                OpenGates()
                createWaitCavalry()
                createWaitArchers()
                createWaitSwords()


	-- Set Music-Set

		LocalMusic.UseSet = EVELANCEMUSIC
	
	--	start quest
	
		create1stQuest()
		    	
		--Tools.ExploreArea(-1, -1, 900)
		--StartSimpleJob("GetMousePos")

		--local pos = GetPosition("Pl4tg1")
		--Logic.CreateEntity(Entities.PU_Hero1, pos.X, pos.Y,0,1)
	end

