-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "MISSIONCOMPLETE"
--
-----------------------------------------------------------------------------------------------------------------------	

function Cutscene_MISSIONCOMPLETE_Start()
	
	Interface_SetCinematicMode(1)
	Music.Start( "music\\40_Extra1_BridgeBuild.mp3" , 100, 1 )
  	Display.SetFogStartAndEnd (5000, 15000)
  	Display.SetRenderFog (1)
	Display.SetFarClipPlaneMinAndMax(0, 16000) 
	
	CreateEntity(1, Entities.PU_Hero1c, GetPosition("CUTSCENE_END_DARIO"), "DARIO9" )     
	CreateEntity(1, Entities.PU_Hero5, GetPosition("CUTSCENE_END_ARI"), "ARI9" )     
	CreateEntity(1, Entities.PU_Hero2, GetPosition("CUTSCENE_END_PILGRIM"), "PILGRIM9" )     
	CreateEntity(1, Entities.PU_Hero11, GetPosition("CUTSCENE_END_MIRAI"), "MIRAI9" )     
	CreateEntity(1, Entities.PU_Hero10, GetPosition("CUTSCENE_END_DRAKE"), "DRAKE9" )              
   
	--CreateEntity(1, Entities.CU_NPC_EvilGovernor, GetPosition("CUTSCENE_END_GOVERNOR"), "GOVERNOR9" )   
           
	LookAt("DARIO9","MIRAI9")    
	LookAt("PILGRIM9","DRAKE9")  
	LookAt("ARI9","DARIO9")  
	LookAt("MIRAI9","DARIO9")  
	LookAt("DRAKE9","PILGRIM9")  
	--LookAt("GOVERNOR9","DARIO9")  
end


function Cutscene_MISSIONCOMPLETE_LookAt01()    
     
     LookAt("MIRAI9","DRAKE9") 
         
end

         
function Cutscene_MISSIONCOMPLETE_Text01()
	 SpokenCinematicText("CM02_10_FloodedLand/CUTSCENE_MISSIONCOMPLETE_TEXT01")
	
end


function Cutscene_MISSIONCOMPLETE_Text02()
	 SpokenCinematicText("CM02_10_FloodedLand/CUTSCENE_MISSIONCOMPLETE_TEXT02")
	
end


function Cutscene_MISSIONCOMPLETE_Text03()
	 SpokenCinematicText("CM02_10_FloodedLand/CUTSCENE_MISSIONCOMPLETE_TEXT03")
	
end


function Cutscene_MISSIONCOMPLETE_Text04()
	 SpokenCinematicText("CM02_10_FloodedLand/CUTSCENE_MISSIONCOMPLETE_TEXT04")
	
end


function Cutscene_MISSIONCOMPLETE_Text05()
	 SpokenCinematicText("CM02_10_FloodedLand/CUTSCENE_MISSIONCOMPLETE_TEXT05")
	
end


function Cutscene_MISSIONCOMPLETE_Text06()
	 SpokenCinematicText("CM02_10_FloodedLand/CUTSCENE_MISSIONCOMPLETE_TEXT06")
	
end


function Cutscene_MISSIONCOMPLETE_Text07()
	 SpokenCinematicText("CM02_10_FloodedLand/CUTSCENE_MISSIONCOMPLETE_TEXT07")
	
end


function Cutscene_MISSIONCOMPLETE_Text08()
	 SpokenCinematicText("CM02_10_FloodedLand/CUTSCENE_MISSIONCOMPLETE_TEXT08")
	
end


function Cutscene_MISSIONCOMPLETE_Text09()
	 SpokenCinematicText("CM02_10_FloodedLand/CUTSCENE_MISSIONCOMPLETE_TEXT09")
	
end


function Cutscene_MISSIONCOMPLETE_Text10()
	 SpokenCinematicText("CM02_10_FloodedLand/CUTSCENE_MISSIONCOMPLETE_TEXT10")
	
end


function Cutscene_MISSIONCOMPLETE_Text11()
	 SpokenCinematicText("CM02_10_FloodedLand/CUTSCENE_MISSIONCOMPLETE_TEXT11")
	
end

MISSIONCOMPLETE_StartFireWorks = 1

function Cutscene_MISSIONCOMPLETE_StartFireWorks()
	 
 	local Position = {}	 	
	Position = GetPosition("CUTSCENE_MISSIONCOMPLETE_FIREWORKS"..MISSIONCOMPLETE_StartFireWorks) 
	
 	Logic.CreateEffect(GGL_Effects.FXYukiFireworksFear, Position.X, Position.Y, 1)
 	Logic.CreateEffect(GGL_Effects.FXYukiFireworksJoy, Position.X, Position.Y, 1)
 	
 	Sound.Play2DSound(Sounds.Military_SO_Fireworks, 0,127)
	
	if MISSIONCOMPLETE_StartFireWorks ~= 5 then
		MISSIONCOMPLETE_StartFireWorks = MISSIONCOMPLETE_StartFireWorks + 1   
	end
	
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