--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Selection 
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function GameCallback_GUI_SelectionChanged()
	local PlayerID = GUI.GetPlayerID()

	-- Hide selection widgets
	XGUIEng.ShowAllSubWidgets(gvGUI_WidgetID.SelectionView,0)	
	
	--Hide all BG Textures
	XGUIEng.ShowAllSubWidgets(gvGUI_WidgetID.BackgroundContainer,0)	
	XGUIEng.ShowWidget(gvGUI_WidgetID.BackgroundLeft,1)
		
	-- Stop video playback
	XGUIEng.StopVideoPlayback( gvGUI_WidgetID.VideoPreview )	
	XGUIEng.ShowWidget(gvGUI_WidgetID.VideoPreview,0)
	
	-- disable following
	if gvCamera.DefaultFlag ~= 0 then	    
		Camera.FollowEntity(0)		
	end

	--	
	if gvGUI.HawkIsFlying == 1 then
		GUIAction_GoBackFromHawkViewInNormalView()
	end
		
	-- Get selected entity
	local EntityId = GUI.GetSelectedEntity()

	GUI_Selection = { GUI.GetSelectedEntities() }
	
	if table.getn(GUI_Selection) > 1 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.MultiSelectionContainer,1)
		GUIAction_UpdateMultiSelectionContainer()
	end
	if GUI_Selection == nil or table.getn(GUI_Selection) <= 1 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.MultiSelectionContainer,0)		
	end
	
	--	
	if EntityId == nil then
		gvGUI.LastSelectedEntityID = 0
		return
	end
	
	-- Get entity type
	local EntityType = Logic.GetEntityType( EntityId )
	local EntityTypeName = Logic.GetEntityTypeName( EntityType )
	
	--Init Sounds
	local SelectionSound = Sounds.Selection_global
	local FunnyComment = 0
	local RandomSelectionSound = XGUIEng.GetRandom(4)

	-- Confirm	
	XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionGeneric,1)	
	XGUIEng.ShowWidget(gvGUI_WidgetID.BackgroundFull,1)
	
	
	-- Start video and show full GUI
	if EntityType ~= 0 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.VideoPreview,1)		
		local VideoName = "data\\graphics\\videos\\" .. EntityTypeName .. ".bik"
		XGUIEng.StartVideoPlayback( gvGUI_WidgetID.VideoPreview, VideoName, 1 )			
	end
	
	-- Is selected entity a serf?
	if Logic.IsSerf( EntityId ) == 1 then	
		if EntityType == Entities.PU_Serf then
			FunnyComment = Sounds.VoicesSerf_SERF_FunnyComment_rnd_01
		end
			
			local OnlySerfsSelected = 1
			
			local i 
			for i=1, 20, 1 do
				local SerfEntityType = Logic.GetEntityType( GUI_Selection[i] )
				if GUI_Selection [i] == nil then
					break
				elseif SerfEntityType ~= Entities.PU_Serf then
					OnlySerfsSelected = 0
					break
				end
			end
			
			XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionSerf,OnlySerfsSelected)						
			XGUIEng.UnHighLightGroup(gvGUI_WidgetID.InGame, "BuildingGroup")
			
			--Set contrsuction menu as default and highlight the tab
			XGUIEng.ShowAllSubWidgets(gvGUI_WidgetID.SerfMenus,0)	
			XGUIEng.ShowWidget(gvGUI_WidgetID.SerfConstructionMenu,1)
			XGUIEng.UnHighLightGroup(gvGUI_WidgetID.InGame, "BuildingMenuGroup")
			XGUIEng.HighLightButton(gvGUI_WidgetID.ToSerfBeatificationMenu,1)
	
		
	-- Is selected entity a worker?
	elseif Logic.IsWorker( EntityId ) == 1 then
		
		
		SelectionSound = 0
		FunnyComment = Sounds.VoicesWorker_WORKER_FunnyComment_rnd_01
		
		
		XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionWorker,1)	
		Camera.FollowEntity(EntityId)		
		
			
	-- Is selected entity a leader?
	elseif Logic.IsLeader( EntityId ) == 1 then	
		
		
		--this can be done better: AnSu		
		XGUIEng.DisableButton(gvGUI_WidgetID.ExpelSettler,0)
		
		--Hide all militray unit widgets
		XGUIEng.ShowAllSubWidgets(gvGUI_WidgetID.SelectionMilitaryUnit,0)	
		
		--Display Military Unit container
		XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionMilitaryUnit,1)
			
		XGUIEng.ShowWidget(gvGUI_WidgetID.CommandsGeneric,1)

		if Logic.IsEntityInCategory(EntityId,EntityCategories.Military) == 1 and Logic.IsHero(EntityId) == 0 then
			XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionLeader,1)
		end
		
		if EntityType == Entities.PU_BattleSerf  then
			XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionBattleSerf ,1)	
			XGUIEng.ShowWidget(gvGUI_WidgetID.CommandsGeneric,1)
			--XGUIEng.ShowWidget("Commands_Leader",0)
			FunnyComment = Sounds.VoicesSerf_SERF_FunnyComment_rnd_01
		else
			XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionBattleSerf ,0)
			--XGUIEng.ShowWidget(gvGUI_WidgetID.CommandsGeneric,1)
		end

		if Logic.IsHero(EntityId) == 0 then
			XGUIEng.ShowWidget("Command_Expel",1)
			XGUIEng.ShowWidget("Commands_Leader",1)
		else
			XGUIEng.ShowWidget("Command_Expel",0)
			XGUIEng.ShowWidget("Commands_Leader",0)
		end
		
		--Scout and Thief
		if EntityType == Entities.PU_Scout then
			XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionScout,1)
			XGUIEng.ShowWidget(gvGUI_WidgetID.CommandsGeneric,1)			
			XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionLeader,0)
			FunnyComment = Sounds.AOVoicesScout_Scout_FunnyComment_rnd_01		
		end
	
		if EntityType == Entities.PU_Thief then
			XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionThief,1)
			XGUIEng.ShowWidget(gvGUI_WidgetID.CommandsGeneric,1)			
			XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionLeader,0)
			FunnyComment = Sounds.AOVoicesThief_Thief_FunnyComment_rnd_01			
		end
		
		
		if GUI_Selection[2] == nil then
			
			if Logic.IsHero(EntityId) == 1 then
	
				if Logic.IsEntityInCategory(EntityId,EntityCategories.Hero1) == 1 then

					FunnyComment = Sounds.VoicesHero1_HERO1_FunnyComment_rnd_01						
				
				elseif Logic.IsEntityInCategory(EntityId,EntityCategories.Hero2) == 1 then

					FunnyComment = Sounds.VoicesHero2_HERO2_FunnyComment_rnd_01
									
				elseif Logic.IsEntityInCategory(EntityId,EntityCategories.Hero3) == 1 then

					FunnyComment = Sounds.VoicesHero3_HERO3_FunnyComment_rnd_01
					
				elseif Logic.IsEntityInCategory(EntityId,EntityCategories.Hero4) == 1 then

					FunnyComment = Sounds.VoicesHero4_HERO4_FunnyComment_rnd_01
									
				elseif Logic.IsEntityInCategory(EntityId,EntityCategories.Hero5) == 1 then

					FunnyComment = Sounds.VoicesHero5_HERO5_FunnyComment_rnd_01
				
				elseif Logic.IsEntityInCategory(EntityId,EntityCategories.Hero6) == 1 then

					FunnyComment = Sounds.VoicesHero6_HERO6_FunnyComment_rnd_01
					
				elseif EntityType == Entities.CU_BlackKnight then

					FunnyComment = Sounds.VoicesHero7_HERO7_FunnyComment_rnd_01
					
				elseif EntityType == Entities.CU_Mary_de_Mortfichet then

					FunnyComment = Sounds.VoicesHero8_HERO8_FunnyComment_rnd_01	
				
				elseif EntityType == Entities.CU_Barbarian_Hero then

					FunnyComment = Sounds.VoicesHero9_HERO9_FunnyComment_rnd_01	
					
				--AddOn
				
				elseif Logic.IsEntityInCategory(EntityId,EntityCategories.Hero10) == 1 then
					FunnyComment = Sounds.AOVoicesHero10_HERO10_FunnyComment_rnd_01
				elseif Logic.IsEntityInCategory(EntityId,EntityCategories.Hero11) == 1 then
					FunnyComment = Sounds.AOVoicesHero11_HERO11_FunnyComment_rnd_01
				elseif EntityType == Entities.CU_Evil_Queen then
					FunnyComment = Sounds.AOVoicesHero12_HERO12_FunnyComment_rnd_01
				
				--Community Patch
				elseif EntityType == Entities.PU_Hero1 then
					FunnyComment = Sounds.AOVoicesScout_Scout_FunnyComment_rnd_01
				
				end
			else
			--disbale Buy soldier Area for units without possible soldier
				if Logic.LeaderGetMaxNumberOfSoldiers(EntityId) == 0 then
					XGUIEng.ShowWidget(gvGUI_WidgetID.BuySoldierArea ,0)
					--XGUIEng.ShowWidget("Commands_Leader",0)
				else
					XGUIEng.ShowWidget(gvGUI_WidgetID.BuySoldierArea ,1)
					--XGUIEng.ShowWidget("Commands_Leader",1)		
				end
				--XGUIEng.ShowWidget(gvGUI_WidgetID.BuySoldier,1)
				
				--FunnyComment = Sounds.VoicesLeader_LEADER_FunnyComment_rnd_04
			end
		
		end	
		
	
	-- Is selected entity a building?
	elseif Logic.IsBuilding( EntityId ) == 1 then
	
		if RandomSelectionSound == 2 then
			local Name = "OnKlick_" .. EntityTypeName
			SelectionSound = Sounds[Name]
		end
			
		
		--Hide all building widgets
		XGUIEng.ShowAllSubWidgets(gvGUI_WidgetID.SelectionBuilding,0)	
		
		--Display building container
		XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionBuilding,1)
		
		local UpgradeCategory = Logic.GetUpgradeCategoryByBuildingType(EntityType)
		
		
		--Display Worker buttons for buildings with at least one worker
		do 
			--Does the building have Workers?
			local MaxNumberOfworkers = Logic.GetMaxNumWorkersInBuilding(EntityId)
			if MaxNumberOfworkers > 0 then
				--YES!
				--Display Buttons				
				XGUIEng.ShowWidget(gvGUI_WidgetID.BuildingTabs,1)
				XGUIEng.UnHighLightGroup(gvGUI_WidgetID.InGame, "BuildingMenuGroup")	
				XGUIEng.HighLightButton(gvGUI_WidgetID.ToBuildingSettlersMenu,1)	
				
				XGUIEng.ShowWidget(gvGUI_WidgetID.ActivateOvertimes,1)
				
				InterfaceTool_UpdateWorkerAmountButtons()			
			end
		end
		
		
		--Display destroy button for all buildings expect headquarter
		do
			if 	UpgradeCategory ~= UpgradeCategories.Headquarters then
				XGUIEng.ShowWidget(gvGUI_WidgetID.DestroyBuilding,1)			
			end
		end
		
		--Display technology progress if building is reseaching something
		do
			if Logic.GetTechnologyResearchedAtBuilding(EntityId) ~= 0 then			
				XGUIEng.ShowWidget(gvGUI_WidgetID.ResearchInProgress,1)			
			end			
		end
		
		
		--Display Upgrade Progress if building will be upgraded currently 
		do 
			if Logic.GetRemainingUpgradeTimeForBuilding(EntityId) ~= Logic.GetTotalUpgradeTimeForBuilding (EntityId) then
				XGUIEng.ShowWidget(gvGUI_WidgetID.UpgradeInProgress,1)			
			end
		end
		
		--Check selected building Type
		if Logic.IsConstructionComplete( EntityId ) == 1 then
		
			local ButtonStem = ""
			
			--Is EntityType the Headquarter?
			if  UpgradeCategory == UpgradeCategories.Headquarters then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Headquarter,1)	
				XGUIEng.ShowWidget(gvGUI_WidgetID.HQOutpostCommands,1)										
				ButtonStem = "Upgrade_Headquarter"		
			
			--Is EntityType the Village?
			elseif  UpgradeCategory == UpgradeCategories.VillageCenter then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Village,1)							
				ButtonStem = "Upgrade_Village"		
			
			--Is EntityType the Grange?
			elseif  UpgradeCategory == UpgradeCategories.Grange then
				XGUIEng.ShowWidget("Grange", 1)							
				ButtonStem = ""								
			
			--Is EntityType the residence?
			elseif 	UpgradeCategory == UpgradeCategories.Residence then			
				XGUIEng.ShowWidget(gvGUI_WidgetID.Residence,1)
				ButtonStem =  "Upgrade_Residence"
				
				--HACK:
				XGUIEng.ShowWidget(gvGUI_WidgetID.BuildingTabs,1)
				XGUIEng.UnHighLightGroup(gvGUI_WidgetID.InGame, "BuildingMenuGroup")	
				XGUIEng.HighLightButton(gvGUI_WidgetID.ToBuildingSettlersMenu,1)	
				
				--XGUIEng.ShowWidget(gvGUI_WidgetID.ActivateOvertimes,0)
				--XGUIEng.ShowWidget(gvGUI_WidgetID.QuitOvertimes,0)
				
				--GUIAction_ChangeBuildingMenu(gvGUI_WidgetID.ToBuildingSettlersMenu)			
				
			
			--Is EntityType the farm?
			elseif 	UpgradeCategory == UpgradeCategories.Farm then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Farm,1)
				ButtonStem =  "Upgrade_Farm"				
				--HACK
				XGUIEng.ShowWidget(gvGUI_WidgetID.BuildingTabs,1)
				XGUIEng.UnHighLightGroup(gvGUI_WidgetID.InGame, "BuildingMenuGroup")	
				XGUIEng.HighLightButton(gvGUI_WidgetID.ToBuildingSettlersMenu,1)
				
				--XGUIEng.ShowWidget(gvGUI_WidgetID.ActivateOvertimes,0)
				--XGUIEng.ShowWidget(gvGUI_WidgetID.QuitOvertimes,0)
				
								
				--GUIAction_ChangeBuildingMenu(gvGUI_WidgetID.ToBuildingSettlersMenu)			
				
						
			--Is EntityType the Barracks?
			elseif 	UpgradeCategory == UpgradeCategories.Barracks then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Barracks,1)
				XGUIEng.ShowWidget(gvGUI_WidgetID.ToggleRecruitGroups,1)

				if CP_GetEvilModUnitState(PlayerID) > 0 then
					XGUIEng.ShowWidget("Group_Evil_Melee", 1)
					if CP_GetEvilModUnitState(PlayerID) == 1 or CP_GetEvilModUnitState(PlayerID) == 3 then
						XGUIEng.ShowWidget("Buy_LeaderBlackKnight", 1)
						XGUIEng.ShowWidget("Buy_LeaderBarbarian", 1)
						XGUIEng.ShowWidget("Buy_LeaderBanditAxe", 1)
					end
					if CP_GetEvilModUnitState(PlayerID) == 2 or CP_GetEvilModUnitState(PlayerID) == 3 then
						XGUIEng.ShowWidget("Buy_LeaderBearman", 1)
						if CP_GetEvilModUnitState(PlayerID) == 2 then
							XGUIEng.SetWidgetPosition("Buy_LeaderBearman", 0, 0)
						end
					end
				end

				ButtonStem =  "Upgrade_Barracks"
			
			--Is EntityType the Archery?
			elseif 	UpgradeCategory == UpgradeCategories.Archery then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Archery,1)
				XGUIEng.ShowWidget(gvGUI_WidgetID.ToggleRecruitGroups,1)

				if CP_GetEvilModUnitState(PlayerID) > 0 then
					XGUIEng.ShowWidget("Group_Evil_Range", 1)
					if CP_GetEvilModUnitState(PlayerID) == 1 or CP_GetEvilModUnitState(PlayerID) == 3 then
						XGUIEng.ShowWidget("Buy_LeaderBanditBow", 1)
					end
					if CP_GetEvilModUnitState(PlayerID) == 2 or CP_GetEvilModUnitState(PlayerID) == 3 then
						XGUIEng.ShowWidget("Buy_LeaderSkirmisher", 1)
						if CP_GetEvilModUnitState(PlayerID) == 2 then
							XGUIEng.SetWidgetPosition("Buy_LeaderSkirmisher", 0, 0)
						end
					end
				end

				ButtonStem =  "Upgrade_Archery"			
			
			--Is EntityType the Foundry?
			elseif 	UpgradeCategory == UpgradeCategories.Foundry then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Foundry,1)
				ButtonStem =  "Upgrade_Foundry"			
				--local CannonProgress = Logic.GetCannonProgress(EntityId)
				if gvGUI_CannonButtonIDArray[EntityId] ~= nil then
					XGUIEng.ShowWidget(gvGUI_WidgetID.CannonInProgress,1)
				else			
					XGUIEng.ShowWidget(gvGUI_WidgetID.CannonInProgress,0)
				end
				
			--Is EntityType the Stables?
			elseif 	UpgradeCategory == UpgradeCategories.Stable then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Stables,1)
				XGUIEng.ShowWidget(gvGUI_WidgetID.ToggleRecruitGroups,1)
				
				if CP_GetEvilModUnitState(PlayerID) > 0 then
					XGUIEng.ShowWidget("Group_Evil_Cavalry", 1)
					if CP_GetEvilModUnitState(PlayerID) == 1 or CP_GetEvilModUnitState(PlayerID) == 3 then
						XGUIEng.ShowWidget("Buy_AggressiveWolf", 1)
					end
				end

				ButtonStem =  "Upgrade_Stables"			
			
			--Is EntityType the University?
			elseif 	UpgradeCategory == UpgradeCategories.University then			
				XGUIEng.ShowWidget(gvGUI_WidgetID.University,1)
				ButtonStem =  "Upgrade_University"
			
							
			--Is EntityType the Silvermine?
			elseif 	UpgradeCategory == UpgradeCategories.ClayMine then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Claymine,1)					
				ButtonStem =  "Upgrade_Claymine"			
			
			--Is EntityType the Sulfurmine?
			elseif 	UpgradeCategory == UpgradeCategories.SulfurMine then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Sulfurmine,1)					
				ButtonStem =  "Upgrade_Sulfurmine"
				
			--Is EntityType the Ironmine?
			elseif 	UpgradeCategory == UpgradeCategories.IronMine then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Ironmine,1)					
				ButtonStem =  "Upgrade_Ironmine"
			
			--Is EntityType the Stonemine?
			elseif 	UpgradeCategory == UpgradeCategories.StoneMine then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Stonemine,1)					
				ButtonStem =  "Upgrade_Stonemine"
							
			--Is EntityType the Brickworks?
			elseif 	UpgradeCategory == UpgradeCategories.Brickworks then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Brickworks,1)					
				ButtonStem =  "Upgrade_Brickworks"
			
			--Is EntityType the Sawmill?
			elseif 	UpgradeCategory == UpgradeCategories.Sawmill then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Sawmill,1)					
				ButtonStem =  "Upgrade_Sawmill"			
			
			--Is EntityType the Blacksmith?
			elseif 	UpgradeCategory == UpgradeCategories.Blacksmith then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Blacksmith,1)					
				ButtonStem =  "Upgrade_Blacksmith"
			
			--Is EntityType the StoneMason?
			elseif 	UpgradeCategory == UpgradeCategories.StoneMason then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Stonemason,1)					
				ButtonStem =  "Upgrade_Stonemason"
			
			
			--Is EntityType the Alchemist?
			elseif 	UpgradeCategory == UpgradeCategories.Alchemist then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Alchemist,1)					
				ButtonStem =  "Upgrade_Alchemist"
			
			
			--Is EntityType the Monastery?
			elseif 	UpgradeCategory == UpgradeCategories.Monastery then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Monastery,1)					
				ButtonStem =  "Upgrade_Monastery"
				
			--Is EntityType the Market?
			elseif 	UpgradeCategory == UpgradeCategories.Market then
			
				--You can only trade at market level 2
				if EntityType == Entities.PB_Market2 then
					XGUIEng.ShowWidget(gvGUI_WidgetID.Trade,1)
					--Trdae in progress?
					if Logic.GetTransactionProgress(EntityId) ~= 100 then
						XGUIEng.ShowWidget(gvGUI_WidgetID.TradeInProgress,1)
					else			
						XGUIEng.ShowWidget(gvGUI_WidgetID.TradeInProgress,0)
					end
				else
					XGUIEng.ShowWidget(gvGUI_WidgetID.Trade,0)
					XGUIEng.ShowWidget(gvGUI_WidgetID.TradeInProgress,0)
				end
				
				
				
				XGUIEng.ShowWidget(gvGUI_WidgetID.Market,1)					
				ButtonStem =  "Upgrade_Market"
				
				if EntityId ~= gvGUI.LastSelectedEntityID then
					GUIAction_MarketClearDeals()
				end
				
			
			--Is EntityType the Bank?
			elseif 	UpgradeCategory == UpgradeCategories.Bank then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Bank,1)					
				ButtonStem =  "Upgrade_Bank"
			
			
			--Is EntityType the Tower?
			elseif 	UpgradeCategory == UpgradeCategories.Tower then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Tower,1)					
				ButtonStem =  "Upgrade_Tower"

			--Is EntityType the DarkTower?
			elseif 	UpgradeCategory == UpgradeCategories.DarkTower then
				XGUIEng.ShowWidget("DarkTower",1)					
				ButtonStem =  "DT_Upgrade_Tower"
				
			--Is EntityType the outpost?
			elseif 	UpgradeCategory == UpgradeCategories.Outpost then
				
				XGUIEng.ShowWidget(gvGUI_WidgetID.Outpost,1)					
				XGUIEng.ShowWidget(gvGUI_WidgetID.HQOutpostCommands,1)				
			
			--Is EntityType the weathertower?
			elseif 	UpgradeCategory == UpgradeCategories.Weathermachine then				
				XGUIEng.ShowWidget(gvGUI_WidgetID.WeatherTower,1)					
			--Is EntityType the powerPlant?
			elseif 	UpgradeCategory == UpgradeCategories.PowerPlant then				
				XGUIEng.ShowWidget(gvGUI_WidgetID.PowerPlant,1)					
				
				
			-- ADDON:
			--Is EntityType the Tavern?
			elseif 	UpgradeCategory == UpgradeCategories.Tavern then
				XGUIEng.ShowWidget(gvGUI_WidgetID.Tavern,1)					
				ButtonStem =  "Upgrade_Tavern"
				
			--Is EntityType the Gunsmith?
			elseif 	UpgradeCategory == UpgradeCategories.GunsmithWorkshop then
				XGUIEng.ShowWidget(gvGUI_WidgetID.GunsmithWorkshop,1)					
				ButtonStem =  "Upgrade_GunsmithWorkshop"
				
			--Is EntityType the Master builder Workshop?
			elseif 	UpgradeCategory == UpgradeCategories.MasterBuilderWorkshop then
				XGUIEng.ShowWidget(gvGUI_WidgetID.MasterBuilderWorkshop,1)					
				
			--Is EntityType the bridge?
			--elseif 	UpgradeCategory == UpgradeCategories.Bridge then
			--	XGUIEng.ShowWidget(gvGUI_WidgetID.Bridge,1)					
			
			
			end
			--Update Upgrade Buttons
			InterfaceTool_UpdateUpgradeButtons(EntityType, UpgradeCategory,ButtonStem)								
		
		
		
		end
		
		
		
	end
	
	if FunnyComment == 0 and Logic.IsLeader( EntityId ) == 1 then
		FunnyComment = Sounds.VoicesLeader_LEADER_FunnyComment_rnd_04
	end
	
	--funny comment only for settlers
	if FunnyComment ~= 0 then
		if Logic.IsSettler( EntityId ) == 1 then
			
			if EntityId  == gvGUI.LastSelectedEntityID then
				gvGUI.FunnyCommentsSelectionCounter = gvGUI.FunnyCommentsSelectionCounter + 1
			end
			
			
			if gvGUI.FunnyCommentsSelectionCounter >= 8 then
				Sound.PlayQueuedFeedbackSound(FunnyComment,127)				
				SelectionSound = 0
				gvGUI.FunnyCommentsSelectionCounter = 0
				gvGUI.FunnyCommentStartTime = Game.RealTimeGetMs() / 1000
			end			
			
		end
	end
	
	
	if gvGUI.LastSelectedEntityID ~= EntityId then
		-- play selection sound
		-- Confirm FX - only every x ms
		if Logic.IsWorker( EntityId )  == 0 then
			
				do
					local CurrentTime = Game.RealTimeGetMs() / 1000		
					if 		gvSelection_LastTimeFXStarted == nil 
						or 	( CurrentTime - gvSelection_LastTimeFXStarted ) > 0.4
					then			
						local volume = 64
						if Logic.IsBuilding( EntityId ) == 1 then						
							volume = 20
							Sound.PlayGUISound( SelectionSound, volume )
						end
						if SelectionSound ~= 0 then								
							if gvGUI.FunnyCommentStartTime == nil 
							or ( CurrentTime - gvGUI.FunnyCommentStartTime ) > 2.5 then
								Sound.PlayGUISound( SelectionSound, volume )
							end
						end
					end
					gvSelection_LastTimeFXStarted = CurrentTime
				
			end	
		else			
			GUIAction_WorkerFeedbackBySelection( EntityId )
		end
	end
	
	gvGUI.LastSelectedEntityID = EntityId
	
	-- Init hero selection
	HeroSelection_Init()
	
	-- Any hero selected
	if HeroSelection_GetCurrentHeroType() ~= 0 then
		
		-- Show hero page
		HeroWidgetUpdate_ShowHeroWidget(HeroSelection_GetCurrentSelectedHeroID())
		
	end
	
	--Update all buttons in the visible container
	XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)
		
end



--------------------------------------------------------------------------------
-- GUI state changed (called by the program)
--------------------------------------------------------------------------------

function GameCallback_GUI_StateChanged( _StateNameID, _Armed )
  
  	if _Armed == 1 then
  		--disable following        			  		 
        if gvCamera.DefaultFlag ~= 0 then	    
    		Camera.FollowEntity(0)
    	end
    end
  
  	-- Default
	if _StateNameID == gvGUI_StateID.Selection then
		Mouse.CursorShow()
		if _Armed == 1 then
        	Mouse.CursorSet( 16 )        	
        else
        	Mouse.CursorSet( 10 )
        	--disable following      
        	if gvCamera.DefaultFlag ~= 0 then
    			Camera.FollowEntity(0)
    		end
        end
        
        
        
        
    -- GUI states
	elseif _StateNameID == gvGUI_StateID.WalkCommand then	       
		Mouse.CursorShow()
        Mouse.CursorSet( 23 )
        		
	elseif _StateNameID == gvGUI_StateID.PlaceBuilding then
		Mouse.CursorShow()
        Mouse.CursorSet( 11 )
    
	elseif _StateNameID == gvGUI_StateID.ExpelSettler then
		Mouse.CursorShow()
        Mouse.CursorSet( 14 )
     
	elseif _StateNameID == gvGUI_StateID.BlessSettler then
		Mouse.CursorShow()
        Mouse.CursorSet( 12 )
     
	elseif _StateNameID == gvGUI_StateID.ForceWorkerToWork then
		Mouse.CursorShow()
        Mouse.CursorSet( 18 )
     
	elseif _StateNameID == gvGUI_StateID.AttackMoveCommand then
		Mouse.CursorShow()
        Mouse.CursorSet( 24 )
    
    elseif _StateNameID == gvGUI_StateID.GuardCommand then
		Mouse.CursorShow()
        Mouse.CursorSet( 25 )
    
    elseif _StateNameID == gvGUI_StateID.PatrolCommand then
		Mouse.CursorShow()
        Mouse.CursorSet( 26 )
    
    elseif _StateNameID == gvGUI_StateID.PlaceBombCommand then
		Mouse.CursorShow()
        Mouse.CursorSet( 27 )
               
    elseif _StateNameID == gvGUI_StateID.PlaceKegCommand then
		Mouse.CursorShow()
        Mouse.CursorSet( 32 )
               
    elseif _StateNameID == gvGUI_StateID.PlaceTorchCommand then
		Mouse.CursorShow()
        Mouse.CursorSet( 33 )
	
    elseif _StateNameID == gvGUI_StateID.ScoutBinocularsCommand then
		Mouse.CursorShow()
        Mouse.CursorSet( 30 )
	
    elseif _StateNameID == gvGUI_StateID.ShurikenCommand then
		Mouse.CursorShow()
        Mouse.CursorSet( 36 )
	
    elseif _StateNameID == gvGUI_StateID.SnipeCommand then
		Mouse.CursorShow()
        Mouse.CursorSet( 37 )

	elseif _StateNameID == gvGUI_StateID.CutScene then
		
		if not IsWaitingForMCSelection() then
			Mouse.CursorHide()
		end
        Mouse.CursorSet( 10 )
                  
   
   	-- Context sensitive
	elseif _StateNameID == gvGUI_StateID.AttackCommand then
		Mouse.CursorShow()
        Mouse.CursorSet( 19 )
      
	elseif _StateNameID == gvGUI_StateID.WalkCommand then
		Mouse.CursorShow()
        Mouse.CursorSet( 23 )
      
	elseif _StateNameID == gvGUI_StateID.SerfConstructBuildingCommand then
		Mouse.CursorShow()
        Mouse.CursorSet( 20 )
      
	elseif _StateNameID == gvGUI_StateID.SerfExtractResourceCommand then
		Mouse.CursorShow()
        Mouse.CursorSet( 21 )
      
	elseif _StateNameID == gvGUI_StateID.SerfRepairBuildingCommand then
		Mouse.CursorShow()
        Mouse.CursorSet( 22 )
  
  	elseif _StateNameID == gvGUI_StateID.NPCInteraction then
  		Mouse.CursorShow()
        Mouse.CursorSet( 29 )
  
  	elseif _StateNameID == gvGUI_StateID.ConvertSettler then
  		Mouse.CursorShow()
  		Mouse.CursorSet( 14 )
  
  	elseif _StateNameID == gvGUI_StateID.DisarmKegCommand then
  		Mouse.CursorShow()
        Mouse.CursorSet( 31 )
  
  	elseif _StateNameID == gvGUI_StateID.StealGoodsCommand then
  		Mouse.CursorShow()
        Mouse.CursorSet( 35 )
        
  	elseif _StateNameID == gvGUI_StateID.SecureStolenGoodsCommand then
  		Mouse.CursorShow()
        Mouse.CursorSet( 34 )
        
	-- Unknown!
  	else
		Mouse.CursorShow()
        Mouse.CursorSet( 10 )
        
	end

end



--------------------------------------------------------------------------------
-- Called by the program after building was placed on the terrain
--------------------------------------------------------------------------------
function GameCallback_GUI_AfterBuildingPlacement()
	
	XGUIEng.UnHighLightGroup(gvGUI_WidgetID.InGame, "BuildingGroup")	
	GUI.CancelState() 
	
end

--------------------------------------------------------------------------------
-- Called by the program when right click pressed in place building mode
--------------------------------------------------------------------------------
function GameCallback_GUI_ConstructBuildAbort()
	XGUIEng.UnHighLightGroup(gvGUI_WidgetID.InGame, "BuildingGroup")	
end

--------------------------------------------------------------------------------
-- Function that is called when an entity ID changes (upgrade, ...)
--------------------------------------------------------------------------------
function
GameCallback_GUI_EntityIDChanged( _OldID, _NewID )

	GroupSelection_EntityIDChanged( _OldID, _NewID )
	
	if MissionScripting_EntityIDChanged ~= nil then
		MissionScripting_EntityIDChanged( _OldID, _NewID )
	end
	
end


--------------------------------------------------------------------------------
-- Called by the program after building was placed on the terrain
--------------------------------------------------------------------------------
function GameCallback_GUI_AfterCannonPlacement()
	
	XGUIEng.UnHighLightGroup(gvGUI_WidgetID.InGame, "BuildingGroup")	
	GUI.CancelState() 
	
end

--------------------------------------------------------------------------------
-- Called by the program when right click pressed in place building mode
--------------------------------------------------------------------------------
function GameCallback_GUI_ConstructCannonAbort()
	XGUIEng.UnHighLightGroup(gvGUI_WidgetID.InGame, "BuildingGroup")	
end 


--------------------------------------------------------------------------------
-- Called by the program when building is ready
function GameCallback_OnBuildingConstructionComplete(_BuildingID, _PlayerID)
	
	if Logic.IsEntityInCategory(_BuildingID,EntityCategories.Bridge) == 1 then
		return
	end
	
	Score.OnBuildingConstructionComplete(_BuildingID, _PlayerID)

	local PlayerID = GUI.GetPlayerID()
	if PlayerID ~= _PlayerID then
		return
	end
	
	--Update all buttons in the visible container
	XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)	
	
	--GameCallback_GUI_SelectionChanged()
	if Logic.IsBuilding(GUI.GetSelectedEntity())== 1 then
		GUI.SetSelectedEntity(GUI.GetSelectedEntity())
	end
	
	if _player == GUI.GetPlayerID() then
		Sound.PlayGUISound(Sounds.Misc_Chat,100)
	end
end


function GameCallback_OnCannonConstructionComplete(_BuildingID, _empty)
	gvGUI_CannonButtonIDArray[_BuildingID] = nil
	local BuildingID = GUI.GetSelectedEntity()
	
	if _BuildingID == BuildingID then
		XGUIEng.ShowWidget(gvGUI_WidgetID.CannonInProgress,0)
	end
end


function
GUIAction_WorkerFeedbackBySelection( _WorkerID )
	
	local PlayerID = GUI.GetPlayerID()	

	local ResidenceID = Logic.GetSettlersResidence(_WorkerID)
	local FarmID = Logic.GetSettlersFarm(_WorkerID)
	local WorkID = Logic.GetSettlersWorkBuilding(_WorkerID)
	
	local Motivation = Logic.GetSettlersMotivation(_WorkerID)
	local TaxLevel = Logic.GetTaxLevel(PlayerID)
	
	local SoundID = 0
	
	if _WorkerID == gvGUI.LastSelectedEntityID then
		return
	end
	
	if 	Motivation < gvGUI.MotivationThresholds.Leave then
			SoundID = Sounds.VoicesWorker_WORKER_Leaving_rnd_01		
	
	elseif 	Motivation > gvGUI.MotivationThresholds.Leave
			and Motivation < gvGUI.MotivationThresholds.Angry 
			then	
				SoundID = Sounds.VoicesWorker_WORKER_Unhappy_rnd_01	
	elseif TaxLevel == 4 then
		SoundID = Sounds.VoicesWorker_WORKER_TaxesToHigh_rnd_01
	
	elseif WorkID == 0 then
		SoundID = Sounds.VoicesWorker_WORKER_NoWork_rnd_01
		
	elseif ResidenceID == 0 then
		SoundID = Sounds.VoicesWorker_WORKER_NeedBed_rnd_01
	
	elseif FarmID == 0 then
		SoundID = Sounds.VoicesWorker_WORKER_NeedFood_rnd_01
	
	
	else
	
		if 		Motivation > gvGUI.MotivationThresholds.Happy 
			then
			 	SoundID = Sounds.VoicesWorker_WORKER_ILikeItHere_rnd_01
			 		
		elseif 	Motivation >= gvGUI.MotivationThresholds.Sad	 
			and Motivation < gvGUI.MotivationThresholds.Happy
			then
				
				SoundID = Sounds.VoicesWorker_WORKER_ILikeItHere_rnd_01
				
		elseif 	Motivation > gvGUI.MotivationThresholds.Leave
			and Motivation < gvGUI.MotivationThresholds.Angry 
			then	
				SoundID = Sounds.VoicesWorker_WORKER_Unhappy_rnd_01		
		else
			SoundID = Sounds.VoicesWorker_WORKER_FunnyComment_rnd_01
		end
	end
	
	Sound.PlayFeedbackSound(SoundID,124)
	


end