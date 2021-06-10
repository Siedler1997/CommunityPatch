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
  
	StartSummer(600)
  
  	SetFriendly(1,2)
  	SetFriendly(2,3)
   CreateEntity(1, Entities.PU_Hero1c, GetPosition("CUTSCENE_MOVE_START_DARIO4"), "DARIO4" )     
   CreateEntity(1, Entities.PU_Hero5, GetPosition("CUTSCENE_MOVE_START_ARI4"), "ARI4" )     
   CreateEntity(1, Entities.PU_Hero2, GetPosition("CUTSCENE_MOVE_START_PILGRIM4"), "PILGRIM4" )     
   CreateEntity(1, Entities.PU_Hero11, GetPosition("CUTSCENE_MOVE_START_MIRAI4"), "MIRAI4" )     
   CreateEntity(3, Entities.PU_Hero10, GetPosition("CUTSCENE_MOVE_START_DRAKE4"), "DRAKE4" )      
   CreateEntity(2, Entities.CU_NPC_EvilGovernor, GetPosition("CUTSCENE_GOVERNOR1"), "GOVERNOR1" )   

 		
 
       CreateEntity(1, Entities.CU_BlackKnight_SoldierSword3, GetPosition("CUTSCENE_WACHE01"), "WACHE01" )       
       CreateEntity(1, Entities.CU_BlackKnight_SoldierSword3, GetPosition("CUTSCENE_WACHE02"), "WACHE02" )  
--       CreateEntity(1, Entities.CU_BlackKnight_SoldierSword3, GetPosition("CUTSCENE_WACHE03"), "WACHE03" )                
--       CreateEntity(1, Entities.CU_BlackKnight_SoldierSword3, GetPosition("CUTSCENE_WACHE04"), "WACHE04" )       
--       CreateEntity(1, Entities.CU_BlackKnight_SoldierSword3, GetPosition("CUTSCENE_WACHE05"), "WACHE05" )  
--       CreateEntity(1, Entities.CU_BlackKnight_SoldierSword3, GetPosition("CUTSCENE_WACHE06"), "WACHE06" )           
--       CreateEntity(1, Entities.CU_BlackKnight_SoldierSword3, GetPosition("CUTSCENE_WACHE07"), "WACHE07" )       
--       CreateEntity(1, Entities.CU_BlackKnight_SoldierSword3, GetPosition("CUTSCENE_WACHE08"), "WACHE08" )  
--       CreateEntity(1, Entities.CU_BlackKnight_SoldierSword3, GetPosition("CUTSCENE_WACHE09"), "WACHE09" )   
       
        
               
         LookAt("WACHE01","WACHE02") 
         LookAt("WACHE02","WACHE01") 
 
--         LookAt("WACHE03","WACHE01") 
--         LookAt("WACHE04","WACHE02") 
--         LookAt("WACHE05","WACHE02")  
--         LookAt("WACHE06","WACHE02")     
--         LookAt("WACHE07","WACHE02") 
--         LookAt("WACHE08","WACHE02")  
--         LookAt("WACHE09","WACHE02")    
	Music.Start( "music\\40_Extra1_BridgeBuild.mp3" , 100, 1 )		
             
end 


function Cutscene_MISSIONCOMPLETE_ChangeSettings()
	Display.SetRenderUseGfxSets(0)
	
	Display.SetFogStartAndEnd (1000, 6000)
  	Display.SetRenderFog (1)
	Display.SetFarClipPlaneMinAndMax(0, 16000) 
	
    Display.SetGlobalLightDiffuse(155,154,130)
    Display.SetGlobalLightAmbient(120,110,110)
    

    --Display.SetFogColor (152,172,182)
    Display.SetFogColor (92,92,82)
end
 

function Cutscene_MISSIONCOMPLETE_LookAt01()    
         
         LookAt("WACHE01","DARIO4") 
         LookAt("WACHE02","DARIO4")  
--         LookAt("WACHE03","DARIO4") 
--         LookAt("WACHE04","DARIO4") 
--         LookAt("WACHE05","DARIO4")  
--         LookAt("WACHE06","DARIO4")     
--         LookAt("WACHE07","DARIO4") 
--         LookAt("WACHE08","DARIO4")  
--         LookAt("WACHE09","DARIO4")    

 end


function Cutscene_MISSIONCOMPLETE_LookAt02()    

        
         LookAt("WACHE01","DARIO4") 
         LookAt("WACHE02","DARIO4")  
--         LookAt("WACHE03","DARIO4") 
--         LookAt("WACHE04","DARIO4") 
--         LookAt("WACHE05","DARIO4")  
--         LookAt("WACHE06","DARIO4")     
--         LookAt("WACHE07","DARIO4") 
--         LookAt("WACHE08","DARIO4")  
--         LookAt("WACHE09","DARIO4")    

 end


function Cutscene_MISSIONCOMPLETE_LookAt03()    

        
         LookAt("WACHE02","WACHE01") 
  

end

function Cutscene_MISSIONCOMPLETE_LookAt04()    

        
         LookAt("WACHE01","WACHE02") 
  

end

function Cutscene_MISSIONCOMPLETE_LookAt05()    

        
         LookAt("GOVERNOR1","DARIO4") 
  

end


function Cutscene_MISSIONCOMPLETE_LookAt06()    

        
         LookAt("GOVERNOR1","DRAKE4") 
  

end


function Cutscene_MISSIONCOMPLETE_LookAt08()    

        
         LookAt("DRAKE4","GOVERNOR1") 
  

end


function Cutscene_MISSIONCOMPLETE_LookAt07()    

        
         LookAt("DRAKE4","DARIO4") 
  

end



function Cutscene_MISSIONCOMPLETE_LookAt09()    

        
         LookAt("GOVERNOR1","DRAKE4") 
  

end


function Cutscene_MISSIONCOMPLETE_LookAt10()    

        
         LookAt("GOVERNOR1","DRAKE4") 
  

end


function Cutscene_MISSIONCOMPLETE_LookAt11()    

        
         LookAt("GOVERNOR1","DARIO4") 
  

end

function Cutscene_MISSIONCOMPLETE_Text01()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT01")
	
end
  




function Cutscene_MISSIONCOMPLETE_Shoot()    
	SetHostile(2,3)	
	Sound.PlayGUISound(Sounds.Military_SO_Rifleman_rnd_1)
end

function Cutscene_MISSIONCOMPLETE_Text02()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT02")
	
end
  

function Cutscene_MISSIONCOMPLETE_Die()    
	Logic.HurtEntity(GetEntityId("GOVERNOR1"),800)
end

function Cutscene_MISSIONCOMPLETE_Text03()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT03")
	
end
  


function Cutscene_MISSIONCOMPLETE_Text04()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT04")
	
end
  


function Cutscene_MISSIONCOMPLETE_Text05()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT05")
	
end
        


function Cutscene_MISSIONCOMPLETE_Text06()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT06")
	
end
    


function Cutscene_MISSIONCOMPLETE_Text07()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT07")
	
end
    



function Cutscene_MISSIONCOMPLETE_Text08()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT08")
	
end
  

function Cutscene_MISSIONCOMPLETE_Text09()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT09")
	
end
  

function Cutscene_MISSIONCOMPLETE_Text10()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT10")
	
end
  

function Cutscene_MISSIONCOMPLETE_Text11()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT11")
	
end
  

  
function Cutscene_MISSIONCOMPLETE_Text12()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT12")
	
end


  
function Cutscene_MISSIONCOMPLETE_Text13()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT13")
	
end


function Cutscene_MISSIONCOMPLETE_Text14()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT14")
	
end
    

function Cutscene_MISSIONCOMPLETE_Text15()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT15")
	
end
   

function Cutscene_MISSIONCOMPLETE_Text16()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT16")
	
end
   

function Cutscene_MISSIONCOMPLETE_Text17()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT17")
	
end
   

function Cutscene_MISSIONCOMPLETE_Text18()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT18")
	
end
 

function Cutscene_MISSIONCOMPLETE_Text19()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT19")
	
end

function Cutscene_MISSIONCOMPLETE_Text20()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT20")
	
end
  
 
function Cutscene_MISSIONCOMPLETE_Text21()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT21")
	
end
    

function Cutscene_MISSIONCOMPLETE_Text22()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT22")
	
end


function Cutscene_MISSIONCOMPLETE_Text23()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT23")
	
end
  

function Cutscene_MISSIONCOMPLETE_Text24()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT24")
	
end
  

function Cutscene_MISSIONCOMPLETE_Text25()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT25")
	
end

function Cutscene_MISSIONCOMPLETE_Text26()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT26")
	
end

function Cutscene_MISSIONCOMPLETE_Text27()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT27")
	 Music.Start( "music\\05_CombatEvelance1.mp3" , 100, 1 )
	
end

function Cutscene_MISSIONCOMPLETE_Text28()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT28")
	
end
 

function Cutscene_MISSIONCOMPLETE_Text29()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT29")
	 Music.Start( "music\\43_Extra1_DarkMoor_Combat.mp3" , 100, 1 )
	
end
   
 
function Cutscene_MISSIONCOMPLETE_Text30()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT30")
	
end


function Cutscene_MISSIONCOMPLETE_Text31()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT31")
	
end
   

function Cutscene_MISSIONCOMPLETE_Text32()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT32")
	
end
   

function Cutscene_MISSIONCOMPLETE_Text33()
	 SpokenCinematicText("CM02_06_TechOrResources/CUTSCENE_MISSIONCOMPLETE_TEXT33")
	
end
            
           
function Cutscene_MISSIONCOMPLETE_Move01()     

        SetPosition("DARIO4", GetPosition("CUTSCENE_MOVE_START_DARIO4"))
        Move("DARIO4", "CUTSCENE_MOVE_END_DARIO4")
 

        SetPosition("ARI4", GetPosition("CUTSCENE_MOVE_START_ARI4"))
        Move("ARI4", "CUTSCENE_MOVE_END_ARI4")
        

        SetPosition("PILGRIM4", GetPosition("CUTSCENE_MOVE_START_PILGRIM4"))
        Move("PILGRIM4", "CUTSCENE_MOVE_END_PILGRIM4")
        

        SetPosition("MIRAI4", GetPosition("CUTSCENE_MOVE_START_MIRAI4"))
        Move("MIRAI4", "CUTSCENE_MOVE_END_MIRAI4")    
       

        SetPosition("DRAKE4", GetPosition("CUTSCENE_MOVE_START_DRAKE4"))
        Move("DRAKE4", "CUTSCENE_MOVE_END_DRAKE4")

                       
end
  
  
  
function Cutscene_MISSIONCOMPLETE_Move02()     

        SetPosition("DARIO4", GetPosition("CUTSCENE_MOVE_END_DARIO4"))
        Move("DARIO4", "CUTSCENE_MOVE_END_DARIO5")
 

        SetPosition("ARI4", GetPosition("CUTSCENE_MOVE_END_ARI4"))
        Move("ARI4", "CUTSCENE_MOVE_END_ARI5")
        

        SetPosition("PILGRIM4", GetPosition("CUTSCENE_MOVE_END_PILGRIM4"))
        Move("PILGRIM4", "CUTSCENE_MOVE_END_PILGRIM5")
        

        SetPosition("MIRAI4", GetPosition("CUTSCENE_MOVE_END_MIRAI4"))
        Move("MIRAI4", "CUTSCENE_MOVE_END_MIRAI5")    
       

        SetPosition("DRAKE4", GetPosition("CUTSCENE_MOVE_END_DRAKE4"))
        Move("DRAKE4", "CUTSCENE_MOVE_END_DRAKE5")

                       
end
  
  
  
function Cutscene_MISSIONCOMPLETE_Move03()     

        SetPosition("DARIO4", GetPosition("CUTSCENE_MOVE_START_DARIO6"))
        Move("DARIO4", "CUTSCENE_MOVE_END_DARIO6")
 

        SetPosition("ARI4", GetPosition("CUTSCENE_MOVE_START_ARI6"))
        Move("ARI4", "CUTSCENE_MOVE_END_ARI6")
        

        SetPosition("PILGRIM4", GetPosition("CUTSCENE_MOVE_START_PILGRIM6"))
        Move("PILGRIM4", "CUTSCENE_MOVE_END_PILGRIM6")
        

        SetPosition("MIRAI4", GetPosition("CUTSCENE_MOVE_START_MIRAI6"))
        Move("MIRAI4", "CUTSCENE_MOVE_END_MIRAI6")    
       

        SetPosition("DRAKE4", GetPosition("CUTSCENE_MOVE_START_DRAKE6"))
        Move("DRAKE4", "CUTSCENE_MOVE_END_DRAKE6")

                       
end

  
function Cutscene_MISSIONCOMPLETE_Move04()     

        SetPosition("DARIO4", GetPosition("CUTSCENE_MOVE_END_DARIO6"))
        Move("DARIO4", "CUTSCENE_MOVE_END_DARIO7")
 

        SetPosition("ARI4", GetPosition("CUTSCENE_MOVE_END_ARI6"))
        Move("ARI4", "CUTSCENE_MOVE_END_ARI7")
        

        SetPosition("PILGRIM4", GetPosition("CUTSCENE_MOVE_END_PILGRIM6"))
        Move("PILGRIM4", "CUTSCENE_MOVE_END_PILGRIM7")
        

        SetPosition("MIRAI4", GetPosition("CUTSCENE_MOVE_END_MIRAI6"))
        Move("MIRAI4", "CUTSCENE_MOVE_END_MIRAI7")    
       

        SetPosition("DRAKE4", GetPosition("CUTSCENE_MOVE_END_DRAKE6"))
        Move("DRAKE4", "CUTSCENE_MOVE_END_DRAKE7")

                       
end  


function Cutscene_MISSIONCOMPLETE_Move05()     

        SetPosition("GOVERNOR1", GetPosition("CUTSCENE_GOVERNOR1"))
        Move("GOVERNOR1", "CUTSCENE_MOVE_END_GOVERNOR1")
 

                      
end  


function Cutscene_MISSIONCOMPLETE_Move06()     

        SetPosition("GOVERNOR1", GetPosition("CUTSCENE_MOVE_END_GOVERNOR1"))
        Move("GOVERNOR1", "CUTSCENE_MOVE_END_GOVERNOR2")
 

                      
end  

function Cutscene_MISSIONCOMPLETE_Move07()     

    
        Move("MIRAI4", "CUTSCENE_MOVE_END_MIRAI8")
 

                      
end 
-------------------------------------------------------------------------------------------------------------------------
function Cutscene_MISSIONCOMPLETE_Cancel()
	Cutscene_MISSIONCOMPLETE_Finished()
	
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_MISSIONCOMPLETE_Finished()
	Display.SetRenderUseGfxSets(1)
	
	Display.SetFarClipPlaneMinAndMax(0, 0) 
	Interface_SetCinematicMode(0)
	CutsceneDone()
		
end