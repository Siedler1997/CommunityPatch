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

   CreateEntity(1, Entities.PU_LeaderSword2, GetPosition("CUTSCENE_INTRO_S1"), "S1" )
   CreateEntity(1, Entities.PU_LeaderSword2, GetPosition("CUTSCENE_INTRO_S2"), "S2" )
   CreateEntity(1, Entities.PU_LeaderSword2, GetPosition("CUTSCENE_INTRO_S3"), "S3" )
   CreateEntity(1, Entities.PU_LeaderSword2, GetPosition("CUTSCENE_INTRO_S4"), "S4" )
   CreateEntity(1, Entities.PU_LeaderBow2, GetPosition("CUTSCENE_INTRO_S5"), "S5" )
   CreateEntity(1, Entities.PU_LeaderBow2, GetPosition("CUTSCENE_INTRO_S6"), "S6" )
   --CreateEntity(1, Entities.PU_LeaderSword2, GetPosition("CUTSCENE_INTRO_S7"), "S7" )







end

 

function Cutscene_INTRO_MOVE01()     

      Move("D1", "CUTSCENE_INTRO_E2")
      Move("S2", "CUTSCENE_INTRO_E1")
      Move("S3", "CUTSCENE_INTRO_E1")

      Move("S1", "CUTSCENE_INTRO_E1")
      Move("S4", "CUTSCENE_INTRO_E1")

      Move("S5", "CUTSCENE_INTRO_E1")
      Move("S6", "CUTSCENE_INTRO_E1")
      --Move("S7", "CUTSCENE_INTRO_E1")

end



  function Cutscene_INTRO_TEXT01()
	 SpokenCinematicText("CM06_04_TaintedLight/CUTSCENE_INTRO_TEXT01")
	
  end


  function Cutscene_INTRO_TEXT02()
	 SpokenCinematicText("CM06_04_TaintedLight/CUTSCENE_INTRO_TEXT02")
	
  end

  function Cutscene_INTRO_TEXT03()
	 SpokenCinematicText("CM06_04_TaintedLight/CUTSCENE_INTRO_TEXT03")
	
  end
-------------------------------------------------------------------------------------------------------------------------
function Cutscene_INTRO_Cancel()
	 Cutscene_INTRO_Finished()
	
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_INTRO_Finished()
	

	 DestroyEntity("D1") 
	 Dario = CreateEntity(1,Entities.PU_Hero1c,GetPosition("CUTSCENE_INTRO_E2"),"Dario")

	-- DestroyEntity("S1") 

	-- DestroyEntity("S2") 

	-- DestroyEntity("S3") 

	-- DestroyEntity("S4") 

	-- DestroyEntity("S5") 

	-- DestroyEntity("S6") 

	-- DestroyEntity("S7") 

	Attack("S2", "pat1")
      Attack("S3", "pat2")

      Attack("S1", "pat3")
      Attack("S4", "pat4")

      Attack("S5", "pat5")
      Attack("S6", "pat6")
      --Attack("S7", "pat7")

	 Display.SetFarClipPlaneMinAndMax(0, 0) 
	 Interface_SetCinematicMode(0)
	 CutsceneDone()
	 	
end