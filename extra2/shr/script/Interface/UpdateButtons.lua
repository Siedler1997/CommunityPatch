--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Update Buttons
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--------------------------------------------------------------------------------
-- Update Technology buttons
--------------------------------------------------------------------------------

function
GUIUpdate_GlobalTechnologiesButtons(_Button, _Technology, _BuildingType)
	
	local PlayerID = GUI.GetPlayerID()
	local TechState = Logic.GetTechnologyState(PlayerID, _Technology)
	
	local SelectedBuildingID = GUI.GetSelectedEntity()
	local SelectedBuildingType = Logic.GetEntityType( SelectedBuildingID )
	
	local UpgardeCategory = Logic.GetUpgradeCategoryByBuildingType(_BuildingType)
	local EntityTypes ={ Logic.GetBuildingTypesInUpgradeCategory( UpgardeCategory ) }
		
	local PositionOfSelectedEntityInTable = 0
	local PositionOfNeededEntityInTable = 0
	
	for i=1,EntityTypes[1],1
	do		
		if EntityTypes[i+1] == SelectedBuildingType then
			PositionOfSelectedEntityInTable = i+1
		end		
		if EntityTypes[i+1] == _BuildingType then
			PositionOfNeededEntityInTable = i+1
		end
	end
	
	--Technology is researched
	if 	TechState == 4 then			
			XGUIEng.ShowWidget(_Button,1)
			XGUIEng.DisableButton(_Button,0)
			XGUIEng.HighLightButton(_Button,1)
			return
	end
		
	
	if PositionOfNeededEntityInTable > PositionOfSelectedEntityInTable 
		or TechState == 1 then			
			XGUIEng.ShowWidget(_Button,1)
			XGUIEng.DisableButton(_Button,1)		
		if TechState == 0 then 
			XGUIEng.DisableButton(_Button,1)
		end
	else
	
	
		--Technology is interdicted
		if TechState == 0 then	
			XGUIEng.DisableButton(_Button,1)
		
		--Technology is disabled but visible
		--elseif TechState == 1 then
			--XGUIEng.ShowWidget(_Button,1)
			--XGUIEng.DisableButton(_Button,1)
			
		--Technology is enabled and visible
		elseif TechState == 2  then
			XGUIEng.ShowWidget(_Button,1)
			XGUIEng.DisableButton(_Button,0)
		-- Reserach is in progress
		elseif TechState == 3 then
			XGUIEng.ShowWidget(_Button,1)
			XGUIEng.DisableButton(_Button,1)
			
		--Technologyresearch is researched
		--elseif TechState == 4 then
			--XGUIEng.ShowWidget(_Button,1)
			--XGUIEng.DisableButton(_Button,0)
			--XGUIEng.HighLightButton(_Button,1)
			
		--Technology is to far in the future
		elseif TechState == 5 then				
			--XGUIEng.ShowWidget(_Button,0)
			XGUIEng.DisableButton(_Button,1)	
		end
	end

end

--------------------------------------------------------------------------------
-- Update Building Buttons
--------------------------------------------------------------------------------

function GUIUpdate_BuildingButtons(_Button, _Technology)
	if _Button == "OnlineHelpButton" or _Button == "GameSpeedButton" then
		XGUIEng.ShowWidget("GameSpeedButton", 1)
		XGUIEng.ShowWidget("OnlineHelpButton", 0)
		XGUIEng.DisableButton("GameSpeedButton",0)	
		--[[
		if GDB.GetValue("Game\\GameSpeedAdjust") == 1 then
			XGUIEng.ShowWidget("GameSpeedButton", 1)
			XGUIEng.ShowWidget("OnlineHelpButton", 0)
			XGUIEng.DisableButton("GameSpeedButton",0)	
		else
			XGUIEng.ShowWidget("GameSpeedButton", 0)
			XGUIEng.ShowWidget("OnlineHelpButton", 1)
			GUIUpdate_UpgradeButtons("OnlineHelpButton", Technologies.T_OnlineHelp)
		end
		--]]
	else
		local PlayerID = GUI.GetPlayerID()
		local TechState = Logic.GetTechnologyState(PlayerID, _Technology)
	
		XGUIEng.ShowWidget(_Button,1)

		--Building is interdicted
		if TechState == 0 then	
			XGUIEng.DisableButton(_Button,1)
	
		--Building is not available yet or Technology is to far in the futur
		elseif TechState == 1 or TechState == 5 then
			XGUIEng.DisableButton(_Button,1)
		
		--Building is enabled and visible	
		elseif TechState == 2 or TechState == 3 or TechState == 4 then
			XGUIEng.DisableButton(_Button,0)	
		end
	end
end

--------------------------------------------------------------------------------
-- Update Upgarde Buttons
--------------------------------------------------------------------------------

function
GUIUpdate_UpgradeButtons(_Button, _Technology)
	local PlayerID = GUI.GetPlayerID()
	local TechState = Logic.GetTechnologyState(PlayerID, _Technology)
	
	--Upgarde is interdicted
	if TechState == 0 then	
		XGUIEng.DisableButton(_Button,1)
	
	--Upgarde is not available yet
	elseif TechState == 1 or TechState == 5 then
		XGUIEng.DisableButton(_Button,1)		
		
	--Upgarde is enabled and visible	
	elseif TechState == 2 or TechState == 3 or TechState == 4  then
		XGUIEng.DisableButton(_Button,0)			
	
	end
end

--------------------------------------------------------------------------------
-- Update Technology buttons that are depening on the Buildingtype
--------------------------------------------------------------------------------
function
GUIUpdate_TechnologyButtons(_Button, _Technology, _BuildingType)
	
	local PlayerID = GUI.GetPlayerID()
	local SelectedBuildingID = GUI.GetSelectedEntity()
	local SelectedBuildingType = Logic.GetEntityType( SelectedBuildingID )
	local TechState = Logic.GetTechnologyState(PlayerID, _Technology)
	
	local UpgardeCategory = Logic.GetUpgradeCategoryByBuildingType(_BuildingType)
	local EntityTypes ={ Logic.GetBuildingTypesInUpgradeCategory( UpgardeCategory ) }
		
	local PositionOfSelectedEntityInTable = 0
	local PositionOfNeededEntityInTable = 0
	
	for i=1,EntityTypes[1],1
	do		
		if EntityTypes[i+1] == SelectedBuildingType then
			PositionOfSelectedEntityInTable = i+1
		end		
		if EntityTypes[i+1] == _BuildingType then
			PositionOfNeededEntityInTable = i+1
		end
	end
	
	--Technology is researched
	if 	TechState == 4 then			
			XGUIEng.DisableButton(_Button,0)
			XGUIEng.HighLightButton(_Button,1)
			return
	end
		
	
	if PositionOfNeededEntityInTable > PositionOfSelectedEntityInTable
	or  TechState == 1 then	
		XGUIEng.DisableButton(_Button,1)
	else
	
		--Building is interdicted
		if TechState == 0 then	
			XGUIEng.DisableButton(_Button,1)
		
		----Technology is not available yet
		--elseif TechState == 1 then
		--	XGUIEng.DisableButton(_Button,1)			
			
		--Technology is enabled 
		elseif TechState == 2 then
			XGUIEng.DisableButton(_Button,0)
		
		--Technology is in reserach ot to far in the future
		elseif TechState == 3 or TechState == 5 then
			XGUIEng.DisableButton(_Button,1)
		
		end
		
	end

end

--------------------------------------------------------------------------------
-- Update Buy Military Unit Buttons
--------------------------------------------------------------------------------
function
GUIUpdate_BuyMilitaryUnitButtons(_Button, _Technology, _UpgradeCategory)

	local PlayerID = GUI.GetPlayerID()	
	
	
	local SettlerType = Logic.GetSettlerTypeByUpgradeCategory( _UpgradeCategory, PlayerID )
	
	--HACK: AnSu Change this after Alpha!
	if 		SettlerType == Entities.PU_LeaderSword2 then
				_Technology = Technologies.MU_LeaderSword2
	elseif	SettlerType == Entities.PU_LeaderSword3 then 
				_Technology = Technologies.MU_LeaderSword3
	elseif	SettlerType == Entities.PU_LeaderSword4 then 
				_Technology = Technologies.MU_LeaderSword4				
	end
	
	if 		SettlerType == Entities.PU_LeaderPoleArm2 then
				_Technology = Technologies.MU_LeaderSpear2
	elseif 	SettlerType == Entities.PU_LeaderPoleArm3 then
				_Technology = Technologies.MU_LeaderSpear3
	elseif	SettlerType == Entities.PU_LeaderPoleArm4 then			
				_Technology = Technologies.MU_LeaderSpear4
	end
	
	if 			SettlerType == Entities.PU_LeaderBow3
			or 	SettlerType == Entities.PU_LeaderBow4 
			then
					_Technology = Technologies.MU_LeaderBow3
	end
	
	
	local TechState = Logic.GetTechnologyState(PlayerID, _Technology)
	
		--Unit type is interdicted
		if TechState == 0 then	
			XGUIEng.DisableButton(_Button,1)
		
		
		elseif TechState == 1 then	
				XGUIEng.DisableButton(_Button,1)
	
		--Technology is enabled 
		elseif TechState == 2 then
			XGUIEng.DisableButton(_Button,0)
		
		--Technology is in reserach ot to far in the future
		elseif TechState == 3 or TechState == 5 then
			XGUIEng.DisableButton(_Button,1)
		
		end
		
	
end

--------------------------------------------------------------------------------
-- Update Cancel Research Button
--------------------------------------------------------------------------------

function
GUIUpdate_CancelResearchButton()
	
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local PlayerID = GUI.GetPlayerID()
	local EntityId = GUI.GetSelectedEntity() 
	local TechnologyType = Logic.GetTechnologyResearchedAtBuilding(EntityId)
	
	-- Transfer material
	if gvGUI_TechnologyButtonIDArray[ TechnologyType ] ~= nil then
		XGUIEng.TransferMaterials( gvGUI_TechnologyButtonIDArray[ TechnologyType ], CurrentWidgetID )
	end
	
end

--------------------------------------------------------------------------------
-- Update Cancel Research Button
--------------------------------------------------------------------------------

function
GUIUpdate_CancelUpgradeButton()

	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local PlayerID = GUI.GetPlayerID()
	local EntityId = GUI.GetSelectedEntity() 
	-- Transfer material
	if gvGUI_UpdateButtonIDArray[ EntityId ] ~= nil then
		XGUIEng.TransferMaterials( gvGUI_UpdateButtonIDArray[ EntityId ], CurrentWidgetID )
	end
end
--------------------------------------------------------------------------------
-- Update Find Settler Button (will be called from local script thru a trun based trigger for the moment)
--------------------------------------------------------------------------------
function GUIUpdate_FindView()
	local PlayerID = GUI.GetPlayerID()
	--Serfs
	local SerfAmount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID, Entities.PU_Serf)
	if SerfAmount > 0 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindIdleSerf,1)
	else
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindIdleSerf,0)
	end	
	--Sword
	local SwordAmount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_LeaderSword1) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_LeaderSword2)
						+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_LeaderSword3) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_LeaderSword4)	
	if SwordAmount > 0 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindSwordLeader ,1)
	else
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindSwordLeader ,0)
	end
	--Spear
	local SpearAmount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_LeaderPoleArm1) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_LeaderPoleArm2)
						+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_LeaderPoleArm3) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_LeaderPoleArm4)
	if SpearAmount > 0 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindSpearLeader ,1)
	else
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindSpearLeader ,0)
	end
	--Bow
	local BowAmount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_LeaderBow1) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_LeaderBow2)
						+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_LeaderBow3) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_LeaderBow4)
	if BowAmount > 0 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindBowLeader ,1)
	else
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindBowLeader ,0)
	end
	--light Cavalry
	local LCavAmount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_LeaderCavalry1) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_LeaderCavalry2)	
	if LCavAmount > 0 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindLightCavalryLeader ,1)
	else
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindLightCavalryLeader ,0)
	end
	--heavy Cavalry
	local HCavAmount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_LeaderHeavyCavalry1) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_LeaderHeavyCavalry2)	
	if HCavAmount > 0 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindHeavyCavalryLeader ,1)
	else
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindHeavyCavalryLeader ,0)
	end
	--cannons	
	local CanAmount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PV_Cannon1) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PV_Cannon2)
						+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PV_Cannon3) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PV_Cannon4)
						+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PV_Cannon3a) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PV_Cannon4a)
	if CanAmount > 0 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindCannon ,1)
	else
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindCannon ,0)
	end
	--rifle	
	local RifAmount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_LeaderRifle1) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_LeaderRifle2)	
	if RifAmount > 0 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindRifleLeader ,1)
	else
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindRifleLeader ,0)
	end
	--Scout
	local Scout = Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_Scout)
	if Scout > 0 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindScout ,1)
	else
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindScout ,0)
	end
	--Thief
	local Thief = Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_Thief)
	if Thief > 0 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindThief ,1)
	else
		XGUIEng.ShowWidget(gvGUI_WidgetID.FindThief ,0)
	end
end

function GUIUpdate_HeroButton()
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()	
	local EntityID = XGUIEng.GetBaseWidgetUserVariable(CurrentWidgetID, 0)
	local SourceButton
	
	--Stuff for 7th hero button
	if gvGUI.BonusHeroId > 0 and IsExisting(gvGUI.BonusHeroId) then
		XGUIEng.ShowWidget("Hero7BG",1)	
		XGUIEng.ShowWidget("FindHero7",1)	

		if IsAlive(gvGUI.BonusHeroId) then
			XGUIEng.ShowWidget("Hero7Dead",0)	
		else
			XGUIEng.ShowWidget("Hero7Dead",1)	
		end
		
		if CurrentWidgetID == XGUIEng.GetWidgetID("FindHero7") then
			EntityID = gvGUI.BonusHeroId
		end
	else
		XGUIEng.ShowWidget("Hero7BG",0)	
		XGUIEng.ShowWidget("FindHero7",0)	
		XGUIEng.ShowWidget("Hero7Dead",0)	
	end
	
	if Logic.IsEntityInCategory(EntityID,EntityCategories.Hero1) == 1 then	
		SourceButton = "FindHeroSource1"	
		--Gibt die Spielerfarbe zurück und speichert ihre RGB_Werte in 3 Variablen
		local ColorR, ColorG, ColorB = GUI.GetPlayerColor(GUI.GetPlayerID())
		--Zu helle Spielerfarben (Weiß, Hellgrau) werden auf Dunkelgrau gesetzt
		if ColorR > 180 and ColorG > 180 and ColorB > 180 then
			ColorR = 136
			ColorG = 136
			ColorB = 136
		end
		XGUIEng.TransferMaterials(SourceButton, CurrentWidgetID)
		if Logic.SentinelGetUrgency(EntityID) == 1 then	
			XGUIEng.SetMaterialColor(CurrentWidgetID,1, 255,255,255,255)
			if gvGUI.DarioCounter < 250 then
				XGUIEng.SetMaterialColor(CurrentWidgetID,0, ColorR,ColorG,ColorB,255)				
				gvGUI.DarioCounter = gvGUI.DarioCounter +1
			end		
			if gvGUI.DarioCounter >= 250 then			
				XGUIEng.SetMaterialColor(CurrentWidgetID,0, 230,230,230,255)					
				gvGUI.DarioCounter = gvGUI.DarioCounter +1
			end
			if gvGUI.DarioCounter == 500 then
				gvGUI.DarioCounter= 0
			end
		else	
			XGUIEng.SetMaterialColor(CurrentWidgetID,0, 230,230,230,255)	
			XGUIEng.SetMaterialColor(CurrentWidgetID,1, 255,255,255,255)	
		end
	else
		if Logic.GetEntityType( EntityID )	== Entities.PU_Hero1 then
			SourceButton = "FindHeroSource0"
		elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero2) == 1 then
			SourceButton = "FindHeroSource2"
		elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero3) == 1 then
			SourceButton = "FindHeroSource3"
		elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero4) == 1 then
			SourceButton = "FindHeroSource4"
		elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero5) == 1 then
			SourceButton = "FindHeroSource5"
		elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero6) == 1 then
			SourceButton = "FindHeroSource6"
		elseif Logic.GetEntityType( EntityID )	== Entities.CU_BlackKnight then
			SourceButton = "FindHeroSource7"
		elseif Logic.GetEntityType( EntityID )	== Entities.CU_Mary_de_Mortfichet then
			SourceButton = "FindHeroSource8"
		elseif Logic.GetEntityType( EntityID )	== Entities.CU_Barbarian_Hero then
			SourceButton = "FindHeroSource9"
		elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero10) == 1 then
			SourceButton = "FindHeroSource10"
		elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero11) == 1 then
			SourceButton = "FindHeroSource11"
		elseif Logic.GetEntityType( EntityID )	== Entities.CU_Evil_Queen then
			SourceButton = "FindHeroSource12"
		else
			SourceButton = "OnlineHelpButton"
		end
		XGUIEng.TransferMaterials(SourceButton, CurrentWidgetID)
	end
end

function
GUIUpdate_HeroFindButtons()

	local PlayerID = GUI.GetPlayerID()
	
	--XGUIEng.ShowAllSubWidgets(gvGUI_WidgetID.HeroFindContainer,0)	
	
	
	--Create Table with all heroes
	
	local Hero = {}
	
	Logic.GetHeroes(PlayerID, Hero)

	--local j = 1
	
	for j=1,6
	do
	
		if  Hero[j] ~= nil then
			
			XGUIEng.ShowWidget(gvGUI_WidgetID.HeroFindButtons[j],1)	
			
			--AddOn: Show also BG
			XGUIEng.ShowWidget(gvGUI_WidgetID.HeroBGIcon[j],1)	
			
			XGUIEng.SetBaseWidgetUserVariable(gvGUI_WidgetID.HeroFindButtons[j], 0,Hero[j])
			
			
			--XGUIEng.ShowAllSubWidgets(gvGUI_WidgetID.HeroDeadIconContainer,0)	
			local Health = Logic.GetEntityHealth(Hero[j]) 
			if Logic.GetEntityHealth(Hero[j]) == 0 then
				XGUIEng.ShowWidget(gvGUI_WidgetID.HeroDeadIcon[j],1)	
			else
				XGUIEng.ShowWidget(gvGUI_WidgetID.HeroDeadIcon[j],0)	
			end
			
			--j = j + 1
		else
			XGUIEng.ShowWidget(gvGUI_WidgetID.HeroFindButtons[j],0)	
			--AddOn: disbale also BG
			XGUIEng.ShowWidget(gvGUI_WidgetID.HeroBGIcon[j],0)	
			XGUIEng.ShowWidget(gvGUI_WidgetID.HeroDeadIcon[j],0)
		end
		
	end
	
	

	
end
--------------------------------------------------------------------------------
-- Update farm, residence and workplace buttons of worker
--------------------------------------------------------------------------------
function
GUIUpdate_WokerButtons()
	
	local WorkerID = GUI.GetSelectedEntity()	
	local ResidenceID = Logic.GetSettlersResidence(WorkerID)
	local FarmID = Logic.GetSettlersFarm(WorkerID)
	local WorkID = Logic.GetSettlersWorkBuilding(WorkerID)
	
	if ResidenceID  ~= 0 then		
		XGUIEng.DisableButton(gvGUI_WidgetID.WorkerResidence,0)			
		if Logic.GetRemainingUpgradeTimeForBuilding(ResidenceID) ~= Logic.GetTotalUpgradeTimeForBuilding (ResidenceID) then			
			XGUIEng.HighLightButton(gvGUI_WidgetID.WorkerResidence,1)	
		else			
			XGUIEng.HighLightButton(gvGUI_WidgetID.WorkerResidence,0)		
		end
	else
		XGUIEng.DisableButton(gvGUI_WidgetID.WorkerResidence,1)	
	end
	
	if FarmID ~= 0 then
		XGUIEng.DisableButton(gvGUI_WidgetID.WorkerFarm,0)
		if Logic.GetRemainingUpgradeTimeForBuilding(FarmID) ~= Logic.GetTotalUpgradeTimeForBuilding (FarmID) then
			XGUIEng.HighLightButton(gvGUI_WidgetID.WorkerFarm,1)	
		else
			XGUIEng.HighLightButton(gvGUI_WidgetID.WorkerFarm,0)		
		end					
	else
		XGUIEng.DisableButton(gvGUI_WidgetID.WorkerFarm,1)
	end
	
	if WorkID ~= 0 then
		XGUIEng.DisableButton(gvGUI_WidgetID.WorkerWork,0)
		if Logic.GetRemainingUpgradeTimeForBuilding(WorkID) ~= Logic.GetTotalUpgradeTimeForBuilding (WorkID) then
			XGUIEng.HighLightButton(gvGUI_WidgetID.WorkerWork,1)	
		else
			XGUIEng.HighLightButton(gvGUI_WidgetID.WorkerWork,0)		
		end
	else
		XGUIEng.DisableButton(gvGUI_WidgetID.WorkerWork,1)		
	end
end

--------------------------------------------------------------------------------
-- Update toggle button for groups
--------------------------------------------------------------------------------
function
GUIUpdate_ToggleGroupRecruitingButtons()
	
	local BuildingID = GUI.GetSelectedEntity()		
	
	if Logic.IsAutoFillActive(BuildingID) == 1 then
		XGUIEng.ShowWidget( gvGUI_WidgetID.RecruitSingleLeader,1)
		XGUIEng.ShowWidget( gvGUI_WidgetID.RecruitGroups,0)
	else
		XGUIEng.ShowWidget( gvGUI_WidgetID.RecruitGroups,1)
		XGUIEng.ShowWidget( gvGUI_WidgetID.RecruitSingleLeader,0)
	end
end

--------------------------------------------------------------------------------
-- Update Buy Soldier Button
--------------------------------------------------------------------------------

function
GUIUpdate_BuySoldierButton()
	
	local LeaderID = GUI.GetSelectedEntity() 
	local MilitaryBuildingID = Logic.LeaderGetNearbyBarracks(LeaderID)
	
	local test = Logic.IsEntityInCategory(LeaderID,EntityCategories.Cannon)
	
	if MilitaryBuildingID ~= 0	then		
		if Logic.IsConstructionComplete( MilitaryBuildingID ) == 1 then
			XGUIEng.DisableButton(gvGUI_WidgetID.BuySoldierButton,0)
		end
	else		
		XGUIEng.DisableButton(gvGUI_WidgetID.BuySoldierButton,1)
	end
end

--------------------------------------------------------------------------------
-- Update Upgrade Settlers Button
--------------------------------------------------------------------------------

function
GUIUpdate_SettlersUpgradeButtons(_Button, _TechnologyType)
	local PlayerID = GUI.GetPlayerID()
	local TechState = Logic.GetTechnologyState(PlayerID, _TechnologyType)
	
	--Upgarde is interdicted
	if TechState == 0 then	
		XGUIEng.ShowWidget(_Button,0)
	
	--Upgarde is enabled and visible	
	elseif TechState == 2 or TechState == 3 then		
		XGUIEng.ShowWidget(_Button,1)	
		XGUIEng.DisableButton(_Button,0)	
	
	--Upgarde is not available yet
	elseif TechState == 5 or TechState == 4 then
		XGUIEng.ShowWidget(_Button,0)		
	
	elseif TechState == 1 then
		XGUIEng.ShowWidget(_Button,1)
		XGUIEng.DisableButton(_Button,1)	
	end
end


--------------------------------------------------------------------------------
-- Update Buttons, that are enabled by a technology (delete Settlersupgrade later!!)
--------------------------------------------------------------------------------
function
GUIUpdate_FeatureButtons(_Button, _TechnologyType)

	local PlayerID = GUI.GetPlayerID()
	local TechState = Logic.GetTechnologyState(PlayerID, _TechnologyType)
	
	--technology is interdicted
	if TechState == 0 then	
		XGUIEng.ShowWidget(_Button,0)
	
	--Technology is enabled and visible	
	elseif TechState == 2 or TechState == 3 then		
		XGUIEng.ShowWidget(_Button,1)	
	
	--Upgarde is not available yet
	elseif TechState == 1 or TechState == 5 or TechState == 4 then
		XGUIEng.ShowWidget(_Button,0)		
	
	end
end

--------------------------------------------------------------------------------
-- Show hero button in MP games
--------------------------------------------------------------------------------
function
GUIUpdate_BuyHeroButton()
	
	local PlayerID = GUI.GetPlayerID()
	local NumberOfHerosToBuy = Logic.GetNumberOfBuyableHerosForPlayer( PlayerID )
	
	
	if XNetwork.Manager_DoesExist() == 1 
	and NumberOfHerosToBuy > 0 then
		XGUIEng.ShowWidget(XGUIEng.GetCurrentWidgetID(),1)		
	else
		XGUIEng.ShowWidget(XGUIEng.GetCurrentWidgetID(),0)		
	end
end

--------------------------------------------------------------------------------
-- Highlight the right military command buttons
--------------------------------------------------------------------------------
function 
GUIUpdate_CommandGroup()
	
	--NOTE: Only the command of the first Leader will be highlighted
	local LeaderID = GUI.GetSelectedEntity()
	if LeaderID == nil then
		return
	end
	local CommandType = Logic.LeaderGetCurrentCommand(LeaderID)
	
	--Unhighlight all buttons
	XGUIEng.UnHighLightGroup(gvGUI_WidgetID.InGame, "Command_group")			
	
	--CommandTypes:
	--0 - CommandAttack
	--1 - CommandEnter
	--2 - CommandAggressiveMode
	--3 - CommandDefend
	--4 - CommandPatrol
	--5 - CommandAttackMove
	--6 - CommandGuard
	--7 - CommandStand
	--8 - CommandMove
	
	--CommandDefend
	if CommandType == 3 then
		XGUIEng.HighLightButton(gvGUI_WidgetID.CommandDefend,1)	
	--CommandPatrol
	elseif CommandType == 4 then
		XGUIEng.HighLightButton(gvGUI_WidgetID.CommandPatrol,1)
	--CommandAttackMove
	elseif CommandType == 5 then
		XGUIEng.HighLightButton(gvGUI_WidgetID.CommandAttack,1)
	--CommandGuard
	elseif CommandType == 6 then
		XGUIEng.HighLightButton(gvGUI_WidgetID.CommandGuard,1)
	--CommandStand
	elseif CommandType == 7 then
		XGUIEng.HighLightButton(gvGUI_WidgetID.CommandStand,1)
	end
end

--------------------------------------------------------------------------------
-- Highlight worker buttons depending on the CurrentMaxWorkers in the selected building
--------------------------------------------------------------------------------

function 
InterfaceTool_UpdateWorkerAmountButtons()
	
	local BuildingID = GUI.GetSelectedEntity()
	local MaxNumberOfworkers = Logic.GetMaxNumWorkersInBuilding(BuildingID)			
	local CurrentMaxNumbersOfWorkers = Logic.GetCurrentMaxNumWorkersInBuilding(BuildingID)

	local FewAmount = 0
	local HalfAmount = math.ceil( MaxNumberOfworkers/2 )
	local FullAmount = MaxNumberOfworkers

	--Unhighlight all buttons
	XGUIEng.UnHighLightGroup(gvGUI_WidgetID.InGame, "SetWorkersGroup")			
			
	--Highlight Button depending on CurrentMaxWorkers 
	if CurrentMaxNumbersOfWorkers <= FewAmount then
		XGUIEng.HighLightButton(gvGUI_WidgetID.SetWorkersAmountFew,1)		
	elseif CurrentMaxNumbersOfWorkers <= HalfAmount then
		XGUIEng.HighLightButton(gvGUI_WidgetID.SetWorkersAmountHalf,1)		
	elseif CurrentMaxNumbersOfWorkers <= FullAmount then
		XGUIEng.HighLightButton(gvGUI_WidgetID.SetWorkersAmountFull,1)		
	end
	
	--Display current amount in Buttons
	XGUIEng.SetTextByValue( gvGUI_WidgetID.WorkersAmountFew, FewAmount, 1 )		
	XGUIEng.SetTextByValue( gvGUI_WidgetID.WorkersAmountHalf, HalfAmount, 1 )		
	XGUIEng.SetTextByValue( gvGUI_WidgetID.WorkersAmountFull, FullAmount, 1  )				
end 

--------------------------------------------------------------------------------
-- Chaneg Texture of Find Ari button, if enemies are near
--------------------------------------------------------------------------------
gvGUI.DarioCounter = 0
function
GUIUpdate_SentinelAbility(_WidgetID, _EntityID)
	
	local EntityType = Logic.GetEntityType(_EntityID)
	local Urgency = Logic.SentinelGetUrgency(_EntityID)
	
	if Logic.SentinelGetUrgency(_EntityID) == 1 then					
		
		if gvGUI.DarioCounter < 250 then
			
			XGUIEng.SetMaterialColor(_WidgetID,0, 100,100,200,255)		
			gvGUI.DarioCounter = gvGUI.DarioCounter +1
		end		
		if gvGUI.DarioCounter >= 250 then			
			XGUIEng.SetMaterialColor(_WidgetID,0, 255,255,255,255)		
			gvGUI.DarioCounter = gvGUI.DarioCounter +1
		end
		if gvGUI.DarioCounter == 500 then
			gvGUI.DarioCounter= 0
		end
	else	
		XGUIEng.SetMaterialColor(_WidgetID,0, 255,255,255,255)		
	end
end

function GUIUpdate_SettlersInBuilding()
	
	local PlayerID = GUI.GetPlayerID()
	local EntityId = GUI.GetSelectedEntity()
	
	if EntityId == nil then
		return
	end
	if Logic.IsBuilding( EntityId ) ~= 1 then
		return
	end
	
	local BuildingType =  Logic.GetEntityType( EntityId )
	local BuildingCategory = Logic.GetUpgradeCategoryByBuildingType( BuildingType )
	
	local SettlersTable = {}
	local MaxSettlersAmount = 0
	
	--fill tables depending on the Building type	
	if BuildingCategory == UpgradeCategories.Residence then
		SettlersTable = {Logic.GetAttachedResidentsToBuilding(EntityId)}
		MaxSettlersAmount = Logic.GetMaxNumberOfResidents(EntityId)
		
	elseif BuildingCategory == UpgradeCategories.Farm or BuildingCategory == UpgradeCategories.Tavern then
		SettlersTable = {Logic.GetAttachedEaterToBuilding(EntityId)}
		MaxSettlersAmount = Logic.GetMaxNumberOfEaters(EntityId)
		
	else
		SettlersTable = {Logic.GetAttachedWorkersToBuilding(EntityId)}
		MaxSettlersAmount = Logic.GetCurrentMaxNumWorkersInBuilding(EntityId)				
	end
	
		
	XGUIEng.ShowAllSubWidgets(gvGUI_WidgetID.WorkerButtonContainer,0)	
	
	--show settlers containers and set variable of container
	local i
	for i=1, MaxSettlersAmount,1
	do
		local ButtonName = "WorkerContainer" .. i		
		XGUIEng.ShowWidget(ButtonName,1)		
		XGUIEng.SetBaseWidgetUserVariable(ButtonName, 0,SettlersTable[i+1])		
	end
	
end

function
GUIUpdate_SettlersContainer(_number)
	
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	local MotherContainer= XGUIEng.GetWidgetsMotherID(CurrentWidgetID)
	local SettlerID = XGUIEng.GetBaseWidgetUserVariable(MotherContainer, 0)
	
	local FarmWidgetName = "WorkerHasFarm" .. _number	
	local ResidenceWidgetName = "WorkerHasResidence" .. _number	
	local MotivationIconName = "WorkerMotivation" .. _number				
	local ButtonName = "Worker" .. _number		
	
	--Is a settler assigned to container?
	if SettlerID == 0 then		
		-- NO!		
		for i=0,4,1
		do
			--empty Textures
			XGUIEng.SetMaterialTexture(ButtonName,i, "Data\\Graphics\\Textures\\GUI\\inHouse\\PU_leer.png")		
		
			--empty motivation			
			XGUIEng.SetMaterialTexture(MotivationIconName,i, "Data\\Graphics\\Textures\\GUI\\inHouse\\motivation_blank.png")		
		
		end	
		
		--do not show farm		
		XGUIEng.ShowWidget(FarmWidgetName,0)	
				
		--do not show residence		
		XGUIEng.ShowWidget(ResidenceWidgetName,0)			
		
		return
	end
	
		
	local WorkerType = Logic.GetEntityType(SettlerID)
	local WorkerTypeName = Logic.GetEntityTypeName( WorkerType )
	
	--set texture on WorkerButtons	
	local TexturePath = ""
	if string.find(WorkerTypeName, "PU_") or WorkerType == Entities.CU_Serf then
		TexturePath = TexturePath .. "Data\\Graphics\\Textures\\GUI\\inHouse\\" .. WorkerTypeName .. ".png"
	else
		TexturePath = TexturePath .. "Data\\Graphics\\Textures\\GUI\\b_help.png"
	end
	for j = 0, 4, 1 do
		XGUIEng.SetMaterialTexture(ButtonName,j, TexturePath)		
	end
	
	--set motivation
	local Motivation = Logic.GetSettlersMotivation(SettlerID)
	local TexturePathMotivationIcon = ""
	
	
	
	if 		Motivation > gvGUI.MotivationThresholds.Happy 
		then
		 		TexturePathMotivationIcon = "Data\\Graphics\\Textures\\GUI\\inHouse\\motivation_happy.png"
		 		
	elseif 	Motivation > gvGUI.MotivationThresholds.Sad	 
		and 	Motivation < gvGUI.MotivationThresholds.Happy
		then
			TexturePathMotivationIcon = "Data\\Graphics\\Textures\\GUI\\inHouse\\motivation_good.png"
			
	elseif 	Motivation > gvGUI.MotivationThresholds.Angry 
		and 	Motivation < gvGUI.MotivationThresholds.Sad
		then
			TexturePathMotivationIcon = "Data\\Graphics\\Textures\\GUI\\inHouse\\motivation_sad.png"
			
	elseif 	Motivation > gvGUI.MotivationThresholds.Leave
		and 	Motivation < gvGUI.MotivationThresholds.Angry 
		then	
			TexturePathMotivationIcon = "Data\\Graphics\\Textures\\GUI\\inHouse\\motivation_angry.png"
			
	elseif 	Motivation < gvGUI.MotivationThresholds.Leave
		then
			TexturePathMotivationIcon = "Data\\Graphics\\Textures\\GUI\\inHouse\\motivation_leave.png"
	else 
				TexturePathMotivationIcon = "Data\\Graphics\\Textures\\GUI\\inHouse\\motivation_good.png"

	end
	
	
	XGUIEng.SetMaterialTexture(MotivationIconName,1,TexturePathMotivationIcon)			
		
	
	--display Farm icon if player has farm
	if Logic.GetSettlersResidence(SettlerID) ~= 0 then
		XGUIEng.ShowWidget(ResidenceWidgetName,1)	
	else
		XGUIEng.ShowWidget(ResidenceWidgetName,0)	
	end
	
	--display residence icon if player has residence
	if Logic.GetSettlersFarm(SettlerID) ~= 0 then
		XGUIEng.ShowWidget(FarmWidgetName,1)	
	else
		XGUIEng.ShowWidget(FarmWidgetName,0)	
	end
		
	
end


function
GUIUpdate_ToggleWeatherForecast()

	local PlayerID = GUI.GetPlayerID()
	local WeatherTowerAmount, WeatherTowerID = Logic.GetPlayerEntities(PlayerID,Entities.PB_WeatherTower1,1)

	if  WeatherTowerAmount >=1 
	and Logic.IsConstructionComplete(WeatherTowerID) == 1 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.WeatherForecast,1)
	else
		XGUIEng.ShowWidget(gvGUI_WidgetID.WeatherForecast,0)	
	end
end

function
GUIUpdate_WeatherForecast()
	
	local NextWeatherState = Logic.GetNextWeatherState()
	local SecondsLeftToNextWeatherPeriod = math.floor (Logic.GetTimeToNextWeatherPeriod())
	local CurrentWeatherState = Logic.GetWeatherState()
	
	--Return: Next weather state 1 = normal, 2 = rain, 3 = snow
	
	
	
	
	local Texture
	if SecondsLeftToNextWeatherPeriod <= 20 then
		
		if NextWeatherState == 1 then
			Texture = "data\\graphics\\textures\\gui\\weather_sun.png"
		elseif NextWeatherState == 2 then
			Texture = "data\\graphics\\textures\\gui\\weather_rain.png"
		elseif NextWeatherState == 3 then
			Texture = "data\\graphics\\textures\\gui\\weather_snow.png"
		end
		
		if SecondsLeftToNextWeatherPeriod == 19 then
			if NextWeatherState ~= CurrentWeatherState then
				GUI.SendWeatherForecastEvent(NextWeatherState)
			end
		end
	else
		if CurrentWeatherState == 1 then
			Texture = "data\\graphics\\textures\\gui\\weather_sun.png"
		elseif CurrentWeatherState == 2 then
			Texture = "data\\graphics\\textures\\gui\\weather_rain.png"
		elseif CurrentWeatherState == 3 then
			Texture = "data\\graphics\\textures\\gui\\weather_snow.png"
		end
	
	end
	
	
	for i=0, 4,1
	do
		XGUIEng.SetMaterialTexture(gvGUI_WidgetID.WeatherForecast,i, Texture)					
	end
	
end

--Modified by CP
function GUIUpdate_AlarmButton()
	local RemainingAlarmTimeInPercent = Logic.GetAlarmRechargeTimeInPercent(GUI.GetPlayerID())
	
	if Logic.IsAlarmModeActive(GUI.GetSelectedEntity()) == true then
		XGUIEng.ShowWidget("QuitAlarm", 1)	
		XGUIEng.ShowWidget("ActivateAlarm", 0)	
		XGUIEng.SetMaterialColor("ActivateAlarm_Recharge", 1, 0, 0, 0, 0)	

		XGUIEng.ShowWidget("OP_QuitAlarm", 1)	
		XGUIEng.ShowWidget("OP_ActivateAlarm", 0)	
		XGUIEng.SetMaterialColor("OP_ActivateAlarm_Recharge", 1, 0, 0, 0, 0)			
	else
		XGUIEng.ShowWidget("QuitAlarm", 0)	
		XGUIEng.ShowWidget("ActivateAlarm", 1)	
		XGUIEng.SetMaterialColor("ActivateAlarm_Recharge", 1, 214, 44, 24, 189)	

		XGUIEng.ShowWidget("OP_QuitAlarm", 0)	
		XGUIEng.ShowWidget("OP_ActivateAlarm", 1)	
		XGUIEng.SetMaterialColor("OP_ActivateAlarm_Recharge", 1, 214, 44, 24, 189)			
		
		if RemainingAlarmTimeInPercent == 0 then
			XGUIEng.DisableButton("ActivateAlarm", 0)
			XGUIEng.DisableButton("OP_ActivateAlarm", 0)
		else
			XGUIEng.DisableButton("ActivateAlarm", 1)
			XGUIEng.DisableButton("OP_ActivateAlarm", 1)
		end
	end
		
	XGUIEng.SetProgressBarValues("ActivateAlarm_Recharge", RemainingAlarmTimeInPercent, 100)
	XGUIEng.SetProgressBarValues("OP_ActivateAlarm_Recharge", RemainingAlarmTimeInPercent, 100)
end

function GUIUpdate_TaxesButtons()
	local PlayerID = GUI.GetPlayerID()
	local TaxLevel = Logic.GetTaxLevel(PlayerID)
	local BuildingID = GUI.GetSelectedEntity()
	local UpgradeCategory = Logic.GetUpgradeCategoryByBuildingType(Logic.GetEntityType(BuildingID))
	
	if UpgradeCategory == UpgradeCategories.Outpost then
		XGUIEng.UnHighLightGroup(gvGUI_WidgetID.InGame, "taxesgroup")		
		XGUIEng.HighLightButton(gvGUI_WidgetID.OP_TaxesButtons[TaxLevel] ,1)	
	else
		XGUIEng.UnHighLightGroup(gvGUI_WidgetID.InGame, "taxesgroup")		
		XGUIEng.HighLightButton(gvGUI_WidgetID.TaxesButtons[TaxLevel] ,1)	
	end
end

function GUIUpdate_OvertimesButtons()
	local BuildingID = GUI.GetSelectedEntity()
	local UpgradeCategory = Logic.GetUpgradeCategoryByBuildingType(Logic.GetEntityType(BuildingID))
	local RemainingOvertimeTimeInPercent = Logic.GetOvertimeRechargeTimeAtBuilding(BuildingID)
	local ProgressBarWidget = XGUIEng.GetWidgetID( "OvertimesButton_Recharge" );
	local MaxNumberOfworkers = Logic.GetCurrentMaxNumWorkersInBuilding(BuildingID)
	
	if UpgradeCategory == UpgradeCategories.Residence or UpgradeCategory == UpgradeCategories.Farm then
		XGUIEng.ShowWidget(gvGUI_WidgetID.ActivateOvertimes, 0)	
		XGUIEng.ShowWidget("BuildingResume",0)
		XGUIEng.ShowWidget("BuildingShutDown",0)
	else
		if MaxNumberOfworkers == 0 then
			XGUIEng.ShowWidget("BuildingResume",1)
			XGUIEng.ShowWidget("BuildingShutDown",0)
		else
			XGUIEng.ShowWidget("BuildingResume",0)
			XGUIEng.ShowWidget("BuildingShutDown",1)
		end

		if Logic.IsOvertimeActiveAtBuilding(BuildingID) == 1 then
			XGUIEng.ShowWidget(gvGUI_WidgetID.QuitOvertimes  ,1)	
			XGUIEng.ShowWidget(gvGUI_WidgetID.ActivateOvertimes  ,0)	
			XGUIEng.SetMaterialColor(ProgressBarWidget,1,0,0,0,0)	
		else
			XGUIEng.ShowWidget(gvGUI_WidgetID.QuitOvertimes  ,0)	
			XGUIEng.ShowWidget(gvGUI_WidgetID.ActivateOvertimes  ,1)	
			XGUIEng.SetMaterialColor(ProgressBarWidget,1,214,44,24,189)		
		
			if RemainingOvertimeTimeInPercent == 0 then
				XGUIEng.DisableButton(gvGUI_WidgetID.ActivateOvertimes, 0)
			else
				XGUIEng.DisableButton(gvGUI_WidgetID.ActivateOvertimes, 1)
			end
				
		end

		XGUIEng.SetProgressBarValues(ProgressBarWidget, RemainingOvertimeTimeInPercent, 100)
	end
end

function
GUIUpdate_ChangeWeatherButtons(_Button, _Technology,_WeatherState)

	local PlayerID = GUI.GetPlayerID()
	local TechState = Logic.GetTechnologyState(PlayerID, _Technology)
	local CurrentWeather = Logic.GetWeatherState()
	
	if _WeatherState == CurrentWeather then
		XGUIEng.DisableButton(_Button,1)
		return
	end
	
	if Logic.IsWeatherChangeActive() == true then
		XGUIEng.DisableButton(_Button,1)
		return
	end
	
	--Building is interdicted
	if TechState == 0 then	
		XGUIEng.DisableButton(_Button,1)
	
	--Building is not available yet or Technology is to far in the futur
	elseif TechState == 1 or TechState == 5 then
		XGUIEng.DisableButton(_Button,1)
		XGUIEng.ShowWidget(_Button,1)
		
	--Building is enabled and visible	
	elseif TechState == 2 or TechState == 3 or TechState == 4 then
		XGUIEng.ShowWidget(_Button,1)
		XGUIEng.DisableButton(_Button,0)	
	
	end

end

function GUIUpdate_DisplayButtonOnlyInMode(_ModeFlag)
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	local NameType = {Framework.GetCurrentMapTypeAndCampaignName()}
	local Type = NameType[1]	
	
	--_ModeFlag 0 = SP
	--_ModeFlag 1 = MP
	--_ModeFlag 2 = Campaign (used for tipps button)
	
	if _ModeFlag == 2 then
		if Type == -1 then
			if Logic.PlayerGetGameState( GUI.GetPlayerID() ) == 3 
			or Logic.PlayerGetGameState( GUI.GetPlayerID() ) == 2 then
			
				XGUIEng.DisableButton(CurrentWidgetID ,0)			
			else
				XGUIEng.DisableButton(CurrentWidgetID ,1)		
			end
		end
		return
	end
	
	local MapName= Framework.GetCurrentMapName()
			
	if Type == -1 and CurrentWidgetID == XGUIEng.GetWidgetID("MainMenuWindow_NetworkGame") and MapName ~= "00_Tutorial1" then
		XGUIEng.SetText("MainMenuWindow_NetworkGame", XGUIEng.GetStringTableText("WindowMisc/MainMenu_ButtonTipps"))
		XGUIEng.DisableButton(CurrentWidgetID ,0)	
	else
		if XNetwork.Manager_DoesExist() == _ModeFlag	-- MP
		or (MapName == "00_Tutorial1" and (CurrentWidgetID ~= XGUIEng.GetWidgetID( "MainMenuWindow_RestartGame" ) )) 
		or (MapName == "00_Tutorial1" and (CurrentWidgetID ~= XGUIEng.GetWidgetID( "GameEndScreen_WindowRestartGame" ) ))
		or XNetworkUbiCom.Manager_DoesExist() == 1 then		
			XGUIEng.DisableButton(CurrentWidgetID ,1)	
		else
			XGUIEng.DisableButton(CurrentWidgetID ,0)	
		end
	end
	
end

function
GUIUpdate_MinimapInDiplomacyMenu()

	if XNetwork.Manager_DoesExist() == 0 then		
		XGUIEng.ShowWidget("DiplomacyWindowMinimap" ,1)	
	else
		XGUIEng.ShowWidget("DiplomacyWindowMinimap",0)	
	end

end

function
GUIUpdate_SelectionGeneric()
	
	XGUIEng.ShowAllSubWidgets(gvGUI_WidgetID.DetailsGeneric,0)	
	
	local EntityID = GUI.GetSelectedEntity()	
	local SelectedEntities = { GUI.GetSelectedEntities() }
	
	
	if EntityID == nil then
		return
	end
	
	local CurrentHealth = Logic.GetEntityHealth( EntityID )		
	if CurrentHealth ~= nil then
		XGUIEng.ShowWidget( gvGUI_WidgetID.DetailsHealth,1 )	
	else
		XGUIEng.ShowWidget( gvGUI_WidgetID.DetailsHealth,0 )	
	end
	
	local Armor = Logic.GetEntityArmor( EntityID )
	if Armor ~= nil then
		XGUIEng.ShowWidget( gvGUI_WidgetID.DetailsArmor,1 )	
	else
		XGUIEng.ShowWidget( gvGUI_WidgetID.DetailsArmor,0 )	
	end
	
	
	local Damage = Logic.GetEntityDamage( EntityID )	
	if Damage ~= nil 
	and Damage ~= 0 then
		XGUIEng.ShowWidget( gvGUI_WidgetID.DetailsDamage,1 )	
	else
		XGUIEng.ShowWidget( gvGUI_WidgetID.DetailsDamage,0 )	
	end
	
	--local NeededSlots = Logic.GetSettlersAttractionLimitValue(EntityID)
	--if NeededSlots ~= nil 
	--and NeededSlots ~= 0 then
	--	XGUIEng.ShowWidget( gvGUI_WidgetID.DetailsPayAndSlots,1 )	
	--else
	--	XGUIEng.ShowWidget( gvGUI_WidgetID.DetailsPayAndSlots,0 )	
	--end
	
	
	if Logic.IsEntityInCategory(EntityID,EntityCategories.Leader) == 1 then	
		
		local MaxAmountOfSoldiers = Logic.LeaderGetMaxNumberOfSoldiers( EntityID )				
		if MaxAmountOfSoldiers ~= nil and MaxAmountOfSoldiers > 0 then
			XGUIEng.ShowWidget( gvGUI_WidgetID.DetailsGroupStrength,1 )	
		else
			XGUIEng.ShowWidget( gvGUI_WidgetID.DetailsGroupStrength,0 )	
		end
		
		
		if 	Logic.GetEntityType(EntityID) ~= Entities.CU_Barbarian_Hero_wolf 
		and	Logic.GetEntityType(EntityID) ~= Entities.PU_Hero5_Outlaw
		and	Logic.GetEntityType(EntityID) ~= Entities.PU_Hero1_Guard then
			local Experience = Logic.GetLeaderExperienceLevel( EntityID )
			if Experience ~= nil then
				XGUIEng.ShowWidget( gvGUI_WidgetID.Experience,1 )	
			else
				XGUIEng.ShowWidget( gvGUI_WidgetID.Experience,0 )	
			end
		end
	
	end
	

end

gvGUI.HighlightButtonCounter  = 1


function GUIUpdate_HighlightNewWorkerHaveNoFarmOrResidenceButtons()
		if GDB.GetValue( "Game\\HighlightNewWorkerHaveNoFarmOrResidenceButtonsFlag" ) == 0 then	
		
			gvGUI.HighlightButtonCounter = 1 - gvGUI.HighlightButtonCounter 
		
			if gvGUI.HighlightButtonCounter == 1 then	
				for i=0, 4,1
				do
					XGUIEng.SetMaterialColor("NextWorkerNoFarm",i, 255,0,0,255)		
					XGUIEng.SetMaterialColor("NextWorkerNoResidence",i, 255,0,0,255)		
				end			
			end		
		
			if gvGUI.HighlightButtonCounter == 0 then
				for i=0, 4,1
				do
					XGUIEng.SetMaterialColor("NextWorkerNoFarm",i, 255,255,255,255)
					XGUIEng.SetMaterialColor("NextWorkerNoResidence",i, 255,255,255,255)
				end
				
			end
		end

end

