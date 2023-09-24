-----------------------------------------------------------------------------------------------------------
-- Hero Widget Update
-- Show hero widget by selected hero id
-----------------------------------------------------------------------------------------------------------

function HeroWidgetUpdate_ShowHeroWidget(EntityId)

	local EntityType = Logic.GetEntityType(EntityId)

	assert(Logic.IsHero(EntityId)==1)

	XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionHero,1)
	
	XGUIEng.DisableButton(gvGUI_WidgetID.ExpelSettler,1)
	
	XGUIEng.ShowAllSubWidgets(gvGUI_WidgetID.SelectionHero,0)	
	
	XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionHeroGeneric,1)
	XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionLeader,0)

	if Logic.IsEntityInCategory(EntityId,EntityCategories.Hero1) == 1 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionHero1,1)
		XGUIEng.ShowWidget("Hero1_KingsDefense", 0)

	elseif Logic.IsEntityInCategory(EntityId,EntityCategories.Hero2) == 1 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionHero2,1)
						
	elseif Logic.IsEntityInCategory(EntityId,EntityCategories.Hero3) == 1 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionHero3,1)		
		
	elseif Logic.IsEntityInCategory(EntityId,EntityCategories.Hero4) == 1 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionHero4,1)		
						
	elseif Logic.IsEntityInCategory(EntityId,EntityCategories.Hero5) == 1 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionHero5,1)		
	
	elseif Logic.IsEntityInCategory(EntityId,EntityCategories.Hero6) == 1 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionHero6,1)		
		
	elseif EntityType == Entities.CU_BlackKnight then
		XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionHero7,1)			
		
	elseif EntityType == Entities.CU_Mary_de_Mortfichet then
		XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionHero8,1)	
	
	elseif EntityType == Entities.CU_Barbarian_Hero then
		XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionHero9,1)	
	
	elseif EntityType == Entities.PU_Hero1 then
		XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionDovbar,1)	
	
	end
	
	--Update Multiselection Container
	--GUIAction_UpdateMultiSelectionContainer()

end