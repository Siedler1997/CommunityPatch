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
        
        
    SetPosition("Helias", GetPosition("CUTSCENE_HELIAS_EXTRO"))
    CreateEntity(1, Entities.CU_Hero10, GetPosition("CUTSCENE_HEADHUNTER_MOVE"), "HEADHUNTER" )
    CreateEntity(1, Entities.PU_Hero1c, GetPosition("CUTSCENE_MOVE_START_DARIO"), "DARIO" )
    --CreateEntity(1, Entities.PU_Hero10, GetPosition("CUTSCENE_QUINTOS_EXTRO"), "QUINTOS" )
    
    SetFriendly(1,8)
    CreateEntity(8, Entities.CU_Thief, GetPosition("CUTSCENE_MOVE_START_THIEF"), "Thief" )
    Logic.SettlerDefend(GetEntityId("Thief"))
    
    
   Music.Start( "music\\05_CombatEvelance1.mp3" , 100, 1 )
        
   RotateEntity("Helias", 270) 
   RotateEntity("Thief", 180) 
end
        
function Cutscene_MISSIONCOMPLETE_Rotate01()     
             RotateEntity("HEADHUNTER", 180) 
end
  

      
function Cutscene_MISSIONCOMPLETE_Move01()     

        SetPosition("HEADHUNTER", GetPosition("CUTSCENE_HEADHUNTER_MOVE"))
        Move("HEADHUNTER", "CUTSCENE_MOVE_END_HEADHUNTER")
        
 end
 
 function Cutscene_MISSIONCOMPLETE_Move02()   
 
        SetPosition("DARIO", GetPosition("CUTSCENE_MOVE_START_DARIO"))
        Move("DARIO", "CUTSCENE_MOVE_END_DARIO")
   
 end     
        

 function Cutscene_MISSIONCOMPLETE_Move03()   
 
        SetPosition("HEADHUNTER", GetPosition("CUTSCENE_MOVE_START_HEADHUNTER2"))
        Move("HEADHUNTER", "CUTSCENE_MOVE_END_HEADHUNTER2")
   
 end 



 function Cutscene_MISSIONCOMPLETE_Move04()   
 
        SetPosition("DARIO", GetPosition("CUTSCENE_MOVE_START_DARIO2"))
        Move("DARIO", "CUTSCENE_MOVE_END_DARIO2")
   
 end 



 function Cutscene_MISSIONCOMPLETE_Move05()   
 
        SetPosition("HEADHUNTER", GetPosition("CUTSCENE_MOVE_START_HEADHUNTER3"))
        Move("HEADHUNTER", "CUTSCENE_MOVE_END_HEADHUNTER3")
   		
 end 
 
 
 
 
 function Cutscene_MISSIONCOMPLETE_Shot()   
 	SetHostile(1,8)
 	SetPosition("HEADHUNTER", GetPosition("CUTSCENE_QUINTOS_EXTRO"))
    
 end 

function Cutscene_MISSIONCOMPLETE_MoveThief()   
	Move("Thief", "CUTSCENE_DEAD_HEADHUNTER")
end

function Cutscene_MISSIONCOMPLETE_ThiefDie()   
	Sound.PlayGUISound(Sounds.Military_SO_Rifleman_rnd_1)
	Logic.HurtEntity(GetEntityId("Thief"),800)
	Music.Start( "music\\40_Extra1_BridgeBuild.mp3" , 100, 1 )		
end

 function Cutscene_MISSIONCOMPLETE_Move06()   
 	
	
	SetPosition("DARIO", GetPosition("CUTSCENE_MOVE_START_DARIO5"))
	Move("DARIO", "CUTSCENE_MOVE_END_DARIO5")
   
 end 


 function Cutscene_MISSIONCOMPLETE_Move07()   
 
        SetPosition("HEADHUNTER", GetPosition("CUTSCENE_MOVE_START_QUINTOS5"))
        Move("HEADHUNTER", "CUTSCENE_MOVE_END_QUINTOS5")
   
 end 


----------------------------------TEXTE------------------------------------------


function Cutscene_MISSIONCOMPLETE_Text01()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_MISSIONCOMPLETE_TEXT01")
	
end


function Cutscene_MISSIONCOMPLETE_Text02()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_MISSIONCOMPLETE_TEXT02")
	
end


function Cutscene_MISSIONCOMPLETE_Text03()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_MISSIONCOMPLETE_TEXT03")
	
end


function Cutscene_MISSIONCOMPLETE_Text04()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_MISSIONCOMPLETE_TEXT04")
	
end


function Cutscene_MISSIONCOMPLETE_Text05()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_MISSIONCOMPLETE_TEXT05")
	
end


function Cutscene_MISSIONCOMPLETE_Text06()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_MISSIONCOMPLETE_TEXT06")
	
end


function Cutscene_MISSIONCOMPLETE_Text07()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_MISSIONCOMPLETE_TEXT07")
	
end


function Cutscene_MISSIONCOMPLETE_Text08()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_MISSIONCOMPLETE_TEXT08")
	
end


function Cutscene_MISSIONCOMPLETE_Text09()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_MISSIONCOMPLETE_TEXT09")
	
end


function Cutscene_MISSIONCOMPLETE_Text10()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_MISSIONCOMPLETE_TEXT10")
	
end


function Cutscene_MISSIONCOMPLETE_Text11()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_MISSIONCOMPLETE_TEXT11")
	
end


function Cutscene_MISSIONCOMPLETE_Text12()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_MISSIONCOMPLETE_TEXT12")
	
end


function Cutscene_MISSIONCOMPLETE_Text13()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_MISSIONCOMPLETE_TEXT13")
	
end


function Cutscene_MISSIONCOMPLETE_Text14()
	 SpokenCinematicText("CM02_05_Headhunter/CUTSCENE_MISSIONCOMPLETE_TEXT14")
	
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_MISSIONCOMPLETE_Cancel()
	Cutscene_MISSIONCOMPLETE_Finished()
	
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_MISSIONCOMPLETE_Finished()
	
	Display.SetFarClipPlaneMinAndMax(0, 0) 
	Interface_SetCinematicMode(0)
	CutsceneDone()
		
end