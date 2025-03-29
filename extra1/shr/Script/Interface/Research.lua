--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Research
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--------------------------------------------------------------------------------
-- Start Research
--------------------------------------------------------------------------------

-- Table saving button widget IDs per techology

function GUIAction_Research_Init()
	gvGUI_TechnologyButtonIDArray = {}
end


function
GUIAction_ReserachTechnology(_TechnologyType)
	
	
	-- Save button ID for technology
	gvGUI_TechnologyButtonIDArray[ _TechnologyType ] = XGUIEng.GetCurrentWidgetID()

	
	-- Get parameter
	local PlayerID = GUI.GetPlayerID()
	Logic.FillTechnologyCostsTable(_TechnologyType, InterfaceGlobals.CostTable)
	local EntityID = GUI.GetSelectedEntity()
	local TechState = Logic.GetTechnologyState(PlayerID, _TechnologyType)
	
		
	--technology is researched or technology is currently in research!
	if TechState == 4 or TechState == 3 then
		return
	end
	
	if InterfaceTool_IsBuildingDoingSomething( EntityID ) == true then		
		return
	end
	
	
	-- Enough resources?
	if InterfaceTool_HasPlayerEnoughResources_Feedback( InterfaceGlobals.CostTable ) == 1 then		
		-- YES!		
		GUI.StartResearch(EntityID,_TechnologyType)
		--Sound.PlayGUISound( Sounds.klick_rnd_1, 0 )		
		--Display Research
		XGUIEng.ShowWidget(gvGUI_WidgetID.ResearchInProgress,1)
		--Update all buttons in the visible container
		XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)	
	end
	
end

--------------------------------------------------------------------------------
-- Update the research progress bar
-------------------------------------------------------------------------------
function
GUIUpdate_ResearchProgress()
	
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local BuildingID = GUI.GetSelectedEntity()
	
	if BuildingID == nil then
		return
	end
	
	local PlayerID = GUI.GetPlayerID()
	local TechnologyType = Logic.GetTechnologyResearchedAtBuilding(BuildingID)
	
	if TechnologyType ~= 0 then
	    local value = Logic.GetTechnologyProgress( PlayerID, TechnologyType )
	
	    XGUIEng.SetProgressBarValues(CurrentWidgetID,value, 100)
	end
	
end

--------------------------------------------------------------------------------
--Get current technology of selected building and cancel it
--------------------------------------------------------------------------------
function
GUIAction_CancelTechnology()
	
	local PlayerID = GUI.GetPlayerID()
	local EntityID = GUI.GetSelectedEntity()
	local TechnologyType = Logic.GetTechnologyResearchedAtBuilding(EntityID)	
	
	XGUIEng.ShowWidget(gvGUI_WidgetID.ResearchInProgress,0)	
	
	GUI.CancelResearch(EntityID, TechnologyType)
end

--------------------------------------------------------------------------------
-- Called by program when technology is researched
--------------------------------------------------------------------------------
function GameCallback_OnTechnologyResearched( _PlayerID, _TechnologyType )
	
	--Update Techs for Tech Race game mode in MP
	if XNetwork ~= nil and XNetwork.GameInformation_GetMPFreeGameMode() == 2 then
		VC_OnTechnologyResearched( _PlayerID, _TechnologyType )
	end
	
	--calculate score
	if Score ~= nil then
		Score.CallBackResearched( _PlayerID, _TechnologyType )	
	end
	
	local PlayerID = GUI.GetPlayerID()
	if PlayerID ~= _PlayerID then
		return
	end
	
	local BuildingID = GUI.GetSelectedEntity()
	if BuildingID ~= 0 then
		local TechnologyAtBuilding = Logic.GetTechnologyResearchedAtBuilding(BuildingID)
		if  TechnologyAtBuilding == 0 then	
			XGUIEng.ShowWidget(gvGUI_WidgetID.ResearchInProgress,0)
		end
	end
	
	--Upgrade SWORD Soldiers and Leaders if upgrade is done: AnSu: We have to do this in the Logic!
	if _TechnologyType == Technologies.T_UpgradeSword1 or _TechnologyType == Technologies.T_UpgradeSword2 or _TechnologyType == Technologies.T_UpgradeSword3 then
		--should be LOGIC not GUI
		GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderSword,PlayerID)
		GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierSword,PlayerID)
		if _TechnologyType == Technologies.T_UpgradeSword3 then
			XGUIEng.TransferMaterials("Buy_Sword_Gold", "Buy_LeaderSword")	
		end
	--Upgrade POLE ARM Soldiers and Leaders if upgrade is done: AnSu: We have to do this in the Logic!
	elseif _TechnologyType == Technologies.T_UpgradeSpear1 or _TechnologyType == Technologies.T_UpgradeSpear2 or _TechnologyType == Technologies.T_UpgradeSpear3 then
		GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm,PlayerID)
		GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm,PlayerID)
		if _TechnologyType == Technologies.T_UpgradeSpear3 then
			XGUIEng.TransferMaterials("Buy_Spear_Gold", "Buy_LeaderSpear")	
		end
	--Upgrade BOW Soldiers and Leaders if upgrade is done: AnSu: We have to do this in the Logic!
	elseif _TechnologyType == Technologies.T_UpgradeBow1 or _TechnologyType == Technologies.T_UpgradeBow2 or _TechnologyType == Technologies.T_UpgradeBow3 then
		GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderBow,PlayerID)
		GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierBow,PlayerID)
		if _TechnologyType == Technologies.T_UpgradeBow3 then
			XGUIEng.TransferMaterials("Buy_Bow_Gold", "Buy_LeaderBow")	
		end
	--Upgrade LIGHT CAVALRYSoldiers and Leaders if upgrade is done
	elseif _TechnologyType == Technologies.T_UpgradeLightCavalry1 then
		GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry,PlayerID)
		GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry,PlayerID)
		if _TechnologyType == Technologies.T_UpgradeLightCavalry1 then
			XGUIEng.TransferMaterials("Buy_CavalryLight_Gold", "Buy_LeaderCavalryLight")	
		end
	--Upgrade LIGHT CAVALRYSoldiers and Leaders if upgrade is done
	elseif _TechnologyType == Technologies.T_UpgradeHeavyCavalry1 then
		GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry,PlayerID)
		GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry,PlayerID)
		if _TechnologyType == Technologies.T_UpgradeHeavyCavalry1 then
			XGUIEng.TransferMaterials("Buy_CavalryHeavy_Gold", "Buy_LeaderCavalryHeavy")	
		end
	-- AddOn 1:
	--Upgrade RIFLEMAN Soldiers and Leaders if upgrade is done
	elseif _TechnologyType == Technologies.T_UpgradeRifle1 then
		GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle,PlayerID)
		GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle,PlayerID)
		if _TechnologyType == Technologies.T_UpgradeRifle1 then
			XGUIEng.TransferMaterials("Buy_Rifle_Gold", "Buy_LeaderRifle")	
		end
	end
	
	--Do not play sound on begin of the map
	local GameTimeMS = Logic.GetTimeMs()	
	if GameTimeMS == 0 then
		return
	end
	
--	Sound.PlayQueuedFeedbackSound( Sounds.Speech_INFO_ResearchReady_rnd_01, 0 )
	
--	if (Logic.GetTechnologyState(PlayerID, Technologies.UP1_Headquarter )== 2 
--	or  Logic.GetTechnologyState(PlayerID, Technologies.UP1_Headquarter )== 3) 	
--	and gvGUI.UpgrdaeHQFlag ==  0
--	then
--		Sound.PlayQueuedFeedbackSound( Sounds.Speech_INFO_UpgardeHG, 0 )
--		gvGUI.UpgrdaeHQFlag = 1
--	end
	
--	if (Logic.GetTechnologyState(PlayerID, Technologies.UP2_Headquarter )== 2 	
--	or Logic.GetTechnologyState(PlayerID, Technologies.UP2_Headquarter )== 3 )
--	and gvGUI.UpgrdaeHQFlag ==  1
--	then
--		Sound.PlayQueuedFeedbackSound( Sounds.Speech_INFO_UpgardeHG, 0 )
--		gvGUI.UpgrdaeHQFlag = 2
--	end
	
	
	
	--Update all buttons in the visible container
	XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)
	
end

function
GameCallback_OnPointToResource(_foundPos, _unused)

	if _foundPos == 0 then
		GUI.AddNote( XGUIEng.GetStringTableText("InGameMessages/shortmessage_noresourceclose") )
	else
		GUI.AddNote( XGUIEng.GetStringTableText("InGameMessages/shortmessage_pointtoresource") )
	end


end