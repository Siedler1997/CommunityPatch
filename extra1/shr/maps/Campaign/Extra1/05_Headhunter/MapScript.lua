Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0

IncludeLocals("gameControl")
IncludeLocals("briefing_prelude")
IncludeLocals("briefing_crossroads")
IncludeLocals("briefing_lab")
IncludeLocals("briefing_openBridge")
IncludeLocals("briefing_victory")
IncludeLocals("briefing_helias")
IncludeLocals("briefing_keyKeeper")
IncludeLocals("briefing_gateKeeper")
IncludeLocals("briefing_openGate")
IncludeLocals("briefing_guards")
IncludeLocals("briefing_fortifyVillageDone")
IncludeLocals("quest_openGate")
IncludeLocals("army_tools")
IncludeLocals("army_villageAttacker")
IncludeLocals("briefing_fortifyVillageResolved")
IncludeLocals("quest_helias")
IncludeLocals("quest_weather")
IncludeLocals("quest_fortifyVillage")
IncludeLocals("quest_destroyCamp")
IncludeLocals("quest_defeat")
IncludeLocals("quest_helias")
IncludeLocals("quest_rescueGateKeeper")
IncludeLocals("army_wayDefenders")
IncludeLocals("player2")


Cutscenes = {}
Cutscenes[INTROCUTSCENE] = "INTRO"
Cutscenes[MISSIONCOMPLETECUTSCENE] = "MISSIONCOMPLETE"

IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])
------------------------------------------------------------------------------
function InitDiplomacy()
    SetHostile(1,2)

	end
------------------------------------------------------------------------------
function InitResources()
    -- set some resources
    AddStone(500)
    AddClay(500)
    AddGold(1000)
    AddSulfur(500)
    AddIron(200)
    AddWood(1000)
    end
------------------------------------------------------------------------------
function InitTechnologies()
	ForbidTechnology(Technologies.GT_Matchlock)
	ForbidTechnology(Technologies.GT_PulledBarrel)

	ResearchTechnology(Technologies.GT_Construction)

	ResearchTechnology(Technologies.GT_Literacy)

	ResearchTechnology(Technologies.GT_Mathematics)
	ResearchTechnology(Technologies.GT_Binocular)

	ResearchTechnology(Technologies.GT_Mercenaries)
	ResearchTechnology(Technologies.GT_Alchemy)

	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
		ResearchAllMilitaryTechsAddOn(2)
	    ForbidTechnology(Technologies.GT_Chemistry)
	end
end
------------------------------------------------------------------------------
function InitWeatherGfxSets()
	SetupEvelanceWeatherGfxSet()
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
    Display.SetPlayerColorMapping(6,FRIENDLY_COLOR1)

end
------------------------------------------------------------------------------
function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	--EnableDebugging()
	--Game.GameTimeReset()

	String.Init("CM02_05_Headhunter")

    CreateRandomGoldChests()
    CreateChestOpener("Dario")
    CreateChestOpener("Pilgrim")
    CreateChestOpener("Ari")
    CreateChestOpener("Helias")
    CreateChestOpener("Salim")
    CreateChestOpener("Yuki")
    StartChestQuest()

    createPlayer2()

	SetPlayerName(6, String.Key("_Player6Name"))
	-- SetPlayerName(6, "Freundliche Stadt")

		LocalMusic.UseSet = EVELANCEMUSIC

    beginChapterOne()

end
