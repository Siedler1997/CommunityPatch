----------------------------------
-- CUTSCENES
--
-- Map: 	06_Cleycourt
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
	 
CreateEntity(3, Entities.PU_LeaderPoleArm1, GetPosition("CutsceneIntroSoldat1"), "CutsceneSoldat1" )
 CreateEntity(3, Entities.PU_LeaderPoleArm1, GetPosition("CutsceneIntroSoldat2"), "CutsceneSoldat2" )
  CreateEntity(3, Entities.PU_LeaderPoleArm1, GetPosition("CutsceneIntroSoldat3"), "CutsceneSoldat3" )
   CreateEntity(3, Entities.PU_LeaderBow1, GetPosition("CutsceneIntroSoldat4"), "CutsceneSoldat4" )
    CreateEntity(3, Entities.PU_LeaderBow1, GetPosition("CutsceneIntroSoldat5"), "CutsceneSoldat5" )
     CreateEntity(3, Entities.PU_LeaderBow1, GetPosition("CutsceneIntroSoldat6"), "CutsceneSoldat6" )
      CreateEntity(3, Entities.PU_LeaderBow1, GetPosition("CutsceneIntroSoldat7"), "CutsceneSoldat7" )
       CreateEntity(3, Entities.PU_LeaderPoleArm1, GetPosition("CutsceneIntroSoldat8"), "CutsceneSoldat8" )
        CreateEntity(3, Entities.PU_LeaderPoleArm1, GetPosition("CutsceneIntroSoldat9"), "CutsceneSoldat9" )
     
          
     		local ID = GetID("CutsceneSoldat1")
			Logic.RotateEntity(ID, 180)
		
			local ID = GetID("CutsceneSoldat2")
		Logic.RotateEntity(ID, 180)
		
			local ID = GetID("CutsceneSoldat3")
		Logic.RotateEntity(ID, 180)
		
			local ID = GetID("CutsceneSoldat4")
		Logic.RotateEntity(ID, 180)
		
			local ID = GetID("CutsceneSoldat5")
		Logic.RotateEntity(ID, 180)
		
			local ID = GetID("CutsceneSoldat6")
		Logic.RotateEntity(ID, 180)
		
			local ID = GetID("CutsceneSoldat7")
		Logic.RotateEntity(ID, 180)
		
			local ID = GetID("CutsceneSoldat8")
		Logic.RotateEntity(ID, 180)
		
			local ID = GetID("CutsceneSoldat9")
		Logic.RotateEntity(ID, 180)
     
end


function Cutscene_Intro_Text1()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Intro_Text1")
	
end

function Cutscene_Intro_Text2()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Intro_Text2")
	
end

function Cutscene_Intro_Text3()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Intro_Text3")
	
end

function Cutscene_Intro_Text4()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Intro_Text4")
	
end

function Cutscene_Intro_Text5()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Intro_Text5")
	
end

function Cutscene_Intro_Text6()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Intro_Text6")
	
end

function Cutscene_Intro_Text7()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Intro_Text7")
	
end


function Cutscene_Intro_Text8()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Intro_Text8")
	
end


function Cutscene_Intro_Text9()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Intro_Text9")
	
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
end



-------------------------------------------------------------------------------------------------------------------------

function Cutscene_Cutscene1_Finished()
	 Mission_EndMovie()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Cutscene1_Cancel()
	 Mission_EndMovie()
end





function Cutscene_Cutscene1_Text1()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene1_Text1")
	
end


function Cutscene_Cutscene1_Text2()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene1_Text2")
	
end

function Cutscene_Cutscene1_Text3()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene1_Text3")
	
end


function Cutscene_Cutscene1_Text4()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene1_Text4")
	
end


function Cutscene_Cutscene1_Text5()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene1_Text5")
	
end


function Cutscene_Cutscene1_Text6()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene1_Text6")
	
end


function Cutscene_Cutscene1_Text7()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene1_Text7")
	
end



-------------------------------------------------------------------------------------------------------------------------
--
--      Cutscene2
--
--------------------------------------------------




function Cutscene_Cutscene2_Init()
	 Mission_InitMovie()    
end


-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Cutscene2_Start()
	 Cutscene_Cutscene2_Init()
end



-------------------------------------------------------------------------------------------------------------------------

function Cutscene_Cutscene2_Finished()
	 Mission_EndMovie()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Cutscene2_Cancel()
	 Mission_EndMovie()
end





function Cutscene_Cutscene2_Text1()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene2_Text1")
	
end


function Cutscene_Cutscene2_Text2()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene2_Text2")
	
end

function Cutscene_Cutscene2_Text3()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene2_Text3")
	
end


function Cutscene_Cutscene2_Text4()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene2_Text4")
	
end


function Cutscene_Cutscene2_Text5()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene2_Text5")
	
end


function Cutscene_Cutscene2_Text6()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene2_Text6")
	
end


-------------------------------------------------------------------------------------------------------------------------
--
--      Cutscene3
--
--------------------------------------------------




function Cutscene_Cutscene3_Init()
	 Mission_InitMovie()    
end


-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Cutscene3_Start()
	 Cutscene_Cutscene3_Init()
	 
	 CreateEntity(8, Entities.PU_Hero5, GetPosition("CutsceneCutscene3Ari"), "Cutscene3Ari" ) 
	 CreateEntity(8, Entities.CU_BanditLeaderSword1, GetPosition("CutsceneCutscene3AriLeader1"), "Cutscene3AriLeader1" ) 
	 CreateEntity(8, Entities.CU_BanditLeaderSword1, GetPosition("CutsceneCutscene3AriLeader2"), "Cutscene3AriLeader2" ) 
	 CreateEntity(8, Entities.CU_BanditLeaderBow1, GetPosition("CutsceneCutscene3AriLeader3"), "Cutscene3AriLeader3" ) 
	 CreateEntity(8, Entities.CU_BanditLeaderBow1, GetPosition("CutsceneCutscene3AriLeader4"), "Cutscene3AriLeader4" ) 
	 CreateEntity(8, Entities.CU_LeaderOutlaw1, GetPosition("CutsceneCutscene3AriLeader5"), "Cutscene3AriLeader5" ) 

     	local ID = GetID("Cutscene3Ari")
	Logic.RotateEntity(ID, 180)
     	local ID = GetID("Cutscene3AriLeader1")
	Logic.RotateEntity(ID, 180)
     	local ID = GetID("Cutscene3AriLeader2")
	Logic.RotateEntity(ID, 180)
     	local ID = GetID("Cutscene3AriLeader3")
	Logic.RotateEntity(ID, 180)
     	local ID = GetID("Cutscene3AriLeader4")
	Logic.RotateEntity(ID, 180)
     	local ID = GetID("Cutscene3AriLeader5")
	Logic.RotateEntity(ID, 180)



------------------Drehen von Ari-----------------------
	 
--	      	local ID = GetID("Cutscene3Ari")
--		Logic.RotateEntity(ID, 270)

end




function Cutscene_Cutscene3_Move()

       	 Move ("Cutscene3Ari", "CutsceneCutscene3MoveAri")
      		 Move ("Cutscene3AriLeader1", "CutsceneCutscene3MoveAriLeader1")
      		 Move ("Cutscene3AriLeader2", "CutsceneCutscene3MoveAriLeader2")
      		 Move ("Cutscene3AriLeader3", "CutsceneCutscene3MoveAriLeader3")
      		 Move ("Cutscene3AriLeader4", "CutsceneCutscene3MoveAriLeader4")
      		 Move ("Cutscene3AriLeader5", "CutsceneCutscene3MoveAriLeader5")
end       	 
 

-------------------------------------------------------------------------------------------------------------------------

function Cutscene_Cutscene3_Finished()
	 Mission_EndMovie()
	 
	 DestroyEntity("Cutscene3Ari")
	 DestroyEntity("Cutscene3AriLeader1")
	 DestroyEntity("Cutscene3AriLeader2")
	 DestroyEntity("Cutscene3AriLeader3")
	 DestroyEntity("Cutscene3AriLeader4")
	 DestroyEntity("Cutscene3AriLeader5")
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Cutscene3_Cancel()
	 Mission_EndMovie()
	 	
	 DestroyEntity("Cutscene3Ari")
	 DestroyEntity("Cutscene3AriLeader1")
	 DestroyEntity("Cutscene3AriLeader2")
	 DestroyEntity("Cutscene3AriLeader3")
	 DestroyEntity("Cutscene3AriLeader4")
	 DestroyEntity("Cutscene3AriLeader5")
end





function Cutscene_Cutscene3_Text1()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene3_Text1")
	
end


function Cutscene_Cutscene3_Text2()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene3_Text2")
	
end

function Cutscene_Cutscene3_Text3()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene3_Text3")
	
end


function Cutscene_Cutscene3_Text4()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene3_Text4")
	
end


function Cutscene_Cutscene3_Text5()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene3_Text5")
	
end

-------------------------------------------------------------------------------------------------------------------------
--
--      Cutscene4
--
--------------------------------------------------




function Cutscene_Cutscene4_Init()
	 Mission_InitMovie()    
end


-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Cutscene4_Start()
	 Cutscene_Cutscene4_Init()
	 

CreateEntity(3, Entities.PU_LeaderPoleArm1, GetPosition("CutsceneCutscene4Soldat1"), "Cutscene4Soldat1" )
 CreateEntity(3, Entities.PU_LeaderPoleArm1, GetPosition("CutsceneCutscene4Soldat2"), "Cutscene4Soldat2" )
  CreateEntity(3, Entities.PU_LeaderPoleArm1, GetPosition("CutsceneCutscene4Soldat3"), "Cutscene4Soldat3" )
   CreateEntity(3, Entities.PU_LeaderBow1, GetPosition("CutsceneCutscene4Soldat4"), "Cutscene4Soldat4" )

	 CreateEntity(8, Entities.PU_Hero5, GetPosition("AriBack"), "Cutscene4Ari" ) 

	     		local ID = GetID("Cutscene4Ari")
			Logic.RotateEntity(ID, 180)

	 
	DestroyEntity("AriLeader1")
	DestroyEntity("AriLeader2")
	DestroyEntity("AriLeader3")
	DestroyEntity("AriLeader4")
	DestroyEntity("AriLeader5")
end

function Cutscene_Cutscene4_Move()


       	 Move ("Cutscene4Soldat1", "CutsceneCutscene4MoveSoldat1")
       	 Move ("Cutscene4Soldat2", "CutsceneCutscene4MoveSoldat2")       	 
       	 Move ("Cutscene4Soldat3", "CutsceneCutscene4MoveSoldat3")       	 
       	 Move ("Cutscene4Soldat4", "CutsceneCutscene4MoveSoldat4")
	     		local ID = GetID("Cutscene4Ari")
			Logic.RotateEntity(ID, 0)
       	        	 
end       	 
 
function Cutscene_Cutscene4_Move2()


       	 Move ("Cutscene4Soldat1", "CutsceneCutscene4MoveSoldat1Target")
       	 Move ("Cutscene4Soldat2", "CutsceneCutscene4MoveSoldat2Target")       	 
       	        	 
end       	 
 

-------------------------------------------------------------------------------------------------------------------------

function Cutscene_Cutscene4_Finished()
	 Mission_EndMovie()
	 
	 
       DestroyEntity("Cutscene4Soldat1") 
       DestroyEntity("Cutscene4Soldat2") 
       DestroyEntity("Cutscene4Soldat3") 
       DestroyEntity("Cutscene4Soldat4") 
	DestroyEntity("Cutscene4Ari") 
 
	 
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Cutscene4_Cancel()
	 Mission_EndMovie()
	 
       DestroyEntity("Cutscene4Soldat1") 
       DestroyEntity("Cutscene4Soldat2") 
       DestroyEntity("Cutscene4Soldat3") 
       DestroyEntity("Cutscene4Soldat4") 
	DestroyEntity("Cutscene4Ari") 
	 
	 
end





function Cutscene_Cutscene4_Text1()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene4_Text1")
	
end


function Cutscene_Cutscene4_Text2()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene4_Text2")
	
end

function Cutscene_Cutscene4_Text3()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene4_Text3")
	
end


function Cutscene_Cutscene4_Text4()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene4_Text4")
	
end


function Cutscene_Cutscene4_Text5()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene4_Text5")
	
end


function Cutscene_Cutscene4_Text6()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Cutscene4_Text6")
	
end



-----------------------------------------------------------------------------------------------------------------------	
--
--	EXTRO-CUTSCENE: "CutsceneComplete"
--
-----------------------------------------------------------------------------------------------------------------------	

  function Cutscene_CutsceneComplete_Start()
	   Mission_InitMovie()    

       DestroyEntity("Dario") 
  --      DestroyEntity("Pilgrim") 
  --       DestroyEntity("Salim") 
   --       DestroyEntity("Ari") 
           DestroyEntity("Helias") 
    --        DestroyEntity("Kerberos") 
             DestroyEntity("Erec")
	   
                  
       CreateEntity(1, Entities.PU_Hero4, GetPosition("CutsceneExtroErec"), "CutsceneErec" )
       CreateEntity(1, Entities.PU_Hero1b, GetPosition("CutsceneExtroDario"), "CutsceneDario" )
       CreateEntity(1, Entities.PU_Hero6, GetPosition("CutsceneExtroAri"), "CutsceneAri" )  
end	 


function Cutscene_CutsceneComplete_Text1()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Extro_Text1")

	WEATHERMACHINE_ID 		= Logic.GetEntityIDByName("Weathermachine") 
	local X,Y 				= Logic.EntityGetPos(WEATHERMACHINE_ID)

	Logic.DestroyEntity(WEATHERMACHINE_ID)	

	WEATHERMACHINE_ID = Logic.CreateEntity(Entities.PB_Weathermachine_Activated, X,Y,345.7, 8)				
	Logic.SetBuildingSubAnim(WEATHERMACHINE_ID, 0, "PB_Weathermachine_Activated_600")
end



function Cutscene_CutsceneComplete_Text2()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Extro_Text2")
	
end




function Cutscene_CutsceneComplete_Text3()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Extro_Text3")
	
end



function Cutscene_CutsceneComplete_Text4()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Extro_Text4")
	
end



function Cutscene_CutsceneComplete_Text5()
	 SpokenCinematicText("CM01_06_Cleycourt_Txt/Cutscene_Extro_Text5")
	
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

