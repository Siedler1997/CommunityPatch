-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "INTRO"
--
-----------------------------------------------------------------------------------------------------------------------	

function Cutscene_INTRO_Start()
	Interface_SetCinematicMode(1)
	
	CreateEntity(1, Entities.CU_Hero10, GetPosition("CUTSCENE_QUINTOS"), "QUINTOS" )
    CreateEntity(1, Entities.PU_Travelling_Salesman, GetPosition("CUTSCENE_TRADER"), "TRADER" )
    
    Display.SetFogStartAndEnd (5000, 15000)
  	Display.SetRenderFog (1)
	Display.SetFarClipPlaneMinAndMax(0, 40000) 
        
     
end



function Cutscene_INTRO_Text01()
	 SpokenCinematicText("CM02_04_TradingCaravans/CUTSCENE_INTRO_TEXT01")
	
end


function Cutscene_INTRO_Text02()
	 SpokenCinematicText("CM02_04_TradingCaravans/CUTSCENE_INTRO_TEXT02")
	
end


function Cutscene_INTRO_Text03()
	 SpokenCinematicText("CM02_04_TradingCaravans/CUTSCENE_INTRO_TEXT03")
	
end


function Cutscene_INTRO_Text04()
	 SpokenCinematicText("CM02_04_TradingCaravans/CUTSCENE_INTRO_TEXT04")
	
end

function Cutscene_INTRO_Text05()
	 SpokenCinematicText("CM02_04_TradingCaravans/CUTSCENE_INTRO_TEXT05")
	
end

function Cutscene_INTRO_Text06()
	 SpokenCinematicText("CM02_04_TradingCaravans/CUTSCENE_INTRO_TEXT06")
	
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_INTRO_Cancel()
	Cutscene_INTRO_Finished()
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_INTRO_Finished()
	
	DestroyEntity("QUINTOS") 
	DestroyEntity("TRADER") 
	
	Interface_SetCinematicMode(0)
	
	Display.SetFarClipPlaneMinAndMax(0, 0) 
	CutsceneDone()
	
	
	
	
end