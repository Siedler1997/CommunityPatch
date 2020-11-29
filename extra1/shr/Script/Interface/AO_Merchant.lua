----------------------------------------------------------------------------------------------------------------
--Merchant Menu 
----------------------------------------------------------------------------------------------------------------

--Merchant is the name for both
--TroopMerchant for troops
--TechMerchant for technologies

----------------------------------------------------------------------------------------------------------------
--Update Merchant Menu 
----------------------------------------------------------------------------------------------------------------
SelectedTroopMerchantID = 0

function
GUIAction_MerchantCallback(_buidlingId, _heroID)

	local CurrentPlayerID = GUI.GetPlayerID()
	local HeroOfPlayerID= Logic.EntityGetPlayer(_heroID)
	
	if HeroOfPlayerID == CurrentPlayerID then
		if  Logic.IsMerchantOpened(_buidlingId, HeroOfPlayerID) == true then

			XGUIEng.ShowAllSubWidgets(gvGUI_WidgetID.SelectionView,0)	
			
			XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionGeneric,1)	
			XGUIEng.ShowWidget(gvGUI_WidgetID.BackgroundFull,1)
			
			--Hide all building widgets
			XGUIEng.ShowAllSubWidgets(gvGUI_WidgetID.SelectionBuilding,0)	
			
			--Display building container
			XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionBuilding,1)
			
			XGUIEng.ShowWidget(gvGUI_WidgetID.TroopMerchant,1)
			
			SelectedTroopMerchantID = _buidlingId
			
			XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)
		else
			
			if XNetwork ~= nil and XNetwork.Manager_DoesExist() == 1 then
				for PlayerUsingTheMerchant=1,8 do
					
					if Logic.IsMerchantOpened(_buidlingId, PlayerUsingTheMerchant) == true  then
					
						local UserName = XNetwork.GameInformation_GetLogicPlayerUserName( PlayerUsingTheMerchant )
						local ColorR, ColorG, ColorB = GUI.GetPlayerColor( PlayerUsingTheMerchant )    
		    			local Message = XGUIEng.GetStringTableText("MenuMerchant/InUse") .. "@color:" .. ColorR .. "," .. ColorG .. "," .. ColorB .. " " .. UserName 
						GUI.AddNote( Message )
					end
				end
			end
		end
	end
	
	
		
end


function
GUIUpdate_MerchantOffers(_WidgetTable)

	local PlayerID = GUI.GetPlayerID()


	if Logic.IsMerchantOpened(SelectedTroopMerchantID, PlayerID) == false then
			GUI.ClearSelection()			
    else
    	local AmountOfOffers = Logic.GetNumerOfMerchantOffers(SelectedTroopMerchantID) 
    
    	XGUIEng.ShowAllSubWidgets(_WidgetTable[0],0)	
    	
    	for i=1,AmountOfOffers,1 
    	do
			XGUIEng.ShowWidget(_WidgetTable[i],1)
    	end
       	
    end

end


----------------------------------------------------------------------------------------------------------------
--Button Update
----------------------------------------------------------------------------------------------------------------
function GUIUpdate_TroopOffer(_SlotIndex)
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	local AmountOfOffers = Logic.GetNumerOfMerchantOffers(SelectedTroopMerchantID) 
	local LeaderType, Amount = Logic.GetMercenaryOffer(SelectedTroopMerchantID,_SlotIndex, InterfaceGlobals.CostTable)
	local SourceButton 
	if LeaderType == Entities.CU_AggressiveWolf then
		SourceButton = "Hero9_CallWolfs"
	elseif LeaderType == Entities.CU_BanditLeaderSword1 or LeaderType == Entities.CU_BanditLeaderSword2 then
		SourceButton = "Hero5_Summon"
	elseif LeaderType == Entities.CU_BanditLeaderBow1 then
		SourceButton = "Build_Archery"
	elseif LeaderType == Entities.CU_Barbarian_LeaderClub1 or LeaderType == Entities.CU_Barbarian_LeaderClub2 or LeaderType == Entities.CU_VeteranLieutenant then
		SourceButton = "Hero9_Berserk"
	elseif LeaderType == Entities.CU_BlackKnight_LeaderMace1 or LeaderType == Entities.CU_BlackKnight_LeaderMace2 then
		SourceButton = "Hero7_InflictFear"
	elseif LeaderType == Entities.CU_VeteranCaptain or LeaderType == Entities.CU_VeteranMajor then
		SourceButton = "Hero7_Madness"
	elseif LeaderType == Entities.CU_Evil_LeaderBearman1 then	
		SourceButton = "Hero12_PoisonRange"
	elseif LeaderType == Entities.CU_Evil_LeaderSkirmisher1 then
		SourceButton = "Hero12_PoisonArrows"
	elseif Logic.IsEntityTypeInCategory(LeaderType,EntityCategories.Bow) == 1 then
		SourceButton = "Buy_LeaderBow"
	elseif Logic.IsEntityTypeInCategory(LeaderType,EntityCategories.Spear)== 1 then
		SourceButton = "Buy_LeaderSpear"
	elseif Logic.IsEntityTypeInCategory(LeaderType,EntityCategories.Sword)== 1 then
		SourceButton = "Buy_LeaderSword"
	elseif Logic.IsEntityTypeInCategory(LeaderType,EntityCategories.CavalryHeavy)== 1 then
		SourceButton = "Buy_LeaderCavalryHeavy"
	elseif Logic.IsEntityTypeInCategory(LeaderType,EntityCategories.CavalryLight) == 1 then
		SourceButton = "Buy_LeaderCavalryLight"
	elseif Logic.IsEntityTypeInCategory(LeaderType,EntityCategories.Rifle) == 1 then	
		SourceButton = "Buy_LeaderRifle"		
	elseif LeaderType == Entities.PV_Cannon1 then	
		SourceButton = "Buy_Cannon1"		
	elseif LeaderType == Entities.PV_Cannon2 then	
		SourceButton = "Buy_Cannon2"		
	elseif LeaderType == Entities.PV_Cannon3 then	
		SourceButton = "Buy_Cannon3"		
	elseif LeaderType == Entities.PV_Cannon4 then	
		SourceButton = "Buy_Cannon4"		
	elseif LeaderType == Entities.PU_Serf then
		SourceButton = "Buy_Serf"
	elseif LeaderType == Entities.PU_Thief then
		SourceButton = "Buy_Thief"				
	elseif LeaderType == Entities.PU_Scout then
		SourceButton = "Buy_Scout"	
	elseif Logic.IsEntityTypeInCategory(LeaderType,EntityCategories.Hero) == 1 then
		SourceButton = "Buy_Hero"	
	else
		SourceButton = "Research_Gilds"
	end
	XGUIEng.TransferMaterials(SourceButton, CurrentWidgetID)
	if Amount == -1 then
		Amount = "00"
	end
	XGUIEng.SetText(gvGUI_WidgetID.TroopMerchantOfferAmount[_SlotIndex], "@ra " .. Amount)
end 

----------------------------------------------------------------------------------------------------------------
--Buy function
----------------------------------------------------------------------------------------------------------------

function
GUIAction_BuyMerchantOffer(_index)
	
	
	local PlayerID = GUI.GetPlayerID()
	    
	-- Maximum number of settlers attracted?
	if Logic.GetPlayerAttractionUsage( PlayerID ) >= Logic.GetPlayerAttractionLimit( PlayerID ) then
		GUI.SendPopulationLimitReachedFeedbackEvent(PlayerID)
		return
	end
	
	
	Logic.GetMercenaryOffer(SelectedTroopMerchantID,_index, InterfaceGlobals.CostTable)
	
	if InterfaceTool_HasPlayerEnoughResources_Feedback( InterfaceGlobals.CostTable ) == 1 then	
		-- Yes
		GUI.BuyMerchantOffer(SelectedTroopMerchantID, PlayerID, _index)
		GUIUpdate_TroopOffer(_index)
	end
	

end

----------------------------------------------------------------------------------------------------------------
--Tooltipfunctions
----------------------------------------------------------------------------------------------------------------
function GUITooltip_TroopOffer(_SlotIndex)
	local LeaderType, Amount = Logic.GetMercenaryOffer(SelectedTroopMerchantID,_SlotIndex, InterfaceGlobals.CostTable)
	local TooltipText = "@color:180,180,180,255 "
	local CostString = InterfaceTool_CreateCostString( InterfaceGlobals.CostTable )
	
	if XGUIEng.GetStringTableText("names/" .. Logic.GetEntityTypeName( LeaderType )) ~= nil then
		local EntityTypeName = Logic.GetEntityTypeName( LeaderType )
		if EntityTypeName == nil then
			return
		end
		local NameString = "names/" .. EntityTypeName
		TooltipText = TooltipText .. " " .. XGUIEng.GetStringTableText(NameString) .. " @cr "
		TooltipText = TooltipText .. XGUIEng.GetStringTableText("MenuMerchant/TroopOfferTooltipText")
	else
		TooltipText = TooltipText .. " ??? @cr "..XGUIEng.GetStringTableText("MenuMerchant/TroopOfferTooltipText")..""
	end
	
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomCosts, CostString)
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomText,TooltipText)
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomShortCut, "")
end

function GUIAction_MerchantReady()
	GameCallback_GUI_SelectionChanged()
end
