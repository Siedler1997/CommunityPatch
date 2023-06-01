Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0

IncludeLocals("gameControl")
IncludeLocals("player2")
IncludeLocals("player3")
IncludeLocals("player4")
IncludeLocals("player5")
IncludeLocals("player6")
IncludeLocals("army_tools")
IncludeLocals("army_blockade")
IncludeLocals("army_outpost")
IncludeLocals("army_wolves")
IncludeLocals("army_ambush")
IncludeLocals("army_barbarianAttack")
IncludeLocals("briefing_prelude")
IncludeLocals("briefing_shepherd")
IncludeLocals("briefing_governor")
IncludeLocals("briefing_scout")
IncludeLocals("briefing_commandant")
IncludeLocals("briefing_guard")
IncludeLocals("quest_rescueSheep")
IncludeLocals("quest_meetCommandant")
IncludeLocals("quest_defeat")
IncludeLocals("quest_heroesAlive")
IncludeLocals("alarmSystem")

--Include cutscenes
Cutscenes = {}
Cutscenes[INTROCUTSCENE] = "INTRO"
Cutscenes[MISSIONCOMPLETECUTSCENE] = "MISSIONCOMPLETE"

IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])

------------------------------------------------------------------------------
function InitDiplomacy()
	SetHostile(1,2)
	SetHostile(1,6)
	SetHostile(1,7)
	SetHostile(2,3)
	SetHostile(3,6)
	SetHostile(3,7)
	SetFriendly(1,3)
	SetFriendly(1,4)
	SetFriendly(1,5)
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
	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		local animalTech2 = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			animalTech2 = true
		end
		
		ResearchAnimalTechs(2, animalTech2)
		ResearchAnimalTechs(6, animalTech2)
		ResearchAnimalTechs(7, animalTech2)
		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(6)
		ResearchAllMilitaryTechsAddOn(7)
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
	Display.SetPlayerColorMapping(2,BARBARIAN_COLOR)
	--Display.SetPlayerColorMapping(3,ENEMY_COLOR2)
	Display.SetPlayerColorMapping(4,ENEMY_COLOR2)
	Display.SetPlayerColorMapping(5,EVIL_GOVERNOR_COLOR)
	Display.SetPlayerColorMapping(6,ROBBERS_COLOR)
	Display.SetPlayerColorMapping(7,ROBBERS_COLOR)

	if CP_Difficulty < 2 then
		Display.SetPlayerColorMapping(1, PLAYER_COLOR)
	else
		Display.SetPlayerColorMapping(1, NEPHILIM_COLOR)
	end
end

------------------------------------------------------------------------------
function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")



    -- debugging stuff
	--EnableDebugging()
	--Game.GameTimeReset()
	
--	StartCutscene(Cutscenes[INTROCUTSCENE],Cutscenes[MISSIONCOMPLETECUTSCENE])
	
--	CreateEntity(1, Entities.PU_Hero10, GetPosition("CUTSCENE_INTRO_D1"), "Drake" )
--	CreateEntity(1, Entities.PU_Hero11, GetPosition("CUTSCENE_INTRO_Y1"), "Yuki" )   
	
	-- Text Tool String
	String.Init("CM03_01_NewBeginning")
	
	LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
	LocalMusic.UseSet = EUROPEMUSIC

	createPlayer2()
	createPlayer3()
	createPlayer4()
	createPlayer5()
	createPlayer6()
	startChapterOne()
	
	if CP_Difficulty > 0 then
		if CP_Difficulty == 2 then
			Display.SetPlayerColorMapping(1, NEPHILIM_COLOR)

			GUI.SetTaxLevel(1)
		end

		local towers1 = { Logic.GetPlayerEntities(2, Entities.PB_DarkTower2, 48, 0) }
		for i = 2, table.getn(towers1) do
			if IsExisting(towers1[i]) then
				ReplaceEntity(towers1[i], Entities.PB_DarkTower3)
			end
		end
		DestroyEntity("p4_extratower")
        local towerpos = GetPosition("p4_watchtower")
        --local vcpos = GetPosition("vc_empty")
		DestroyEntity("p4_watchtower")

        --DestroyEntity("vc_empty")
        --Logic.CreateEntity(Entities.XD_RuinMonastery2,vcpos.X,vcpos.Y,90,0)
        Logic.CreateEntity(Entities.XD_RuinSmallTower2,towerpos.X,towerpos.Y,0,0)
        
		local bosspos1 = GetPosition("armySpawn")
		local bossID1 = AI.Entity_CreateFormation(2,Entities.CU_VeteranLieutenant,0,0,(bosspos1.X + 0),(bosspos1.Y - 300),0,0,3,0)
		LookAt(bossID1, "Drake")
		local bosspos2 = GetPosition("armyOutpost")
		local bossID2 = AI.Entity_CreateFormation(2,Entities.CU_VeteranLieutenant,0,0,(bosspos2.X + 100),(bosspos2.Y + 500),0,0,3,0)
		--LookAt(bossID2, "Drake")
	end

	RaidersCreate({player = 7, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 7, pos = "bearpos2", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 7, pos = "bearpos3", revier = 1000, range = 3500, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	
	--StartSimpleJob("GetMousePos")
	--Tools.ExploreArea(-1, -1, 900)
end