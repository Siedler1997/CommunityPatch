--------------------------------------------------------------------------------
-- MapName: Old Kings Castle
--
-- Author: Peter Sprys
--
--------------------------------------------------------------------------------

	--Input.KeyBindDown (Keys.NumPad7, "Cheat_Intro_Start()")


-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )

CP_Difficulty = 0

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()
	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 8, Diplomacy.Hostile )
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()

	Display.SetPlayerColorMapping(2, KERBEROS_COLOR)		-- Kerberos in Southwest
	Display.SetPlayerColorMapping(3, ROBBERS_COLOR)			-- Robbers at Mountain path
	Display.SetPlayerColorMapping(4, PLAYER_FRIEND_COLOR)	-- Garek, village
	Display.SetPlayerColorMapping(5, KERBEROS_COLOR)		-- Kerberos in northeast
	Display.SetPlayerColorMapping(6, FRIENDLY_COLOR2)		-- Avala (Mountain village)
	Display.SetPlayerColorMapping(7, NPC_COLOR)				-- NPCs
	Display.SetPlayerColorMapping(8, KERBEROS_COLOR)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()
	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
		ResearchAllMilitaryTechs(2)
		ResearchAllMilitaryTechs(3)
		ResearchAllMilitaryTechs(5)
		ResearchAllMilitaryTechs(6)	--No enemy, but has to be useful
		ResearchAllMilitaryTechs(8)
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

	Logic.AddWeatherElement(2, 5, 1, 2, 5, 10)

end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	IncludeLocals("Cutscene_Control")

	-- Load mission files
	IncludeLocals("army_p2defense")
	IncludeLocals("army_p2firstattack")
	IncludeLocals("army_p2intruders")
	IncludeLocals("army_p2ironattack")
	IncludeLocals("army_p2villageattack")
	IncludeLocals("army_p3robbers")
	IncludeLocals("army_p5attack")
	IncludeLocals("army_p5defense")
	IncludeLocals("army_p6attack")

	IncludeLocals("briefing_bergstadt")
	IncludeLocals("briefing_bergstadtattack")
	IncludeLocals("briefing_garek")
	IncludeLocals("briefing_kerberos")
	IncludeLocals("briefing_neutralkerberos")
	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_sommer")
	IncludeLocals("briefing_closedgate")
	IncludeLocals("briefing_arisfriends")
	IncludeLocals("briefing_ariheliasdead")
	
	IncludeLocals("gameControl")

	IncludeLocals("player_1")
	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_5")
	IncludeLocals("player_6")

	IncludeLocals("quest_arifriends")
	IncludeLocals("quest_buildneariron")
	IncludeLocals("quest_defeat")
	IncludeLocals("quest_defeatkerberos")
	IncludeLocals("quest_reachexit")
	IncludeLocals("quest_rescuevillage")
	IncludeLocals("quest_sommer")
	IncludeLocals("quest_tributebergstadt")
	IncludeLocals("quest_wintergate")
	IncludeLocals("quest_ariheliasdead")

	IncludeLocals("quest_gatekey")
	IncludeLocals("quest_opengate")
	IncludeLocals("quest_closedgate")
	IncludeLocals("quest_Leonardo")
	IncludeLocals("quest_rewards")
	IncludeLocals("quest_rebuildCastle")
	IncludeLocals("quest_destroyruins")
	
	IncludeLocals("Map_LocalInit")		--TF_Include!

	--	chest handling

		CreateChestOpener("Dario")
		CreateChestOpener("Erec")
		CreateChestOpener("Helias")
		CreateChestOpener("Ari")
		CreateChestOpener("Pilgrim")
		CreateChestOpener("Salim")
	
		CreateRandomGoldChests()
		CreateRandomChests()
		
		StartChestQuest()


	--
	
		String.Init("CM01_15_OldKingsCastle_Txt")

	-- Set Music-Set

		LocalMusic.UseSet = MEDITERANEANMUSIC

	-- Start time line

		TimeLine.Start()
	
	-- Start prelude

		StartCutscene("Intro", start1stQuest)
-- DEBUGG

--	EnableDebugging()

--	StartCutscene("MissionComplete")

	if CP_Difficulty == 1 then
		local hq_ai1_pos = GetPosition("HQ_AI1")

		Logic.CreateEntity(Entities.XD_RockDestroyableMedium1, (hq_ai1_pos.X + 800), (hq_ai1_pos.Y + 2400), 0, 0);

		local bossID1 = AI.Entity_CreateFormation(8,Entities.CU_VeteranCaptain,0,0,(hq_ai1_pos.X + 800),(hq_ai1_pos.Y - 800),0,0,3,0)
		LookAt(bossID1, "Garek")
	end

	--Tools.ExploreArea(-1, -1, 900)
end
