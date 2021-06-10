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
    AddStone(500)
    AddClay(500)
    AddGold(1000)
    AddSulfur(500)
    AddIron(200)
    AddWood(1000)
    end
------------------------------------------------------------------------------
function InitTechnologies()
	if GDB.GetValue("Game\\Campaign_Difficulty") > 1 then
		_ResearchSuperTech = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			_ResearchSuperTech = true
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
		end

		ResearchAllMilitaryTechsAddOn(2, _ResearchSuperTech)
		ResearchAllMilitaryTechsAddOn(5, _ResearchSuperTech)
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
    Display.SetPlayerColorMapping(3,NPC_COLOR)
    Display.SetPlayerColorMapping(4,NPC_COLOR)
    Display.SetPlayerColorMapping(5,ROBBERS_COLOR)
    Display.SetPlayerColorMapping(6,ENEMY_COLOR2)
    
	if CP_Difficulty < 2 then
		Display.SetPlayerColorMapping(1, PLAYER_COLOR)
        Display.SetPlayerColorMapping(2, NEPHILIM_COLOR)
	else
		Display.SetPlayerColorMapping(1, NEPHILIM_COLOR)
        Display.SetPlayerColorMapping(2, ENEMY_COLOR1)
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
    
	if CP_Difficulty == 0 then
		CreateRandomGoldChests()
	else
		local addWolves = 0
		if CP_Difficulty == 2 then
			Display.SetPlayerColorMapping(1, NEPHILIM_COLOR)
			Display.SetPlayerColorMapping(2, ENEMY_COLOR1)
			GUI.SetTaxLevel(1)
			
			addWolves = addWolves + 2
			
			ReplaceEntity("player1", Entities.PB_Headquarters1)
			ReplaceEntity("vc_player", Entities.PB_VillageCenter1)
			ReplaceEntity("b1", Entities.CB_Grange)
		end

		local vcpos = GetPosition("vc_empty")
		DestroyEntity("vc_empty")
		Logic.CreateEntity(Entities.XD_RuinMonastery2,vcpos.X,vcpos.Y,0,0)

		for i = 1, 5 do
			ReplaceEntity("cannon"..i, Entities.PV_Cannon3)
		end

		RaidersCreate({player = 5, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 3500, samount = (2 + addWolves), ramount = (8 + addWolves)})
	end

	--StartSimpleHiResJob("GetDarioPos")
	--Tools.ExploreArea(-1, -1, 900)
    --ReplaceEntity("bridge",Entities.PB_DrawBridgeClosed1)
end

--[[
function GetDarioPos()
	local pos = GetPosition("Dario")
	Message("X: " .. pos.X .. "   Y: " .. pos.Y)
end
--]]