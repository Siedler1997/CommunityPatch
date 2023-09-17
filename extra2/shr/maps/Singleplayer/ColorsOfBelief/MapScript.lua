
--	Input.KeyBindDown (Keys.NumPad9, "EnableDebugging()")


-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )

--Include cutscenes
Cutscenes = {}
Cutscenes[INTROCUTSCENE] = "INTRO"
Cutscenes[MISSIONCOMPLETECUTSCENE] = "MISSIONCOMPLETE"

IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

		Logic.SetDiplomacyState( 1, 4, Diplomacy.Neutral )
		Logic.SetDiplomacyState( 2, 3, Diplomacy.Hostile )
		Logic.SetDiplomacyState( 1, 8, Diplomacy.Neutral )
		Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )
		Logic.SetDiplomacyState( 1, 6, Diplomacy.Neutral )
		Logic.SetDiplomacyState( 4, 6, Diplomacy.Neutral )


	end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()


	-- Set Colors

--PLAYER_COLOR 		= 1

--FRIENDLY_COLOR1		= 5
--FRIENDLY_COLOR2		= 3
--FRIENDLY_COLOR3		= 13

--ENEMY_COLOR1		= 6
--ENEMY_COLOR2		= 4

--NEPHILIM_COLOR		= 2
--EVIL_GOVERNOR_COLOR	= 9
--KERBEROS_COLOR 		= 12
--ROBBERS_COLOR		= 14

--NPC_COLOR			= 11

---custom colors --

BLUE = 1
RED = 2


	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if p1color == 2 then
		Display.SetPlayerColorMapping(2, 3)			
	end
	Display.SetPlayerColorMapping(2, 9)
	Display.SetPlayerColorMapping(3, 4)
	Display.SetPlayerColorMapping(4, ROBBERS_COLOR)
	Display.SetPlayerColorMapping(6, 8)
	Display.SetPlayerColorMapping(8, NPC_COLOR)	
					
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()


	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_MasterBuilderWorkshop, 0)
	--Logic.SetTechnologyState(gvMission.PlayerID,Technologies.GT_Arhitecture, 0)

	
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

	Logic.AddWeatherElement(1, 1200, 1, 1, 5, 10)	-- Sommer
--	Logic.AddWeatherElement(2, 180, 1, 2, 5, 10)	-- Foggy with Rain
--	Logic.AddWeatherElement(1, 320, 1, 1, 5, 10)	-- Sommer
--	Logic.AddWeatherElement(2, 120, 1, 2, 5, 10)		-- Foggy with Rain
--	Logic.AddWeatherElement(1, 400, 1, 1, 5, 10)		-- Sommer
--	Logic.AddWeatherElement(3, 60, 1, 5, 5, 10)		-- Foggy with Rain and Snow
--	Logic.AddWeatherElement(2, 60, 1, 4, 5, 10)		-- Foggy with Snow
--	Logic.AddWeatherElement(3, 320, 1, 3, 5, 10)	-- Winter with Snow
--	Logic.AddWeatherElement(3, 120, 1, 6, 5, 10)		-- Winter
--	Logic.AddWeatherElement(3, 200, 1, 3, 5, 10)	-- Winter with Snow
----	Logic.AddWeatherElement(3, 90, 1, 8, 5, 10)		-- Winter with Rain and Snow
--	Logic.AddWeatherElement(3, 60, 1, 7, 5, 10)		-- Winter with Rain
--	Logic.AddWeatherElement(2, 90, 1, 2, 5, 10)		-- Foggy with Rain
--	Logic.AddWeatherElement(1, 300, 1, 1, 5, 10)		-- Sommer
--	Logic.AddWeatherElement(2, 130, 1, 2, 5, 10)	-- Foggy with Rain

	end


--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

function Mission_InitMerchants()

	
end

	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

	-- Load mission files
	String.Init("SP_ColorsOfBelief")

	IncludeLocals("gameControl")
	IncludeLocals("player_1")
	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_4")
	
	IncludeLocals("briefing_wedding")
	IncludeLocals("army_spawn")
	IncludeLocals("briefing_johannes")
	IncludeLocals("briefing_peace")
	IncludeLocals("briefing_edward")
	IncludeLocals("briefing_dovbar")
        IncludeLocals("briefing_bandit")
	IncludeLocals("briefing_hanz")
	IncludeLocals("briefing_trader1")
	IncludeLocals("briefing_trader2")
	IncludeLocals("briefing_trader3")
	IncludeLocals("briefing_trader4")
	IncludeLocals("briefing_bridgekeeper3")
	IncludeLocals("briefing_bridgekeeper2")
	IncludeLocals("briefing_bridgekeeper1")
	IncludeLocals("briefing_scout")
	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_monk")

	createPlayer1()
	createPlayer2()
	createPlayer3()
	createPlayer4()
 


	-- debugging stuff
--	EnableDebugging()
--	Game.GameTimeReset()


	start1stQuest()

	-- set player names

	-- Set Music-Set
	LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
	LocalMusic.UseSet = EUROPEMUSIC

	--SetPlayerName(2, "Edward")
	SetPlayerName(2, String.Key("_Player2Name"))
	--SetPlayerName(3, "Dovbar")
	SetPlayerName(3, String.Key("_Player3Name"))

	--Tools.ExploreArea(-1, -1, 900)
end


--StartCutscene(Cutscenes[MISSIONCOMPLETECUTSCENE],Victory)


