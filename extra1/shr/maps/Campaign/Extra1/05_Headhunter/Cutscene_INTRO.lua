-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "INTRO"
--
-----------------------------------------------------------------------------------------------------------------------	

function Cutscene_INTRO_Start()
	Interface_SetCinematicMode(1)
	
	Display.SetFogStartAndEnd (5000, 15000)
  	Display.SetRenderFog (1)
	Display.SetFarClipPlaneMinAndMax(0, 16000) 
	      
    SetNeutral(1,5)
    CreateEntity(5, Entities.CU_Hero10, GetPosition("CUTSCENE_QUINTOS"), "QUINTOS" )
    CreateEntity(1, Entities.PU_Scout, GetPosition("CUTSCENE_SCOUT"), "SCOUT" )
    --CreateEntity(1, Entities.PU_Hero6, GetPosition("CUTSCENE_HELIAS"), "HELIAS" )
        
    --RotateEntity("HELIAS", 270)
    
    
    LookAt("QUINTOS","SCOUT")   
    LookAt("SCOUT","QUINTOS")  
   
end



function Cutscene_INTRO_Text01()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_INTRO_TEXT01")
	
end


function Cutscene_INTRO_Text02()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_INTRO_TEXT02")
	
end



function Cutscene_INTRO_Text03()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_INTRO_TEXT03")
	
end


function Cutscene_INTRO_Text04()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_INTRO_TEXT04")
	
end



function Cutscene_INTRO_Text05()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_INTRO_TEXT05")
	
end

function Cutscene_INTRO_ShowHelias()
	local ScoutID  = Logic.GetEntityIDByName("SCOUT")
	 GUI.ScoutPointToResources(ScoutID)
end


function Cutscene_INTRO_Text06()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_INTRO_TEXT06")
	 
end



function Cutscene_INTRO_Text07()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_INTRO_TEXT07")
	
end
-------------------------------------------------------------------------------------------------------------------------
function Cutscene_INTRO_Cancel()
	Cutscene_INTRO_Finished()
		
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_INTRO_Finished()
	
	DestroyEntity("QUINTOS") 
	DestroyEntity("SCOUT") 
	--DestroyEntity("HELIAS") 

    SetHostile(1,5)
	
	Display.SetFarClipPlaneMinAndMax(0, 0) 
	Interface_SetCinematicMode(0)
	CutsceneDone()
	
end