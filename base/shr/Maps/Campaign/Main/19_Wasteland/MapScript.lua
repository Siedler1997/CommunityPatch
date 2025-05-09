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
	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()
--  Player _DstPlayerID will use color of player _SrcPlayerID. Params: _DstPlayerID, _SrcPlayerID.

	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	
	if p1color ~= 6 then
		Display.SetPlayerColorMapping(2,ENEMY_COLOR2)
	end
	Display.SetPlayerColorMapping(3,ARIS_ROBBERS)
	if p1color ~= 4 then
		Display.SetPlayerColorMapping(4,FRIENDLY_COLOR1)
	else
		Display.SetPlayerColorMapping(4,9)
	end
	Display.SetPlayerColorMapping(5,KERBEROS_COLOR)
	Display.SetPlayerColorMapping(6,FRIENDLY_COLOR2)
	Display.SetPlayerColorMapping(7,KERBEROS_COLOR)
	Display.SetPlayerColorMapping(8,NPC_COLOR)
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
	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		local animalTech2 = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			animalTech2 = true
		end
		ResearchAnimalTechs(2, animalTech2)
		ResearchAnimalTechs(5, animalTech2)
		ResearchAnimalTechs(7, animalTech2)

		ResearchAllMilitaryTechs(2)
		ResearchAllMilitaryTechs(5)
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
	
	WeatherSets_SetupEvelance(1)
	WeatherSets_SetupEvelanceRain(2)
	WeatherSets_SetupEvelanceSnow(3)
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

	-- Attach soldiers
	local i
	for i=1,3 do
		Tools.AttachSoldiersToLeader("RescueObject"..i, 8)
	end
	
	String.Init("CM01_19_Wasteland_Txt")
	IncludeGlobals("MapEditorTools")

	-- Load mission files
	
 	IncludeLocals("gameControl")
	IncludeLocals("tributecontrol")
	IncludeLocals("Map_LocalInit")

	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_4")
	IncludeLocals("player_5")
	IncludeLocals("player_6")
	IncludeLocals("player_7")

	IncludeLocals("briefing_mapstart")
	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_rain")
	IncludeLocals("briefing_fugitive")
	IncludeLocals("briefing_buildup")
	IncludeLocals("briefing_dryvillage")
	IncludeLocals("briefing_swamp")
	IncludeLocals("briefing_weathermaster")
	IncludeLocals("briefing_weathermaster_off")
	
	IncludeLocals("quest_buildupvillage")
	IncludeLocals("quest_rain")
	IncludeLocals("quest_searchAllies")
	IncludeLocals("quest_snow")
	IncludeLocals("quest_reachmountainfortress")
	IncludeLocals("quest_rescuevillagers")
	IncludeLocals("quest_weathermaster")
	IncludeLocals("quest_buildAlchemy")
	
	
	IncludeLocals("army_centeroutpost")
	IncludeLocals("army_leftfortress")
	IncludeLocals("army_rightfortress")

       IncludeLocals("Cutscene_Control")
       
       
    String.Init("CM01_19_Wasteland_Txt")

	--	chest handling

		CreateChestOpener("Dario")
		CreateChestOpener("Erec")
		CreateChestOpener("Helias")
		CreateChestOpener("Ari")
		CreateChestOpener("Pilgrim")
		CreateChestOpener("Salim")
	
		
		StartChestQuest()
	

	
	-- Start time line
--	TimeLine.Start()
	LocalMusic.UseSet = EVELANCEMUSIC

	InitMapNPCs()      
	-- Start prelude

	start1stQuest()

	
	if CP_Difficulty == 0 then
		CreateRandomGoldChests()
		CreateRandomChests()
	else
		if CP_Difficulty == 2 then
			GUI.SetTaxLevel(1)
		
			local towers1 = { Logic.GetPlayerEntities(1, Entities.PB_DarkTower3, 10, 0) }
			for i = 1, table.getn(towers1) do
				if IsExisting(towers1[i]) then
					ReplaceEntity(towers1[i], Entities.PB_DarkTower2)
				end
			end

			local towers2 = { Logic.GetPlayerEntities(5, Entities.PB_DarkTower2, 4, 0) }
			for i = 1, table.getn(towers2) do
				if IsExisting(towers2[i]) then
					ReplaceEntity(towers2[i], Entities.PB_DarkTower3)
				end
			end

			Logic.CreateEntity(Entities.XD_RockDarkEvelance7,21000,60300,0,0)
		else
			CreateRandomGoldChests()
			CreateRandomChests()
		end

		ReplaceEntity("vc_player", Entities.PB_VillageCenter1)
		ReplaceEntity("KI3_HQ", Entities.PB_Headquarters2)
		ReplaceEntity("start_1", Entities.PB_Headquarters1)

		local bosspos1 = GetPosition("KI3_SpawnPos")
		local bossID1 = AI.Entity_CreateFormation(7,Entities.CU_VeteranCaptain,0,0,(bosspos1.X - 600),(bosspos1.Y + 800),0,0,3,0)
		LookAt(bossID1, "RescueObject1")
		
		local bosspos2 = GetPosition("KI2_SpawnPos")
		local bossID2 = AI.Entity_CreateFormation(7,Entities.CU_VeteranCaptain,0,0,(bosspos2.X - 300),(bosspos2.Y + 0),0,0,3,0)
		LookAt(bossID2, "Banned_Info_NPC")
	end
		
	RaidersCreate({player = 7, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1", "rudelpos1_wp2"}, range = 3500, types = RaidersDefaultSets.Evelance, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	RaidersCreate({player = 7, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1"}, range = 3500, types = RaidersDefaultSets.Evelance, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	RaidersCreate({player = 7, pos = "rudelpos3", revier = {"rudelpos3", "rudelpos3_wp1"}, range = 3500, types = RaidersDefaultSets.Evelance, samount = (3 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	RaidersCreate({player = 7, pos = "rudelpos4", revier = {"rudelpos4", "rudelpos4_wp1"}, range = 4000, types = RaidersDefaultSets.Evelance, samount = (2 + CP_Difficulty), ramount = (7 + CP_Difficulty * 2)})

	RaidersCreate({player = 7, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBlackBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 7, pos = "bearpos2", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBlackBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})

	--CP_ActivateEvilMod(1, 1, 1)
--	EnableDebugging()

	--StartSimpleJob("GetMousePos")
	--Tools.ExploreArea(-1, -1, 900)
	--ResearchAllMilitaryTechs(1, true)
	--SetPosition ("Dario", GetPosition("RainNPC"))
end
