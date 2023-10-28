--------------------------------------------------------------------------------
-- MapName: Wasteland
--
-- Author: Peter Sprys
--
--------------------------------------------------------------------------------

-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )

CP_Difficulty = 0

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Hostile )
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()
--  Player _DstPlayerID will use color of player _SrcPlayerID. Params: _DstPlayerID, _SrcPlayerID.

	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if p1color ~= 13 then
		Display.SetPlayerColorMapping(2,PAPAL_COLOR)
	else
		Display.SetPlayerColorMapping(2,3)
	end
	Display.SetPlayerColorMapping(3,ROBBERS_COLOR)
	Display.SetPlayerColorMapping(4,KERBEROS_COLOR)
	Display.SetPlayerColorMapping(5,KERBEROS_COLOR)
	Display.SetPlayerColorMapping(6,FRIENDLY_COLOR1)
	if p1color ~= 4 then
		Display.SetPlayerColorMapping(6,FRIENDLY_COLOR1)
	else
		Display.SetPlayerColorMapping(6,16)
	end
	Display.SetPlayerColorMapping(7,NPC_COLOR)
	Display.SetPlayerColorMapping(8,NPC_COLOR)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()

	-- Generate resources
	Tools.GiveResouces(gvMission.PlayerID, 300, 800, 800, 400,200)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

	-- forbid weather machine base
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_ChangeWeather, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_WeatherForecast, 0)

	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_MarketSulfur, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_MarketIron, 0)
	
	ResearchTechnology( Technologies.T_AnimalTechnology1, 1 );
	ResearchTechnology( Technologies.T_AnimalTechnology2, 1 );
	
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

		ResearchAllMilitaryTechs(2)
		ResearchAllMilitaryTechs(3)
		ResearchAllMilitaryTechs(4)
		ResearchAllMilitaryTechs(5)

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
	
	WeatherSets_SetupHighland(1)
	WeatherSets_SetupHighlandRain(2)
	WeatherSets_SetupHighlandSnow(3)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

	Logic.SetupGfxSet(1)
	
	Logic.AddWeatherElement(1, 5, 1, 1, 5, 10)

end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	String.Init("CM01_17_CloudyMountains_Txt")

	-- Load mission files
	IncludeLocals("gameControl")
	IncludeLocals("Map_LocalInit")

	IncludeLocals("army_ai1attack")
	IncludeLocals("army_ai1defendiron")
	IncludeLocals("army_ai1Defense")
	IncludeLocals("army_ai2concentratingarea")
	IncludeLocals("army_robbers")

	IncludeLocals("briefing_key")
	IncludeLocals("briefing_orb")
	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_stonevalley")
	IncludeLocals("briefing_svmajor")
	IncludeLocals("briefing_snow")
	IncludeLocals("briefing_gate")
	IncludeLocals("briefing_IronMan")
	IncludeLocals("briefing_woodpecker")
	
	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_5")
	IncludeLocals("player_6")

	IncludeLocals("quest_buildup")
	IncludeLocals("quest_buyorb")
	IncludeLocals("quest_defeat")
	IncludeLocals("quest_destroyblocking")
	IncludeLocals("quest_destroystone")
	IncludeLocals("quest_findorb")
	IncludeLocals("quest_snow")
	IncludeLocals("quest_gateHQ")
	IncludeLocals("quest_stonevalley")
	IncludeLocals("quest_CountVCs")
	IncludeLocals("quest_IronManTribute")
	
	IncludeLocals("Cutscene_Control")

	String.Init("CM01_17_CloudyMountains_Txt")

	--	chest handling

		CreateChestOpener("Dario")
		CreateChestOpener("Erec")
		CreateChestOpener("Helias")
		CreateChestOpener("Ari")
		CreateChestOpener("Pilgrim")
		CreateChestOpener("Salim")
		CreateChestOpener("Kerberos")
	
		
		StartChestQuest()
		
	-- Start time line
--	TimeLine.Start()

	MapLocal_CreateNPCs()

	
	-- Start prelude
	local pos = GetPosition("Dario")
	Camera.ScrollSetLookAt(pos.X, pos.Y)
	
	LocalMusic.UseSet = HIGHLANDMUSIC

	start1stQuest()
	
--	EnableDebugging()

	if CP_Difficulty == 0 then
		CreateRandomGoldChests()
		CreateRandomChests()
	else
		if CP_Difficulty == 2 then
			GUI.SetTaxLevel(1)
		else
			CreateRandomGoldChests()
			CreateRandomChests()
		end

		local bosspos1 = GetPosition("HQ_AI1")
		local bossID1 = AI.Entity_CreateFormation(4,Entities.CU_VeteranCaptain,0,0,(bosspos1.X - 1000),(bosspos1.Y - 1000),0,0,3,0)

		local bossID2 = AI.Entity_CreateFormation(3,Entities.CU_LeaderOutlaw1,0,0,38400,14400,0,0,3,0)
		LookAt(bossID2, "camp_fire1")

		--[[		
		local bearPos = GetPosition("Kerberos")
		AI.Entity_CreateFormation(1,Entities.CU_AggressiveWolf_Grey,0,0,(bearPos.X - 500),(bearPos.Y - 500),0,0,3,0)
		AI.Entity_CreateFormation(1,Entities.CU_AggressiveWolf_White,0,0,(bearPos.X + 500),(bearPos.Y + 500),0,0,3,0)
		AI.Entity_CreateFormation(1,Entities.CU_AggressiveWolf_Brown,0,0,(bearPos.X + 500),(bearPos.Y - 500),0,0,3,0)
		AI.Entity_CreateFormation(1,Entities.CU_AggressiveWolf_Black,0,0,(bearPos.X - 500),(bearPos.Y + 500),0,0,3,0)
		--]]
	end

	RaidersCreate({player = 3, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1", "rudelpos1_wp2"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	RaidersCreate({player = 3, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1", "rudelpos2_wp2"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	RaidersCreate({player = 3, pos = "rudelpos3", revier = {"rudelpos3", "rudelpos3_wp1"}, range = 4000, types = RaidersDefaultSets.Evelance, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	
	RaidersCreate({player = 3, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	
    gvGUI.BonusHeroId = GetEntityId("Kerberos")

	--Tools.ExploreArea(-1, -1, 900)
	--StartSimpleJob("GetMousePos")
end