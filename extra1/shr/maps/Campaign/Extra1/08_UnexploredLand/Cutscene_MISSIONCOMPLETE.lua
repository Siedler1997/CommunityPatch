-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "MISSIONCOMPLETE"
--
-----------------------------------------------------------------------------------------------------------------------	

function Cutscene_MISSIONCOMPLETE_Start()
	Interface_SetCinematicMode(1)
	Display.SetFogStartAndEnd (5000, 15000)
  	Display.SetRenderFog (1)
	Display.SetFarClipPlaneMinAndMax(0, 16000) 


       CreateEntity(1, Entities.PU_Hero1c, GetPosition("CUTSCENE_MISSIONCOMPLETE_DARIO"), "DARIO9" )     
       CreateEntity(1, Entities.PU_Hero5, GetPosition("CUTSCENE_MISSIONCOMPLETE_ARI"), "ARI9" )     
       CreateEntity(1, Entities.PU_Hero2, GetPosition("CUTSCENE_MISSIONCOMPLETE_PILGRIM"), "PILGRIM9" )     
       CreateEntity(1, Entities.PU_Hero11, GetPosition("CUTSCENE_MISSIONCOMPLETE_MIRAI"), "MIRAI9" )     
       CreateEntity(1, Entities.PU_Hero10, GetPosition("CUTSCENE_MISSIONCOMPLETE_DRAKE"), "DRAKE9" )   
       CreateEntity(1, Entities.PU_Hero6, GetPosition("CUTSCENE_MISSIONCOMPLETE_HELIAS"), "HELIAS9" ) 
       
           LookAt("DARIO9","DRAKE9")    
           LookAt("DRAKE9","DARIO9") 
           LookAt("ARI9","DARIO9") 
           LookAt("PILGRIM9","DARIO9") 
           LookAt("MIRAI9","DARIO9")     
           LookAt("HELIAS9","DARIO9")                                            
     
end





function Cutscene_MISSIONCOMPLETE_Text01()
	 SpokenCinematicText("CM02_08_UnexploredLand/CUTSCENE_MISSIONCOMPLETE_TEXT01")
	
end


function Cutscene_MISSIONCOMPLETE_Text02()
	 SpokenCinematicText("CM02_08_UnexploredLand/CUTSCENE_MISSIONCOMPLETE_TEXT02")
	
end

function Cutscene_MISSIONCOMPLETE_Text03()
	 SpokenCinematicText("CM02_08_UnexploredLand/CUTSCENE_MISSIONCOMPLETE_TEXT03")
	
end
-------------------------------------------------------------------------------------------------------------------------
function Cutscene_MISSIONCOMPLETE_Cancel()
	Cutscene_MISSIONCOMPLETE_Finished()	
		
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_MISSIONCOMPLETE_Finished()
	
	DestroyEntity("DARIO9")
	DestroyEntity("ARI9") 
	DestroyEntity("PILGRIM9") 
	DestroyEntity("MIRAI9") 
	DestroyEntity("DRAKE9") 		
	DestroyEntity("HELIAS9") 			 
	
	Display.SetFarClipPlaneMinAndMax(0, 0) 
	
	Interface_SetCinematicMode(0)
	CutsceneDone()
		
end