Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0

--Include cutscenes
Cutscenes = {}
Cutscenes[INTROCUTSCENE] = "INTRO"
Cutscenes[MISSIONCOMPLETECUTSCENE] = "MISSIONCOMPLETE"

IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])
IncludeLocals("army_tools")
IncludeLocals("GameControl")
IncludeLocals("briefing_intro")
IncludeLocals("army_player")
IncludeLocals("armies_start")
IncludeLocals("npc_dario")
IncludeLocals("quest_chapter1")
IncludeLocals("quest_chapter2")
IncludeLocals("quest_chapter3")
IncludeLocals("quest_chapter4")
IncludeLocals("player_2")
IncludeLocals("player_4")


------------------------------------------------------------------------------
function InitDiplomacy()
	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 2, 4, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 8, Diplomacy.Hostile )
end
------------------------------------------------------------------------------
function InitResources()
    -- set some resources
	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		GlobalMissionScripting.GiveResouces(1, 1000, 800, 800, 600, 400, 300)
	else
		GlobalMissionScripting.GiveResouces(1, 1000, 1000, 1000, 1000, 1000, 1000)
	end
end
------------------------------------------------------------------------------
function InitTechnologies()
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Weathermachine, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_PowerPlant, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_WeatherForecast, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_ChangeWeather, 0)

	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		local animalTech2 = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			animalTech2 = true
		end
		
		ResearchAnimalTechs(2, animalTech2)
		ResearchAnimalTechs(3, animalTech2)
		ResearchAnimalTechs(4, animalTech2)
		ResearchAnimalTechs(5, animalTech2)
		ResearchAnimalTechs(6, animalTech2)
		ResearchAnimalTechs(7, animalTech2)
		ResearchAnimalTechs(8, animalTech2)
		
		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(3)
		ResearchAllMilitaryTechsAddOn(4, animalTech2)
		ResearchAllMilitaryTechsAddOn(5)
		ResearchAllMilitaryTechsAddOn(6)
		ResearchAllMilitaryTechsAddOn(7)
		ResearchAllMilitaryTechsAddOn(8)
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
	Display.SetPlayerColorMapping(2, BARBARIAN_COLOR)
	Display.SetPlayerColorMapping(3, ARIS_ROBBERS)
	--Display.SetPlayerColorMapping(4, FRIENDLY_COLOR2)
	Display.SetPlayerColorMapping(5, 15)
	Display.SetPlayerColorMapping(7, 16)
	Display.SetPlayerColorMapping(8, ROBBERS_COLOR)

	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if p1color ~= 3 then
		Display.SetPlayerColorMapping(4, FRIENDLY_COLOR2)
	else
		Display.SetPlayerColorMapping(4, PAPAL_COLOR)
	end
end

------------------------------------------------------------------------------
function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	StartSimpleJob("DefeatCond")
	mines1free = 0
	first = 0 
	String.Init("CM06_04_TaintedLight")
	-- load scripts
	-- IncludeLocals("gameControl")
	CreateChestOpener("Dario")

	StartChestQuest()

	createPlayer4()
	
	StartCutscene(Cutscenes[INTROCUTSCENE],Start1stChapter)

	--createBriefingPrelude()
	-- debugging stuff
	--EnableDebugging()
	--Game.GameTimeReset()
	
	LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
	LocalMusic.UseSet = EUROPEMUSIC

	-- Start1stChapter()


	--SetPlayerName(2, "Barbaren Armee")
	SetPlayerName(2, String.Key("_Player2Name"))
	--SetPlayerName(3, "Krynn Landarbeiter")
	SetPlayerName(3, String.Key("_Player3Name"))
	SetPlayerName(4, String.Key("_Player4Name"))
	--SetPlayerName(6, "Krynn Hauptquartier")
	SetPlayerName(6, String.Key("_Player6Name"))
	
	if CP_Difficulty > 0 then
		if CP_Difficulty == 2 then
			GUI.SetTaxLevel(1)
		else
			CreateRandomChests()
		end

		local towers3 = { Logic.GetPlayerEntities(2, Entities.PB_DarkTower2, 5, 0) }
		for i = 2, table.getn(towers3) do
			if IsExisting(towers3[i]) then
				ReplaceEntity(towers3[i], Entities.PB_DarkTower3)
			end
		end
		
		local vcpos = GetPosition("vc_empty")
		DestroyEntity("vc_empty")
		local ruinVC = Logic.CreateEntity(Entities.CB_DestroyAbleRuinMonastery1,vcpos.X,vcpos.Y,0,8)
		Logic.SetModelAndAnimSet(ruinVC,Models.XD_RuinMonastery2)
		
		ReplaceEntity("p1_vc", Entities.PB_VillageCenter1)
		ReplaceEntity("p1_clay", Entities.PB_ClayMine1)
		ReplaceEntity("p1_iron", Entities.PB_IronMine1)
		ReplaceEntity("p1_tavern", Entities.PB_Tavern1)
		
		ReplaceEntity("t21", Entities.PB_VillageCenter1)
	else
		CreateRandomChests()
	end

	RaidersCreate({player = 8, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (8 + CP_Difficulty * 2)})
	RaidersCreate({player = 8, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (8 + CP_Difficulty * 2)})
	RaidersCreate({player = 8, pos = "rudelpos3", revier = {"rudelpos3", "rudelpos3_wp1"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (8 + CP_Difficulty * 2)})
	RaidersCreate({player = 8, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 8, pos = "bearpos2", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	
	--Tools.ExploreArea(-1, -1, 900)
	--StartSimpleJob("GetMousePos")
end


