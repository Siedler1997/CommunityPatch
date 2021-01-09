Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0

------------------------------------------------------------------------------
function InitDiplomacy()
    -- diplomacy
    SetHostile(1,2)
    SetHostile(8,2)
	end
------------------------------------------------------------------------------
function InitResources()
    -- set some resources
    AddStone(0)
    AddClay(0)
    AddGold(0)
    AddSulfur(0)
    AddIron(0)
    AddWood(0)
    end
------------------------------------------------------------------------------
function InitTechnologies()
	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(8)
	end
end
------------------------------------------------------------------------------
function InitWeatherGfxSets()
	SetupMoorWeatherGfxSet()
    end
------------------------------------------------------------------------------
function InitWeather()
	AddPeriodicWinter(300)
	AddPeriodicSummer(800)
	AddPeriodicWinter(200)
	
	StartWinter(10000000)
end
------------------------------------------------------------------------------
function InitPlayerColorMapping()

	Display.SetPlayerColorMapping(1,PLAYER_COLOR)
	Display.SetPlayerColorMapping(2,NEPHILIM_COLOR)
	Display.SetPlayerColorMapping(4,NEPHILIM_COLOR)
	Display.SetPlayerColorMapping(5,FRIENDLY_COLOR1)
	Display.SetPlayerColorMapping(8,FRIENDLY_COLOR1)
	Display.SetPlayerColorMapping(3,NPC_COLOR)
		
end

------------------------------------------------------------------------------
function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	-- load scripts
	IncludeLocals("army_bridges")
	IncludeLocals("army_DestroyHQ")
	IncludeLocals("army_nephilimsHQ")
	IncludeLocals("army_p8Defense")
	IncludeLocals("army_player")
	IncludeLocals("army_tribalCamps")

	IncludeLocals("briefing_bridges")
	IncludeLocals("briefing_cleanUpRuins")
	IncludeLocals("briefing_prelude")

	IncludeLocals("gameControl")

	IncludeLocals("npc_gate1")
	IncludeLocals("npc_gate2")
	IncludeLocals("npc_hq1")
	IncludeLocals("npc_hq2")
	IncludeLocals("npc_hq3")

	IncludeLocals("player_2")
	IncludeLocals("player_8")

	IncludeLocals("quest_bridges")
	IncludeLocals("quest_cleanUpRuins")
	IncludeLocals("quest_defeat")
	IncludeLocals("quest_gatekey1")
	IncludeLocals("quest_gatekey2")

	--Init String tables
	String.Init("CM02_08_UnexploredLand")
	
    -- debugging stuff

    --EnableDebugging()
    
   
	-- String
	String.Init("CM02_08_UnexploredLand")
	
	Cutscenes 							= {}
	Cutscenes[INTROCUTSCENE] 			= "INTRO"	
	Cutscenes[THRESHOLDONECUTSCENE] 	= "ATTACKSOLDIER"
	Cutscenes[MISSIONCOMPLETECUTSCENE] 	= "MISSIONCOMPLETE"

				
	IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
	IncludeLocals("Cutscene_" .. Cutscenes[THRESHOLDONECUTSCENE])
	IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])

    
    LocalMusic.UseSet = DARKMOORMUSIC

	-- start
	StartCutscene(Cutscenes[INTROCUTSCENE],start1stChapter)

	end


