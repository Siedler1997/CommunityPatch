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
	ForbidTechnology(Technologies.GT_Binocular)
	ForbidTechnology(Technologies.GT_Matchlock)
	ForbidTechnology(Technologies.GT_PulledBarrel)

	ForbidTechnology(Technologies.GT_Tactics)
	ForbidTechnology(Technologies.GT_Strategies)

	ForbidTechnology(Technologies.GT_ChainBlock)
	ForbidTechnology(Technologies.GT_Architecture)

	ForbidTechnology(Technologies.GT_Metallurgy)
	ForbidTechnology(Technologies.GT_Chemistry)

	ForbidTechnology(Technologies.GT_Printing)
	ForbidTechnology(Technologies.GT_Library)

	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(6)
	end
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
    Display.SetPlayerColorMapping(1,PLAYER_COLOR)
    Display.SetPlayerColorMapping(2,NEPHILIM_COLOR)
    Display.SetPlayerColorMapping(3,NPC_COLOR)
    Display.SetPlayerColorMapping(4,NPC_COLOR)
    Display.SetPlayerColorMapping(5,NPC_COLOR)
    Display.SetPlayerColorMapping(6,ROBBERS_COLOR)

	Display.SetPlayerColorMapping(8,PLAYER_COLOR)
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

    Logic.SetShareExplorationWithPlayerFlag(1, 4, 1)
    Logic.SetShareExplorationWithPlayerFlag(1, 3, 1)

    StartCutscene("PREINTRO",beginChapterOne)

    LocalMusic.UseSet = EUROPEMUSIC
	if CP_Difficulty == 1 then
        local vcpos = GetPosition("vc_empty")
        DestroyEntity("vc_empty")
        Logic.CreateEntity(Entities.XD_RuinMonastery2,vcpos.X,vcpos.Y,90,0)
    end
end
