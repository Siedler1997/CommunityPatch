
-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0

--Include cutscenes
Cutscenes = {}
Cutscenes[INTROCUTSCENE] = "INTRO"
Cutscenes[MISSIONCOMPLETECUTSCENE] = "MISSIONCOMPLETE"

IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])

IncludeLocals("gameControl")
IncludeLocals("briefing_prelude")
IncludeLocals("TentsArmy")
IncludeLocals("briefing_ScoutsFree")
IncludeLocals("Player1Army")
IncludeLocals("Caravans")
IncludeLocals("briefing_caravan")
IncludeLocals("briefing_caravanAttack")
IncludeLocals("briefing_mines")
IncludeLocals("briefing_ErecMessenger")
IncludeLocals("briefing_DrakeMessenger")
IncludeLocals("briefing_AriMessenger")
IncludeLocals("ErecMessQuest")
IncludeLocals("DrakeMessQuest")
IncludeLocals("AriMessQuest")
IncludeLocals("Bombs")
IncludeLocals("briefing_Alchemist")
IncludeLocals("quest_defeat")
IncludeLocals("player_2")
IncludeLocals("AttacksFromVillage")
IncludeLocals("briefing_NPCIron")
IncludeLocals("briefing_MessAttack")
IncludeLocals("briefing_ScoutDies")

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 2, 3, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 2, 4, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 3, 4, Diplomacy.Hostile )

	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()
	Display.SetPlayerColorMapping(2, BARBARIAN_COLOR)
	Display.SetPlayerColorMapping(3, ROBBERS_COLOR)
	Display.SetPlayerColorMapping(7, BARBARIAN_COLOR)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

	        Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Weathermachine     	,0 )	
	        Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_PowerPlant      	,0 )
	        Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_WeatherForecast    	,0 ) 
	        Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_ChangeWeather      	,0 )
	        Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Tavern      	,0 )
	        Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_ScoutTorches      	,0 ) 
	        Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_ScoutFindResources	,0 )

	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(3)
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

		String.Init("CM04_03_TheBeautifulLand")

		Logic.SetShareExplorationWithPlayerFlag(1, 4, 1)

	--	resources
	
		AddGold(500)
		AddWood(0)
		AddClay(0)
		AddStone(0)
		AddIron(0)
		AddSulfur(0)

		CreateChestOpener("Pilgrim")

		CreateRandomChests()
		StartChestQuest()


	-- Set Music-Set

		LocalMusic.UseSet = EUROPEMUSIC

	--	Variables

		Scout1InBase		=0
		Scout2InBase		=0
		Scout3InBase		=0
		Scout1Free		=0
		Scout2Free		=0
		Scout3Free		=0

		Caravan1Done		=0
		Caravan2Done		=0
		Caravan3Done		=0
		Caravan4Done		=0

		IronMineIsBuild		=0
		ClayMineIsBuild		=0
		QuestMinesReady		=0
		QuestTwoMessGone	=0

		ErecMessengerGone	=0
		DrakeMessengerGone	=0
		AriMessengerGone	=0

		LightTheBombs		=0
		StopEffects		=0

		Prost1Dead		=0
		Prost2Dead		=0
		Prost3Dead		=0
	
	--	start quest

		StartCutscene(Cutscenes[INTROCUTSCENE],createBriefingScoutDies)
		createPlayer2()
		setupArmyAI1Attack()
		StartAttackPos1()
		StartAttackPos2()

		SetPlayerName(2, String.Key("_Player2Name"))
		--SetPlayerName(3, String.Key("_Player3Name"))


	-- debugging stuff

		--EnableDebugging()
    		--Game.GameTimeReset()
		    
		if CP_Difficulty == 1 then
			local towers1 = { Logic.GetPlayerEntities(1, Entities.PB_Tower3, 10, 0) }
			for i = 2, table.getn(towers1) do
				if IsExisting(towers1[i]) then
					ReplaceEntity(towers1[i], Entities.PB_Tower2)
				end
			end
			local towers2 = { Logic.GetPlayerEntities(2, Entities.PB_Tower2, 10, 0) }
			for j = 2, table.getn(towers2) do
				GUI.UpgradeSingleBuilding(towers2[j])	
			end
			GUI.UpgradeSingleBuilding(GetEntityId("ArmyGen1"))
			GUI.UpgradeSingleBuilding(GetEntityId("ArmyGen2"))	
		end
		--Tools.ExploreArea(-1, -1, 900) 
	end

