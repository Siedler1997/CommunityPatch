--------------------------------------------------------------------------------
-- MapName: Cleycourt
--
-- Author: Peter Sprys
--
--------------------------------------------------------------------------------

-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )
Script.Load(Folders.MapTools.."Technologies_ForbidAll.lua")

CP_Difficulty = 0

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()
	Logic.SetDiplomacyState( 1, 6, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()

--  Player _DstPlayerID will use color of player _SrcPlayerID. Params: _DstPlayerID, _SrcPlayerID.
	Display.SetPlayerColorMapping(1,PLAYER_COLOR)
	Display.SetPlayerColorMapping(2,NPC_COLOR)
	Display.SetPlayerColorMapping(3,BARMECIA_COLOR)
	Display.SetPlayerColorMapping(4,CLEYCOURT_COLOR)
	Display.SetPlayerColorMapping(6, ROBBERS_COLOR)
	Display.SetPlayerColorMapping(7,KERBEROS_COLOR)
	Display.SetPlayerColorMapping(8,NPC_COLOR)

	if CP_Difficulty == 2 then
		Display.SetPlayerColorMapping(1, ENEMY_COLOR1)
	end

end
	

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()

	GeneratePlayerResources(3)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
-- see Player_1.lua !!!
function Mission_InitTechnologies()
	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		_ResearchSuperTech = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			_ResearchSuperTech = true
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
		end

		ResearchAllMilitaryTechs(6, _ResearchSuperTech)
		ResearchAllMilitaryTechs(7, _ResearchSuperTech)
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

	String.Init("CM01_06_Cleycourt_txt")
	IncludeLocals("Cutscene_Control")

	-- Load mission files
	IncludeLocals("army_p7defense")
	IncludeLocals("army_p7ironmine")
	IncludeLocals("army_p7playerattack")

	IncludeLocals("briefing_aribase")
	IncludeLocals("briefing_catchari")
	IncludeLocals("briefing_leonardo")
	IncludeLocals("briefing_orb")
	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_uni")
	IncludeLocals("briefing_warning")
	IncludeLocals("briefing_trader1")
	IncludeLocals("briefing_trader1end")
	IncludeLocals("briefing_trader2")
	IncludeLocals("briefing_trader2end")
	IncludeLocals("briefing_GuardWaterfall")
	
	IncludeLocals("gameControl")

	IncludeLocals("player_1")
	IncludeLocals("player_3")
	IncludeLocals("player_4")
	IncludeLocals("player_7")

	IncludeLocals("quest_builduni")
	IncludeLocals("quest_catchari")
	IncludeLocals("quest_defeat")
	IncludeLocals("quest_findari")
	IncludeLocals("quest_freechest")
	IncludeLocals("quest_getkey")
	IncludeLocals("quest_leomovenearmachine")
	IncludeLocals("quest_opengate")
	IncludeLocals("quest_trader1")
	IncludeLocals("quest_trader2")
	IncludeLocals("quest_ReachBarmeciaMayor")
	IncludeLocals("quest_NearGateNoKey")


	LocalMusic.UseSet = EUROPEMUSIC
		
	
	String.Init("CM01_06_Cleycourt_Txt")

	--	chest handling

		CreateChestOpener("Dario")
		CreateChestOpener("Erec")
		CreateChestOpener("Helias")
--		CreateChestOpener("Ari")
--		CreateChestOpener("Pilgrim")
--		CreateChestOpener("Salim")
	
		
		StartChestQuest()


	
	-- Start prelude
	start1stQuest()
	-- Start time line
	TimeLine.Start()

--	EnableDebugging()
	if CP_Difficulty == 0 then
		CreateRandomGoldChests()
		CreateRandomChests()
	else
		local addWolves = 0
		if CP_Difficulty == 1 then
			Logic.CreateEntity(Entities.PB_Tower2,8100,15000,0,7)
		else
			Display.SetPlayerColorMapping(1, ENEMY_COLOR1)
			GUI.SetTaxLevel(1)
			
			Logic.CreateEntity(Entities.PB_Tower3,8100,15000,0,7)
			StartCountdown(15 * 60, setupArmyP7PlayerAttack, false)
			
			addWolves = addWolves + 2

			LocalMusic.SetBattle = LocalMusic.SetEvilBattle
		end

		local vcpos = GetPosition("vc_empty")
		DestroyEntity("vc_empty")
		Logic.CreateEntity(Entities.XD_RuinMonastery2,vcpos.X,vcpos.Y,90,0)
		
		local vcpos2 = GetPosition("vc_empty2")
		DestroyEntity("vc_empty2")

		local bosspos = GetPosition("KerberosCamp")
		local bossID = AI.Entity_CreateFormation(7,Entities.CU_VeteranCaptain,0,0,(bosspos.X - 0),(bosspos.Y - 0),0,0,3,0)
		LookAt(bossID, "Dario")
		
		RaidersCreate({player = 6, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 3500, samount = (2 + addWolves), ramount = (6 + addWolves)})
		RaidersCreate({player = 6, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1", "rudelpos2_wp2"}, range = 4000, samount = (4 + addWolves), ramount = (10 + addWolves)})
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
