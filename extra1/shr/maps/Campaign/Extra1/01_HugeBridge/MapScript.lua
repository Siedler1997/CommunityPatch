Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0

IncludeLocals("army_tools")
IncludeLocals("army_bridge")
IncludeLocals("army_defenders")
IncludeLocals("army_stone")
IncludeLocals("quest_bridge")
IncludeLocals("quest_ruinDefenders")
IncludeLocals("quest_destroyRuins")
IncludeLocals("quest_survive")
IncludeLocals("quest_defeat")
IncludeLocals("quest_stoneArmyDead")
IncludeLocals("quest_thief")
IncludeLocals("briefing_prelude")
IncludeLocals("briefing_builder0")
IncludeLocals("briefing_builder1")
IncludeLocals("briefing_builder2")
IncludeLocals("briefing_pilgrim")
IncludeLocals("briefing_survive")
IncludeLocals("briefing_thief")
IncludeLocals("gameControl")
IncludeLocals("player1")
IncludeLocals("player2")
IncludeLocals("player6")



Cutscenes = {}
Cutscenes[INTROCUTSCENE] = "INTRO"
Cutscenes[THRESHOLDONECUTSCENE] = "ARMYBRIDGEDESTROYED"
Cutscenes[THRESHOLTWOCUTSCENE] = "BRIDGEBUILD"
Cutscenes[MISSIONCOMPLETECUTSCENE] = "MISSIONCOMPLETE"


IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[THRESHOLDONECUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[THRESHOLTWOCUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])
IncludeLocals("Cutscene_PREINTRO")


------------------------------------------------------------------------------
function InitDiplomacy()
    SetHostile(1,2)
    SetNeutral(1,5)
    SetHostile(1,6)

end
------------------------------------------------------------------------------
function InitResources()
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
		ResearchAnimalTechs(6, animalTech2)

		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(6)
	end
	createPlayer1()
end
------------------------------------------------------------------------------
function InitWeatherGfxSets()
	SetupNormalWeatherGfxSet()
    end
------------------------------------------------------------------------------
function InitWeather()
	AddPeriodicSummer(10)
    end
------------------------------------------------------------------------------
function InitPlayerColorMapping()
    --Display.SetPlayerColorMapping(3,NPC_COLOR)
    Display.SetPlayerColorMapping(4,NPC_COLOR)
    --Display.SetPlayerColorMapping(5,NPC_COLOR)
    Display.SetPlayerColorMapping(6,ROBBERS_COLOR)
	
	if CP_Difficulty < 2 then
		Display.SetPlayerColorMapping(1, PLAYER_COLOR)
		Display.SetPlayerColorMapping(3, PLAYER_COLOR)
		Display.SetPlayerColorMapping(5, PLAYER_COLOR)
		Display.SetPlayerColorMapping(2, NEPHILIM_COLOR)
		Display.SetPlayerColorMapping(8, PLAYER_COLOR)
	else
		Display.SetPlayerColorMapping(1, NEPHILIM_COLOR)
		Display.SetPlayerColorMapping(3, NEPHILIM_COLOR)
		Display.SetPlayerColorMapping(5, NEPHILIM_COLOR)
		Display.SetPlayerColorMapping(8, NEPHILIM_COLOR)
        Display.SetPlayerColorMapping(2, ENEMY_COLOR1)
	end
end
------------------------------------------------------------------------------
function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

    --EnableDebugging()
    --Game.GameTimeReset()


    --SpeedUpGame()
  --  SpeedUpGame()
--    SpeedUpGame()
    -- String
	String.Init("CM02_01_HugeBridge")

    createPlayer2()
    createPlayer6()

    --Logic.SetShareExplorationWithPlayerFlag(1, 4, 1)
    Logic.SetShareExplorationWithPlayerFlag(1, 3, 1)

    StartCutscene("PREINTRO",beginChapterOne)

    LocalMusic.UseSet = EUROPEMUSIC
	if CP_Difficulty > 0 then
		local addWolves = 0
		local wolfSet = RaidersDefaultSets.Vanilla
		if CP_Difficulty == 2 then
			Display.SetPlayerColorMapping(1, NEPHILIM_COLOR)
			Display.SetPlayerColorMapping(3, NEPHILIM_COLOR)
			Display.SetPlayerColorMapping(5, NEPHILIM_COLOR)
			Display.SetPlayerColorMapping(8, NEPHILIM_COLOR)
			Display.SetPlayerColorMapping(2, ENEMY_COLOR1)
			GUI.SetTaxLevel(1)
			
			addWolves = addWolves + 2

			wolfSet = RaidersDefaultSets.Europe
		end
		--[[
        local vcpos = GetPosition("vc_empty")
        DestroyEntity("vc_empty")
        Logic.CreateEntity(Entities.XD_RuinMonastery2,vcpos.X,vcpos.Y,90,0)
        --]]
		local bosspos1 = GetPosition("army5")
		local bossID1 = AI.Entity_CreateFormation(6,Entities.CU_VeteranCaptain,0,0,(bosspos1.X + 900),(bosspos1.Y + 50),0,0,3,0)
		--LookAt(bossID1, "dario")
    end

	RaidersCreate({player = 6, pos = "rudelpos1", revier = 2500, range = 3500, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	RaidersCreate({player = 6, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1"}, range = 3500, types = RaidersDefaultSets.Europe, samount = (3 + CP_Difficulty), ramount = (7 + CP_Difficulty * 2)})
	
	RaidersCreate({player = 6, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 6, pos = "bearpos2", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})

    --Tools.ExploreArea(-1, -1, 900)
	--StartSimpleJob("GetMousePos")
end
