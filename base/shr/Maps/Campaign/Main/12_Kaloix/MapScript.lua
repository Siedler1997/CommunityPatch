--------------------------------------------------------------------------------
-- MapName: Kaliox
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
	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 6, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 4, 6, Diplomacy.Hostile )
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()

--  Player _DstPlayerID will use color of player _SrcPlayerID. Params: _DstPlayerID, _SrcPlayerID.
	Display.SetPlayerColorMapping(2,ENEMY_COLOR2)
	Display.SetPlayerColorMapping(3,FRIENDLY_COLOR1)
	Display.SetPlayerColorMapping(4,FRIENDLY_COLOR2)
	Display.SetPlayerColorMapping(5,KERBEROS_COLOR)
	Display.SetPlayerColorMapping(6,KERBEROS_COLOR)
	Display.SetPlayerColorMapping(7,ROBBERS_COLOR)
	Display.SetPlayerColorMapping(8,NPC_COLOR)

	if CP_Difficulty == 2 then
		Display.SetPlayerColorMapping(1, ENEMY_COLOR1)
	end

end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
-- gold, clay, wood, stone, iron, sulfur
function Mission_InitResources()

	-- Generate resources
	-- GeneratePlayerResources(2)
	Tools.GiveResouces(1, 300, 700, 600, 400, 200, 0)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

	-- Forbid foundry
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Foundry, 0)
	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
		end

		ResearchAllMilitaryTechs(2)
		ResearchAllMilitaryTechs(5)
		ResearchAllMilitaryTechs(6)
		ResearchAllMilitaryTechs(7)
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
	
	WeatherSets_SetupMediterranean(1)
	WeatherSets_SetupMediterraneanRain(2)
	WeatherSets_SetupMediterraneanSnow(3)
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

	String.Init("CM01_12_Kaloix")

	-- Load mission files
	IncludeLocals("gameControl")
	IncludeLocals("Map_LocalInit")

	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_mines")
	IncludeLocals("briefing_DestroyRedDone")
	IncludeLocals("briefing_RedAttack")
	IncludeLocals("briefing_TributePaid")
	IncludeLocals("briefing_morfichet")
	IncludeLocals("briefing_tributetoredpaid")
	IncludeLocals("briefing_Wiseguy")

	IncludeLocals("quest_BuildUpCountessVillage")
	IncludeLocals("quest_DefendCountessVillage")
	IncludeLocals("quest_CountessVillageTributePaid")
	IncludeLocals("quest_BuyMines")
	IncludeLocals("quest_DestroyKI1")
	IncludeLocals("quest_DestroyKI2")
	IncludeLocals("quest_Defeat")
	IncludeLocals("quest_tributetored")
	
	
	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_4")
	IncludeLocals("player_6")
	IncludeLocals("player_7")
	
	IncludeLocals("army_KI1")
	IncludeLocals("army_KI1_defense")
	IncludeLocals("army_KI2")
	IncludeLocals("army_KI2_defense")
	IncludeLocals("army_DefenseLeftMines")
	IncludeLocals("army_DefenseRightMines")
	
        IncludeLocals("Cutscene_Control")

	--	chest handling

		CreateChestOpener("Dario")
		CreateChestOpener("Erec")
		CreateChestOpener("Helias")
		CreateChestOpener("Ari")
		CreateChestOpener("Pilgrim")
		CreateChestOpener("Salim")
		
		StartChestQuest()

	
--TK
	
	InitMapNPCs()
	
	GlobalMissionScripting_AttachSoldiersToLeader("P1_BowLeader1",4)

	String.Init("CM01_12_Kaloix")

	
	-- Start time line
	TimeLine.Start()
	
	LocalMusic.UseSet = MEDITERANEANMUSIC
	
	-- Start prelude
	start1stQuest()

	CreateRandomGoldChests()
	if CP_Difficulty == 0 then
		CreateRandomChests()
		DestroyEntity("rock_gold1")
		DestroyEntity("rock_gold2")
	else
		local addWolves = 0
		if CP_Difficulty == 1 then
			DestroyEntity("rock_gold1")
			DestroyEntity("rock_gold2")
		else
			Display.SetPlayerColorMapping(1, ENEMY_COLOR1)
			GUI.SetTaxLevel(1)

			Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Weathermachine, 0)
			Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_PowerPlant, 0)
			Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_WeatherForecast, 0)
			Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_ChangeWeather, 0)
			
			addWolves = addWolves + 2

			LocalMusic.SetBattle = LocalMusic.SetEvilBattle
		end

		ReplaceEntity("KI1_Target1", Entities.PB_Headquarters2)
		Logic.CreateEntity(Entities.PB_Tower3, 44800, 10400, 0, 6);
		Logic.CreateEntity(Entities.PB_Tower3, 41500, 10300, 0, 6);
		
		local bossID1 = AI.Entity_CreateFormation(5,Entities.CU_VeteranCaptain,0,0,43100,11400,0,0,3,0)
		LookAt(bossID1, "KI1_Defense")
		
		local towers1 = { Logic.GetPlayerEntities(6, Entities.PB_Tower2, 5, 0) }
		for i = 1, table.getn(towers1) do
			if IsExisting(towers1[i]) then
				ReplaceEntity(towers1[i], Entities.PB_Tower3)
			end
		end

		RaidersCreate({player = 7, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1", "rudelpos1_wp2"}, range = 3500, samount = (2 + addWolves), ramount = (9 + addWolves)})
		RaidersCreate({player = 7, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1", "rudelpos2_wp2"}, range = 3500, samount = (3 + addWolves), ramount = (10 + addWolves)})
	end

	--Tools.ExploreArea(-1, -1, 900)
	--StartSimpleHiResJob("GetDarioPos")
end

--[[
function GetDarioPos()
	local pos = GetPosition("Dario")
	Message("X: " .. pos.X .. "   Y: " .. pos.Y)
end
--]]