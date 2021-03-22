--------------------------------------------------------------------------------
-- Multi selection
--------------------------------------------------------------------------------
function
GUIAction_UpdateMultiSelectionContainer()
	
	XGUIEng.ShowAllSubWidgets(gvGUI_WidgetID.MultiSelectionContainer,0)	
	
	local SelectedEntities = { GUI.GetSelectedEntities() }
	
	for i=1,table.getn(SelectedEntities),1
	do
		if i == 13 then
			break
		end
		XGUIEng.ShowWidget(gvGUI_WidgetID.MultiSelectionButtons[i],1)
		XGUIEng.SetBaseWidgetUserVariable(gvGUI_WidgetID.MultiSelectionButtons[i], 0,SelectedEntities[i])
	end
end


--------------------------------------------------------------------------------
-- Transfer Textures to buttons
function
GUIUpdate_MultiSelectionButton()
	
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	local MotherContainer= XGUIEng.GetWidgetsMotherID(CurrentWidgetID)	
	local EntityID = XGUIEng.GetBaseWidgetUserVariable(MotherContainer, 0)			
	local SelectedHeroID = HeroSelection_GetCurrentSelectedHeroID()
	
	local SourceButton
	
	if Logic.GetEntityType( EntityID )	== Entities.PU_Hero1 then
		SourceButton = "MultiSelectionSource_Hero0"
	elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero1) == 1 then	
		SourceButton = "MultiSelectionSource_Hero1"
	elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero2) == 1 then
		SourceButton = "MultiSelectionSource_Hero2"
	elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero3) == 1 then
		SourceButton = "MultiSelectionSource_Hero3"
	elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero4) == 1 then
		SourceButton = "MultiSelectionSource_Hero4"
	elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero5) == 1 then
		SourceButton = "MultiSelectionSource_Hero5"
	elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero6) == 1 then
		SourceButton = "MultiSelectionSource_Hero6"
	elseif Logic.GetEntityType( EntityID )	== Entities.CU_BlackKnight then
		SourceButton = "MultiSelectionSource_Hero7"
	elseif Logic.GetEntityType( EntityID )	== Entities.CU_Mary_de_Mortfichet then
		SourceButton = "MultiSelectionSource_Hero8"
	elseif Logic.GetEntityType( EntityID )	== Entities.CU_Barbarian_Hero then
		SourceButton = "MultiSelectionSource_Hero9"
	elseif Logic.GetEntityType( EntityID ) == Entities.PU_Serf then
		SourceButton = "MultiSelectionSource_Serf"	
	elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Sword) == 1 then
		SourceButton = "MultiSelectionSource_Sword"
	elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Bow) == 1 then
		SourceButton = "MultiSelectionSource_Bow"
	elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Spear) == 1 then
		SourceButton = "MultiSelectionSource_Spear"
	elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Cannon) == 1 then
		SourceButton = "MultiSelectionSource_Cannon"
	elseif Logic.IsEntityInCategory(EntityID,EntityCategories.CavalryHeavy) == 1 then
		SourceButton = "MultiSelectionSource_HeavyCav"
	elseif Logic.IsEntityInCategory(EntityID,EntityCategories.CavalryLight) == 1 then
		SourceButton = "MultiSelectionSource_LightCav"	
	
	
	--AddOn
	elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Rifle) == 1 
	and Logic.IsEntityInCategory(EntityID,EntityCategories.Hero10) == 0 then
		SourceButton = "MultiSelectionSource_Rifle"	
	
	elseif Logic.GetEntityType( EntityID )	== Entities.PU_Scout then
		SourceButton = "MultiSelectionSource_Scout"			
	elseif Logic.GetEntityType( EntityID )	== Entities.PU_Thief then
		SourceButton = "MultiSelectionSource_Thief"		
	elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero10) == 1 then
		SourceButton = "MultiSelectionSource_Hero10"
	elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero11) == 1 then
		SourceButton = "MultiSelectionSource_Hero11"
	elseif Logic.GetEntityType( EntityID )	== Entities.CU_Evil_Queen then
		SourceButton = "MultiSelectionSource_Hero12"
		
		
			
	else
		SourceButton = "MultiSelectionSource_Sword"
	end
	
	
	XGUIEng.TransferMaterials(SourceButton, CurrentWidgetID)
	
	-- set color when hero is selected
	if SelectedHeroID == EntityID then		
		for i=0, 4,1
		do
			XGUIEng.SetMaterialColor(SourceButton,i, 255,177,0,255)
		end		
	else	
		for i=0, 4,1
		do
			XGUIEng.SetMaterialColor(SourceButton,i, 255,255,255,255)
		end	
	end
end


--------------------------------------------------------------------------------
-- Select unit
function
GUIAction_MultiSelectionSelectUnit()
	
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	local MotherContainer= XGUIEng.GetWidgetsMotherID(CurrentWidgetID)	
	local EntityID = XGUIEng.GetBaseWidgetUserVariable(MotherContainer, 0)	
	
	if EntityID == nil then
		return
	end
	
	if XGUIEng.IsModifierPressed( Keys.ModifierControl ) == 1 then
		local IDPosX, IDPosY, IDPosZ = Logic.EntityGetPos( EntityID )
		Camera.ScrollSetLookAt(IDPosX, IDPosY)	
	
			
	elseif  XGUIEng.IsModifierPressed( Keys.ModifierShift )== 1 then
		GUI.DeselectEntity(EntityID)			
	else	
		local IDPosX, IDPosY, IDPosZ = Logic.EntityGetPos( EntityID )
		Camera.ScrollSetLookAt(IDPosX, IDPosY)	
		GUI.SetSelectedEntity( EntityID )
	end

end


--------------------------------------------------------------------------------
-- Update Heatlthbar
function
GUIUpate_MultiSelectionHealthBar()
	
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	local MotherContainer= XGUIEng.GetWidgetsMotherID(CurrentWidgetID)	
	local LeaderID = XGUIEng.GetBaseWidgetUserVariable(MotherContainer, 0)	
	
	local PlayerID = GUI.GetPlayerID()
	local ColorR, ColorG, ColorB = GUI.GetPlayerColor( PlayerID )
	
	if LeaderID == nil then
		return
	end
	
	local CurrentHealth = Logic.GetEntityHealth( LeaderID )
	local Maxhealth = Logic.GetEntityMaxHealth( LeaderID )
	
	if Logic.IsEntityInCategory(LeaderID,EntityCategories.Leader) == 1 then
		
		local AmountOfSoldiers = Logic.LeaderGetNumberOfSoldiers( LeaderID )
		local MaxAmountOfSoldiers = Logic.LeaderGetMaxNumberOfSoldiers( LeaderID )
				
		CurrentHealth = CurrentHealth + (AmountOfSoldiers * 200)
		Maxhealth = Maxhealth + (MaxAmountOfSoldiers * 200)
		
	end
	
	XGUIEng.SetMaterialColor(CurrentWidgetID,0,ColorR, ColorG, ColorB,255)
	
	XGUIEng.SetProgressBarValues(CurrentWidgetID,CurrentHealth, Maxhealth)

end
