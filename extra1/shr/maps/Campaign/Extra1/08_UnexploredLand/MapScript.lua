Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0

------------------------------------------------------------------------------
function InitDiplomacy()
    -- diplomacy
    SetHostile(1,2)
    SetHostile(1,7)
    SetHostile(8,2)
    SetHostile(8,7)
end
------------------------------------------------------------------------------
function InitResources()
    -- set some resources
    AddStone(0)
    AddClay(0)
    AddGold(0)
    AddSulfur(0)
    AddIron(0)
    AddWood(0)
    end
------------------------------------------------------------------------------
function InitTechnologies()
	if GDB.GetValue("Game\\Campaign_Difficulty") > 1 then
		_ResearchSuperTech = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			_ResearchSuperTech = true
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			--ForbidTechnology(Technologies.UP2_Village)
		end

		ResearchAllMilitaryTechsAddOn(2, _ResearchSuperTech)
		ResearchAllMilitaryTechsAddOn(7, _ResearchSuperTech)
		ResearchAllMilitaryTechsAddOn(8, _ResearchSuperTech)
	end
end
------------------------------------------------------------------------------
function InitWeatherGfxSets()
	SetupMoorWeatherGfxSet()
    end
------------------------------------------------------------------------------
function InitWeather()
	AddPeriodicWinter(300)
	AddPeriodicSummer(800)
	AddPeriodicWinter(200)
	
	StartWinter(10000000)
end
------------------------------------------------------------------------------
function InitPlayerColorMapping()

	Display.SetPlayerColorMapping(5,FRIENDLY_COLOR1)
	Display.SetPlayerColorMapping(8,FRIENDLY_COLOR1)
	Display.SetPlayerColorMapping(3,NPC_COLOR)
	Display.SetPlayerColorMapping(7,ROBBERS_COLOR)
	
	if CP_Difficulty < 2 then
		Display.SetPlayerColorMapping(1,PLAYER_COLOR)
		Display.SetPlayerColorMapping(2,NEPHILIM_COLOR)
		Display.SetPlayerColorMapping(4,NEPHILIM_COLOR)
	else
		Display.SetPlayerColorMapping(1,NEPHILIM_COLOR)
		Display.SetPlayerColorMapping(2,ENEMY_COLOR1)
		Display.SetPlayerColorMapping(4,ENEMY_COLOR1)
	end
end

------------------------------------------------------------------------------
function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	-- load scripts
	IncludeLocals("army_bridges")
	IncludeLocals("army_DestroyHQ")
	IncludeLocals("army_nephilimsHQ")
	IncludeLocals("army_p8Defense")
	IncludeLocals("army_player")
	IncludeLocals("army_tribalCamps")
	IncludeLocals("army_robbers")

	IncludeLocals("briefing_bridges")
	IncludeLocals("briefing_cleanUpRuins")
	IncludeLocals("briefing_prelude")

	IncludeLocals("gameControl")

	IncludeLocals("npc_gate1")
	IncludeLocals("npc_gate2")
	IncludeLocals("npc_hq1")
	IncludeLocals("npc_hq2")
	IncludeLocals("npc_hq3")

	IncludeLocals("player_2")
	IncludeLocals("player_7")
	IncludeLocals("player_8")

	IncludeLocals("quest_bridges")
	IncludeLocals("quest_cleanUpRuins")
	IncludeLocals("quest_defeat")
	IncludeLocals("quest_gatekey1")
	IncludeLocals("quest_gatekey2")

	--Init String tables
	String.Init("CM02_08_UnexploredLand")
	
    -- debugging stuff

    --EnableDebugging()
    
   
	-- String
	String.Init("CM02_08_UnexploredLand")
	
	Cutscenes 							= {}
	Cutscenes[INTROCUTSCENE] 			= "INTRO"	
	Cutscenes[THRESHOLDONECUTSCENE] 	= "ATTACKSOLDIER"
	Cutscenes[MISSIONCOMPLETECUTSCENE] 	= "MISSIONCOMPLETE"

				
	IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
	IncludeLocals("Cutscene_" .. Cutscenes[THRESHOLDONECUTSCENE])
	IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])

    
    LocalMusic.UseSet = DARKMOORMUSIC

	-- start
	StartCutscene(Cutscenes[INTROCUTSCENE],start1stChapter)
	
	if CP_Difficulty > 0 then
		--local addWolves = 0
		if CP_Difficulty == 2 then
			Display.SetPlayerColorMapping(1,NEPHILIM_COLOR)
			Display.SetPlayerColorMapping(2,ENEMY_COLOR1)
			Display.SetPlayerColorMapping(4,ENEMY_COLOR1)

			GUI.SetTaxLevel(1)
			
			--addWolves = addWolves + 2
		end

		SetEntityName(Logic.CreateEntity(Entities.CB_Bastille1, 23500, 14000, 90, 7), "RobberyTower1");
		SetEntityName(Logic.CreateEntity(Entities.CB_Bastille1, 46200, 65700, 270, 7), "RobberyTower2");
		
		SetEntityName(Logic.CreateEntity(Entities.XD_ScriptEntity, 24100, 13900, 90, 7), "RobbersSpawnPos1");
		SetEntityName(Logic.CreateEntity(Entities.XD_ScriptEntity, 45600, 65800, 270, 7), "RobbersSpawnPos2");
		
		Logic.CreateEntity(Entities.XD_LargeCampFire, 24400, 14000, 0, 7);
		Logic.CreateEntity(Entities.XD_LargeCampFire, 45300, 65800, 180, 7);

		local bossID1 = AI.Entity_CreateFormation(7,Entities.CU_LeaderOutlaw1,0,0,45500,65900,0,0,3,0)
		LookAt(bossID1, "ArmyMovePos0")
		local bossID2 = AI.Entity_CreateFormation(7,Entities.CU_LeaderOutlaw1,0,0,24200,14000,0,0,3,0)
		LookAt(bossID2, "NPCHQ3")
	end

	--StartSimpleHiResJob("GetDarioPos")
	--Tools.ExploreArea(-1, -1, 900)
end

--[[
function GetDarioPos()
	local pos = GetPosition("Dario")
	Message("X: " .. pos.X .. "   Y: " .. pos.Y)
end
--]]