----------------------------------
-- CUTSCENES
--
-- Map: 	19_Wasteland
-- Author: 	Ralf Angerbauer
-- Status: 	wip
----------------------------------


function Cheat_Intro_Start()
         Cutscene.Start("Intro")

        
end

function Cheat_MissionComplete_Start()
         Cutscene.Start("MissionComplete")
end




-- Init scripting tables
-------------------------------------------------------------------------------------------------------------------------

Cutscene1 = {}
Cutscene2 = {}

Cutscene1.dummy1 = 0
Cutscene1.dummy2 = 0


-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "INTRO"
--
-----------------------------------------------------------------------------------------------------------------------	
function Cutscene_Intro_Init()
	 Mission_InitMovie()     
	 
end


-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Start()
	 Cutscene_Intro_Init()
             

       DestroyEntity("Dario") 
       DestroyEntity("Pilgrim") 
         DestroyEntity("Salim") 
          DestroyEntity("Ari") 
            DestroyEntity("Erec")

       CreateEntity(1, Entities.PU_Hero4, GetPosition("CutsceneIntroErec"), "CutsceneErec" )
       CreateEntity(1, Entities.PU_Hero1c, GetPosition("CutsceneIntroDario"), "CutsceneDario" )
       CreateEntity(1, Entities.PU_Hero2, GetPosition("CutsceneIntroPilgrim"), "CutscenePilgrim" )
       CreateEntity(1, Entities.PU_Hero3, GetPosition("CutsceneIntroSalim"), "CutsceneSalim" )
       CreateEntity(1, Entities.PU_Hero5, GetPosition("CutsceneIntroAri"), "CutsceneAri" )       
       CreateEntity(1, Entities.PU_Hero6, GetPosition("CutsceneIntroHelias"), "CutsceneHelias" )
    
    
    
       CreateEntity(1, Entities.PU_Hero4, GetPosition("CutsceneIntro2Erec"), "Erec" )
       CreateEntity(1, Entities.PU_Hero1c, GetPosition("CutsceneIntro2Dario"), "Dario" )
       CreateEntity(1, Entities.PU_Hero2, GetPosition("CutsceneIntro2Pilgrim"), "Pilgrim" )
       CreateEntity(1, Entities.PU_Hero3, GetPosition("CutsceneIntro2Salim"), "Salim" )
       CreateEntity(1, Entities.PU_Hero5, GetPosition("CutsceneIntro2Ari"), "Ari" )       
       CreateEntity(1, Entities.PU_Hero6, GetPosition("CutsceneIntro2Helias"), "Helias" )
       CreateEntity(1, Entities.PU_Serf, GetPosition("CutsceneIntro2Serf"), "CutsceneSerf2" )
    
    
    
end
	 

function Cutscene_Intro_Move()

       	 Move ("CutsceneErec", "CutsceneIntroMoveErec")
       	 Move ("CutsceneDario", "CutsceneIntroMoveDario")
         Move ("CutsceneSalim", "CutsceneIntroMoveSalim")
         Move ("CutscenePilgrim", "CutsceneIntroMovePilgrim")
       	 Move ("CutsceneAri", "CutsceneIntroMoveAri")
         Move ("CutsceneHelias", "CutsceneIntroMoveHelias")
         
end       	 
 


	 

function Cutscene_Intro_Move2()

       	 Move ("Erec", "CutsceneIntro2MoveErec")
       	 Move ("Dario", "CutsceneIntro2MoveDario")
         Move ("Salim", "CutsceneIntro2MoveSalim")
         Move ("Pilgrim", "CutsceneIntro2MovePilgrim")
       	 Move ("Ari", "CutsceneIntro2MoveAri")
         Move ("Helias", "CutsceneIntro2MoveHelias")
         Move ("CutsceneSerf2", "CutsceneIntro2MoveSerf")
         Logic.EntityLookAt("Dario","CutsceneIntro2MoveSerf")
end       




function Cutscene_Intro_Text1()
	 SpokenCinematicText("CM01_19_Wasteland_Txt/Cutscene_Intro_Text1")
	
end



function Cutscene_Intro_Text2()
	 SpokenCinematicText("CM01_19_Wasteland_Txt/Cutscene_Intro_Text2")
	
end


function Cutscene_Intro_Text3()
	 SpokenCinematicText("CM01_19_Wasteland_Txt/Cutscene_Intro_Text3")
	
end


function Cutscene_Intro_Text4()
	 SpokenCinematicText("CM01_19_Wasteland_Txt/Cutscene_Intro_Text4")
	
end



function Cutscene_Intro_Text5()
	 SpokenCinematicText("CM01_19_Wasteland_Txt/Cutscene_Intro_Text5")
	
end

-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Intro_Finished()
	 Cutscene_Intro_End()
	
       DestroyEntity("CutsceneDario") 
        DestroyEntity("CutscenePilgrim") 
         DestroyEntity("CutsceneSalim") 
          DestroyEntity("CutsceneAri") 
           DestroyEntity("CutsceneHelias") 
             DestroyEntity("CutsceneErec")

	
--       DestroyEntity("Dario") 
--       DestroyEntity("Pilgrim") 
--         DestroyEntity("Salim") 
--          DestroyEntity("Ari") 
--           DestroyEntity("CutsceneHelias2") 
--            DestroyEntity("Erec")
	     DestroyEntity("CutsceneSerf2")

  	 CutsceneDone()
  	 local Start = Logic.GetEntityIDByName("Dario")
	local StartPos_x, StartPos_y, StartPos_z = Logic.EntityGetPos(Start)		
	Camera.ScrollGameTimeSynced(StartPos_x, StartPos_y)

end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Cancel()
 	 Cutscene_Intro_End()
	 
	 	
       DestroyEntity("CutsceneDario") 
        DestroyEntity("CutscenePilgrim") 
         DestroyEntity("CutsceneSalim") 
          DestroyEntity("CutsceneAri") 
           DestroyEntity("CutsceneHelias") 
             DestroyEntity("CutsceneErec")


	
--       DestroyEntity("Dario") 
--        DestroyEntity("Pilgrim") 
--         DestroyEntity("Salim") 
--         DestroyEntity("Ari") 
--           DestroyEntity("CutsceneHelias2") 
--            DestroyEntity("Erec")
             DestroyEntity("CutsceneSerf2")

	   CutsceneDone() 
	 local Start = Logic.GetEntityIDByName("Dario")
	local StartPos_x, StartPos_y, StartPos_z = Logic.EntityGetPos(Start)		
	Camera.ScrollGameTimeSynced(StartPos_x, StartPos_y)
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_SetView()
--    Display.SetFogColor (152,172,182)
--    Display.SetFogStartAndEnd (5000, 10000)
--    Display.SetRenderFog (1)
end

-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Intro_End()
 
	 Mission_EndMovie()
end

-----------------------------------------------------------------------------------------------------------------------	
--
--	EXTRO-CUTSCENE: "MissionComplete"
--
-----------------------------------------------------------------------------------------------------------------------	

  function Cutscene_MissionComplete_Start()
	Mission_InitMovie()    

       DestroyEntity("Dario") 
        DestroyEntity("Pilgrim") 
         DestroyEntity("Salim") 
          DestroyEntity("Ari") 
           DestroyEntity("Helias") 
             DestroyEntity("Erec")

 
 
  
       CreateEntity(1, Entities.PU_Hero4, GetPosition("CutsceneExtroErec"), "CutsceneExtroErec" )
       CreateEntity(1, Entities.PU_Hero1c, GetPosition("CutsceneExtroDario"), "CutsceneExtroDario" )
       CreateEntity(1, Entities.PU_Hero2, GetPosition("CutsceneExtroPilgrim"), "CutsceneExtroPilgrim" )
       CreateEntity(1, Entities.PU_Hero3, GetPosition("CutsceneExtroSalim"), "CutsceneExtroSalim" )
       CreateEntity(1, Entities.PU_Hero5, GetPosition("CutsceneExtroAri"), "CutsceneExtroAri" )       
       CreateEntity(1, Entities.PU_Hero6, GetPosition("CutsceneExtroHelias"), "CutsceneExtroHelias" )
    

         
end



	 

function Cutscene_MissionComplete_Move3()

       	 Move ("CutsceneExtroErec", "CutsceneExtroMoveErec")
       	 Move ("CutsceneExtroDario", "CutsceneExtroMoveDario")
         Move ("CutsceneExtroSalim", "CutsceneExtroMoveSalim")
         Move ("CutsceneExtroPilgrim", "CutsceneExtroMovePilgrim")
       	 Move ("CutsceneExtroAri", "CutsceneExtroMoveAri")
         Move ("CutsceneExtroHelias", "CutsceneExtroMoveHelias")

end       






function Cutscene_MissionComplete_Text1()
	 SpokenCinematicText("CM01_19_Wasteland_Txt/Cutscene_Extro_Text1")
	
end

function Cutscene_MissionComplete_Text2()
	 SpokenCinematicText("CM01_19_Wasteland_Txt/Cutscene_Extro_Text2")
	
end


function Cutscene_MissionComplete_Text3()
	 SpokenCinematicText("CM01_19_Wasteland_Txt/Cutscene_Extro_Text3")
	
end

function Cutscene_MissionComplete_Text4()
	 SpokenCinematicText("CM01_19_Wasteland_Txt/Cutscene_Extro_Text4")
	
end


function Cutscene_MissionComplete_Text5()
	 SpokenCinematicText("CM01_19_Wasteland_Txt/Cutscene_Extro_Text5")
	
end


function Cutscene_MissionComplete_Text6()
	 SpokenCinematicText("CM01_19_Wasteland_Txt/Cutscene_Extro_Text6")
	
end

-------------------------------------------------------------------------------------------------------------------------


function Cutscene_MissionComplete_Finished()
	Logic.StopPrecipitation()
	Mission_EndMovie()	
end


-------------------------------------------------------------------------------------------------------------------------


function Cutscene_MissionComplete_Cancel()
	Logic.StopPrecipitation()
	Mission_EndMovie()	
end



-------------------------------------------------------------------------------------------------------------------------





--*********************************************************************************************
function Mission_InitMovie()
	
--	Display.SetRenderUseGfxSets(0)

    --Display.SetFogColor (152,172,182)
    Display.SetFogStartAndEnd (1000, 10000)--1000,10000
    Display.SetRenderFog (1)

	Display.SetFarClipPlaneMinAndMax(0, 16000) 

	--Display_SetSummerValues()

	Logic.StopPrecipitation()

	Interface_SetCinematicMode(1)
 
end

function Mission_EndMovie()
	Logic.StopPrecipitation()
	-- disable Cutscene mode
	Display.SetRenderUseGfxSets(1)

	Interface_SetCinematicMode(0)
	--Display_SetDefaultValues()
	Display.SetFarClipPlaneMinAndMax(0, 0) --0,12000
	CutsceneDone()
	
end

