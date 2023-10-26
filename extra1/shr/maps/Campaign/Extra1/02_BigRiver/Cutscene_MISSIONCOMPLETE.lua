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
        
	SetNeutral(1,2) 
	SetNeutral(1,8) 
	
    SetPosition("Dario", GetPosition("DarioStartPos"))
    SetPosition("Ari", GetPosition("AriStartPos"))
    SetPosition("Pilgrim", GetPosition("PilgrimStartPos"))
	      
	CreateEntity(1, Entities.PU_Hero1c, GetPosition("CUTSCENE_MOVE_START_DARIO3"), "DARIO3" )
	CreateEntity(1, Entities.PU_Scout, GetPosition("CUTSCENE_SCOUT3"), "SCOUT3" )
	CreateEntity(1, Entities.PU_Hero2, GetPosition("CUTSCENE_MOVE_START_PILGRIM3"), "PILGRIM3" ) 
	CreateEntity(1, Entities.PU_Hero5, GetPosition("CUTSCENE_MOVE_START_ARI3"), "ARI3" )
	CreateEntity(7, Entities.CU_Thief, GetPosition("CUTSCENE_MOVE_START_THIEF"), "THIEF" )
	CreateEntity(8, Entities.CU_Hero10, GetPosition("CUTSCENE_MOVE_START_QUINTOS"), "QUINTOS" ) 

	LookAt("THIEF", "Erec")
end



function Cutscene_MISSIONCOMPLETE_Move01()     
	SetPosition("DARIO3", GetPosition("CUTSCENE_MOVE_START_DARIO3"))
	Move("DARIO3", "CUTSCENE_MOVE_END_DARIO3")

	SetPosition("ARI3", GetPosition("CUTSCENE_MOVE_START_ARI3"))
	Move("ARI3", "CUTSCENE_MOVE_END_ARI3")
 
	SetPosition("PILGRIM3", GetPosition("CUTSCENE_MOVE_START_PILGRIM3"))
	Move("PILGRIM3", "CUTSCENE_MOVE_END_PILGRIM3")
     
	Music.Start( "music\\43_Extra1_DarkMoor_Combat.mp3" , 100, 1 )       
end


function Cutscene_MISSIONCOMPLETE_Move02()  
	Sound.PlayGUISound(Sounds.Military_SO_Rifleman_rnd_1)   

    SetPosition("THIEF", GetPosition("CUTSCENE_MOVE_START_THIEF"))
    Move("THIEF", "CUTSCENE_MOVE_END_THIEF")   
	Music.Start( "music\\43_Extra1_DarkMoor_Combat.mp3" , 100, 1 )        
    Logic.HurtEntity(GetEntityId("Erec"),1000)       
               
end


function Cutscene_MISSIONCOMPLETE_Move03()     

    SetPosition("QUINTOS", GetPosition("CUTSCENE_MOVE_START_QUINTOS"))
    Move("QUINTOS", "CUTSCENE_MOVE_END_QUINTOS")
    SetNeutral(7,8)
end

function Cutscene_MISSIONCOMPLETE_Shoot()     
	SetHostile(7,8)
	
end





function Cutscene_MISSIONCOMPLETE_Text01()
	 SpokenCinematicText("CM02_02_BigRiver/CUTSCENE_MISSIONCOMPLETE_TEXT01")
	
end


function Cutscene_MISSIONCOMPLETE_Text02()
	 SpokenCinematicText("CM02_02_BigRiver/CUTSCENE_MISSIONCOMPLETE_TEXT02")
	
end


function Cutscene_MISSIONCOMPLETE_Text03()
	 SpokenCinematicText("CM02_02_BigRiver/CUTSCENE_MISSIONCOMPLETE_TEXT03")
	
end


function Cutscene_MISSIONCOMPLETE_Text04()
	 SpokenCinematicText("CM02_02_BigRiver/CUTSCENE_MISSIONCOMPLETE_TEXT04")
	
end


function Cutscene_MISSIONCOMPLETE_Text05()
	 SpokenCinematicText("CM02_02_BigRiver/CUTSCENE_MISSIONCOMPLETE_TEXT05")
	
end


function Cutscene_MISSIONCOMPLETE_Text06()
	SpokenCinematicText("CM02_02_BigRiver/CUTSCENE_MISSIONCOMPLETE_TEXT06")
	Music.Start( "music\\22_Evelance_Summer4.mp3" , 100, 1 )   
	DestroyEntity("THIEF") 
	DestroyEntity("QUINTOS") 
end


function Cutscene_MISSIONCOMPLETE_Text07()
	 SpokenCinematicText("CM02_02_BigRiver/CUTSCENE_MISSIONCOMPLETE_TEXT07")
	
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_MISSIONCOMPLETE_Cancel()
	 Cutscene_MISSIONCOMPLETE_Finished()
	
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_MISSIONCOMPLETE_Finished()
	DestroyEntity("DARIO3") 
	DestroyEntity("SCOUT3") 
	DestroyEntity("ARI3") 
	DestroyEntity("PILGRIM3") 
	 
    SetPosition("Dario", GetPosition("CUTSCENE_MOVE_END_DARIO3"))
    SetPosition("Ari", GetPosition("CUTSCENE_MOVE_END_ARI3"))
    SetPosition("Pilgrim", GetPosition("CUTSCENE_MOVE_END_PILGRIM3"))

	--SetHostile(1,2)
	--SetHostile(1,8)
	
	Display.SetFarClipPlaneMinAndMax(0, 0) 
	Interface_SetCinematicMode(0)
	CutsceneDone()
end