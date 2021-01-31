
-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0

IncludeLocals("gameControl")
IncludeLocals("Player1StartArmy")
IncludeLocals("VillageArmy")
IncludeLocals("briefing_Stone")
IncludeLocals("briefing_PRE_Stone")
IncludeLocals("briefing_fire")
IncludeLocals("briefing_PRE_Clay")
IncludeLocals("briefing_PRE_Sulfur")
IncludeLocals("briefing_PRE_Iron")
IncludeLocals("briefing_FinalAttack")
IncludeLocals("briefing_Explosion")
IncludeLocals("briefing_fun")
IncludeLocals("briefing_Trader")

IncludeLocals("briefing_Clay")
IncludeLocals("briefing_Iron")
IncludeLocals("briefing_Sulfur")
IncludeLocals("briefing_Merchant")
IncludeLocals("briefing_Bombs")
IncludeLocals("briefing_prelude")
IncludeLocals("quest_StoneMines")
IncludeLocals("quest_ClayMines")
IncludeLocals("Teleport")
IncludeLocals("TeleportBack")
IncludeLocals("quest_defeat")
IncludeLocals("MainArmy1")
IncludeLocals("MainArmy2")
IncludeLocals("MainArmy3")
IncludeLocals("FinalAttack")
IncludeLocals("CounterFinalAttack")
IncludeLocals("NPCFun")
IncludeLocals("NPCStone")
IncludeLocals("NPCClay")
IncludeLocals("NPCSulfur")
IncludeLocals("NPCMerchant")
IncludeLocals("NPCIron")
IncludeLocals("NPCBombSquad")

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
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 2, 4, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 2, 5, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )
	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()
	Display.SetPlayerColorMapping(7, ROBBERS_COLOR)
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
		Logic.SetTechnologyState(gvMission.PlayerID, Technologies.GT_Mathematics	,0 ) 

	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
		ResearchAllMilitaryTechsAddOn(2)
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

	      String.Init("CM04_02_TheRichLand")

	--	resources
	
		AddGold(900)
		AddWood(1500)
		AddClay(800)
		AddStone(700)
		AddIron(0)
		AddSulfur(0)
		SetHealth("Base1",50)
		SetHealth("Base2",50)
		SetHealth("Base3",50)

		--SetPlayerName(2, "Barbaren")
		SetPlayerName(2, String.Key("_Player2Name"))


	-- Set Music-Set

		LocalMusic.UseSet = EUROPEMUSIC
	
	--	start quest

		start1stChapter()
		MakeInvulnerable("MainRock")
		StoneMinesAreBuild=0
		ClayMinesAreBuild=0
		MakeInvulnerable("RockBlock1")
		startQuestDefeat()
		
	--	EnableDebugging()

		if CP_Difficulty == 1 then
			local vcpos = GetPosition("vc_empty") 		

			DestroyEntity("vc_empty")
			Logic.CreateEntity(Entities.CB_Camp01,(vcpos.X - 300),(vcpos.Y + 200),90,2)
			local enemycamp = Logic.CreateEntity(Entities.XD_Camp,(vcpos.X - 400),(vcpos.Y - 500),0,0)
			local barbenemies = AI.Entity_CreateFormation(2, Entities.CU_VeteranLieutenant, 0, 0, (vcpos.X - 600),(vcpos.Y - 500), 0, 0, 2, 0)
			LookAt(barbenemies, enemycamp)
		end

		--Tools.ExploreArea(-1, -1, 900)   
	end

