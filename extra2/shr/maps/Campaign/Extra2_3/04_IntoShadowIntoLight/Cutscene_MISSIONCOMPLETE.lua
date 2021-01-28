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

	Logic.SetDiplomacyState( 1, 3, Diplomacy.Neutral )
	Display.SetPlayerColorMapping(7, 1)

     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S1"), "S1" )
     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S2"), "S2" )
     CreateEntity(7, Entities.PU_SoldierBow1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S3"), "S3" )
     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S4"), "S4" )
     CreateEntity(7, Entities.PU_SoldierBow4, GetPosition("CUTSCENE_MISSIONCOMPLETE_S5"), "S5" )
     CreateEntity(7, Entities.PU_SoldierHeavyCavalry1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S6"), "S6" )
     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S7"), "S7" )
     CreateEntity(7, Entities.PU_SoldierSword2, GetPosition("CUTSCENE_MISSIONCOMPLETE_S8"), "S8" )
     CreateEntity(7, Entities.PU_SoldierRifle1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S9"), "S9" )
     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S10"), "S10" )
     CreateEntity(7, Entities.PU_SoldierSword3, GetPosition("CUTSCENE_MISSIONCOMPLETE_S11"), "S11" )
     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S12"), "S12" )
     CreateEntity(7, Entities.PU_SoldierPoleArm1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S13"), "S13" )
     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S14"), "S14" )
     CreateEntity(7, Entities.PU_SoldierPoleArm4, GetPosition("CUTSCENE_MISSIONCOMPLETE_S15"), "S15" )
     CreateEntity(7, Entities.PU_SoldierSword3, GetPosition("CUTSCENE_MISSIONCOMPLETE_S16"), "S16" )
     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S17"), "S17" )
     CreateEntity(7, Entities.PU_SoldierBow2, GetPosition("CUTSCENE_MISSIONCOMPLETE_S18"), "S18" )
     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S19"), "S19" )
     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S20"), "S20" )
     CreateEntity(7, Entities.PU_SoldierBow3, GetPosition("CUTSCENE_MISSIONCOMPLETE_S21"), "S21" )
     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S22"), "S22" )
     CreateEntity(7, Entities.PU_SoldierSword2, GetPosition("CUTSCENE_MISSIONCOMPLETE_S23"), "S23" )
     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S24"), "S24" )
     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S25"), "S25" )
     CreateEntity(7, Entities.PU_SoldierCavalry1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S26"), "S26" )
     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S27"), "S27" )
     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S28"), "S28" )
     CreateEntity(7, Entities.PU_SoldierRifle1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S29"), "S29" )
     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S30"), "S30" )
     CreateEntity(7, Entities.PU_SoldierCavalry2, GetPosition("CUTSCENE_MISSIONCOMPLETE_S31"), "S31" )
     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S32"), "S32" )
     CreateEntity(7, Entities.PU_SoldierRifle2, GetPosition("CUTSCENE_MISSIONCOMPLETE_S33"), "S33" )
     CreateEntity(7, Entities.PU_SoldierSword4, GetPosition("CUTSCENE_MISSIONCOMPLETE_S34"), "S34" )
     CreateEntity(7, Entities.PU_SoldierSword2, GetPosition("CUTSCENE_MISSIONCOMPLETE_S35"), "S35" )
     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S36"), "S36" )
     CreateEntity(7, Entities.PU_SoldierSword3, GetPosition("CUTSCENE_MISSIONCOMPLETE_S37"), "S37" )
     CreateEntity(7, Entities.PU_SoldierBow1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S38"), "S38" )
     CreateEntity(7, Entities.PU_SoldierSword4, GetPosition("CUTSCENE_MISSIONCOMPLETE_S39"), "S39" )
     CreateEntity(7, Entities.PU_SoldierSword1, GetPosition("CUTSCENE_MISSIONCOMPLETE_S40"), "S40" )
     CreateEntity(7, Entities.PU_SoldierHeavyCavalry2, GetPosition("CUTSCENE_MISSIONCOMPLETE_S41"), "S41" )   

     CreateEntity(3, Entities.PU_Hero1c, GetPosition("CUTSCENE_MISSIONCOMPLETE_D1"), "D1" )
     CreateEntity(1, Entities.CU_Barbarian_Hero, GetPosition("CUTSCENE_MISSIONCOMPLETE_V1"), "V1" )
     CreateEntity(1, Entities.CU_BlackKnight, GetPosition("CUTSCENE_MISSIONCOMPLETE_K1"), "K1" )
     CreateEntity(1, Entities.CU_Mary_de_Mortfichet, GetPosition("CUTSCENE_MISSIONCOMPLETE_M1"), "M1" )

end




function Cutscene_MISSIONCOMPLETE_LOOKAT01()    

	LookAt("K1","S1") 
	LookAt("V1","S1") 
	LookAt("M1","S1") 	
	LookAt("D1","S1") 

	LookAt("S2","D1") 
	LookAt("S3","D1") 
	LookAt("S4","D1") 
	LookAt("S5","D1") 
	LookAt("S6","D1") 
	LookAt("S7","D1") 
	LookAt("S8","D1") 
	LookAt("S9","D1") 
	LookAt("S10","D1") 
	LookAt("S11","D1") 
	LookAt("S12","D1") 
	LookAt("S13","D1") 
	LookAt("S14","D1") 
	LookAt("S15","D1") 
	LookAt("S16","D1") 
	LookAt("S17","D1") 
	LookAt("S18","D1") 
	LookAt("S19","D1") 
	LookAt("S20","D1") 
	LookAt("S21","D1") 
	LookAt("S22","D1") 
	LookAt("S23","D1") 
	LookAt("S24","D1") 
	LookAt("S25","D1") 
	LookAt("S26","D1") 
	LookAt("S27","D1") 
	LookAt("S28","D1") 
	LookAt("S29","D1") 
	LookAt("S30","D1") 
	LookAt("S31","D1") 
	LookAt("S32","D1") 
	LookAt("S33","D1") 
	LookAt("S34","D1") 
	LookAt("S35","D1") 
	LookAt("S36","D1") 
	LookAt("S37","D1") 
	LookAt("S38","D1") 
	LookAt("S39","D1") 
	LookAt("S40","D1") 
	LookAt("S41","D1") 

	
end




function Cutscene_MISSIONCOMPLETE_TEXT01()

	 SpokenCinematicText("CM05_05_IntoShadowIntoLight/CUTSCENE_MISSIONCOMPLETE_TEXT01")
	
end



function Cutscene_MISSIONCOMPLETE_TEXT02()

	 SpokenCinematicText("CM05_05_IntoShadowIntoLight/CUTSCENE_MISSIONCOMPLETE_TEXT02")
	
end


function Cutscene_MISSIONCOMPLETE_TEXT03()

	 SpokenCinematicText("CM05_05_IntoShadowIntoLight/CUTSCENE_MISSIONCOMPLETE_TEXT03")
	
end


-------------------------------------------------------------------------------------------------------------------------
function Cutscene_MISSIONCOMPLETE_Cancel()
	 Cutscene_MISSIONCOMPLETE_Finished()
	
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_MISSIONCOMPLETE_Finished()
	Display.SetPlayerColorMapping(7, 15)
	
	 DestroyEntity("S1") 
	 DestroyEntity("S2") 
	 DestroyEntity("S3") 
	 DestroyEntity("S4") 
	 DestroyEntity("S5") 
	 DestroyEntity("S6") 
	 DestroyEntity("S7") 
	 DestroyEntity("S8") 
	 DestroyEntity("S9") 
	 DestroyEntity("S10") 
	 DestroyEntity("S11") 
	 DestroyEntity("S12") 
	 DestroyEntity("S13") 
	 DestroyEntity("S14") 
	 DestroyEntity("S15") 
	 DestroyEntity("S16") 
	 DestroyEntity("S17") 
	 DestroyEntity("S18") 
	 DestroyEntity("S19") 
	 DestroyEntity("S20") 
	 DestroyEntity("S21") 
	 DestroyEntity("S22") 
	 DestroyEntity("S23") 
	 DestroyEntity("S24") 
	 DestroyEntity("S25") 
	 DestroyEntity("S26") 
	 DestroyEntity("S27") 
	 DestroyEntity("S28") 
	 DestroyEntity("S29") 
	 DestroyEntity("S30") 
	 DestroyEntity("S31") 
	 DestroyEntity("S32") 
	 DestroyEntity("S33") 
	 DestroyEntity("S34") 
	 DestroyEntity("S35") 
	 DestroyEntity("S36") 
	 DestroyEntity("S37") 
	 DestroyEntity("S38") 
	 DestroyEntity("S39") 
	 DestroyEntity("S40") 
	 DestroyEntity("S41") 

	 DestroyEntity("D1") 
	 DestroyEntity("K1") 
	 DestroyEntity("V1") 
	 DestroyEntity("M1") 


	
	 Display.SetFarClipPlaneMinAndMax(0, 0) 
	 Interface_SetCinematicMode(0)
	 CutsceneDone()
	 	
end