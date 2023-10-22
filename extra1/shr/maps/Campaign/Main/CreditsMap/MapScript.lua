Script.Load( "Data\\Script\\MapTools\\Main.lua" )
------------------------------------------------------------------------------
function InitDiplomacy()
	end
------------------------------------------------------------------------------
function InitResources()
  
    end
------------------------------------------------------------------------------
function InitTechnologies()
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
    --Display.SetPlayerColorMapping(1,GetPlayerPreferredColor())	
    --Display.SetPlayerColorMapping(8,NEPHILIM_COLOR)	
    Display.SetPlayerColorMapping(5,ROBBERS_COLOR)	

	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if p1color ~= 2 then
		Display.SetPlayerColorMapping(2, 2)		
		Display.SetPlayerColorMapping(8, 2)		
	else
		Display.SetPlayerColorMapping(2, 6)		
		Display.SetPlayerColorMapping(8, 6)		
	end
end

------------------------------------------------------------------------------
function FirstMapAction()

	XGUIEng.ShowWidget("Normal",0)
	XGUIEng.ShowWidget("3dOnScreenDisplay",0)
	XGUIEng.ShowWidget("Movie",1)
	
	Logic.SetGlobalInvulnerability(1)
	
	--Include Support functions
	IncludeLocals("Cutscene_Credits" )
	
	
	--Preload all models
	Display.LoadAllModels()
	
	Mission_CreateAttackers()
	
	Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND, NIL, "MissionScriptingEverySecond", 1)
	gvCreditsTime = 0
	gvCreditsCounter = 0
	gvCreditsWaitTime = 5
	
	
	Display.SetRenderSky(1)
	GUI.SetFeedbackSoundOutputState(0)		
	Display.SetProgramOptionRenderOcclusionEffect(0)
	-- cutscene input mode
	Input.CutsceneMode()
	-- toggle FoW		
	Display.SetRenderFogOfWar(0) 
	GUI.MiniMap_SetRenderFogOfWar(0)
	
	Cutscene_Credits_NormalMusic()
	end
	

function
MissionScriptingEverySecond()

	if Logic.GetTime() == 1 then
		Display.SetFarClipPlaneMinAndMax(0, 40000) 
		Cutscene.Start("Credits")
	end

	
	if gvCreditsCounter <= 23 then
		if gvCreditsTime < (Logic.GetTime()) then			
			local String = "Credits/Credits[" .. gvCreditsCounter .. "]"
			local StringTitle= "Credits/CreditsTitle[" .. gvCreditsCounter .. "]"
	
			XGUIEng.SetText( "CreditsWindowTextTitle", XGUIEng.GetStringTableText(StringTitle) )		
			XGUIEng.SetText( "CreditsWindowText", XGUIEng.GetStringTableText(String) )					
			gvCreditsTime = Logic.GetTime() + gvCreditsWaitTime
			gvCreditsCounter = gvCreditsCounter + 1
		end
	end
	if gvCreditsCounter == 23 then		
		gvCreditsCounter = 0
	end
	
	
	
end


function
Mission_CreateAttackers()
	SetHostile(1,8)	
	
	local Position = {}
	
	Position = GetPosition("Rifleman1")	
	CreateMilitaryGroup(1,Entities.PU_LeaderRifle2,8,Position)
	
	Position = GetPosition("Rifleman2")	
	CreateMilitaryGroup(1,Entities.PU_LeaderRifle2,8,Position)
	
	Position = GetPosition("Bearman1")	
	CreateMilitaryGroup(8,Entities.CU_Evil_LeaderBearman1,10,Position)
	
	Position = GetPosition("Bearman2")	
	CreateMilitaryGroup(8,Entities.CU_Evil_LeaderBearman1,10,Position)
	
	Position = GetPosition("Bearman3")	
	CreateMilitaryGroup(8,Entities.CU_Evil_LeaderBearman1,10,Position)
	
	
	Position = GetPosition("Skirmisher1")	
	CreateMilitaryGroup(8,Entities.CU_Evil_LeaderSkirmisher1,10,Position)	
	
	Position = GetPosition("Skirmisher2")	
	CreateMilitaryGroup(8,Entities.CU_Evil_LeaderSkirmisher1,10,Position)
	
	Position = GetPosition("Swordman1")	
	CreateMilitaryGroup(1,Entities.PU_LeaderSword4,8,Position)	
	
	
	Position = GetPosition("Spearman")	
	CreateMilitaryGroup(1,Entities.PU_LeaderPoleArm4,8,Position)
	
end