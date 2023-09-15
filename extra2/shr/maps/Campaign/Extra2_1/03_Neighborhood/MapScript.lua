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
	SetHostile(1,3)
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
	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		local animalTech2 = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			animalTech2 = true
		end
		
		ResearchAnimalTechs(2, animalTech2)
		ResearchAnimalTechs(3, animalTech2)
		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(3)
	end
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
	Display.SetPlayerColorMapping(2,BARBARIAN_COLOR)
	Display.SetPlayerColorMapping(3, ROBBERS_COLOR)
	Display.SetPlayerColorMapping(5,FRIENDLY_COLOR2)
	Display.SetPlayerColorMapping(7,ARIS_ROBBERS)
	
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if p1color ~= 3 then
		Display.SetPlayerColorMapping(5, 3)		
	else
		Display.SetPlayerColorMapping(5, 1)		
	end
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
	
	LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
	LocalMusic.UseSet = DARKMOORMUSIC
	
	createPlayer2()
	createPlayer4()
	createPlayer5()
	createPlayer6()
	createPlayer7()

	startChapterOne()
	
	-- Increase support timer
	if CP_Difficulty > 0 then
		if CP_Difficulty == 2 then
			GUI.SetTaxLevel(1)
			timeForSupport = timeForSupport + 60 * 15
		end

		local bosspos1 = GetPosition("armyOutpost")
		local bossID1 = AI.Entity_CreateFormation(2,Entities.CU_VeteranLieutenant,0,0,(bosspos1.X + 0),(bosspos1.Y - 0),0,0,3,0)
		LookAt(bossID1, "supportNogersund")
	end
	
	RaidersCreate({player = 3, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1", "rudelpos1_wp2"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (8 + CP_Difficulty * 2)})

	--Tools.ExploreArea(-1, -1, 900)
	--StartSimpleJob("GetMousePos")
end