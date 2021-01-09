Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0

IncludeLocals("army_tools")
IncludeLocals("army_bandit")
IncludeLocals("army_defenders")
IncludeLocals("quest_towers")
IncludeLocals("quest_gate")
IncludeLocals("quest_smallGate")
IncludeLocals("quest_defeat")
IncludeLocals("quest_enemyOutpost")
IncludeLocals("quest_bombs")
IncludeLocals("quest_stoneBandits")
IncludeLocals("quest_erec")
IncludeLocals("briefing_inventor")
IncludeLocals("briefing_tip")
IncludeLocals("briefing_prelude")
IncludeLocals("briefing_scout")
IncludeLocals("briefing_bandits")
IncludeLocals("briefing_smallGateOpens")
IncludeLocals("gameControl")
IncludeLocals("player2")
IncludeLocals("player6")

Cutscenes = {}
Cutscenes[INTROCUTSCENE] = "INTRO"
Cutscenes[THRESHOLDONECUTSCENE] = "SERF"
Cutscenes[MISSIONCOMPLETECUTSCENE] = "MISSIONCOMPLETE"

IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[THRESHOLDONECUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])


--Cheat for GoldChest described in Manual. Only before the map is saved and loaded the first time
Input.KeyBindDown(Keys.ModifierControl + Keys.ModifierAlt + Keys.G, 		"SpecialManualGoldChest()",2)
SpecialManualGoldChestFound = false

------------------------------------------------------------------------------
function InitDiplomacy()
    SetHostile(1,2)
    SetNeutral(1,4)
    SetNeutral(2,4)
    SetHostile(1,5)
    SetNeutral(1,6)

	end
------------------------------------------------------------------------------
function InitResources()
    -- set some resources
    AddStone(1000)
    AddClay(1000)
    AddGold(1000)
    AddSulfur(500)
    AddIron(500)
    AddWood(1000)
    end
------------------------------------------------------------------------------
function InitTechnologies()
	ForbidTechnology(Technologies.GT_Matchlock)
	ForbidTechnology(Technologies.GT_PulledBarrel)

	ResearchAllMilitaryTechsAddOn(5)
	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(6)
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

    Display.SetPlayerColorMapping(1,PLAYER_COLOR)
    Display.SetPlayerColorMapping(3,PLAYER_COLOR)
    Display.SetPlayerColorMapping(2,EVIL_GOVERNOR_COLOR)
    Display.SetPlayerColorMapping(4,NPC_COLOR)
    Display.SetPlayerColorMapping(5,ENEMY_COLOR1)
    Display.SetPlayerColorMapping(6,ROBBERS_COLOR)
	Display.SetPlayerColorMapping(7,EVIL_GOVERNOR_COLOR)

end
------------------------------------------------------------------------------
function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

    -- Start simple jobs
    StartSimpleJob("heroesNearErec")

    --EnableDebugging()
    --Game.GameTimeReset()


	-- String
	String.Init("CM02_02_BigRiver")


    createPlayer2()
    createPlayer6()

    createQuestDefeat()

    beginChapterOne()

	LocalMusic.UseSet = HIGHLANDMUSIC
	
	if CP_Difficulty == 1 then
		local towers1 = { Logic.GetPlayerEntities(1, Entities.PB_Tower3, 3, 0) }
		for i = 2, table.getn(towers1) do
			ReplaceEntity(towers1[i], Entities.PB_Tower2)
		end

		Logic.CreateEntity(Entities.PB_DarkTower3, 26400, 15800, 0, 2);
		Logic.CreateEntity(Entities.PB_DarkTower3, 45100, 31200, 0, 2);
		Logic.CreateEntity(Entities.PB_DarkTower3, 47600, 31300, 0, 2);
		Logic.CreateEntity(Entities.PB_DarkTower3, 22000, 32700, 0, 2);

		Logic.CreateEntity(Entities.PB_DarkTower3, 41600, 24300, 0, 2);
		Logic.CreateEntity(Entities.PB_DarkTower3, 32400, 21200, 0, 2);
		Logic.CreateEntity(Entities.PB_DarkTower3, 23100, 40900, 0, 2);
		SetEntityName(Logic.CreateEntity(Entities.PB_DarkTower3, 40200, 42000, 0, 2), "tower12")

		--local smpos = {X = 35600, Y = 45400}
		local tpos = GetPosition("control1")
		SetEntityName(Logic.CreateEntity(Entities.PB_DarkTower3, tpos.X, tpos.Y, 0, 2), "tower13")
		DestroyEntity("control1")
		SetEntityName(Logic.CreateEntity(Entities.CB_SteamMashine, smpos.X, smpos.Y, 0, 2), "control1")
		Logic.CreateEntity(Entities.PU_LeaderPoleArm4, (smpos.X + 300), (smpos.Y + 200), 45, 2)
	end
end


------------------------------------------------------------------------------
function SpecialManualGoldChest()
	
	if SpecialManualGoldChestFound == false then
		local Position = {}
		Position = GetPosition("SpecialManualGoldChest")	
		Camera.ScrollGameTimeSynced	(Position.X, Position.Y)
		CreateRandomGoldChest(Position)
		Logic.CreateEffect(GGL_Effects.FXYukiFireworksJoy, Position.X, Position.Y, 1)
		Sound.PlayGUISound(Sounds.Military_SO_Fireworks)
		Sound.PlayGUISound(Sounds.OnKlick_Select_mary_de_mortfichet)
		SpecialManualGoldChestFound = true
	end
end