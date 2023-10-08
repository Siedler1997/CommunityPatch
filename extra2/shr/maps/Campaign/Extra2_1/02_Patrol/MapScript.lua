Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0

IncludeLocals("gameControl")
IncludeLocals("player2")
IncludeLocals("player7")
IncludeLocals("army_tools")
IncludeLocals("army_defender")
IncludeLocals("army_patrol1")
IncludeLocals("army_patrol2")
IncludeLocals("army_ambush1")
IncludeLocals("army_ambush2")
IncludeLocals("army_replenishment")
IncludeLocals("alarmSystem")
IncludeLocals("army_alarm1")
IncludeLocals("army_alarm2")
IncludeLocals("army_alarm3")
IncludeLocals("briefing_prelude")
IncludeLocals("briefing_survivor")
IncludeLocals("briefing_survivor2")
IncludeLocals("briefing_scout")
IncludeLocals("briefing_scout2")
IncludeLocals("briefing_militia")
IncludeLocals("briefing_maverick")
IncludeLocals("quest_victory")
IncludeLocals("quest_defeat")

--Include cutscenes
Cutscenes = {}
Cutscenes[INTROCUTSCENE] = "INTRO"
Cutscenes[MISSIONCOMPLETECUTSCENE] = "MISSIONCOMPLETE"

IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])

------------------------------------------------------------------------------
function InitDiplomacy()
	SetHostile(1,2)
	SetHostile(1,5)
	SetFriendly(1,7)
	end
------------------------------------------------------------------------------
function InitResources()
	if CP_Difficulty == 0 then
		-- set some resources
		GlobalMissionScripting.GiveResouces(1, 1000, 1000, 1000, 1000, 1000, 1000)
	else
		-- set some resources
		GlobalMissionScripting.GiveResouces(1, 500, 500, 500, 500, 500, 500)
	end
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
		ResearchAllMilitaryTechsAddOn(2)
	end
end
------------------------------------------------------------------------------
function InitWeatherGfxSets()
	SetupNormalWeatherGfxSet()
    end
------------------------------------------------------------------------------
function InitWeather()
	AddPeriodicSummer(960)
	AddPeriodicRain(60)
	AddPeriodicSummer(240)
	AddPeriodicRain(30)
	AddPeriodicSummer(480)
	AddPeriodicRain(120)
    end

------------------------------------------------------------------------------
function InitPlayerColorMapping()
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if p1color ~= 5 then
		Display.SetPlayerColorMapping(2,BARBARIAN_COLOR)
	else
		Display.SetPlayerColorMapping(2,6)
	end
	Display.SetPlayerColorMapping(3, p1color)
	--Display.SetPlayerColorMapping(3,PLAYER_COLOR)
	Display.SetPlayerColorMapping(4,3)
	Display.SetPlayerColorMapping(5,ROBBERS_COLOR)
	Display.SetPlayerColorMapping(7,ARIS_ROBBERS)
end

------------------------------------------------------------------------------
function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	-- debugging stuff
	--EnableDebugging()
    	--Game.GameTimeReset()
	
	-- Text Tool String
	String.Init("CM03_02_Patrol")

	LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
	LocalMusic.UseSet = EUROPEMUSIC

	createPlayer2()
	createPlayer7()
	
	beginChapterOne()
	
	if CP_Difficulty > 0 then
		if CP_Difficulty == 2 then
			GUI.SetTaxLevel(1)
		end

		local bosspos1 = GetPosition("armyDefender")
		local bossID1 = AI.Entity_CreateFormation(2,Entities.CU_VeteranLieutenant,0,0,(bosspos1.X + 0),(bosspos1.Y - 0),0,0,3,0)
		LookAt(bossID1, "vc_empty")
		
		local bosspos2 = GetPosition("armyPatrol1")
		local bossID2 = AI.Entity_CreateFormation(2,Entities.CU_VeteranLieutenant,0,0,(bosspos2.X + 0),(bosspos2.Y - 0),0,0,3,0)
		LookAt(bossID2, bossID1)
		
		local bosspos3 = GetPosition("armyPatrol2")
		local bossID3 = AI.Entity_CreateFormation(2,Entities.CU_VeteranLieutenant,0,0,(bosspos3.X + 0),(bosspos3.Y - 0),0,0,3,0)
		LookAt(bossID3, bossID1)

		local towers1 = { Logic.GetPlayerEntities(2, Entities.PB_DarkTower2, 5, 0) }
		for i = 2, table.getn(towers1) do
			if IsExisting(towers1[i]) then
				ReplaceEntity(towers1[i], Entities.PB_DarkTower3)
			end
		end
        --DestroyEntity("vc_empty")
	end

	RaidersCreate({player = 5, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	RaidersCreate({player = 5, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})

	--Tools.ExploreArea(-1, -1, 900)
	--StartSimpleJob("GetMousePos")
end

------------------------------------------------------------------------------
