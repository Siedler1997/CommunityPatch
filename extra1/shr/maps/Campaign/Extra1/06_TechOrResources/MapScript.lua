Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0

IncludeGlobals("MapEditorTools")
IncludeLocals("army_tools")
IncludeLocals("army_assault")
IncludeLocals("army_defend")
IncludeLocals("army_friendly")
IncludeLocals("army_guard")
IncludeLocals("quest_victory")
IncludeLocals("quest_defeat")
IncludeLocals("quest_stones")
IncludeLocals("quest_priest")
IncludeLocals("briefing_prelude")
IncludeLocals("briefing_priest")
IncludeLocals("briefing_hiddenPath")
IncludeLocals("briefing_farmer")
IncludeLocals("gameControl")
IncludeLocals("player2")
IncludeLocals("player3")
IncludeLocals("player7")

------------------------------------------------------------------------------
function InitDiplomacy()

    --  player 2 = enemy, player 3 = friend

        SetHostile(1,2)
        SetFriendly(1,3)
        SetHostile(2,3)

        SetHostile(1,7)
        SetHostile(3,7)

    --  neutral enemy

        SetNeutral(1,5)
        SetNeutral(2,5)

    --  player 4 = npcs

        SetNeutral(2,4)
        SetNeutral(1,4)

	end
------------------------------------------------------------------------------
function InitResources()
    AddStone(500)
    AddClay(500)
    AddGold(0)
    AddSulfur(500)
    AddIron(500)
    AddWood(500)
    end
------------------------------------------------------------------------------
function InitTechnologies()
	ForbidTechnology(Technologies.GT_PulledBarrel)
	
	ResearchTechnology(Technologies.GT_Construction)
	
	ResearchTechnology(Technologies.T_ThiefSabotage)

	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(3)	--No enemy, but has to be useful
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

  	Display.SetPlayerColorMapping(1,PLAYER_COLOR)
    Display.SetPlayerColorMapping(2,EVIL_GOVERNOR_COLOR)
    Display.SetPlayerColorMapping(3,FRIENDLY_COLOR2)
    Display.SetPlayerColorMapping(4,NPC_COLOR)
    Display.SetPlayerColorMapping(5,EVIL_GOVERNOR_COLOR)
    Display.SetPlayerColorMapping(6,NPC_COLOR)
    Display.SetPlayerColorMapping(7,EVIL_GOVERNOR_COLOR)
end
------------------------------------------------------------------------------

function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

--Input.KeyBindDown(Keys.ModifierControl + Keys.N, "BriefingMCButtonSelected(1)",15)
--Input.KeyBindDown(Keys.ModifierControl + Keys.M, "BriefingMCButtonSelected(2)",15)

	String.Init("CM02_06_TechOrResources")

	--Init Cutscenes
	Cutscenes[INTROCUTSCENE] 			= "INTRO"
	Cutscenes[MISSIONCOMPLETECUTSCENE] 	= "MISSIONCOMPLETE"

	IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
	IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])

    Logic.SetShareExplorationWithPlayerFlag(1, 3, 1)

    --createPlayer2()
    createPlayer3()
    createPlayer7()

		LocalMusic.UseSet = EUROPEMUSIC

    createQuestDefeat()

    --EnableDebugging()
    --Game.GameTimeReset()
    
    beginChapterOne()

	if CP_Difficulty == 1 then
		local cannons1 = { Logic.GetPlayerEntities(7, Entities.PV_Cannon1, 5, 0) }
		for i = 1, table.getn(cannons1) do
            if IsExisting(cannons1[i]) then
			    ReplaceEntity(cannons1[i], Entities.PV_Cannon3)
            end
		end
		local cannons2 = { Logic.GetPlayerEntities(7, Entities.PV_Cannon2, 5, 0) }
		for i = 1, table.getn(cannons2) do
            if IsExisting(cannons2[i]) then
			    ReplaceEntity(cannons2[i], Entities.PV_Cannon3)
            end
		end
	end

    --Tools.ExploreArea(-1, -1, 900)
end

