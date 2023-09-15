
--	Input.KeyBindDown (Keys.NumPad9, "EnableDebugging()")


-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )

CP_Difficulty = 0
ErecOnTheMove = 0

--Include cutscenes
Cutscenes = {}
Cutscenes[INTROCUTSCENE] = "INTRO"
Cutscenes[MISSIONCOMPLETECUTSCENE] = "MISSIONCOMPLETE"

IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

		Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
		Logic.SetDiplomacyState( 1, 6, Diplomacy.Hostile )
		Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )
		Logic.SetDiplomacyState( 1, 4, Diplomacy.Hostile )
		Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile )
		Logic.SetDiplomacyState( 1, 7, Diplomacy.Neutral )
		Logic.SetDiplomacyState( 1, 8, Diplomacy.Neutral )

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

	Display.SetPlayerColorMapping(1, KERBEROS_COLOR)
	Display.SetPlayerColorMapping(8, NPC_COLOR)	

	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(2, p1color)
	Display.SetPlayerColorMapping(3, p1color)
	Display.SetPlayerColorMapping(4, p1color)
	Display.SetPlayerColorMapping(5, p1color)
	Display.SetPlayerColorMapping(6, p1color)
	if p1color ~= 2 then
		Display.SetPlayerColorMapping(7, 15)
	else
		Display.SetPlayerColorMapping(7, 16)
	end
					
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

	--Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Tavern, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Beautification01, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Weathermachine, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_WeatherForecast, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_ChangeWeather, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_MasterBuilderWorkshop, 0)
	--Logic.SetTechnologyState(gvMission.PlayerID,Technologies.GT_Arhitecture, 0)

	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		local animalTech2 = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			animalTech2 = true
		end
		ResearchAnimalTechs(2, animalTech2)
		ResearchAnimalTechs(3, animalTech2)
		ResearchAnimalTechs(4, animalTech2)
		ResearchAnimalTechs(5, animalTech2)
		ResearchAnimalTechs(6, animalTech2)
		ResearchAnimalTechs(7, animalTech2)

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

--	Logic.AddWeatherElement(1, 700, 1, 1, 5, 10)	-- Sommer
--	Logic.AddWeatherElement(2, 140, 1, 2, 5, 10)	-- Foggy with Rain
--	Logic.AddWeatherElement(1, 320, 1, 1, 5, 10)	-- Sommer
--	Logic.AddWeatherElement(2, 60, 1, 2, 5, 10)		-- Foggy with Rain
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

	if GDB.GetValue("Game\\Campaign_Difficulty") < 2 then
		AddPeriodicSummer(10)	
	else
	    AddPeriodicSummer(600)
	    AddPeriodicRain(120)
	end
end


--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

function Mission_InitMerchants()

	local mercenaryId = Logic.GetEntityIDByName("merchant1")
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_BlackKnight_LeaderMace2, 3, ResourceType.Iron, 300)
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_Barbarian_LeaderClub2, 3, ResourceType.Iron, 300)
	Logic.AddMercenaryOffer(mercenaryId, Entities.PU_Scout, 5, ResourceType.Gold, 150)
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_BanditLeaderBow2, 3, ResourceType.Gold, 250)

	local mercenaryId = Logic.GetEntityIDByName("merchant2")
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_BanditLeaderSword2, 3, ResourceType.Iron, 300)
	Logic.AddMercenaryOffer(mercenaryId, Entities.PU_Thief, 6, ResourceType.Gold, 150)
	Logic.AddMercenaryOffer(mercenaryId, Entities.PU_Scout, 5, ResourceType.Gold, 150)
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_BanditLeaderBow2, 3, ResourceType.Gold, 250)
	
end

	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	-- Load mission files
	String.Init("CM05_05_IntoShadowIntoLight")

	IncludeLocals("gameControl")
	IncludeLocals("player_1")
	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_4")
	IncludeLocals("player_5")
	IncludeLocals("player_6")
	IncludeLocals("player_7")
	IncludeLocals("caravan_1")
	IncludeLocals("caravan_2")
	IncludeLocals("caravan_3")
	IncludeLocals("quest_1")
	IncludeLocals("quest_2")
	IncludeLocals("quest_3")
	IncludeLocals("army_defend")
	IncludeLocals("quest_defeat")
	IncludeLocals("army_defend")
	IncludeLocals("army_spawn")
    IncludeLocals("briefing_wolfmaster")
	IncludeLocals("briefing_fight")
	IncludeLocals("briefing_q3")
	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_q2")

	createPlayer1()
	createPlayer2()
	createPlayer3()
	createPlayer4()
	createPlayer5()
	createPlayer6()
	


	-- debugging stuff
	--EnableDebugging()
    --Game.GameTimeReset()

    Mission_InitMerchants()

	start1stQuest()

	-- set player names
	--SetPlayerName(2, "Darios Truppen")
	SetPlayerName(2, String.Key("_Player2Name"))

	-- Set Music-Set
	LocalMusic.UseSet = DARKMOORMUSIC

	if CP_Difficulty > 0 then
		if CP_Difficulty == 2 then
			GUI.SetTaxLevel(1)
		end

		local towers1 = { Logic.GetPlayerEntities(2, Entities.PB_Tower2, 20, 0) }
		for i = 2, table.getn(towers1) do
			if IsExisting(towers1[i]) then
				ReplaceEntity(towers1[i], Entities.PB_Tower3)
			end
		end
		local towers2 = { Logic.GetPlayerEntities(4, Entities.PB_Tower2, 10, 0) }
		for i = 2, table.getn(towers2) do
			if IsExisting(towers2[i]) then
				ReplaceEntity(towers2[i], Entities.PB_Tower3)
			end
		end
		local towers3 = { Logic.GetPlayerEntities(6, Entities.PB_Tower2, 10, 0) }
		for i = 2, table.getn(towers3) do
			if IsExisting(towers3[i]) then
				ReplaceEntity(towers3[i], Entities.PB_Tower3)
			end
		end
		
		local cannons1 = { Logic.GetPlayerEntities(8, Entities.PV_Cannon1, 5, 0) }
		for i = 1, table.getn(cannons1) do
            if IsExisting(cannons1[i]) then
			    ReplaceEntity(cannons1[i], Entities.PV_Cannon3)
            end
		end
		local cannons2 = { Logic.GetPlayerEntities(8, Entities.PV_Cannon2, 5, 0) }
		for i = 1, table.getn(cannons2) do
            if IsExisting(cannons2[i]) then
			    ReplaceEntity(cannons2[i], Entities.PV_Cannon3)
            end
		end

		Logic.CreateEntity(Entities.PB_Tower1, 500, 500, 0, 3);
		Logic.CreateEntity(Entities.PB_Tower1, 500, 500, 0, 6);
	end
	
	RaidersCreate({player = 3, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	RaidersCreate({player = 3, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1", "rudelpos2_wp2"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (3 + CP_Difficulty), ramount = (7 + CP_Difficulty * 2)})
	RaidersCreate({player = 3, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})

	--Tools.ExploreArea(-1, -1, 900)
	--StartSimpleJob("GetMousePos")
end


--StartCutscene(Cutscenes[MISSIONCOMPLETECUTSCENE],Victory)


