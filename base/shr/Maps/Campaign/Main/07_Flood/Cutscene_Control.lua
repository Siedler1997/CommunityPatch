----------------------------------
-- CUTSCENES
--
-- Map: 	07_Flood
-- Author: 	Ralf Angerbauer
-- Status: 	wip
----------------------------------


function Cheat_Intro_Start()
         StartCutscene("Intro")
end



function Cheat_Cutscene1_Start()
         StartCutscene("Cutscene1")
end



function Cheat_CutsceneComplete_Start()
         StartCutscene("CutsceneComplete")
end






-- Init scripting tables
-------------------------------------------------------------------------------------------------------------------------



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

	if CP_Difficulty == 0 then	 
        CreateEntity(4, Entities.PU_LeaderPoleArm1, GetPosition("CutsceneIntroSoldat1"), "CutsceneSoldat1" )
        CreateEntity(4, Entities.PU_LeaderSword1, GetPosition("CutsceneIntroSoldat2"), "CutsceneSoldat2" )
        CreateEntity(4, Entities.PU_LeaderPoleArm1, GetPosition("CutsceneIntroSoldat3"), "CutsceneSoldat3" )
        CreateEntity(4, Entities.PU_LeaderBow1, GetPosition("CutsceneIntroSoldat4"), "CutsceneSoldat4" )
        CreateEntity(4, Entities.PU_LeaderBow1, GetPosition("CutsceneIntroSoldat5"), "CutsceneSoldat5" )
        CreateEntity(4, Entities.PU_LeaderBow1, GetPosition("CutsceneIntroSoldat6"), "CutsceneSoldat6" )
        CreateEntity(4, Entities.PU_LeaderBow1, GetPosition("CutsceneIntroSoldat7"), "CutsceneSoldat7" )
        CreateEntity(4, Entities.PU_LeaderPoleArm1, GetPosition("CutsceneIntroSoldat8"), "CutsceneSoldat8" )
        CreateEntity(4, Entities.PU_LeaderPoleArm1, GetPosition("CutsceneIntroSoldat9"), "CutsceneSoldat9" )
        CreateEntity(4, Entities.PU_LeaderPoleArm1, GetPosition("CutsceneIntroSoldat10"), "CutsceneSoldat10" )
        CreateEntity(4, Entities.PU_LeaderSword1, GetPosition("CutsceneIntroSoldat11"), "CutsceneSoldat11" )
        CreateEntity(4, Entities.PU_LeaderSword1, GetPosition("CutsceneIntroSoldat12"), "CutsceneSoldat12" )
        CreateEntity(4, Entities.PU_LeaderSword1, GetPosition("CutsceneIntroSoldat13"), "CutsceneSoldat13" )
        CreateEntity(4, Entities.PU_LeaderBow1, GetPosition("CutsceneIntroSoldat14"), "CutsceneSoldat14" )
        CreateEntity(4, Entities.PU_LeaderBow1, GetPosition("CutsceneIntroSoldat15"), "CutsceneSoldat15" )
        CreateEntity(4, Entities.PU_LeaderBow1, GetPosition("CutsceneIntroSoldat16"), "CutsceneSoldat16" )
        CreateEntity(4, Entities.PU_LeaderBow1, GetPosition("CutsceneIntroSoldat17"), "CutsceneSoldat17" )
        CreateEntity(4, Entities.PU_LeaderPoleArm1, GetPosition("CutsceneIntroSoldat18"), "CutsceneSoldat18" )
        CreateEntity(4, Entities.PU_LeaderPoleArm1, GetPosition("CutsceneIntroSoldat19"), "CutsceneSoldat19" )
        CreateEntity(4, Entities.PU_LeaderSword1, GetPosition("CutsceneIntroSoldat20"), "CutsceneSoldat20" )
    else
        CreateEntity(4, Entities.PU_LeaderPoleArm2, GetPosition("CutsceneIntroSoldat1"), "CutsceneSoldat1" )
        CreateEntity(4, Entities.PU_LeaderSword2, GetPosition("CutsceneIntroSoldat2"), "CutsceneSoldat2" )
        CreateEntity(4, Entities.PU_LeaderPoleArm2, GetPosition("CutsceneIntroSoldat3"), "CutsceneSoldat3" )
        CreateEntity(4, Entities.PU_LeaderBow2, GetPosition("CutsceneIntroSoldat4"), "CutsceneSoldat4" )
        CreateEntity(4, Entities.PU_LeaderBow2, GetPosition("CutsceneIntroSoldat5"), "CutsceneSoldat5" )
        CreateEntity(4, Entities.PU_LeaderBow2, GetPosition("CutsceneIntroSoldat6"), "CutsceneSoldat6" )
        CreateEntity(4, Entities.PU_LeaderBow2, GetPosition("CutsceneIntroSoldat7"), "CutsceneSoldat7" )
        CreateEntity(4, Entities.PU_LeaderPoleArm2, GetPosition("CutsceneIntroSoldat8"), "CutsceneSoldat8" )
        CreateEntity(4, Entities.PU_LeaderPoleArm2, GetPosition("CutsceneIntroSoldat9"), "CutsceneSoldat9" )
        CreateEntity(4, Entities.PU_LeaderPoleArm2, GetPosition("CutsceneIntroSoldat10"), "CutsceneSoldat10" )
        CreateEntity(4, Entities.PU_LeaderSword2, GetPosition("CutsceneIntroSoldat11"), "CutsceneSoldat11" )
        CreateEntity(4, Entities.PU_LeaderSword2, GetPosition("CutsceneIntroSoldat12"), "CutsceneSoldat12" )
        CreateEntity(4, Entities.PU_LeaderSword2, GetPosition("CutsceneIntroSoldat13"), "CutsceneSoldat13" )
        CreateEntity(4, Entities.PU_LeaderBow2, GetPosition("CutsceneIntroSoldat14"), "CutsceneSoldat14" )
        CreateEntity(4, Entities.PU_LeaderBow2, GetPosition("CutsceneIntroSoldat15"), "CutsceneSoldat15" )
        CreateEntity(4, Entities.PU_LeaderBow2, GetPosition("CutsceneIntroSoldat16"), "CutsceneSoldat16" )
        CreateEntity(4, Entities.PU_LeaderBow2, GetPosition("CutsceneIntroSoldat17"), "CutsceneSoldat17" )
        CreateEntity(4, Entities.PU_LeaderPoleArm2, GetPosition("CutsceneIntroSoldat18"), "CutsceneSoldat18" )
        CreateEntity(4, Entities.PU_LeaderPoleArm2, GetPosition("CutsceneIntroSoldat19"), "CutsceneSoldat19" )
        CreateEntity(4, Entities.PU_LeaderSword2, GetPosition("CutsceneIntroSoldat20"), "CutsceneSoldat20" )
    end

--local i
--for i=1,20 do
--	local ID = GetID("CutsceneSoldat1"..i)
--	Logic.RotateEntity(ID, 180)

--end



end


function Cutscene_Intro_Text1()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Intro_Text1")
	
end

function Cutscene_Intro_Text2()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Intro_Text2")
	
end

function Cutscene_Intro_Text3()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Intro_Text3")
	
end

function Cutscene_Intro_Text4()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Intro_Text4")
	
end

function Cutscene_Intro_Text5()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Intro_Text5")
	
end

function Cutscene_Intro_Text6()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Intro_Text6")
	
end

function Cutscene_Intro_Text7()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Intro_Text7")
	
end

-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Intro_Finished()
	 Cutscene_Intro_End()
       
       DestroyEntity("CutsceneSoldat1") 
       DestroyEntity("CutsceneSoldat2") 
       DestroyEntity("CutsceneSoldat3") 
       DestroyEntity("CutsceneSoldat4") 
       DestroyEntity("CutsceneSoldat5") 
       DestroyEntity("CutsceneSoldat6") 
       DestroyEntity("CutsceneSoldat7") 
       DestroyEntity("CutsceneSoldat8") 
       DestroyEntity("CutsceneSoldat9") 
       DestroyEntity("CutsceneSoldat10")
       DestroyEntity("CutsceneSoldat11") 
       DestroyEntity("CutsceneSoldat12") 
       DestroyEntity("CutsceneSoldat13") 
       DestroyEntity("CutsceneSoldat14") 
       DestroyEntity("CutsceneSoldat15") 
       DestroyEntity("CutsceneSoldat16") 
       DestroyEntity("CutsceneSoldat17") 
       DestroyEntity("CutsceneSoldat18") 
       DestroyEntity("CutsceneSoldat19") 
       DestroyEntity("CutsceneSoldat20")       

--	 Mission_EndMovie()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Cancel()
 
	 Cutscene_Intro_End()

       DestroyEntity("CutsceneSoldat1") 
       DestroyEntity("CutsceneSoldat2") 
       DestroyEntity("CutsceneSoldat3") 
       DestroyEntity("CutsceneSoldat4") 
       DestroyEntity("CutsceneSoldat5") 
       DestroyEntity("CutsceneSoldat6") 
       DestroyEntity("CutsceneSoldat7") 
       DestroyEntity("CutsceneSoldat8") 
       DestroyEntity("CutsceneSoldat9") 
       DestroyEntity("CutsceneSoldat10")
       DestroyEntity("CutsceneSoldat11") 
       DestroyEntity("CutsceneSoldat12") 
       DestroyEntity("CutsceneSoldat13") 
       DestroyEntity("CutsceneSoldat14") 
       DestroyEntity("CutsceneSoldat15") 
       DestroyEntity("CutsceneSoldat16") 
       DestroyEntity("CutsceneSoldat17") 
       DestroyEntity("CutsceneSoldat18") 
       DestroyEntity("CutsceneSoldat19") 
       DestroyEntity("CutsceneSoldat20")
	  
--	 Mission_EndMovie()
end




-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_SetView()
    Display.SetFogColor (152,172,182)
    Display.SetFogStartAndEnd (5000, 10000)
    Display.SetRenderFog (1)
end

-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Intro_End()
 
	 Mission_EndMovie()
end


-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "Cutscene1"
--
-----------------------------------------------------------------------------------------------------------------------	

function Cutscene_Cutscene1_Init()
	 Mission_InitMovie()    
end


-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Cutscene1_Start()
	 Cutscene_Cutscene1_Init()

--	CreateEntity(1, Entities.PU_Hero5, GetPosition("Cutscene1AriSpawn"), "Ari" )  
--	CreateEntity(3, Entities.PU_LeaderPoleArm1, GetPosition("Cutscene1Guard1Spawn"), "Cutscene1Guard1" )
--	CreateEntity(3, Entities.PU_LeaderPoleArm1, GetPosition("Cutscene1Guard2Spawn"), "Cutscene1Guard2" )
	 
	
       	CreateEntity(7, Entities.CU_BanditLeaderSword1, GetPosition("CutsceneCutscene1Outlaw3"), "CutsceneOutlaw3" )  
       	CreateEntity(7, Entities.CU_BanditLeaderSword1, GetPosition("CutsceneCutscene1Outlaw2"), "CutsceneOutlaw2" )
       	CreateEntity(7, Entities.CU_BanditLeaderBow1, GetPosition("CutsceneCutscene1Outlaw1"), "CutsceneOutlaw1" )		
          			
--     		local ID = GetID("CutsceneCutscene1Ari")
--			Logic.RotateEntity(ID, 270)
		   
      
      
      
              
end

function Cutscene_Cutscene1_Move2()
-- Ari + 2 Guards 
       	 Move ("Ari", "spawnAri")
       	 Move ("Cutscene1Guard1", "Cutscene1Guard1Target")
      	 Move ("Cutscene1Guard2", "Cutscene1Guard2Target")
      	 
end
	
function Cutscene_Cutscene1_Move3()
-- guards back in HQ

       	 Move ("Cutscene1Guard1", "Cutscene1GuardsExit")
      	 Move ("Cutscene1Guard2", "Cutscene1GuardsExit")
end	 

function Cutscene_Cutscene1_Move()
-- Ari's Outlaws
       	 Move ("CutsceneOutlaw1", "CutsceneCutscene1MoveOutlaw1")
       	 Move ("CutsceneOutlaw2", "CutsceneCutscene1MoveOutlaw2")
      	 Move ("CutsceneOutlaw3", "CutsceneCutscene1MoveOutlaw3")
end

function Cutscene_Cutscene1_destroy()

	 DestroyEntity("Cutscene1Guard1") 
	 DestroyEntity("Cutscene1Guard2") 
end

function Cutscene_Cutscene1_RotateOutlaws()
       local ID = GetID("CutsceneOutlaw1")
	Logic.RotateEntity(ID, 180)
       local ID = GetID("CutsceneOutlaw2")
	Logic.RotateEntity(ID, 180)
       local ID = GetID("CutsceneOutlaw3")
	Logic.RotateEntity(ID, 180)
end


-------------------------------------------------------------------------------------------------------------------------

function Cutscene_Cutscene1_Finished()
	 Mission_EndMovie()
	 	  
	 DestroyEntity("CutsceneOutlaw1") 
	 DestroyEntity("CutsceneOutlaw2")
	 DestroyEntity("CutsceneOutlaw3")
--	 DestroyEntity("CutsceneCutscene1Ari")
	 
	 
	 
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Cutscene1_Cancel()
	 Mission_EndMovie()
	 
	 DestroyEntity("CutsceneOutlaw1") 
	 DestroyEntity("CutsceneOutlaw2")
	 DestroyEntity("CutsceneOutlaw3")
--	 DestroyEntity("CutsceneCutscene1Ari")
	 
	
end





function Cutscene_Cutscene1_Text1()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Cutscene1_Text1")
	
end


function Cutscene_Cutscene1_Text2()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Cutscene1_Text2")
	
end

function Cutscene_Cutscene1_Text3()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Cutscene1_Text3")
	
end


function Cutscene_Cutscene1_Text4()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Cutscene1_Text4")
	
end


function Cutscene_Cutscene1_Text5()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Cutscene1_Text5")
	
end


function Cutscene_Cutscene1_Text6()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Cutscene1_Text6")
	
end


function Cutscene_Cutscene1_Text7()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Cutscene1_Text7")
	
end

-------------------------------------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------------------------------	
--
--	EXTRO-CUTSCENE: "CutsceneComplete"
--
-----------------------------------------------------------------------------------------------------------------------	

  function Cutscene_CutsceneComplete_Start()
	   Mission_InitMovie()    

       DestroyEntity("Dario") 
--        DestroyEntity("Pilgrim") 
--         DestroyEntity("Salim") 
          DestroyEntity("Ari") 
           DestroyEntity("Helias") 
--          DestroyEntity("Kerberos") 
             DestroyEntity("Erec")
          
       CreateEntity(1, Entities.PU_Hero6, GetPosition("CutsceneExtroHelias"), "CutsceneExtroHelias" )   
       CreateEntity(1, Entities.PU_Hero4, GetPosition("CutsceneExtroErec"), "CutsceneExtroErec" )
       CreateEntity(1, Entities.PU_Hero1b, GetPosition("CutsceneExtroDario"), "CutsceneExtroDario" )	
       CreateEntity(1, Entities.PU_Hero5, GetPosition("CutsceneExtroAri"), "CutsceneExtroAri" )  

--- 2. sequence ari allein

       CreateEntity(1, Entities.PU_Hero5, GetPosition("CutsceneExtroAri2"), "CutsceneExtroAri2" )  
       CreateEntity(1, Entities.PU_Hero1b, GetPosition("CutsceneExtroDario2"), "CutsceneExtroDario2" )	
       
       local ID = GetID("CutsceneExtroDario2")
	Logic.RotateEntity(ID, 90)
       
end


	 

function Cutscene_CutsceneComplete_Move()

       	 Move ("CutsceneExtroErec", "CutsceneExtroMoveErec")
       	 Move ("CutsceneExtroDario", "CutsceneExtroMoveDario")
       	 Move ("CutsceneExtroAri", "CutsceneExtroMoveAri")
         Move ("CutsceneExtroHelias", "CutsceneExtroMoveHelias")
 
end       

	 

function Cutscene_CutsceneComplete_Move2()

       	 Move ("CutsceneExtroAri2", "CutsceneExtroMove2Ari")
 
end       

function Cutscene_CutsceneComplete_Text1()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Extro_Text1")
	
end



function Cutscene_CutsceneComplete_Text2()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Extro_Text2")
	
end




function Cutscene_CutsceneComplete_Text3()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Extro_Text3")
	
end



function Cutscene_CutsceneComplete_Text4()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Extro_Text4")
	
end



function Cutscene_CutsceneComplete_Text5()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Extro_Text5")
	
end



function Cutscene_CutsceneComplete_Text6()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Extro_Text6")
	
end


function Cutscene_CutsceneComplete_Text7()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Extro_Text7")
	
end


function Cutscene_CutsceneComplete_Text8()
	 SpokenCinematicText("CM01_07_Flood/Cutscene_Extro_Text8")
	
end
-------------------------------------------------------------------------------------------------------------------------


function Cutscene_CutsceneComplete_Finished()
	Mission_EndMovie()	
end


-------------------------------------------------------------------------------------------------------------------------


function Cutscene_CutsceneComplete_Cancel()
	Mission_EndMovie()	
end


--*********************************************************************************************
function Mission_InitMovie()
	
--	Display.SetRenderUseGfxSets(0)
--	Display.SetFogColor (152,172,182)
	Display.SetFogStartAndEnd (1000, 8000)

	Display.SetRenderFog (1)

	Display.SetFarClipPlaneMinAndMax(0, 12000) 

--	Display_SetSummerValues()

	Logic.StopPrecipitation()

	Interface_SetCinematicMode(1)
 
end
 
function Mission_EndMovie()
	Logic.StopPrecipitation()

	-- disable Cutscene mode

	Display.SetRenderUseGfxSets(1)

	Interface_SetCinematicMode(0)
--	Display_SetDefaultValues()
	Display.SetFarClipPlaneMinAndMax(0, 12000) 

	CutsceneDone()
end

