Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0
TIMER_WINTER = 10 * 60

IncludeLocals("gameControl")
IncludeLocals("player2")
IncludeLocals("player5")
IncludeLocals("army_tools")
IncludeLocals("army_barbarianAttack")
IncludeLocals("army_wolvesAttack")
IncludeLocals("army_outpost")
IncludeLocals("army_wolves")
IncludeLocals("army_vargWolves")
IncludeLocals("briefing_prelude")
IncludeLocals("briefing_shepherd")
IncludeLocals("briefing_winter")
IncludeLocals("briefing_winterEnd")
IncludeLocals("briefing_miner")
IncludeLocals("briefing_wolves")
IncludeLocals("briefing_wolvesEnd")
IncludeLocals("briefing_leonardo")
IncludeLocals("briefing_farmer")
IncludeLocals("briefing_varg")
IncludeLocals("briefing_vargWolves")
IncludeLocals("quest_winter")
IncludeLocals("quest_rescueSheep")
IncludeLocals("quest_wolves")
IncludeLocals("quest_varg")
IncludeLocals("quest_vargWolves")
IncludeLocals("quest_victory")
IncludeLocals("weather")

--Include cutscenes
Cutscenes = {}
Cutscenes[INTROCUTSCENE] = "INTRO"
Cutscenes[MISSIONCOMPLETECUTSCENE] = "MISSIONCOMPLETE"

IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])

------------------------------------------------------------------------------
function InitDiplomacy()
	SetHostile(1,2)
	SetHostile(2,3)
	SetFriendly(1,3)
	SetNeutral(1,5)
	end
------------------------------------------------------------------------------
function InitResources()
    -- set some resources
	if GDB.GetValue("Game\\Campaign_Difficulty") == 0 then
		AddStone(1000)
		AddClay(1000)
		AddGold(1000)
		AddSulfur(1000)
		AddIron(1000)
		AddWood(1000)
	else
		AddStone(500)
		AddClay(500)
		AddGold(500)
		AddSulfur(500)
		AddIron(500)
		AddWood(500)
	end
    end
------------------------------------------------------------------------------
function InitTechnologies()
	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
		ResearchAllMilitaryTechsAddOn(2)
	end
end
------------------------------------------------------------------------------
function InitWeatherGfxSets()
	SetupHighlandWeatherGfxSet()
    end
------------------------------------------------------------------------------
function InitWeather()
	AddPeriodicSummer(10)
    end

------------------------------------------------------------------------------
function InitPlayerColorMapping()
	Display.SetPlayerColorMapping(5,FRIENDLY_COLOR1)
end

------------------------------------------------------------------------------
function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

    -- debugging stuff
	-- EnableDebugging()
	--Game.GameTimeReset()
	
	-- Text Tool String
	String.Init("CM03_04_WolfsLair")

	LocalMusic.UseSet = HIGHLANDMUSIC
	
	createPlayer2()
	createPlayer5()
	startChapterOne()

	if CP_Difficulty == 1 then
		TIMER_WINTER = TIMER_WINTER - 60 * 2
        local vcpos = GetPosition("vc_empty")
        DestroyEntity("vc_empty")
        Logic.CreateEntity(Entities.XD_RuinMonastery2,vcpos.X,vcpos.Y,90,0)
	end
	
	--Tools.ExploreArea(-1, -1, 900)
end