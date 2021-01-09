Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0
------------------------------------------------------------------------------
function InitDiplomacy()
	SetFriendly(1,2)
	SetFriendly(1,5)
		
	SetHostile(4,1)
	SetHostile(4,2)
	SetHostile(4,5)

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
	ForbidTechnology(Technologies.GT_Matchlock)
	ForbidTechnology(Technologies.GT_PulledBarrel)
	
	ResearchTechnology(Technologies.GT_Mercenaries)
	ResearchTechnology(Technologies.GT_StandingArmy)
	ResearchTechnology(Technologies.GT_Tactics)
	
	ResearchTechnology(Technologies.GT_Construction)
	
	ResearchTechnology(Technologies.GT_Alchemy)
	
	ResearchTechnology(Technologies.GT_Literacy)
	
	ResearchTechnology(Technologies.GT_Mathematics)
	ResearchTechnology(Technologies.GT_Binocular)
	
	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
		ResearchAllMilitaryTechsAddOn(4)
		ForbidTechnology(Technologies.UP2_Tower)
		ForbidTechnology(Technologies.GT_Chemistry)
	end
end
------------------------------------------------------------------------------
function InitWeatherGfxSets()
	SetupSteppeWeatherGfxSet()
    end
------------------------------------------------------------------------------
function InitWeather()
	AddPeriodicSummer(10)
end

------------------------------------------------------------------------------
function InitPlayerColorMapping()

	Display.SetPlayerColorMapping(1,PLAYER_COLOR)
	Display.SetPlayerColorMapping(2,FRIENDLY_COLOR1)
	
	if CitywallsPlayercolor ~= true then
		Display.SetPlayerColorMapping(3,FRIENDLY_COLOR1)
	else
		Display.SetPlayerColorMapping(3,PLAYER_COLOR)
	end
	
	if Player4IsNephilim ~= true then
		Display.SetPlayerColorMapping(4,EVIL_GOVERNOR_COLOR)
	else
		Display.SetPlayerColorMapping(4,NEPHILIM_COLOR)
	end
	
end
	
------------------------------------------------------------------------------
function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	-- load scripts
	IncludeLocals("army_attackers")
	IncludeLocals("army_attackers2")
	IncludeLocals("army_cityDefense")
	IncludeLocals("army_finalAttack")
	IncludeLocals("army_firstAttack")
	IncludeLocals("army_mirai")

	IncludeLocals("briefing_attackers")
	IncludeLocals("briefing_attackersGone")
	IncludeLocals("briefing_defend")
	IncludeLocals("briefing_finalAttack")
	IncludeLocals("briefing_mirai")
	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_riflemen")

	IncludeLocals("gameControl")

	IncludeLocals("player_2")
	IncludeLocals("player_4")
	IncludeLocals("player_5")

	IncludeLocals("quest_buildUp")
	IncludeLocals("quest_defend")
	IncludeLocals("quest_finalAttack")
	IncludeLocals("quest_firstAttackersWave")
	IncludeLocals("quest_mirai")
	IncludeLocals("quest_rescueCity")
	--AnSu: Needed to update the QuestInformation
	IncludeLocals("quest_killFirstAttackers")

	LocalMusic.UseSet = MEDITERANEANMUSIC

    -- debugging stuff
    --EnableDebugging()
    
    -- Start simple jobs
        
	-- String
	String.Init("CM02_03_BigCity")
	
	Cutscenes = {}
	Cutscenes[INTROCUTSCENE] = "INTRO"	
	Cutscenes[THRESHOLDONECUTSCENE] = "CITY"
	Cutscenes[THRESHOLTWOCUTSCENE] = "FOG"
	Cutscenes[MISSIONCOMPLETECUTSCENE] = "LEAVING"
	
			
	IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
	IncludeLocals("Cutscene_" .. Cutscenes[THRESHOLDONECUTSCENE])	
	IncludeLocals("Cutscene_" .. Cutscenes[THRESHOLTWOCUTSCENE])	
	IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])
	
	
	-- cutscene
--	StartCutscene("Intro",start1stChapter)
	start1stChapter();

end