Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0
timeForSupport = 60 * 45

IncludeLocals("gameControl")
IncludeLocals("player2")
IncludeLocals("player4")
IncludeLocals("player5")
IncludeLocals("player6")
IncludeLocals("player7")
IncludeLocals("army_tools")
IncludeLocals("army_attack1")
IncludeLocals("army_lighthouse")
IncludeLocals("army_wolves")
IncludeLocals("army_outpost")
IncludeLocals("army_barbarianAttack")
IncludeLocals("quest_reachLighthouse")
IncludeLocals("quest_defendLighthouse")
IncludeLocals("quest_survive")
IncludeLocals("quest_reconquerVillage")
IncludeLocals("quest_victory")
IncludeLocals("briefing_prelude")
IncludeLocals("briefing_coward")
IncludeLocals("briefing_lighthouse")
IncludeLocals("briefing_alarm")
IncludeLocals("briefing_support")
IncludeLocals("briefing_reconquer")

--Include cutscenes
Cutscenes = {}
Cutscenes[INTROCUTSCENE] = "INTRO"
Cutscenes[MISSIONCOMPLETECUTSCENE] = "MISSIONCOMPLETE"

IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])

------------------------------------------------------------------------------
function InitDiplomacy()
	SetHostile(1,2)
	SetHostile(2,4)
	SetHostile(2,5)
	SetHostile(2,6)
	SetHostile(2,7)
	SetFriendly(1,4)
	SetFriendly(1,5)
	SetFriendly(1,6)
	SetFriendly(1,7)
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
	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
		ResearchAllMilitaryTechsAddOn(2)
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
end

------------------------------------------------------------------------------
function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

    	--debugging stuff
	--EnableDebugging()
	--Game.GameTimeReset()
	
--	StartCutscene(Cutscenes[INTROCUTSCENE],Cutscenes[MISSIONCOMPLETECUTSCENE])
	
	-- Text Tool String
	String.Init("CM03_03_Neighborhood")

	LocalMusic.UseSet = DARKMOORMUSIC
	
	createPlayer2()
	createPlayer4()
	createPlayer5()
	createPlayer6()
	createPlayer7()
	startChapterOne()
	
	-- Increase support timer
	if CP_Difficulty > 0 then
		timeForSupport = timeForSupport + 60 * 15

		local bosspos1 = GetPosition("armyOutpost")
		local bossID1 = AI.Entity_CreateFormation(2,Entities.CU_VeteranLieutenant,0,0,(bosspos1.X + 0),(bosspos1.Y - 0),0,0,3,0)
		LookAt(bossID1, "supportNogersund")
	end

	--Tools.ExploreArea(-1, -1, 900)
end