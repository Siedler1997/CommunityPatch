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
IncludeLocals("player1")
IncludeLocals("player2")


Cutscenes = {}
Cutscenes[INTROCUTSCENE] = "INTRO"
Cutscenes[MISSIONCOMPLETECUTSCENE] = "MISSIONCOMPLETE"

IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])
------------------------------------------------------------------------------
function InitDiplomacy()
    SetHostile(1,2)
    SetHostile(1,5)
end
------------------------------------------------------------------------------
function InitResources()
    -- set some resources
	GlobalMissionScripting.GiveResouces(1, 1000, 500, 1000, 500, 200, 500)
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
		ResearchAnimalTechs(5, animalTech2)

		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(5)
	end
    createPlayer1()
end
------------------------------------------------------------------------------
function InitWeatherGfxSets()
	SetupEvelanceWeatherGfxSet()
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
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if p1color == 2 then
		Display.SetPlayerColorMapping(2, 6)		
	end
    Display.SetPlayerColorMapping(3,NPC_COLOR)
    Display.SetPlayerColorMapping(4,NPC_COLOR)
    Display.SetPlayerColorMapping(5,ROBBERS_COLOR)
	if p1color ~= 4 then
		Display.SetPlayerColorMapping(6,ENEMY_COLOR2)	
	else
		Display.SetPlayerColorMapping(6,16)	
	end
end
------------------------------------------------------------------------------
function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	--EnableDebugging()
	--Game.GameTimeReset()

	String.Init("CM02_05_Headhunter")

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

	--Deactivated because workers create lots of internal camp fires
	--CreateSettlersForKarratas()
	
	ScoutFoerster_gvScoutFoerster.GROWTH_LEVELS = table.getn(ScoutFoerster_SET_Evelance)
	ScoutFoerster_gvScoutFoerster.treeSet = ScoutFoerster_SET_Evelance
    
	if CP_Difficulty > 0 then
		if CP_Difficulty == 2 then
			GUI.SetTaxLevel(1)
			
			ReplaceEntity("player1", Entities.PB_Headquarters1)
			ReplaceEntity("vc_player", Entities.PB_VillageCenter1)
			ReplaceEntity("b1", Entities.CB_Grange)
		else
			CreateRandomGoldChests()
		end
		--[[
		local vcpos = GetPosition("vc_empty")
		DestroyEntity("vc_empty")
		Logic.CreateEntity(Entities.XD_RuinMonastery2,vcpos.X,vcpos.Y,0,0)
		--]]
		for i = 1, 5 do
			ReplaceEntity("cannon"..i, Entities.PV_Cannon3)
		end
	else
		CreateRandomGoldChests()
	end

	RaidersCreate({player = 5, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 3500, types = RaidersDefaultSets.Evelance, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	
	RaidersCreate({player = 5, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBlackBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})

	--StartSimpleJob("GetMousePos")
	--Tools.ExploreArea(-1, -1, 900)
    --ReplaceEntity("bridge",Entities.PB_DrawBridgeClosed1)
end

function CreateSettlersForKarratas()
	local settlersPos = GetPosition("CUTSCENE_HELIAS_EXTRO")
	for i = 1, 6 do
		Logic.CreateEntity(Entities.PU_Farmer,settlersPos.X,settlersPos.Y,0,6)
	end
	for i = 1, 10 do
		Logic.CreateEntity(Entities.PU_Priest,settlersPos.X,settlersPos.Y,0,6)
	end
end