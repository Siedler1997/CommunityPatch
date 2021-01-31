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
	SetFriendly(1,7)
	end
------------------------------------------------------------------------------
function InitResources()
    -- set some resources
    AddStone(1000)
    AddClay(1000)
    AddGold(1000)
    AddSulfur(1000)
    AddIron(1000)
    AddWood(1000)
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
	AddPeriodicSummer(960)
	AddPeriodicRain(60)
	AddPeriodicSummer(240)
	AddPeriodicRain(30)
	AddPeriodicSummer(480)
	AddPeriodicRain(120)
    end

------------------------------------------------------------------------------
function InitPlayerColorMapping()
	Display.SetPlayerColorMapping(3,PLAYER_COLOR)
	Display.SetPlayerColorMapping(7,FRIENDLY_COLOR1)
end

------------------------------------------------------------------------------
function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	-- debugging stuff
	--EnableDebugging()
    	--Game.GameTimeReset()
	
	-- Text Tool String
	String.Init("CM03_02_Patrol")

	LocalMusic.UseSet = EUROPEMUSIC

	createPlayer2()
	createPlayer7()
	beginChapterOne()
	
	if CP_Difficulty == 1 then
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
        DestroyEntity("vc_empty")
	end

	--Tools.ExploreArea(-1, -1, 900)
end

------------------------------------------------------------------------------
