--------------------------------------------------------------------------------
-- Author: T. Friedmann
--
--------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
-- Forbid all Technologies
----------------------------------------------------------------------------------------

function AOTechnologies_ForbidAll(_PlayerID)

	 --Global-->
		 --Inventions-->
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Mathematics  ,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Binocular   	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Matchlock   	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_PulledBarrel ,0 )
		
	--Buildings and their upgrades-->
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Tavern      				,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Tavern     			,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.B_GunsmithWorkshop      	,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_GunsmithWorkshop	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.B_MasterBuilderWorkshop     ,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Bridge      				,0 )
		
	--Beautifications -->	
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Beautification13  ,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Beautification14  ,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Beautification15  ,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Beautification16  ,0 )
		
	 --Feature Technologies -->			
	Logic.SetTechnologyState(_PlayerID,Technologies.T_FleeceArmor      			,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_FleeceLinedLeatherArmor   ,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_LeadShot      			,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_Sights      				,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_ThiefSabotage      		,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_ScoutFindResources      	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_ScoutTorches      		,0 )	
	
	 -- Units -->
	Logic.SetTechnologyState(_PlayerID,Technologies.MU_LeaderRifle  ,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.T_UpgradeRifle1 ,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.MU_Thief      	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.MU_Scout      	,0 )

	 -- CP -->	
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Beautification13  ,0 )		
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Beautification14  ,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Beautification15  ,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Beautification16  ,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_EvilTower		,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_ScoutForester     ,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.T_Lockpicking		,0 )
	
end