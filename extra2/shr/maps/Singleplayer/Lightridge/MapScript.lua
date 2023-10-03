
-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )

IncludeLocals("gameControl")
IncludeLocals("briefing_Bridge")
IncludeLocals("briefing_Erec")
IncludeLocals("briefing_Ari")
IncludeLocals("briefing_Alternative")
IncludeLocals("briefing_Warning")

IncludeLocals("SpawnThievesWest")
IncludeLocals("SpawnThievesEast")
IncludeLocals("SpawnThievesSouth")
IncludeLocals("SpawnDefense")
IncludeLocals("AttackCaravan")
IncludeLocals("Arrival")
IncludeLocals("CaravanReward")
IncludeLocals("FirstAttack")
IncludeLocals("SecondAttack")
IncludeLocals("AfterAttacks")
IncludeLocals("StopAttacks")
IncludeLocals("Ari")
IncludeLocals("Alternative")
IncludeLocals("TheFinalAttack")
IncludeLocals("DestroyBridge")
IncludeLocals("CheckBridge")
IncludeLocals("CheckThiefProximity")


IncludeLocals("quest_defeat")
IncludeLocals("quest_victory")
IncludeLocals("quest_victory1")


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 2, 3, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 2, 4, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 3, 4, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )

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
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_ThiefSabotage      	,0 ) 

	ResearchTechnology(Technologies.T_UpgradeBow1)

	ResearchAllMilitaryTechsAddOn(4)
	ResearchAllMilitaryTechsAddOn(7)

	ResearchAnimalTechs(7)
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
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
 	-- set player colors
	 
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if p1color == 2 then
		Display.SetPlayerColorMapping(2, 9)		
		Display.SetPlayerColorMapping(3, 9)		
	else
		Display.SetPlayerColorMapping(2, 2)		
		Display.SetPlayerColorMapping(3, 2)	
	end
	Display.SetPlayerColorMapping(5, 6)		
	Display.SetPlayerColorMapping(7, ROBBERS_COLOR)		
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

	      String.Init("SP_Lightridge")

	--	resources
		GlobalMissionScripting.GiveResouces(1, 1500, 2000, 1500, 2000, 1500, 1000)
	
		Logic.SetShareExplorationWithPlayerFlag(1, 4, 1)
		Logic.SetEntityInvulnerabilityFlag(GetEntityId("OpenSesame"),1)
		MakeInvulnerable("OpenSesame")
		MakeInvulnerable("Pod1")
		MakeInvulnerable("Pod2")
		MakeInvulnerable("Pod3")
		MakeInvulnerable("Pod4")

	-- Set Music-Set
	
		LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
		LocalMusic.UseSet = HIGHLANDMUSIC
	
	--	start quest

		BridgeDestroyed=0
		variabila=0
		variabila2=0
		CheckThiefEast()
		CheckThiefSouth()
		CheckThiefWest()
		startQuestDefeat()
		CheckBridge()
		create1stQuest()

		UnimportantBridge = 0

		--SetPlayerName(2, "Die Feinde")
		SetPlayerName(2, String.Key("_Player2Name"))

		--EnableDebugging()

		RaidersCreate({player = 7, pos = "bearpos1", revier = 1000, range = 3500, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})
		RaidersCreate({player = 7, pos = "bearpos2", revier = 1000, range = 3500, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})
		RaidersCreate({player = 7, pos = "bearpos3", revier = 1000, range = 3500, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})
		    	
		--StartSimpleJob("GetMousePos")
		--Tools.ExploreArea(-1, -1, 900)
end

