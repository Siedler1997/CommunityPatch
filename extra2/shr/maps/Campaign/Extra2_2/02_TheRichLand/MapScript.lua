
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
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if p1color ~= 4 then
		Display.SetPlayerColorMapping(2, ENEMY_COLOR2)
	else
		Display.SetPlayerColorMapping(2, 3)
	end
	if p1color ~= 9 then
		Display.SetPlayerColorMapping(4, PLAYER_FRIEND_COLOR)
	else
		Display.SetPlayerColorMapping(4, 1)
	end
	Display.SetPlayerColorMapping(5, NPC_COLOR)
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

	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		local animalTech2 = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			animalTech2 = true
		end
		ResearchAnimalTechs(2, animalTech2)
		ResearchAnimalTechs(7, animalTech2)
		ResearchAllMilitaryTechsAddOn(2)
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

	      String.Init("CM04_02_TheRichLand")

	--	resources
	
		GlobalMissionScripting.GiveResouces(1, 900, 800, 1500, 700, 0, 0)

		SetHealth("Base1",50)
		SetHealth("Base2",50)
		SetHealth("Base3",50)

		--SetPlayerName(2, "Barbaren")
		SetPlayerName(2, String.Key("_Player2Name"))


	-- Set Music-Set
	
		LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
		LocalMusic.UseSet = EUROPEMUSIC
		
	--	start quest

		start1stChapter()
		MakeInvulnerable("MainRock")
		StoneMinesAreBuild=0
		ClayMinesAreBuild=0
		MakeInvulnerable("RockBlock1")
		startQuestDefeat()
		
	--	EnableDebugging()

		if CP_Difficulty > 0 then
			if CP_Difficulty == 2 then
				GUI.SetTaxLevel(1)
			end
			--[[
			local vcpos = GetPosition("vc_empty") 	
			DestroyEntity("vc_empty")
			Logic.CreateEntity(Entities.CB_Camp01,(vcpos.X - 300),(vcpos.Y + 200),90,2)
			local enemycamp = Logic.CreateEntity(Entities.XD_Camp,(vcpos.X - 400),(vcpos.Y - 500),0,0)
			local barbenemies = AI.Entity_CreateFormation(2, Entities.CU_VeteranLieutenant, 0, 0, (vcpos.X - 600),(vcpos.Y - 500), 0, 0, 2, 0)
			LookAt(barbenemies, enemycamp)
			--]]
			RaidersCreate({player = 7, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 3500, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
			RaidersCreate({player = 7, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
			RaidersCreate({player = 7, pos = "rudelpos3", revier = {"rudelpos3", "rudelpos3_wp1"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
			RaidersCreate({player = 7, pos = "rudelpos4", revier = {"rudelpos4", "rudelpos4_wp1"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (7 + CP_Difficulty * 2)})
			RaidersCreate({player = 7, pos = "rudelpos5", revier = {"rudelpos5", "rudelpos5_wp1"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
		end

		--Tools.ExploreArea(-1, -1, 900)   
		--StartSimpleJob("GetMousePos")
	end

