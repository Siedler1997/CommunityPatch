-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "CITY"
--
-----------------------------------------------------------------------------------------------------------------------	

function Cutscene_CITY_Start()
	Interface_SetCinematicMode(1)
	
	
	Display.SetFogStartAndEnd (5000, 15000)
    Display.SetRenderFog (1)
	Display.SetFarClipPlaneMinAndMax(0, 40000) 
	      
    SetPosition("Dario", GetPosition("CUTSCENE_CITY_DARIO1"))
    CreateEntity(2, Entities.CU_NPC_Major_Barmecia, GetPosition("CUTSCENE_MOVE_START_GOVERNOR1"), "GOVERNOR1" )   	
	SetPosition("Mirai", GetPosition("CUTSCENE_MOVE_START_MIRAI"))	

    LookAt("Dario","GOVERNOR1") 
    LookAt("GOVERNOR1","Dario") 
    
    Sound.PlayGUISound(Sounds.OnKlick_Select_pilgrim)

end


 
function Cutscene_CITY_Move01()     

        SetPosition("GOVERNOR1", GetPosition("CUTSCENE_MOVE_START_GOVERNOR1"))
        Move("GOVERNOR1", "CUTSCENE_MOVE_END_GOVERNOR1")
        
        
        
 end

function Cutscene_CITY_Move02()     	
        Move("Mirai", "CUTSCENE_MOVE_END_MIRAI")
        
 end


function Cutscene_CITY_Move03()     

        SetPosition("GOVERNOR1", GetPosition("CUTSCENE_MOVE_END_GOVERNOR1"))
        Move("GOVERNOR1", "CUTSCENE_MOVE_END_GOVERNOR2")
        
 end

 
function Cutscene_CITY_LookAt01()    

 	LookAt("Mirai","Dario") 
	LookAt("Dario","Mirai") 
 end

function Cutscene_CITY_LookAt02()    

 	LookAt("Mirai","GOVERNOR1") 

 end


function Cutscene_CITY_LookAt03()    

 	LookAt("Mirai","Dario") 

 end




function Cutscene_CITY_Text01()
	 SpokenCinematicText("CM02_03_BigCity/CUTSCENE_CITY_TEXT01")
	
end


function Cutscene_CITY_Text02()
	 SpokenCinematicText("CM02_03_BigCity/CUTSCENE_CITY_TEXT02")
	
end



function Cutscene_CITY_Text03()
	 SpokenCinematicText("CM02_03_BigCity/CUTSCENE_CITY_TEXT03")
	
end



function Cutscene_CITY_Text04()
	 SpokenCinematicText("CM02_03_BigCity/CUTSCENE_CITY_TEXT04")
	
end



function Cutscene_CITY_Text05()
	 SpokenCinematicText("CM02_03_BigCity/CUTSCENE_CITY_TEXT05")
	
end



function Cutscene_CITY_Text06()
	 SpokenCinematicText("CM02_03_BigCity/CUTSCENE_CITY_TEXT06")
	
end


function Cutscene_CITY_Text07()
	 SpokenCinematicText("CM02_03_BigCity/CUTSCENE_CITY_TEXT07")
	
end



function Cutscene_CITY_Text08()
	 SpokenCinematicText("CM02_03_BigCity/CUTSCENE_CITY_TEXT08")
	
end


function Cutscene_CITY_Text09()
	-- Give player 2 to player 1
	--Logic.ChangeAllEntitiesPlayerID(2, 1)

	SpokenCinematicText("CM02_03_BigCity/CUTSCENE_CITY_TEXT09")	 
	Sound.PlayGUISound(Sounds.OnKlick_Select_ari)
	
end




-------------------------------------------------------------------------------------------------------------------------
function Cutscene_CITY_Cancel()
	-- Give player 2 to player 1
	--Logic.ChangeAllEntitiesPlayerID(2, 1)

	Cutscene_CITY_Finished()	
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_CITY_Finished()
	
	DestroyEntity("GOVERNOR1") 
	Display.SetFarClipPlaneMinAndMax(0, 0) 
	
	Interface_SetCinematicMode(0)
	CutsceneDone()
		
end