--------------------------------------------------------------------------------
-- Local interface script
--------------------------------------------------------------------------------
-- Init interface

function
Interface_InitWidgets()
	
	gvGUI_WidgetID = {}
	-- Convert widget names into widget IDs
	--selection views
	gvGUI_WidgetID.SelectionView = 			XGUIEng.GetWidgetID( "SelectionView" )	
	gvGUI_WidgetID.SelectionMilitaryUnit = 	XGUIEng.GetWidgetID( "Selection_MilitaryUnit" )
	gvGUI_WidgetID.SelectionBuilding = 		XGUIEng.GetWidgetID( "Selection_Building" )
	gvGUI_WidgetID.SelectionHeroGeneric=	XGUIEng.GetWidgetID( "Selection_HeroGeneric" )
	gvGUI_WidgetID.SelectionWorker=			XGUIEng.GetWidgetID( "Selection_Worker" )	
	gvGUI_WidgetID.SelectionSerf = 			XGUIEng.GetWidgetID( "Selection_Serf" )
	gvGUI_WidgetID.SelectionBattleSerf = 	XGUIEng.GetWidgetID( "Selection_BattleSerf" )
	
	gvGUI_WidgetID.DestroyBuildingConfirmation = 	XGUIEng.GetWidgetID( "DestroyBuildingConfirmationScreen" )
	
	gvGUI_WidgetID.CommandsGeneric = 		XGUIEng.GetWidgetID( "Commands_generic" )	
	gvGUI_WidgetID.ExpelSettler = 			XGUIEng.GetWidgetID( "Command_Expel" )	
	gvGUI_WidgetID.SelectionHero = 			XGUIEng.GetWidgetID( "Selection_Hero" )  		
	gvGUI_WidgetID.SelectionHero1 = 		XGUIEng.GetWidgetID( "Selection_Hero1" ) 	
	gvGUI_WidgetID.SelectionHero2 = 		XGUIEng.GetWidgetID( "Selection_Hero2" ) 
	gvGUI_WidgetID.SelectionHero3 = 		XGUIEng.GetWidgetID( "Selection_Hero3" ) 
	gvGUI_WidgetID.SelectionHero4=  		XGUIEng.GetWidgetID( "Selection_Hero4" ) 
	gvGUI_WidgetID.SelectionHero5 = 		XGUIEng.GetWidgetID( "Selection_Hero5" ) 	
	gvGUI_WidgetID.SelectionHero6 = 		XGUIEng.GetWidgetID( "Selection_Hero6" ) 	
	gvGUI_WidgetID.SelectionHero7 = 		XGUIEng.GetWidgetID( "Selection_Hero7" ) 	
	gvGUI_WidgetID.SelectionHero8 = 		XGUIEng.GetWidgetID( "Selection_Hero8" ) 	
	gvGUI_WidgetID.SelectionHero9 = 		XGUIEng.GetWidgetID( "Selection_Hero9" ) 	
	gvGUI_WidgetID.SelectionDovbar = 		XGUIEng.GetWidgetID( "Selection_Dovbar" ) 	
	gvGUI_WidgetID.SelectionLeader = 		XGUIEng.GetWidgetID( "Selection_Leader" )	
	
	gvGUI_WidgetID.BackgroundContainer= 	XGUIEng.GetWidgetID( "BackGroundBottomContainer" )
	gvGUI_WidgetID.BackgroundFull= 			XGUIEng.GetWidgetID( "BackGround_Bottom" )
	gvGUI_WidgetID.BackgroundLeft= 			XGUIEng.GetWidgetID( "BackGround_BottomLeft" )
	
	gvGUI_WidgetID.SerfConstructionMenu= 	XGUIEng.GetWidgetID( "SerfConstructionMenu" )
	gvGUI_WidgetID.SerfBeautificationMenu=  XGUIEng.GetWidgetID( "SerfBeautificationMenu" )	
	gvGUI_WidgetID.SerfMenus= 				XGUIEng.GetWidgetID( "Commands_Serf" )
	
	
	gvGUI_WidgetID.MultiSelectionContainer= XGUIEng.GetWidgetID( "MultiSelectionContainer" )
	
	
	gvGUI_WidgetID.SelectionGeneric = 		XGUIEng.GetWidgetID( "Selection_generic" )
	gvGUI_WidgetID.DetailsGeneric= 			XGUIEng.GetWidgetID( "Details_Generic" )
	gvGUI_WidgetID.DetailsHealth = 			XGUIEng.GetWidgetID( "DetailsHealth" )
	gvGUI_WidgetID.DetailsArmor = 			XGUIEng.GetWidgetID( "DetailsArmor" )
	gvGUI_WidgetID.DetailsDamage = 			XGUIEng.GetWidgetID( "DetailsDamage" )
	gvGUI_WidgetID.DetailsGroupStrength = 	XGUIEng.GetWidgetID( "DetailsGroupStrength" )	
	gvGUI_WidgetID.Experience = 			XGUIEng.GetWidgetID( "DetailsExperience" )
	gvGUI_WidgetID.DetailsPayAndSlots= 		XGUIEng.GetWidgetID( "DetailsPayAndSlots" )
	gvGUI_WidgetID.DetailsGroupStrengthSoldiersContainer = XGUIEng.GetWidgetID( "DetailsGroupStrength_Soldiers" )
	gvGUI_WidgetID.DetailsGroupStrengthSoldiers ={}
	gvGUI_WidgetID.DetailsGroupStrengthSoldiers[1] = XGUIEng.GetWidgetID( "DetailsGroupStrength_Soldier01" )
	gvGUI_WidgetID.DetailsGroupStrengthSoldiers[2] = XGUIEng.GetWidgetID( "DetailsGroupStrength_Soldier02" )
	gvGUI_WidgetID.DetailsGroupStrengthSoldiers[3] = XGUIEng.GetWidgetID( "DetailsGroupStrength_Soldier03" )
	gvGUI_WidgetID.DetailsGroupStrengthSoldiers[4] = XGUIEng.GetWidgetID( "DetailsGroupStrength_Soldier04" )
	gvGUI_WidgetID.DetailsGroupStrengthSoldiers[5] = XGUIEng.GetWidgetID( "DetailsGroupStrength_Soldier05" )
	gvGUI_WidgetID.DetailsGroupStrengthSoldiers[6] = XGUIEng.GetWidgetID( "DetailsGroupStrength_Soldier06" )
	gvGUI_WidgetID.DetailsGroupStrengthSoldiers[7] = XGUIEng.GetWidgetID( "DetailsGroupStrength_Soldier07" )
	gvGUI_WidgetID.DetailsGroupStrengthSoldiers[8] = XGUIEng.GetWidgetID( "DetailsGroupStrength_Soldier08" )
	
	gvGUI_WidgetID.DetailsExperienceLevel ={}
	gvGUI_WidgetID.DetailsExperienceLevel[0] = XGUIEng.GetWidgetID( "DetailsExperience_Star1" )
	gvGUI_WidgetID.DetailsExperienceLevel[1] = XGUIEng.GetWidgetID( "DetailsExperience_Star2" )
	gvGUI_WidgetID.DetailsExperienceLevel[2] = XGUIEng.GetWidgetID( "DetailsExperience_Star3" )
	gvGUI_WidgetID.DetailsExperienceLevel[3] = XGUIEng.GetWidgetID( "DetailsExperience_Star4" )
	gvGUI_WidgetID.DetailsExperienceLevel[4] = XGUIEng.GetWidgetID( "DetailsExperience_Star5" )
	
	
	gvGUI_WidgetID.MultiSelectionButtons= {}
	gvGUI_WidgetID.MultiSelectionButtons[1] = XGUIEng.GetWidgetID( "MultiSelectionEntity01" )
	gvGUI_WidgetID.MultiSelectionButtons[2] = XGUIEng.GetWidgetID( "MultiSelectionEntity02" )
	gvGUI_WidgetID.MultiSelectionButtons[3] = XGUIEng.GetWidgetID( "MultiSelectionEntity03" )
	gvGUI_WidgetID.MultiSelectionButtons[4] = XGUIEng.GetWidgetID( "MultiSelectionEntity04" )
	gvGUI_WidgetID.MultiSelectionButtons[5] = XGUIEng.GetWidgetID( "MultiSelectionEntity05" )
	gvGUI_WidgetID.MultiSelectionButtons[6] = XGUIEng.GetWidgetID( "MultiSelectionEntity06" )
	gvGUI_WidgetID.MultiSelectionButtons[7] = XGUIEng.GetWidgetID( "MultiSelectionEntity07" )
	gvGUI_WidgetID.MultiSelectionButtons[8] = XGUIEng.GetWidgetID( "MultiSelectionEntity08" )
	gvGUI_WidgetID.MultiSelectionButtons[9] = XGUIEng.GetWidgetID( "MultiSelectionEntity09" )
	gvGUI_WidgetID.MultiSelectionButtons[10] = XGUIEng.GetWidgetID( "MultiSelectionEntity10" )
	gvGUI_WidgetID.MultiSelectionButtons[11] = XGUIEng.GetWidgetID( "MultiSelectionEntity11" )
	gvGUI_WidgetID.MultiSelectionButtons[12] = XGUIEng.GetWidgetID( "MultiSelectionEntity12" )
	
	
	

	--Buildings
	gvGUI_WidgetID.Headquarter = 			XGUIEng.GetWidgetID( "Headquarter" )
	gvGUI_WidgetID.Residence = 				XGUIEng.GetWidgetID( "Residence" )
	gvGUI_WidgetID.Farm = 					XGUIEng.GetWidgetID( "Farm" )
	gvGUI_WidgetID.Barracks = 				XGUIEng.GetWidgetID( "Barracks" )
	gvGUI_WidgetID.Archery = 				XGUIEng.GetWidgetID( "Archery" )
	gvGUI_WidgetID.Foundry = 				XGUIEng.GetWidgetID( "Foundry" )
	gvGUI_WidgetID.Stables = 				XGUIEng.GetWidgetID( "Stables" )
	gvGUI_WidgetID.University = 			XGUIEng.GetWidgetID( "University" )
	gvGUI_WidgetID.Claymine = 				XGUIEng.GetWidgetID( "Claymine" )
	gvGUI_WidgetID.Sulfurmine = 			XGUIEng.GetWidgetID( "Sulfurmine" )
	gvGUI_WidgetID.Ironmine = 				XGUIEng.GetWidgetID( "Ironmine" )
	gvGUI_WidgetID.Stonemine = 				XGUIEng.GetWidgetID( "Stonemine" )
	gvGUI_WidgetID.Brickworks = 			XGUIEng.GetWidgetID( "Brickworks" )
	gvGUI_WidgetID.Blacksmith = 			XGUIEng.GetWidgetID( "Blacksmith" )
	gvGUI_WidgetID.Stonemason = 			XGUIEng.GetWidgetID( "Stonemason" )
	gvGUI_WidgetID.Alchemist = 				XGUIEng.GetWidgetID( "Alchemist" )
	gvGUI_WidgetID.Monastery = 				XGUIEng.GetWidgetID( "Monastery" )
	gvGUI_WidgetID.Market = 				XGUIEng.GetWidgetID( "Market" )
	gvGUI_WidgetID.Bank = 					XGUIEng.GetWidgetID( "Bank" )
	gvGUI_WidgetID.Village = 				XGUIEng.GetWidgetID( "Village" )
	gvGUI_WidgetID.Tower = 					XGUIEng.GetWidgetID( "Tower" )
	gvGUI_WidgetID.Sawmill = 				XGUIEng.GetWidgetID( "Sawmill" )
	gvGUI_WidgetID.Outpost = 				XGUIEng.GetWidgetID( "Outpost" )
	gvGUI_WidgetID.WeatherTower = 			XGUIEng.GetWidgetID( "WeatherTower" )	
	gvGUI_WidgetID.PowerPlant = 			XGUIEng.GetWidgetID( "PowerPlant" )	
	gvGUI_WidgetID.ToggleRecruitGroups = 	XGUIEng.GetWidgetID( "ToggleRecruitGroups" )
	gvGUI_WidgetID.RecruitGroups = 			XGUIEng.GetWidgetID( "Activate_RecruitGroups" )
	gvGUI_WidgetID.RecruitSingleLeader = 	XGUIEng.GetWidgetID( "Activate_RecruitSingleLeader" )
	gvGUI_WidgetID.DestroyBuilding = 		XGUIEng.GetWidgetID( "DestroyBuilding" )
	gvGUI_WidgetID.ResearchInProgress = 	XGUIEng.GetWidgetID( "ResearchInProgress" )
	gvGUI_WidgetID.UpgradeInProgress = 		XGUIEng.GetWidgetID( "UpgradeInProgress" )
	gvGUI_WidgetID.TradeInProgress = 		XGUIEng.GetWidgetID( "TradeInProgress" )	
	gvGUI_WidgetID.Trade = 					XGUIEng.GetWidgetID( "Trade_Market" )	
	gvGUI_WidgetID.CannonInProgress= 		XGUIEng.GetWidgetID( "CannonInProgress" )	
	gvGUI_WidgetID.WorkersAmountFew = 		XGUIEng.GetWidgetID( "WorkersAmountFew" )
	gvGUI_WidgetID.WorkersAmountHalf = 		XGUIEng.GetWidgetID( "WorkersAmountHalf" )
	gvGUI_WidgetID.WorkersAmountFull = 		XGUIEng.GetWidgetID( "WorkersAmountFull" )
	gvGUI_WidgetID.SetWorkersAmountFew = 	XGUIEng.GetWidgetID( "SetWorkersAmountFew" )
	gvGUI_WidgetID.SetWorkersAmountHalf = 	XGUIEng.GetWidgetID( "SetWorkersAmountHalf" )
	gvGUI_WidgetID.SetWorkersAmountFull = 	XGUIEng.GetWidgetID( "SetWorkersAmountFull" )
	gvGUI_WidgetID.HQOutpostCommands =		XGUIEng.GetWidgetID( "HQOutpost_Commands" )
	gvGUI_WidgetID.ActivateAlarm = 			XGUIEng.GetWidgetID( "ActivateAlarm" )
	gvGUI_WidgetID.QuitAlarm = 				XGUIEng.GetWidgetID( "QuitAlarm" )	
	gvGUI_WidgetID.HQCallMilitia = 			XGUIEng.GetWidgetID( "HQ_CallMilitia" )
	gvGUI_WidgetID.HQBackToWork =			XGUIEng.GetWidgetID( "HQ_BackToWork" )	
	gvGUI_WidgetID.WorkerInBuilding= 		XGUIEng.GetWidgetID( "WorkerInBuilding" )	
	gvGUI_WidgetID.WorkerButtonContainer= 	XGUIEng.GetWidgetID( "WorkerButtonsContainer" )
	gvGUI_WidgetID.ToBuildingCommandMenu= 	XGUIEng.GetWidgetID( "ToBuildingCommandMenu")
	gvGUI_WidgetID.ToBuildingSettlersMenu= 	XGUIEng.GetWidgetID( "ToBuildingSettlersMenu")
	gvGUI_WidgetID.BuildingTabs=		 	XGUIEng.GetWidgetID( "BuildingTabs")
	
	
	gvGUI_WidgetID.ToSerfConstructionMenu= 	XGUIEng.GetWidgetID( "SerfToConstructionMenu")
	gvGUI_WidgetID.ToSerfBeatificationMenu= XGUIEng.GetWidgetID( "SerfToBeautificationMenu")
	
	
	gvGUI_WidgetID.TaxesButtons = {}
	gvGUI_WidgetID.TaxesButtons[0] = 			XGUIEng.GetWidgetID( "SetVeryLowTaxes" )
	gvGUI_WidgetID.TaxesButtons[1] = 			XGUIEng.GetWidgetID( "SetLowTaxes" )
	gvGUI_WidgetID.TaxesButtons[2] = 			XGUIEng.GetWidgetID( "SetNormalTaxes" )
	gvGUI_WidgetID.TaxesButtons[3] = 			XGUIEng.GetWidgetID( "SetHighTaxes" )
	gvGUI_WidgetID.TaxesButtons[4] = 			XGUIEng.GetWidgetID( "SetVeryHighTaxes" )
	
	gvGUI_WidgetID.OP_TaxesButtons = {}
	gvGUI_WidgetID.OP_TaxesButtons[0] = 			XGUIEng.GetWidgetID( "OP_SetVeryLowTaxes" )
	gvGUI_WidgetID.OP_TaxesButtons[1] = 			XGUIEng.GetWidgetID( "OP_SetLowTaxes" )
	gvGUI_WidgetID.OP_TaxesButtons[2] = 			XGUIEng.GetWidgetID( "OP_SetNormalTaxes" )
	gvGUI_WidgetID.OP_TaxesButtons[3] = 			XGUIEng.GetWidgetID( "OP_SetHighTaxes" )
	gvGUI_WidgetID.OP_TaxesButtons[4] = 			XGUIEng.GetWidgetID( "OP_SetVeryHighTaxes" )
	
	gvGUI_WidgetID.ActivateOvertimes = 		XGUIEng.GetWidgetID( "OvertimesButtonEnable" )
	gvGUI_WidgetID.QuitOvertimes = 			XGUIEng.GetWidgetID( "OvertimesButtonDisable" )	
	
	
	--Find view
	gvGUI_WidgetID.FindIdleSerf = 			XGUIEng.GetWidgetID( "Find_IdleSerf" )
	gvGUI_WidgetID.HeroFindContainer = 		XGUIEng.GetWidgetID( "FindHeroesContainer" )
	gvGUI_WidgetID.HeroFindButtons = {}
	gvGUI_WidgetID.HeroFindButtons[1] = 	XGUIEng.GetWidgetID( "FindHero1" )
	gvGUI_WidgetID.HeroFindButtons[2] = 	XGUIEng.GetWidgetID( "FindHero2" )
	gvGUI_WidgetID.HeroFindButtons[3] = 	XGUIEng.GetWidgetID( "FindHero3" )
	gvGUI_WidgetID.HeroFindButtons[4] = 	XGUIEng.GetWidgetID( "FindHero4" )
	gvGUI_WidgetID.HeroFindButtons[5] = 	XGUIEng.GetWidgetID( "FindHero5" )	
	gvGUI_WidgetID.HeroFindButtons[6] = 	XGUIEng.GetWidgetID( "FindHero6" )
	
	
	gvGUI_WidgetID.HeroDeadIconContainer = XGUIEng.GetWidgetID( "FindHeroesDeadContainer" )
	gvGUI_WidgetID.HeroDeadIcon = {}
	gvGUI_WidgetID.HeroDeadIcon[1] = 	XGUIEng.GetWidgetID( "Hero1Dead" )
	gvGUI_WidgetID.HeroDeadIcon[2] = 	XGUIEng.GetWidgetID( "Hero2Dead" )
	gvGUI_WidgetID.HeroDeadIcon[3] = 	XGUIEng.GetWidgetID( "Hero3Dead" )
	gvGUI_WidgetID.HeroDeadIcon[4] = 	XGUIEng.GetWidgetID( "Hero4Dead" )
	gvGUI_WidgetID.HeroDeadIcon[5] = 	XGUIEng.GetWidgetID( "Hero5Dead" )	
	gvGUI_WidgetID.HeroDeadIcon[6] = 	XGUIEng.GetWidgetID( "Hero6Dead" )
	
	
	
	
	--gvGUI_WidgetID.FindHero1_Button= 		XGUIEng.GetWidgetID( "FindHero1_button" ) 
	gvGUI_WidgetID.FindSwordLeader = 		XGUIEng.GetWidgetID( "FindSwordmen" )
	gvGUI_WidgetID.FindSpearLeader = 		XGUIEng.GetWidgetID( "FindSpearmen" )
	gvGUI_WidgetID.FindBowLeader = 			XGUIEng.GetWidgetID( "FindBowmen" )
	gvGUI_WidgetID.FindLightCavalryLeader = XGUIEng.GetWidgetID( "FindLightCavalry" )
	gvGUI_WidgetID.FindHeavyCavalryLeader = XGUIEng.GetWidgetID( "FindHeavyCavalry" )
	gvGUI_WidgetID.FindCannon = 			XGUIEng.GetWidgetID( "FindCannon" )
	
	--Workers
	gvGUI_WidgetID.WorkerResidence=			XGUIEng.GetWidgetID( "Worker_Residence" )	
	gvGUI_WidgetID.WorkerFarm= 				XGUIEng.GetWidgetID( "Worker_Farm" )	
	gvGUI_WidgetID.WorkerWork= 				XGUIEng.GetWidgetID( "Worker_Work" )	
	
	
	gvGUI_WidgetID.IconMotivation= 			XGUIEng.GetWidgetID( "IconMotivation" )	
	
	
	--Military units and heroes
	
	gvGUI_WidgetID.CommandDefend = 			XGUIEng.GetWidgetID( "Command_Defend" )
	gvGUI_WidgetID.CommandPatrol = 			XGUIEng.GetWidgetID( "Command_Patrol" )
	gvGUI_WidgetID.CommandAttack = 			XGUIEng.GetWidgetID( "Command_Attack" )
	gvGUI_WidgetID.CommandGuard = 			XGUIEng.GetWidgetID( "Command_Guard" )
	gvGUI_WidgetID.CommandStand = 			XGUIEng.GetWidgetID( "Command_Stand" )
	gvGUI_WidgetID.BuySoldierButton = 		XGUIEng.GetWidgetID( "Buy_Soldier_Button" )
	gvGUI_WidgetID.BuySoldierArea = 		XGUIEng.GetWidgetID( "Buy_Soldier" )
	--gvGUI_WidgetID.ExpelSettlerArea = 		XGUIEng.GetWidgetID( "ExpelSettler" )
	--gvGUI_WidgetID.HealthPoints= 			XGUIEng.GetWidgetID( "Healthpoints" )
	--gvGUI_WidgetID.GroupStrength=  			XGUIEng.GetWidgetID( "GroupStrength" )	
	
	
	gvGUI_WidgetID.Hero1_SendHawk= 			XGUIEng.GetWidgetID( "Hero1_SendHawk" )	
	gvGUI_WidgetID.Hero1_ProtectUnits = 	XGUIEng.GetWidgetID( "Hero1_ProtectUnits" )	
	gvGUI_WidgetID.Hero1_KingsDefense = 	XGUIEng.GetWidgetID( "Hero1_KingsDefense" )	
	gvGUI_WidgetID.Hero2_PlaceBomb=			XGUIEng.GetWidgetID( "Hero2_PlaceBomb" )	
	gvGUI_WidgetID.Hero2_BuildCannon= 		XGUIEng.GetWidgetID( "Hero2_BuildCannon" )		
	gvGUI_WidgetID.Hero3_BuildTrap= 		XGUIEng.GetWidgetID( "Hero3_BuildTrap" )	
	gvGUI_WidgetID.Hero3_Heal = 			XGUIEng.GetWidgetID( "Hero3_Heal" )	
	gvGUI_WidgetID.Hero4_CircularAttack= 	XGUIEng.GetWidgetID( "Hero4_CircularAttack" )	
	gvGUI_WidgetID.Hero4_AuraOfWar= 		XGUIEng.GetWidgetID( "Hero4_AuraOfWar" )	
	gvGUI_WidgetID.Hero5_Camouflage= 		XGUIEng.GetWidgetID( "Hero5_Camouflage" )		
	gvGUI_WidgetID.Hero5_Summon	= 			XGUIEng.GetWidgetID( "Hero5_Summon" )	
	gvGUI_WidgetID.Hero6_ConvertSettlers= 	XGUIEng.GetWidgetID( "Hero6_ConvertSettler" )	
	gvGUI_WidgetID.Hero6_Bless= 			XGUIEng.GetWidgetID( "Hero6_Bless" )
	gvGUI_WidgetID.Hero7_InflictFear= 		XGUIEng.GetWidgetID( "Hero7_InflictFear" )	
	gvGUI_WidgetID.Hero7_Madness=			XGUIEng.GetWidgetID( "Hero7_Madness" )	
	gvGUI_WidgetID.Hero8_Poison= 			XGUIEng.GetWidgetID( "Hero8_Poison" )	
	gvGUI_WidgetID.Hero8_MoraleDamage= 		XGUIEng.GetWidgetID( "Hero8_MoraleDamage" )	
	gvGUI_WidgetID.Hero9_Berserk= 			XGUIEng.GetWidgetID( "Hero9_Berserk" )	
	gvGUI_WidgetID.Hero9_CallWolfs= 		XGUIEng.GetWidgetID( "Hero9_CallWolfs" )	
	gvGUI_WidgetID.Dovbar_Discipline= 		XGUIEng.GetWidgetID( "Dovbar_Discipline" )	
	gvGUI_WidgetID.Dovbar_Summon= 			XGUIEng.GetWidgetID( "Dovbar_Summon" )	
	
	
	--Others	
	gvGUI_WidgetID.SelectionName = 			XGUIEng.GetWidgetID( "Selection_Name" )
	gvGUI_WidgetID.TooltipBottomCosts = 	XGUIEng.GetWidgetID( "TooltipBottomCosts" )
	gvGUI_WidgetID.TooltipBottomText = 		XGUIEng.GetWidgetID( "TooltipBottomText" )
	gvGUI_WidgetID.TooltipBottomShortCut = 	XGUIEng.GetWidgetID( "TooltipBottomShortCut" )
	gvGUI_WidgetID.InGame = 				XGUIEng.GetWidgetID( "InGame" )	
	gvGUI_WidgetID.VideoPreview = 			XGUIEng.GetWidgetID( "VideoPreview" )	
	gvGUI_WidgetID.GameClock= 				XGUIEng.GetWidgetID( "GameClock" )	
	gvGUI_WidgetID.Windows = 				XGUIEng.GetWidgetID( "Windows" )
	gvGUI_WidgetID.MainMenuWindow =			XGUIEng.GetWidgetID( "MainMenuWindow" )
	gvGUI_WidgetID.TradeWindow = 			XGUIEng.GetWidgetID( "TradeWindow" )
	gvGUI_WidgetID.QuestWindow = 			XGUIEng.GetWidgetID( "QuestWindow" )
	gvGUI_WidgetID.DiplomacyWindow = 		XGUIEng.GetWidgetID( "DiplomacyWindow" )
	gvGUI_WidgetID.StatisticsWindow = 		XGUIEng.GetWidgetID( "StatisticsWindow" )
	gvGUI_WidgetID.MainMenuLoadWindow = 	XGUIEng.GetWidgetID( "MainMenuLoadWindow" )	
	gvGUI_WidgetID.GameEndScreenWindowHint = XGUIEng.GetWidgetID( "GameEndScreen_WindowHint" )	
	gvGUI_WidgetID.BuyHeroWindow = 			XGUIEng.GetWidgetID( "BuyHeroWindow" )
	gvGUI_WidgetID.NetworkWindow = 			XGUIEng.GetWidgetID( "NetworkWindow" )	
	gvGUI_WidgetID.DiplomacyWindowMiniMap= 	XGUIEng.GetWidgetID( "DiplomacyWindowMiniMap" )
	gvGUI_WidgetID.NetworkWindowInfoCustomWidget= 	XGUIEng.GetWidgetID( "NetworkWindowInfoCustomWidget" )
	gvGUI_WidgetID.WeatherForecast= 		XGUIEng.GetWidgetID( "TopWeatherForecastTexture" )
	gvGUI_WidgetID.GameEndScreen = 			XGUIEng.GetWidgetID( "GameEndScreen" )
	gvGUI_WidgetID.GameEndScreenMessage = 	XGUIEng.GetWidgetID( "GameEndScreen_Message" )
	
	gvGUI_WidgetID.MainMenuWindow_LoadGame =	XGUIEng.GetWidgetID( "MainMenuWindow_LoadGame" )
	gvGUI_WidgetID.MainMenuWindow_SaveGame =	XGUIEng.GetWidgetID( "MainMenuWindow_SaveGame" )
	
	gvGUI_WidgetID.VCMP_Window= 			XGUIEng.GetWidgetID( "VCMP_Window" )
	gvGUI_WidgetID.VCMP_Team = {}	
	gvGUI_WidgetID.VCMP_Team[1]= 			XGUIEng.GetWidgetID( "VCMP_Team1" )
	gvGUI_WidgetID.VCMP_Team[2]= 			XGUIEng.GetWidgetID( "VCMP_Team2" )
	gvGUI_WidgetID.VCMP_Team[3]= 			XGUIEng.GetWidgetID( "VCMP_Team3" )
	gvGUI_WidgetID.VCMP_Team[4]= 			XGUIEng.GetWidgetID( "VCMP_Team4" )
	gvGUI_WidgetID.VCMP_Team[5]= 			XGUIEng.GetWidgetID( "VCMP_Team5" )
	gvGUI_WidgetID.VCMP_Team[6]= 			XGUIEng.GetWidgetID( "VCMP_Team6" )
	gvGUI_WidgetID.VCMP_Team[7]= 			XGUIEng.GetWidgetID( "VCMP_Team7" )
	gvGUI_WidgetID.VCMP_Team[8]= 			XGUIEng.GetWidgetID( "VCMP_Team8" )
	
	gvGUI_WidgetID.VCMP_TeamTechRace = {}
	gvGUI_WidgetID.VCMP_TeamTechRace[1]= 	XGUIEng.GetWidgetID( "VCMP_Team1TechRace" )
	gvGUI_WidgetID.VCMP_TeamTechRace[2]= 	XGUIEng.GetWidgetID( "VCMP_Team2TechRace" )
	gvGUI_WidgetID.VCMP_TeamTechRace[3]= 	XGUIEng.GetWidgetID( "VCMP_Team3TechRace" )
	gvGUI_WidgetID.VCMP_TeamTechRace[4]= 	XGUIEng.GetWidgetID( "VCMP_Team4TechRace" )
	gvGUI_WidgetID.VCMP_TeamTechRace[5]= 	XGUIEng.GetWidgetID( "VCMP_Team5TechRace" )
	gvGUI_WidgetID.VCMP_TeamTechRace[6]= 	XGUIEng.GetWidgetID( "VCMP_Team6TechRace" )
	gvGUI_WidgetID.VCMP_TeamTechRace[7]= 	XGUIEng.GetWidgetID( "VCMP_Team7TechRace" )
	gvGUI_WidgetID.VCMP_TeamTechRace[8]= 	XGUIEng.GetWidgetID( "VCMP_Team8TechRace" )
	
	
	gvGUI_WidgetID.VCMP_PointGame = {}
	gvGUI_WidgetID.VCMP_PointGame[1]= 	XGUIEng.GetWidgetID( "VCMP_Team1PointGame" )
	gvGUI_WidgetID.VCMP_PointGame[2]= 	XGUIEng.GetWidgetID( "VCMP_Team2PointGame" )
	gvGUI_WidgetID.VCMP_PointGame[3]= 	XGUIEng.GetWidgetID( "VCMP_Team3PointGame" )
	gvGUI_WidgetID.VCMP_PointGame[4]= 	XGUIEng.GetWidgetID( "VCMP_Team4PointGame" )
	gvGUI_WidgetID.VCMP_PointGame[5]= 	XGUIEng.GetWidgetID( "VCMP_Team5PointGame" )
	gvGUI_WidgetID.VCMP_PointGame[6]= 	XGUIEng.GetWidgetID( "VCMP_Team6PointGame" )
	gvGUI_WidgetID.VCMP_PointGame[7]= 	XGUIEng.GetWidgetID( "VCMP_Team7PointGame" )
	gvGUI_WidgetID.VCMP_PointGame[8]= 	XGUIEng.GetWidgetID( "VCMP_Team8PointGame" )
	
	
	-- Convert state names into IDs
	gvGUI_StateID = {}
	gvGUI_StateID.Selection = 						GUI.GetStateNameByID( "Selection" )
	gvGUI_StateID.WalkCommand = 					GUI.GetStateNameByID( "WalkCommand" )
	gvGUI_StateID.PlaceBuilding = 					GUI.GetStateNameByID( "PlaceBuilding" )
	gvGUI_StateID.ExpelSettler = 					GUI.GetStateNameByID( "ExpelSettler" )
	gvGUI_StateID.BlessSettler = 					GUI.GetStateNameByID( "BlessSettler" )
	gvGUI_StateID.ForceWorkerToWork = 				GUI.GetStateNameByID( "ForceWorkerToWork" )
	gvGUI_StateID.AttackMoveCommand = 				GUI.GetStateNameByID( "AttackMoveCommand" )
	gvGUI_StateID.GuardCommand = 					GUI.GetStateNameByID( "GuardCommand" )
	gvGUI_StateID.PatrolCommand = 					GUI.GetStateNameByID( "PatrolCommand" )
	gvGUI_StateID.PlaceBombCommand = 				GUI.GetStateNameByID( "PlaceBombCommand" )
	gvGUI_StateID.CutScene = 						GUI.GetStateNameByID( "CutScene" )
	gvGUI_StateID.AttackCommand = 					GUI.GetStateNameByID( "AttackCommand" )
	gvGUI_StateID.WalkCommand = 					GUI.GetStateNameByID( "WalkCommand" )
	gvGUI_StateID.SerfConstructBuildingCommand = 	GUI.GetStateNameByID( "SerfConstructBuildingCommand" )
	gvGUI_StateID.SerfExtractResourceCommand = 		GUI.GetStateNameByID( "SerfExtractResourceCommand" )
	gvGUI_StateID.SerfRepairBuildingCommand = 		GUI.GetStateNameByID( "SerfRepairBuildingCommand" )
	gvGUI_StateID.NPCInteraction =					GUI.GetStateNameByID( "NPCInteraction" )
	gvGUI_StateID.ConvertBuilding =					GUI.GetStateNameByID( "ConvertBuildingCommand" )
	gvGUI_StateID.ConvertSettler =					GUI.GetStateNameByID( "ConvertSettlerCommand" )
	
	--reactivate Quest stuff
	if StopWatchSecondsLeft ~= nil and StopWatchSecondsLeft > 0 then
		XGUIEng.ShowWidget("MapProgressStuff",1)
		XGUIEng.ShowWidget("StopWatch",1)
	end
end 

function Interface_Init()

	gvInterfaceCinematicSelectedEntites = {}   	

	gvGUI ={}
	
	gvGUI.HawkIsFlying = 0

	gvGUI.TriggerID_GUI_FollowEntity = 0

	gvGUI.BonusHeroId = 0
    					
   gvGUI.UpgrdaeHQFlag = 0
	
	--remember thresholds
	gvGUI.MotivationThresholds = {}
    gvGUI.MotivationThresholds.Happy 	= Logic.GetLogicPropertiesMotivationThresholdHappy()
	gvGUI.MotivationThresholds.Sad 		= Logic.GetLogicPropertiesMotivationThresholdSad()
	gvGUI.MotivationThresholds.Angry 	= Logic.GetLogicPropertiesMotivationThresholdAngry()
	gvGUI.MotivationThresholds.Leave 	= Logic.GetLogicPropertiesMotivationThresholdLeave()

	--Load Interface script folder
	Script.LoadFolder("Data\\Script\\Interface")
	
	GroupSelection_Init()
	GUIAction_Research_Init()
	GUIAction_Market_Init()
	GUIAction_Upgrade_Init()
	GUIAction_BuyCannon_Init()
	
	gvGUI.FunnyCommentsSelectionCounter = 0
	gvGUI.LastSelectedEntityID = 0
	gvGUI.FunnyCommentStartTime = 0
	
	
	
	--Init table with to link the Upgardecategories with the Sound AND Textfile (same name!)
--[AnSu] Where can I put this?

HintTable = {}
HintTable[UpgradeCategories.Headquarters] 	= "BUILDING_Headquarter"
HintTable[UpgradeCategories.Blacksmith] 	= "BUILDING_Smithy"
HintTable[UpgradeCategories.Barracks] 		= "BUILDING_Barracks"
HintTable[UpgradeCategories.SoldierSword] 	= "UNIT_Swordsman"
HintTable[UpgradeCategories.Headquarters] 	= "BUILDING_Headquarter"
HintTable[UpgradeCategories.Residence] 		= "BUILDING_Residence"
HintTable[UpgradeCategories.Barracks] 		= "BUILDING_Barracks"
HintTable[UpgradeCategories.Archery] 		= "BUILDING_ShootingRange"
HintTable[UpgradeCategories.Blacksmith] 	= "BUILDING_Smithy"
HintTable[UpgradeCategories.Farm] 			= "BUILDING_Farm"
HintTable[UpgradeCategories.StoneMine] 		= "BUILDING_StonePit"
HintTable[UpgradeCategories.IronMine] 		= "BUILDING_IronPit"
HintTable[UpgradeCategories.SulfurMine] 	= "BUILDING_SulfurPit"
HintTable[UpgradeCategories.ClayMine] 		= "BUILDING_ClayPit"
HintTable[UpgradeCategories.Market] 		= "BUILDING_Marketplace"
HintTable[UpgradeCategories.Monastery] 		= "BUILDING_Chapel"
HintTable[UpgradeCategories.University] 	= "BUILDING_College"
HintTable[UpgradeCategories.VillageCenter] 	= "BUILDING_VillageCenter"
HintTable[UpgradeCategories.Bank] 			= "BUILDING_Bank"
HintTable[UpgradeCategories.StoneMason] 	= "BUILDING_StonemasonsHut"
HintTable[UpgradeCategories.Sawmill] 		= "BUILDING_SawMill"
HintTable[UpgradeCategories.Alchemist] 		= "BUILDING_AlchemistsHut"
HintTable[UpgradeCategories.Brickworks] 	= "BUILDING_BrickmakersHut"
HintTable[UpgradeCategories.Foundry] 		= "BUILDING_Foundry"
HintTable[UpgradeCategories.Stable] 		= "BUILDING_Stables"
HintTable[UpgradeCategories.Tower] 			= "BUILDING_Watchtower"
HintTable[UpgradeCategories.DarkTower] 		= "BUILDING_Watchtower"
HintTable[UpgradeCategories.Weathermachine] = "BUILDING_WeatherTower"
HintTable[UpgradeCategories.PowerPlant] 	= "BUILDING_WeatherPlant"
HintTable[UpgradeCategories.Beautification01] 	= "BUILDING_Beautification"
HintTable[UpgradeCategories.Beautification02] 	= "BUILDING_Beautification"
HintTable[UpgradeCategories.Beautification03] 	= "BUILDING_Beautification"
HintTable[UpgradeCategories.Beautification04] 	= "BUILDING_Beautification"
HintTable[UpgradeCategories.Beautification05] 	= "BUILDING_Beautification"
HintTable[UpgradeCategories.Beautification06] 	= "BUILDING_Beautification"
HintTable[UpgradeCategories.Beautification07] 	= "BUILDING_Beautification"
HintTable[UpgradeCategories.Beautification08] 	= "BUILDING_Beautification"
HintTable[UpgradeCategories.Beautification09] 	= "BUILDING_Beautification"
HintTable[UpgradeCategories.Beautification10] 	= "BUILDING_Beautification"
HintTable[UpgradeCategories.Beautification11] 	= "BUILDING_Beautification"
HintTable[UpgradeCategories.Beautification12] 	= "BUILDING_Beautification"
HintTable[UpgradeCategories.SoldierSword] 	= "UNIT_Swordsman"
HintTable[UpgradeCategories.SoldierPoleArm] = "UNIT_Spearman"
HintTable[UpgradeCategories.SoldierBow] 	= "UNIT_Archer"
HintTable[UpgradeCategories.SoldierCavalry] = "UNIT_LightCavalry"
HintTable[UpgradeCategories.SoldierHeavyCavalry] 	= "UNIT_HeavyCavalry"
HintTable[UpgradeCategories.BattleSerf] 	= "UNIT_Militia"
HintTable[UpgradeCategories.Cannon1] 		= "UNIT_Cannon"
HintTable[UpgradeCategories.Cannon2] 		= "UNIT_Cannon"
HintTable[UpgradeCategories.Cannon3] 		= "UNIT_Cannon"
HintTable[UpgradeCategories.Cannon4] 		= "UNIT_Cannon"
HintTable[UpgradeCategories.Cannon3a] 		= "UNIT_Cannon"
HintTable[UpgradeCategories.Cannon4a] 		= "UNIT_Cannon"


	--Table for generic sound and Text tipps
	HintTable["global"] 	= {	"GENERAL_Help01",
								"GENERAL_Help02",
								"GENERAL_Help03",
								"GENERAL_Help04",
								"GENERAL_Help05",
								"GENERAL_Help06",
								"GENERAL_Help07",
								"GENERAL_Help08",
								"GENERAL_Help09",
								"GENERAL_Help10",
								"GENERAL_Help11",
								"GENERAL_Help12",
								"GENERAL_Help13",
								"GENERAL_Help14",
								"GENERAL_Help15",
								"GENERAL_Help16",
								"GENERAL_Help17",
								"GENERAL_Help18",
								"GENERAL_Help19",
								"GENERAL_Help20",
								"GENERAL_Help21",
								"GENERAL_Help22",
								"GENERAL_Help23",
								"GENERAL_Help24",
								"GENERAL_Help25",
								"GENERAL_Help26",
								"GENERAL_Help27",
								"GENERAL_Help28",
								"GENERAL_Help29",
								"GENERAL_Help30",
								"GENERAL_Help31",
								"GENERAL_Help32",
								"GENERAL_Help33" }
	
	
	--Update all buttons in the visible container
	XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)
end
