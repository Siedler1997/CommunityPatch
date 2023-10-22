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


   CreateEntity(1, Entities.PU_Hero1c, GetPosition("CUTSCENE_INTRO_D1"), "D1" )

   --CreateEntity(1, Entities.PU_LeaderSword2, GetPosition("CUTSCENE_INTRO_S1"), "S1" )

   CreateEntity(1, Entities.PU_LeaderSword2, GetPosition("CUTSCENE_INTRO_S2"), "S2" )

   --CreateEntity(1, Entities.PU_LeaderSword2, GetPosition("CUTSCENE_INTRO_S3"), "S3" )

   CreateEntity(1, Entities.PU_LeaderSword2, GetPosition("CUTSCENE_INTRO_S4"), "S4" )


end

 


function Cutscene_INTRO_MOVE01()     

      Move("D1", "CUTSCENE_INTRO_E3")
      --Move("S1", "CUTSCENE_INTRO_E1")
      --Move("S3", "CUTSCENE_INTRO_E2")
      Move("S4", "CUTSCENE_INTRO_E3")
      Move("S2", "CUTSCENE_INTRO_E3")
end

  function Cutscene_INTRO_TEXT01()
	 SpokenCinematicText("CM06_02_DefendingTheDryMoat/CUTSCENES_INTRO_TEXT01")
	
  end



  function Cutscene_INTRO_TEXT02()
	 SpokenCinematicText("CM06_02_DefendingTheDryMoat/CUTSCENES_INTRO_TEXT02")
	
  end



  function Cutscene_INTRO_TEXT03()
	 SpokenCinematicText("CM06_02_DefendingTheDryMoat/CUTSCENES_INTRO_TEXT03")
	
  end



  function Cutscene_INTRO_TEXT04()
	 SpokenCinematicText("CM06_02_DefendingTheDryMoat/CUTSCENES_INTRO_TEXT04")
	
  end


-------------------------------------------------------------------------------------------------------------------------
function Cutscene_INTRO_Cancel()
	 Cutscene_INTRO_Finished()
	
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_INTRO_Finished()
	

	 DestroyEntity("D1")
	
	CreateEntity(1, Entities.PU_Hero1c, GetPosition("CUTSCENE_INTRO_E3"), "Dario" )

	 --DestroyEntity("S1") 

	 DestroyEntity("S2") 

	 --DestroyEntity("S3") 

	 DestroyEntity("S4") 

 CreateEntity(1, Entities.PU_LeaderSword2, GetPosition("lead1"), "S1" )
  CreateEntity(1, Entities.PU_LeaderSword2, GetPosition("lead2"), "S2" )
	
	 Display.SetFarClipPlaneMinAndMax(0, 0) 
	 Interface_SetCinematicMode(0)
	 CutsceneDone()
	 	
end