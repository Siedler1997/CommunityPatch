--------------------------------------------------------------------------------
-- Author: T. Friedmann
--
--------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
-- Forbid all Technologies
----------------------------------------------------------------------------------------

function Mission_ForbidAllTechnologies(_PlayerID)

	 --Global-->
		 --Militray-->
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Mercenaries   	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_StandingArmy   	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Tactics   		,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Strategies   	,0 )
		
		 --Construction-->
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Construction   	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_ChainBlock   	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_GearWheel   		,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Architecture   	,0 )
		
		 --Resources-->
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Alchemy   		,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Alloying   		,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Metallurgy   	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Chemistry   		,0 )
		
		 --Administration-->
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Literacy   		,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Trading   		,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Printing   		,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Library   		,0 )
		
		 --Trading NOTE: THIS IS NOT USED ANYMORE!!-->
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Taxation   		,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Laws   			,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Banking   		,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Gilds   			,0 )
		
		 --Technology to enable / disable the Beautification Menu-->
--	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Beautification   ,0 )
	
		
	 --Buildings and their upgrades-->

	 --Startbuildings-->
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Headquarter      		,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Headquarter     ,0 )
		Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Headquarter     ,0 )
		
		
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Residence      		,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Residence     	,0 )
		Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Residence      	,0 )
			
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Farm      			,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Farm      		,0 )
		Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Farm      		,0 )
		
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Ironmine      		,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Ironmine      	,0 )
		Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Ironmine      	,0 )
			
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Stonemine      		,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Stonemine      	,0 )
		Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Stonemine      	,0 )
			
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Sulfurmine      		,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Sulfurmine      ,0 )
		Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Sulfurmine      ,0 )
		
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Claymine      		,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Claymine      	,0 )
		Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Claymine      	,0 )
					
	Logic.SetTechnologyState(_PlayerID,Technologies.B_University      		,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_University      ,0 )
		
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Village      			,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Village      	,0 )
		Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Village      	,0 )
	
	 -- Refiners -->	
	Logic.SetTechnologyState(_PlayerID,Technologies.B_StoneMason      		,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_StoneMason      ,0 )
		
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Alchemist      		,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Alchemist      	,0 )
			
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Blacksmith      		,0 )		
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Blacksmith      ,0 )
		Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Blacksmith      ,0 )
	
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Brickworks      		,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Brickworks      ,0 )
	
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Sawmill      			,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Sawmill      	,0 )
	
	
	 --Special Buildings -->		
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Market      			,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Market      	,0 )
			
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Bank      			,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Bank      		,0 )
			
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Monastery      		,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Monastery      	,0 )
		Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Monastery      	,0 )
		
		
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Outpost      			,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Weathermachine      	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.B_PowerPlant      		,0 )		
		                                                                  	
	 --Military Buildings -->	                                          	
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Barracks      		,0 )		
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Barracks      	,0 )
			
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Stables      			,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Stables      	,0 )
			                                                             	
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Archery      			,0 )	 	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Archery      	,0 )	
			                                                             	
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Foundry      			,0 )	 	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Foundry      	,0 )	
	
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Tower      			,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Tower      		,0 )	
		Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Tower      		,0 )	
		
		 --Beautifications -->	
--	Logic.SetTechnologyState(_PlayerID,Technologies.B_Beautification01      ,0 )
--	Logic.SetTechnologyState(_PlayerID,Technologies.B_Beautification02      ,0 )
--	Logic.SetTechnologyState(_PlayerID,Technologies.B_Beautification03      ,0 )
--	Logic.SetTechnologyState(_PlayerID,Technologies.B_Beautification04      ,0 )
		
	
	 --Feature Technologies -->			
	Logic.SetTechnologyState(_PlayerID,Technologies.T_AdjustTaxes      		,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_EnableMilitia      	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_BlessSettlers1      	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_BlessSettlers2      	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_BlessSettlers3      	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_BlessSettlers4      	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_BlessSettlers5      	,0 )	
	
	 --Blacksmith Technologies -->			
		 --Armor: For Sword and Heavy cavalry-->						
	Logic.SetTechnologyState(_PlayerID,Technologies.T_LeatherMailArmor      ,0 )		
	Logic.SetTechnologyState(_PlayerID,Technologies.T_ChainMailArmor      	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_PlateMailArmor      	,0 )	
		
		 --Armor: Bowmen, light cavalry and spear-->						
	Logic.SetTechnologyState(_PlayerID,Technologies.T_SoftArcherArmor      	,0 )			
	Logic.SetTechnologyState(_PlayerID,Technologies.T_PaddedArcherArmor     ,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_LeatherArcherArmor    ,0 )	
		
		 --Damage: sword and heavy cavalry-->						
	Logic.SetTechnologyState(_PlayerID,Technologies.T_MasterOfSmithery      ,0 ) 
	Logic.SetTechnologyState(_PlayerID,Technologies.T_IronCasting      		,0 )
	
	 --Sawmill Technologies -->			
		 --Damage: Bowmen and light cavalry-->						
	Logic.SetTechnologyState(_PlayerID,Technologies.T_Fletching      		,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_BodkinArrow      		,0 )	
		
		 --Damage: Spearmen-->						
	Logic.SetTechnologyState(_PlayerID,Technologies.T_WoodAging      		,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_Turnery      			,0 )	
	
	 --Alchemist Technologies -->			
		 --Damage: Cannons-->						
	Logic.SetTechnologyState(_PlayerID,Technologies.T_EnhancedGunPowder     ,0 ) 
	Logic.SetTechnologyState(_PlayerID,Technologies.T_BlisteringCannonballs ,0 ) 
		
		 --Weather-->						
	Logic.SetTechnologyState(_PlayerID,Technologies.T_WeatherForecast      	,0 ) 
	Logic.SetTechnologyState(_PlayerID,Technologies.T_ChangeWeather      	,0 ) 
		 --<Technology>T_MoreWeather      ,0 ) Has to be implemented later-->
	
	 --Stone Mason Technologies -->			
		 --Armor: Buildings-->		
	Logic.SetTechnologyState(_PlayerID,Technologies.T_Masonry      			,0 ) 
	
	 --Brickworks Technologies -->				
			 --Speed: Serfs build-->		
		Logic.SetTechnologyState(_PlayerID,Technologies.T_LightBricks      	,0 ) 
	
	 --Bank Technologies -->				
			 --Payday: Refine more and change Payday frequenze-->	
		Logic.SetTechnologyState(_PlayerID,Technologies.T_Debenture      	,0 ) 
		Logic.SetTechnologyState(_PlayerID,Technologies.T_BookKeeping      	,0 ) 
			
			 --Market: Better exchange-->	
		Logic.SetTechnologyState(_PlayerID,Technologies.T_Scale      		,0 ) 
		Logic.SetTechnologyState(_PlayerID,Technologies.T_Coinage      		,0 ) 
			
	 --Village Center Technologies -->				
			 --Exploration: Buildings-->	
		Logic.SetTechnologyState(_PlayerID,Technologies.T_TownGuard      	,0 ) 
			 --Armor: Workers and Serfs-->	
		Logic.SetTechnologyState(_PlayerID,Technologies.T_Loom      		,0 ) 
			
			 --Speed: Workers and Serfs-->	
		Logic.SetTechnologyState(_PlayerID,Technologies.T_Shoes      		,0 ) 
	
	 --Barracks Technologies -->				
		 --Speed: Spearmen and Sowrdmen-->	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_BetterTrainingBarracks,0 ) 

	 --Archery Technologies -->				
		 --Speed: Bowmen-->	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_BetterTrainingArchery ,0 ) 
		
	 --Stables Technologies -->				
		 --Speed: light and heavy cavalry-->	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_Shoeing      			,0 ) 
		
	 --Foundry Technologies -->				
		 --Speed: cannons-->	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_BetterChassis      	,0 ) 
		
	 --Weathermashine -->				
	Logic.SetTechnologyState(_PlayerID,Technologies.T_MakeSnow      		,0 ) 
	Logic.SetTechnologyState(_PlayerID,Technologies.T_MakeSummer      		,0 ) 
	Logic.SetTechnologyState(_PlayerID,Technologies.T_MakeRain      		,0 ) 
	
	 -- Units -->
	Logic.SetTechnologyState(_PlayerID,Technologies.MU_LeaderSword      	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.MU_LeaderSword2      	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.MU_LeaderSword3      	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.MU_LeaderSword4      	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.T_UpgradeSword1      	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_UpgradeSword2      	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_UpgradeSword3      	,0 )	

	Logic.SetTechnologyState(_PlayerID,Technologies.MU_LeaderSpear      	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.MU_LeaderSpear2      	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.MU_LeaderSpear3      	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.MU_LeaderSpear4      	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_UpgradeSpear1      	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_UpgradeSpear2      	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_UpgradeSpear3      	,0 )	

	Logic.SetTechnologyState(_PlayerID,Technologies.MU_LeaderBow      		,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.MU_LeaderBow3      		,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.T_UpgradeBow1      		,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_UpgradeBow2      		,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_UpgradeBow3      		,0 )	
	
	Logic.SetTechnologyState(_PlayerID,Technologies.MU_LeaderLightCavalry   ,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.T_UpgradeLightCavalry1  ,0 )	
	
	Logic.SetTechnologyState(_PlayerID,Technologies.MU_LeaderHeavyCavalry   ,0 )		
	Logic.SetTechnologyState(_PlayerID,Technologies.T_UpgradeHeavyCavalry1  ,0 )	
	
	Logic.SetTechnologyState(_PlayerID,Technologies.MU_Cannon1      		,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.MU_Cannon2      		,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.MU_Cannon3      		,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.MU_Cannon4      		,0 )
	
	Logic.SetTechnologyState(_PlayerID,Technologies.MU_Serf      			,0 )
	
	 -- Technology Test -->	
	Logic.SetTechnologyState(_PlayerID,Technologies.T_SuperTechnology      	,0 )
		
	Logic.SetTechnologyState(_PlayerID,Technologies.T_PlateBardingArmor     ,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.T_Tracking      		,0 )		
	
	 -- NOT USED FOR THE MOMENT: -->		
--	Logic.SetTechnologyState(_PlayerID,Technologies.T_CropCycle      		,0 )	
--	Logic.SetTechnologyState(_PlayerID,Technologies.T_PickAxe      			,0 )	
--	Logic.SetTechnologyState(_PlayerID,Technologies.T_SpinningWheel      	,0 )	
--	Logic.SetTechnologyState(_PlayerID,Technologies.T_CityGuard      		,0 )		
--	Logic.SetTechnologyState(_PlayerID,Technologies.T_ChainBardingArmor     ,0 )	
--	Logic.SetTechnologyState(_PlayerID,Technologies.T_PaddedBardingArmor    ,0 )	
--	Logic.SetTechnologyState(_PlayerID,Technologies.T_LeatherBaringArmor    ,0 )		
	

end