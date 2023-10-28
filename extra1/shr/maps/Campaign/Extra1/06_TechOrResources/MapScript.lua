Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0

IncludeGlobals("MapEditorTools")
IncludeLocals("army_tools")
IncludeLocals("army_assault")
IncludeLocals("army_defend")
IncludeLocals("army_friendly")
IncludeLocals("army_guard")
IncludeLocals("quest_victory")
IncludeLocals("quest_defeat")
IncludeLocals("quest_stones")
IncludeLocals("quest_priest")
IncludeLocals("briefing_prelude")
IncludeLocals("briefing_priest")
IncludeLocals("briefing_hiddenPath")
IncludeLocals("briefing_farmer")
IncludeLocals("gameControl")
IncludeLocals("player1")
IncludeLocals("player2")
IncludeLocals("player3")
IncludeLocals("player7")

------------------------------------------------------------------------------
function InitDiplomacy()

    --  player 2 = enemy, player 3 = friend

        SetHostile(1,2)
        SetFriendly(1,3)
        SetHostile(2,3)
        SetHostile(1,8)
        --SetHostile(3,8)

        SetHostile(1,7)
        SetHostile(3,7)

    --  neutral enemy

        SetNeutral(1,5)
        SetNeutral(2,5)

    --  player 4 = npcs

        SetNeutral(2,4)
        SetNeutral(1,4)

	end
------------------------------------------------------------------------------
function InitResources()
	GlobalMissionScripting.GiveResouces(1, 500, 500, 500, 500, 500, 500)
end
------------------------------------------------------------------------------
function InitTechnologies()
	if GDB.GetValue("Game\\Campaign_Difficulty") > 1 then
		local animalTech2 = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			animalTech2 = true
		end
		ResearchAnimalTechs(2, animalTech2)
		ResearchAnimalTechs(3, animalTech2)
		ResearchAnimalTechs(7, animalTech2)
		ResearchAnimalTechs(8, animalTech2)

		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(3)	--No enemy, but has to be useful
		ResearchAllMilitaryTechsAddOn(7)
		ResearchAllMilitaryTechsAddOn(8)
	end
    createPlayer1()
end
------------------------------------------------------------------------------
function InitWeatherGfxSets()
	SetupNormalWeatherGfxSet()
    end
------------------------------------------------------------------------------
function InitWeather()
	if GDB.GetValue("Game\\Campaign_Difficulty") < 2 then
	    AddPeriodicSummer(10)
    else
	    AddPeriodicSummer(600)
	    AddPeriodicRain(120)
    end
end
------------------------------------------------------------------------------
function InitPlayerColorMapping()
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if p1color ~= 9 then
		Display.SetPlayerColorMapping(2,EVIL_GOVERNOR_COLOR)
		Display.SetPlayerColorMapping(5,EVIL_GOVERNOR_COLOR)
		Display.SetPlayerColorMapping(7,EVIL_GOVERNOR_COLOR)
	else
		Display.SetPlayerColorMapping(2,1)
		Display.SetPlayerColorMapping(5,1)
		Display.SetPlayerColorMapping(7,1)
	end
	if p1color ~= 13 then
		Display.SetPlayerColorMapping(3, PAPAL_COLOR)
	end

    Display.SetPlayerColorMapping(4,NPC_COLOR)
    Display.SetPlayerColorMapping(6,NPC_COLOR)
    Display.SetPlayerColorMapping(8,ROBBERS_COLOR)
	
end
------------------------------------------------------------------------------

function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

--Input.KeyBindDown(Keys.ModifierControl + Keys.N, "BriefingMCButtonSelected(1)",15)
--Input.KeyBindDown(Keys.ModifierControl + Keys.M, "BriefingMCButtonSelected(2)",15)

	String.Init("CM02_06_TechOrResources")

	--Init Cutscenes
	Cutscenes[INTROCUTSCENE] 			= "INTRO"
	Cutscenes[MISSIONCOMPLETECUTSCENE] 	= "MISSIONCOMPLETE"

	IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
	IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])

    Logic.SetShareExplorationWithPlayerFlag(1, 3, 1)

    createPlayer3()
    createPlayer7()
	
	ScoutFoerster_gvScoutFoerster.GROWTH_LEVELS = table.getn(ScoutFoerster_SET_DarkTree)
	ScoutFoerster_gvScoutFoerster.treeSet = ScoutFoerster_SET_DarkTree

	LocalMusic.UseSet = EUROPEMUSIC

    createQuestDefeat()

    --EnableDebugging()
    --Game.GameTimeReset()
    
    beginChapterOne()

	if CP_Difficulty > 0 then
		local addWolves = 0
		local wolfSet = RaidersDefaultSets.Vanilla
		if CP_Difficulty == 2 then
			GUI.SetTaxLevel(1)
			
			addWolves = addWolves + 2
			wolfSet = RaidersDefaultSets.Europe
			
			ReplaceEntity("player1", Entities.PB_Headquarters1)

			local towers = { Logic.GetPlayerEntities(1, Entities.PB_Tower3, 5, 0) }
			for i = 1, table.getn(towers) do
				if IsExisting(towers[i]) then
					ReplaceEntity(towers[i], Entities.PB_Tower2)
				end
			end
			
			local bossID1 = AI.Entity_CreateFormation(7,Entities.PV_Cannon4,0,0,18500,56000,0,0,3,0)
			local bossID2 = AI.Entity_CreateFormation(7,Entities.PU_LeaderRifle2,0,0,18300,56300,0,0,3,0)
			local bossID3 = AI.Entity_CreateFormation(7,Entities.PU_LeaderRifle2,0,0,18400,55600,0,0,3,0)
			SetEntityName(Logic.CreateEntity(Entities.XD_ScriptEntity, 15500, 55000, 0, 8), "block2_lookpos")
			LookAt(bossID1, "block2_lookpos")
			LookAt(bossID2, "block2_lookpos")
			LookAt(bossID3, "block2_lookpos")

			local bossID4 = AI.Entity_CreateFormation(7,Entities.PV_Cannon3,0,0,13100,52700,0,0,3,0)
			local bossID5 = AI.Entity_CreateFormation(7,Entities.PU_LeaderRifle2,0,0,13000,52900,0,0,3,0)
			SetEntityName(Logic.CreateEntity(Entities.XD_ScriptEntity, 10100, 52000, 0, 8), "block1_lookpos")
			LookAt(bossID4, "block1_lookpos")
			LookAt(bossID5, "block1_lookpos")
		end

		local cannons1 = { Logic.GetPlayerEntities(7, Entities.PV_Cannon1, 5, 0) }
		for i = 1, table.getn(cannons1) do
            if IsExisting(cannons1[i]) then
			    ReplaceEntity(cannons1[i], Entities.PV_Cannon3)
            end
		end
		local cannons2 = { Logic.GetPlayerEntities(7, Entities.PV_Cannon2, 5, 0) }
		for i = 1, table.getn(cannons2) do
            if IsExisting(cannons2[i]) then
			    ReplaceEntity(cannons2[i], Entities.PV_Cannon3)
            end
		end
	end
		
	RaidersCreate({player = 8, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 3500, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	--RaidersCreate({player = 8, pos = "rudelpos2", revier = 2000, range = 3500, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	RaidersCreate({player = 8, pos = "rudelpos3", revier = {"rudelpos3", "rudelpos3_wp1", "rudelpos3_wp2", "rudelpos3_wp3"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (7 + CP_Difficulty * 2)})
		
	RaidersCreate({player = 8, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 8, pos = "bearpos2", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})

	gvGUI.BonusHeroId = GetEntityId("Yuki")

	--StartSimpleJob("GetMousePos")
    --Tools.ExploreArea(-1, -1, 900)
end
