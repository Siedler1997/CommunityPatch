--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Upgrade
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--------------------------------------------------------------------------------
-- Upggrade the selected building
--------------------------------------------------------------------------------

function GUIAction_Upgrade_Init()
	-- Table saving button widget IDs per techology
	gvGUI_UpdateButtonIDArray = {}
end


function 
GUIAction_UpgradeSelectedBuilding()

	local SelectedEntityID = GUI.GetSelectedEntity()
	local SelectedBuildingType = Logic.GetEntityType( SelectedEntityID )	
	Logic.FillBuildingUpgradeCostsTable( SelectedBuildingType, InterfaceGlobals.CostTable )
	
	if InterfaceTool_IsBuildingDoingSomething( SelectedEntityID ) == true then		
		return
	end
	
	if Logic.IsAlarmModeActive(SelectedEntityID) == true then
		GUI.AddNote(XGUIEng.GetStringTableText("InGameMessages/Note_StoptAlarmFirst"))				
		return
	end
	
	
	local EntityType = Logic.GetEntityType( SelectedEntityID )
	local UpgradeCategory = Logic.GetUpgradeCategoryByBuildingType(EntityType)
	
	if UpgradeCategory == UpgradeCategories.Barracks
	or UpgradeCategory == UpgradeCategories.Archery
	or UpgradeCategory == UpgradeCategories.Stable then
		local LeadersTrainingAtMilitaryBuilding = Logic.GetLeaderTrainingAtBuilding(SelectedEntityID)
		if LeadersTrainingAtMilitaryBuilding ~= 0 then
			GUI.AddNote(XGUIEng.GetStringTableText("InGameMessages/GUI_UpgradeNotPossibleBecauseOfTraining"))			
			return
		end
	end
	
	
	gvGUI_UpdateButtonIDArray[ SelectedEntityID ] = XGUIEng.GetCurrentWidgetID()
	
	if InterfaceTool_HasPlayerEnoughResources_Feedback( InterfaceGlobals.CostTable ) == 1 then
		GUI.UpgradeSingleBuilding( SelectedEntityID )		
		--Sound.PlayGUISound( Sounds.klick_rnd_1, 0 )	
		
		XGUIEng.ShowWidget(gvGUI_WidgetID.UpgradeInProgress,1)
	end
	--Update all buttons in the visible container
	XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)
end

--------------------------------------------------------------------------------
--Get current upgrade of selected building and cancle it
--------------------------------------------------------------------------------

function
GUIAction_CancelUpgrade()
	
	local EntityID = GUI.GetSelectedEntity()
	
	XGUIEng.ShowWidget(gvGUI_WidgetID.UpgradeInProgress,0)	
	GUI.CancelBuildingUpgrade(EntityID)
	
end

--------------------------------------------------------------------------------
-- Show the correct upgrade button
--------------------------------------------------------------------------------
function
InterfaceTool_UpdateUpgradeButtons(_EntityType, _UpgradeCategory, _ButtonNameStem )

	if _ButtonNameStem == "" then
		return
	end

	local Upgrades = {Logic.GetBuildingTypesInUpgradeCategory(_UpgradeCategory)}
	
	if Upgrades[1] == 2 then
		if _EntityType == Upgrades[2] then
			XGUIEng.ShowWidget(_ButtonNameStem .. 1,1)
		else
			XGUIEng.ShowWidget(_ButtonNameStem .. 1,0)
		end
	
	elseif Upgrades[1] == 3 then	
		local i
		for i = 1, Upgrades[1], 1
		do		
			if _EntityType == Upgrades[i+1] then
				
			 	if i == 1 then
					XGUIEng.ShowWidget(_ButtonNameStem .. 1,1)
					XGUIEng.ShowWidget(_ButtonNameStem .. 2,0)
				elseif i == 2 then
					XGUIEng.ShowWidget(_ButtonNameStem .. 1,0)
					XGUIEng.ShowWidget(_ButtonNameStem .. 2,1)
				else
					XGUIEng.ShowWidget(_ButtonNameStem .. 1,0)
					XGUIEng.ShowWidget(_ButtonNameStem .. 2,0)
				end

			end
		end
	end

end

--------------------------------------------------------------------------------
-- Update the upgrade progress bar
--------------------------------------------------------------------------------

function
GUIUpdate_UpgradeProgress()

	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()

	local BuildingID = GUI.GetSelectedEntity()
	
	if BuildingID == nil then
		return
	end
	
	local value = Logic.GetRemainingUpgradeTimeForBuilding( BuildingID )
	local limit = Logic.GetTotalUpgradeTimeForBuilding( BuildingID )
	
	value = limit - value

	XGUIEng.SetProgressBarValues(CurrentWidgetID,value, limit)
end


--------------------------------------------------------------------------------
-- Update the Menus, when building was upgarded
--------------------------------------------------------------------------------

function GameCallback_OnBuildingUpgradeComplete(_OldID, _NewID)

	--calculate score
	if Score ~= nil then
		Score.CallBackUpgrade(_OldID, _NewID)		
	end
	
	local EntityType = Logic.GetEntityType( _NewID )
	local UpgradeCategory = Logic.GetUpgradeCategoryByBuildingType(EntityType)
	
	--Set Maxworkers after upgrade
	local MaxNumberOfworkers = Logic.GetMaxNumWorkersInBuilding(_NewID)
	if MaxNumberOfworkers > 0 then
		GUI.SetCurrentMaxNumWorkersInBuilding(_NewID,MaxNumberOfworkers)
		InterfaceTool_UpdateWorkerAmountButtons()
	end
	
	local PlayerID = Logic.EntityGetPlayer( _NewID )
	local TitleString = " "
	local PronounString = ""

	local ColorR, ColorG, ColorB = GUI.GetPlayerColor( PlayerID )
	local Color =  "@color:" .. ColorR .. "," .. ColorG .. ",".. ColorB .. ",255 "
	local UserTool_GetPlayerName = Color .. UserTool_GetPlayerName( PlayerID )

	if UserTool_GetLocalPlayerSex() == 1 then
		PronounString = PronounString .. XGUIEng.GetStringTableText("MenuGeneric/Female_Pronoun_Generic")
	else
		PronounString = PronounString .. XGUIEng.GetStringTableText("MenuGeneric/Male_Pronoun_Generic")
	end

	if 	UpgradeCategory == UpgradeCategories.Headquarters then
		local UpgradeName = ""
		if EntityType == Entities.PB_Headquarters2 then
			UpgradeName = UpgradeName .. string.format(XGUIEng.GetStringTableText("InGameMessages/GUI_PlayerXHasUpgradeHisKeep"), PlayerName, PronounString)	
		else
			UpgradeName = UpgradeName .. string.format(XGUIEng.GetStringTableText("InGameMessages/GUI_PlayerXHasUpgradeHisCastle"), PlayerName, PronounString)
		end
		--GUI.ClearNotes()
		
		
		GUI.AddNote(UpgradeName)
		
	end
	
	--Update all buttons in the visible container
	XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)	
	
	if PlayerID == GUI.GetPlayerID() then	
		GUI.SendUpgradeFinishedFeedbackEvent(_NewID, UpgradeCategory)
--		Sound.PlayFeedbackSound( Sounds.Speech_INFO_UpgradeBuilding_rnd_01, 0 )
	end
end
