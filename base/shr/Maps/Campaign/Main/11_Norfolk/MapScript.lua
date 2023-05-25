--------------------------------------------------------------------------------
-- MapName: Cleycourt
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
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 6, Diplomacy.Hostile )

	Logic.SetDiplomacyState( 3, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 3, 4, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 3, 6, Diplomacy.Hostile )
	
	Logic.SetDiplomacyState( 2, 4, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 2, 6, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 4, 6, Diplomacy.Friendly )
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()

--  Player _DstPlayerID will use color of player _SrcPlayerID. Params: _DstPlayerID, _SrcPlayerID.
	Display.SetPlayerColorMapping(2,KERBEROS_COLOR)
	Display.SetPlayerColorMapping(3,FRIENDLY_COLOR1)
	Display.SetPlayerColorMapping(4,BARBARIAN_COLOR)
	Display.SetPlayerColorMapping(5,FRIENDLY_COLOR1)
	Display.SetPlayerColorMapping(6,ENEMY_COLOR2)
	Display.SetPlayerColorMapping(8,NPC_COLOR)

	if CP_Difficulty == 2 then
		Display.SetPlayerColorMapping(1, ENEMY_COLOR1)
	end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()

	-- Generate resources
	GeneratePlayerResources(3)--(2)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Weathermachine, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_PowerPlant, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_WeatherForecast, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_ChangeWeather, 0)

	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
		end

		ResearchAllMilitaryTechs(2)
		ResearchAllMilitaryTechs(3)	--No enemy, but has to survive attacks without help
		ResearchAllMilitaryTechs(4)
		ResearchAllMilitaryTechs(6)
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
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

	Logic.AddWeatherElement(1, 5, 1, 1, 5, 10)

end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	String.Init("CM01_11_Norfolk_Txt")
	-- Load mission files
	
	IncludeGlobals("MapEditorTools")

	IncludeLocals("army_p2attacker")
	IncludeLocals("army_p2defense")
	IncludeLocals("army_p2winterattacker")
	IncludeLocals("army_p3defense")
	IncludeLocals("army_p4attacker")
	IncludeLocals("army_p4attacker2")
	IncludeLocals("army_p4defense")
	IncludeLocals("army_p4intruders")
	IncludeLocals("army_p4winterattacker")
	IncludeLocals("army_bosses")

	IncludeLocals("briefing_ingredients")
	IncludeLocals("briefing_ironmines")
	IncludeLocals("briefing_leonardo")
	IncludeLocals("briefing_mayor")
	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_priest")
	IncludeLocals("briefing_priesthealed")
	IncludeLocals("briefing_water")
	IncludeLocals("briefing_HolzMichl")
	IncludeLocals("briefing_WinterWarning")
	IncludeLocals("briefing_PlayerWeatherChange")
	
	IncludeLocals("gameControl")

	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_4")

	IncludeLocals("quest_defeat")
	IncludeLocals("quest_defendnorfolk")
	IncludeLocals("quest_escortmessanger")
	IncludeLocals("quest_getingredients")
	IncludeLocals("quest_getwater")
	IncludeLocals("quest_leonardo")
	IncludeLocals("quest_winterattack")
	IncludeLocals("quest_protectNorfolk")
	IncludeLocals("quest_PlayerWeatherChange")
	IncludeLocals("quest_ReachLeo")

       IncludeLocals("Map_LocalInit")
       IncludeLocals("Cutscene_Control")
       
       LocalMusic.UseSet = HIGHLANDMUSIC 


	String.Init("CM01_11_Norfolk_Txt")

	--	chest handling

		CreateChestOpener("Dario")
		CreateChestOpener("Erec")
		CreateChestOpener("Helias")
		CreateChestOpener("Ari")
		CreateChestOpener("Pilgrim")
		CreateChestOpener("Salim")
	
		
		StartChestQuest()


	-- Start time line
	TimeLine.Start()
	
	-- Start cutscene and prelude after
	start1stQuest()

	CreateRandomGoldChests()
	if CP_Difficulty == 0 then
		CreateRandomChests()
	else
		local addWolves = 0
		if CP_Difficulty == 2 then
			Display.SetPlayerColorMapping(1, ENEMY_COLOR1)
			GUI.SetTaxLevel(1)
			
			addWolves = addWolves + 2

			LocalMusic.SetBattle = LocalMusic.SetEvilBattle
		end

		SetPosition ("Ingredient", GetPosition("GoldChest1"))

		local bosspos1 = GetPosition("P2Defense2")
		local bossID1 = AI.Entity_CreateFormation(6,Entities.CU_VeteranCaptain,0,0,(bosspos1.X + 1500),(bosspos1.Y + 0),0,0,3,0)
		SetEntityName(bossID1, "P2_Boss")

		local bosspos2 = GetPosition("P4DefensePos")
		local bossID2 = AI.Entity_CreateFormation(6,Entities.CU_Barbarian_Hero,0,0,(bosspos2.X + 300),(bosspos2.Y + 1700),0,0,0,0)
		SetEntityName(bossID2, "P4_Boss")

		RaidersCreate({player = 6, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1", "rudelpos1_wp2"}, range = 4000, samount = (2 + addWolves), ramount = (6 + addWolves)})
		RaidersCreate({player = 6, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1", "rudelpos2_wp2"}, range = 4000, samount = (3 + addWolves), ramount = (8 + addWolves)})
	end

	--Tools.ExploreArea(-1, -1, 900)
	--ResearchAllMilitaryTechs(1)
	--StartSimpleHiResJob("GetDarioPos")
	--EnableDebugging()
end

--[[
function GetDarioPos()
	local pos = GetPosition("Dario")
	Message("X: " .. pos.X .. "   Y: " .. pos.Y)
end
--]]