
createPlayer1 = function()

--	Logic.SetPlayerName(GetHumanPlayer(), String.MainKey.."_Player1Name")

	-- 	start  resources 									

	GlobalMissionScripting.GiveResouces(GetHumanPlayer(),500,1000,1000,500,300,300)


	-- Set technologies

	local PlayerID = GetHumanPlayer()

	Mission_ForbidAllTechnologies(PlayerID)

	 --Global-->
		 --Militray-->
	Logic.SetTechnologyState(PlayerID,Technologies.GT_Mercenaries   		,2 )	
		Logic.SetTechnologyState(PlayerID,Technologies.GT_StandingArmy   	,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.GT_Tactics   		,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.GT_Strategies   	,2 )
			
			 --Construction-->
	Logic.SetTechnologyState(PlayerID,Technologies.GT_Construction   		,2 )	
	Logic.SetTechnologyState(PlayerID,Technologies.GT_GearWheel   			,2 )
		Logic.SetTechnologyState(PlayerID,Technologies.GT_ChainBlock   	,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.GT_Architecture   	,2 )
			
			 --Resources-->
		Logic.SetTechnologyState(PlayerID,Technologies.GT_Alchemy   		,2 )	
		Logic.SetTechnologyState(PlayerID,Technologies.GT_Alloying   		,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.GT_Metallurgy   	,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.GT_Chemistry   		,2 )
			
			 --Administration-->
	Logic.SetTechnologyState(PlayerID,Technologies.GT_Literacy   			,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.GT_Trading   		,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.GT_Printing   		,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.GT_Library   		,2 )
			
			 --Trading NOTE: THIS IS NOT USED ANYMORE!!-->
	--	Logic.SetTechnologyState(PlayerID,Technologies.GT_Taxation   		,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.GT_Laws   			,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.GT_Banking   		,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.GT_Gilds   			,2 )
			
			 --Technology to enable / disable the Beautification Menu-->
	Logic.SetTechnologyState(PlayerID,Technologies.GT_Beautification   	,2 )
		
			
		 --Buildings and their upgrades-->
	
		 --Startbuildings-->
	Logic.SetTechnologyState(PlayerID,Technologies.B_Headquarter      		,2 )	
	Logic.SetTechnologyState(PlayerID,Technologies.UP1_Headquarter     	,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP2_Headquarter     ,2 )
			
			
	Logic.SetTechnologyState(PlayerID,Technologies.B_Residence      		,2 )	
	Logic.SetTechnologyState(PlayerID,Technologies.UP1_Residence     		,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP2_Residence      	,2 )
				
	Logic.SetTechnologyState(PlayerID,Technologies.B_Farm      			,2 )	
	Logic.SetTechnologyState(PlayerID,Technologies.UP1_Farm      			,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP2_Farm      		,2 )
			
	Logic.SetTechnologyState(PlayerID,Technologies.B_Ironmine      		,2 )	
		Logic.SetTechnologyState(PlayerID,Technologies.UP1_Ironmine      	,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP2_Ironmine      	,2 )
				
	Logic.SetTechnologyState(PlayerID,Technologies.B_Stonemine      		,2 )	
	Logic.SetTechnologyState(PlayerID,Technologies.UP1_Stonemine      		,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP2_Stonemine      	,2 )
				
		Logic.SetTechnologyState(PlayerID,Technologies.B_Sulfurmine      	,2 )	
		Logic.SetTechnologyState(PlayerID,Technologies.UP1_Sulfurmine      ,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP2_Sulfurmine      ,2 )
			
	Logic.SetTechnologyState(PlayerID,Technologies.B_Claymine      		,2 )	
	Logic.SetTechnologyState(PlayerID,Technologies.UP1_Claymine      		,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP2_Claymine      	,2 )
						
	Logic.SetTechnologyState(PlayerID,Technologies.B_University      		,2 )	
		Logic.SetTechnologyState(PlayerID,Technologies.UP1_University      ,2 )
			
	Logic.SetTechnologyState(PlayerID,Technologies.B_Village      			,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP1_Village      	,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP2_Village      	,2 )
		
		 -- Refiners -->	
	Logic.SetTechnologyState(PlayerID,Technologies.B_StoneMason      		,2 )	
		Logic.SetTechnologyState(PlayerID,Technologies.UP1_StoneMason      ,2 )
			
		Logic.SetTechnologyState(PlayerID,Technologies.B_Alchemist      	,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP1_Alchemist      	,2 )
				
		Logic.SetTechnologyState(PlayerID,Technologies.B_Blacksmith      	,2 )		
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP1_Blacksmith      ,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP2_Blacksmith      ,2 )
		
	Logic.SetTechnologyState(PlayerID,Technologies.B_Brickworks      		,2 )	
		Logic.SetTechnologyState(PlayerID,Technologies.UP1_Brickworks      ,2 )
		
	Logic.SetTechnologyState(PlayerID,Technologies.B_Sawmill      			,2 )	
		Logic.SetTechnologyState(PlayerID,Technologies.UP1_Sawmill      	,2 )
		
		
		 --Special Buildings -->		
	Logic.SetTechnologyState(PlayerID,Technologies.B_Market      			,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP1_Market      	,2 )
				
	--	Logic.SetTechnologyState(PlayerID,Technologies.B_Bank      		,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP1_Bank      		,2 )
				
	--	Logic.SetTechnologyState(PlayerID,Technologies.B_Monastery      	,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP1_Monastery      	,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP2_Monastery      	,2 )
			
			
	--	Logic.SetTechnologyState(PlayerID,Technologies.B_Outpost      		,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.B_Weathermachine    ,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.B_PowerPlant      	,2 )		
			                                                                  	
		 --Military Buildings -->	                                          	
	Logic.SetTechnologyState(PlayerID,Technologies.B_Barracks      		,2 )		
		Logic.SetTechnologyState(PlayerID,Technologies.UP1_Barracks      	,2 )
				
	--	Logic.SetTechnologyState(PlayerID,Technologies.B_Stables      		,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP1_Stables      	,2 )
				                                                             	
		Logic.SetTechnologyState(PlayerID,Technologies.B_Archery      		,2 )	 	
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP1_Archery      	,2 )	
				                                                             	
	--	Logic.SetTechnologyState(PlayerID,Technologies.B_Foundry      		,2 )	 	
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP1_Foundry      	,2 )	
		
		Logic.SetTechnologyState(PlayerID,Technologies.B_Tower      		,2 )	
		Logic.SetTechnologyState(PlayerID,Technologies.UP1_Tower      		,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.UP2_Tower      		,2 )	
			
			 --Beautifications -->	
	Logic.SetTechnologyState(PlayerID,Technologies.B_Beautification01      ,2 )
		Logic.SetTechnologyState(PlayerID,Technologies.B_Beautification02      ,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.B_Beautification03      ,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.B_Beautification04      ,2 )
			
		
		 --Feature Technologies -->			
	if CP_Difficulty < 2 then			
		Logic.SetTechnologyState(PlayerID,Technologies.T_AdjustTaxes      		,2 )
	end
	Logic.SetTechnologyState(PlayerID,Technologies.T_EnableMilitia      	,2 )	
	Logic.SetTechnologyState(PlayerID,Technologies.T_BlessSettlers1      	,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_BlessSettlers2      	,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_BlessSettlers3      	,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_BlessSettlers4      	,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_BlessSettlers5      	,2 )	
		
		 --Blacksmith Technologies -->			
		 --Armor: For Sword and Heavy cavalry-->						
		Logic.SetTechnologyState(PlayerID,Technologies.T_LeatherMailArmor      ,2 )		
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_ChainMailArmor      	,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_PlateMailArmor      	,2 )	
			
			 --Armor: Bowmen, light cavalry and spear-->						
		Logic.SetTechnologyState(PlayerID,Technologies.T_SoftArcherArmor      	,2 )			
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_PaddedArcherArmor     ,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_LeatherArcherArmor    ,2 )	
			
			 --Damage: sword and heavy cavalry-->						
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_MasterOfSmithery      ,2 ) 
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_IronCasting      		,2 )
		
		 --Sawmill Technologies -->			
			 --Damage: Bowmen and light cavalry-->						
		Logic.SetTechnologyState(PlayerID,Technologies.T_Fletching      		,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_BodkinArrow      		,2 )	
			
			 --Damage: Spearmen-->						
		Logic.SetTechnologyState(PlayerID,Technologies.T_WoodAging      		,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_Turnery      			,2 )	
		
		 --Alchemist Technologies -->			
			 --Damage: Cannons-->						
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_EnhancedGunPowder     ,2 ) 
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_BlisteringCannonballs ,2 ) 
			
			 --Weather-->						
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_WeatherForecast      	,2 ) 
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_ChangeWeather      	,2 ) 
			 --<Technology>T_MoreWeather      ,2 ) Has to be implemented later-->
		
		 --Stone Mason Technologies -->			
			 --Armor: Buildings-->		
		Logic.SetTechnologyState(PlayerID,Technologies.T_Masonry      			,2 ) 
		
		 --Brickworks Technologies -->				
				 --Speed: Serfs build-->		
			Logic.SetTechnologyState(PlayerID,Technologies.T_LightBricks      	,2 ) 
		
		 --Bank Technologies -->				
				 --Payday: Refine more and change Payday frequenze-->	
	--		Logic.SetTechnologyState(PlayerID,Technologies.T_Debenture      	,2 ) 
	--		Logic.SetTechnologyState(PlayerID,Technologies.T_BookKeeping      	,2 ) 
				
				 --Market: Better exchange-->	
	--		Logic.SetTechnologyState(PlayerID,Technologies.T_Scale      		,2 ) 
	--		Logic.SetTechnologyState(PlayerID,Technologies.T_Coinage      		,2 ) 
				
		 --Village Center Technologies -->				
				 --Exploration: Buildings-->	
		Logic.SetTechnologyState(PlayerID,Technologies.T_TownGuard      		,2 ) 
				 --Armor: Workers and Serfs-->	
			-- Logic.SetTechnologyState(PlayerID,Technologies.T_Loom      		,2 ) 
				
				 --Speed: Workers and Serfs-->	
	--		Logic.SetTechnologyState(PlayerID,Technologies.T_Shoes      		,2 ) 
		
		 --Barracks Technologies -->				
			 --Speed: Spearmen and Sowrdmen-->	
			Logic.SetTechnologyState(PlayerID,Technologies.T_BetterTrainingBarracks,2 ) 
	
		 --Archery Technologies -->				
			 --Speed: Bowmen-->	
	--		Logic.SetTechnologyState(PlayerID,Technologies.T_BetterTrainingArchery ,2 ) 
			
		 --Stables Technologies -->				
			 --Speed: light and heavy cavalry-->	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_Shoeing      			,2 ) 
			
		 --Foundry Technologies -->				
			 --Speed: cannons-->	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_BetterChassis      	,2 ) 
			
		 --Weathermashine -->				
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_MakeSnow      		,2 ) 
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_MakeSummer      		,2 ) 
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_MakeRain      		,2 ) 
		
		 -- Units -->
	Logic.SetTechnologyState(PlayerID,Technologies.MU_LeaderSword      	,2 )
		Logic.SetTechnologyState(PlayerID,Technologies.MU_LeaderSword2      	,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.MU_LeaderSword3      	,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.MU_LeaderSword4      	,2 )
		Logic.SetTechnologyState(PlayerID,Technologies.T_UpgradeSword1      	,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_UpgradeSword2      	,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_UpgradeSword3      	,2 )	
	
	Logic.SetTechnologyState(PlayerID,Technologies.MU_LeaderSpear      	,2 )	
		Logic.SetTechnologyState(PlayerID,Technologies.MU_LeaderSpear2      	,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.MU_LeaderSpear3      	,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.MU_LeaderSpear4      	,2 )	
		Logic.SetTechnologyState(PlayerID,Technologies.T_UpgradeSpear1      	,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_UpgradeSpear2      	,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_UpgradeSpear3      	,2 )	
	
		Logic.SetTechnologyState(PlayerID,Technologies.MU_LeaderBow      		,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.MU_LeaderBow3      		,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_UpgradeBow1      		,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_UpgradeBow2      		,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_UpgradeBow3      		,2 )	
		
	--	Logic.SetTechnologyState(PlayerID,Technologies.MU_LeaderLightCavalry   ,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_UpgradeLightCavalry1  ,2 )	
		
	--	Logic.SetTechnologyState(PlayerID,Technologies.MU_LeaderHeavyCavalry   ,2 )		
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_UpgradeHeavyCavalry1  ,2 )	
		
	--	Logic.SetTechnologyState(PlayerID,Technologies.MU_Cannon1      		,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.MU_Cannon2      		,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.MU_Cannon3      		,2 )
	--	Logic.SetTechnologyState(PlayerID,Technologies.MU_Cannon4      		,2 )
		
	Logic.SetTechnologyState(PlayerID,Technologies.MU_Serf      			,2 )
	
		 -- Technology Test -->	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_SuperTechnology      	,2 )
		
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_PlateBardingArmor     ,2 )	
		
		 -- NOT USED FOR THE MOMENT: -->
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_Tracking      		,2 )			
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_CropCycle      		,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_PickAxe      			,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_SpinningWheel      	,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_CityGuard      		,2 )		
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_ChainBardingArmor     ,2 )		
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_PaddedBardingArmor    ,2 )	
	--	Logic.SetTechnologyState(PlayerID,Technologies.T_LeatherBaringArmor    ,2 )		
	--	

end