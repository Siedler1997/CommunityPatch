Script.Load( "Data\\Script\\MapTools\\Main.lua" )
IncludeLocals("player1")

CP_Difficulty = 0
------------------------------------------------------------------------------
function InitDiplomacy()
	SetFriendly(1,2)
	SetFriendly(1,5)
		
	SetHostile(4,1)
	SetHostile(4,2)
	SetHostile(4,5)
	SetHostile(1,6)

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
	if GDB.GetValue("Game\\Campaign_Difficulty") > 1 then
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
		end
		
		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(4)
		ResearchAllMilitaryTechsAddOn(5)
		ResearchAllMilitaryTechsAddOn(6)
	end

    createPlayer1()
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
	Display.SetPlayerColorMapping(2,15)
	Display.SetPlayerColorMapping(5,16)
    Display.SetPlayerColorMapping(6,ROBBERS_COLOR)

	if CP_Difficulty < 2 then
		Display.SetPlayerColorMapping(1,PLAYER_COLOR)
	
		if CitywallsPlayercolor ~= true then
			Display.SetPlayerColorMapping(3,15)
		else
			Display.SetPlayerColorMapping(3,PLAYER_COLOR)
		end
	
		if Player4IsNephilim ~= true then
			Display.SetPlayerColorMapping(4,EVIL_GOVERNOR_COLOR)
		else
			Display.SetPlayerColorMapping(4,NEPHILIM_COLOR)
		end
	else
		Display.SetPlayerColorMapping(1,NEPHILIM_COLOR)
	
		if CitywallsPlayercolor ~= true then
			Display.SetPlayerColorMapping(3,15)
		else
			Display.SetPlayerColorMapping(3,NEPHILIM_COLOR)
		end
	
		if Player4IsNephilim ~= true then
			Display.SetPlayerColorMapping(4,EVIL_GOVERNOR_COLOR)
		else
			Display.SetPlayerColorMapping(4,ENEMY_COLOR1)
		end
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

	if CP_Difficulty > 0 then
		local addWolves = 0
		local wolfSet = RaidersDefaultSets.Vanilla
		if CP_Difficulty == 2 then		
			Display.SetPlayerColorMapping(1,NEPHILIM_COLOR)
			Display.SetPlayerColorMapping(3,15)
			Display.SetPlayerColorMapping(4,EVIL_GOVERNOR_COLOR)
			GUI.SetTaxLevel(1)
			
			addWolves = addWolves + 2
			
			wolfSet = RaidersDefaultSets.Mediterranean
		end

		RaidersCreate({player = 6, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 3500, types = wolfSet, samount = (2 + addWolves), ramount = (8 + addWolves)})
		RaidersCreate({player = 6, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1"}, range = 3500, types = wolfSet, samount = (2 + addWolves), ramount = (8 + addWolves)})
	end

    --Tools.ExploreArea(-1, -1, 900)
	--StartSimpleJob("GetMousePos")
end
