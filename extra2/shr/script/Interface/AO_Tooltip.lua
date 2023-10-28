--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Update Tooltips
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


function GUITooltip_AOFindHero()
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()	
	local EntityID = XGUIEng.GetBaseWidgetUserVariable(CurrentWidgetID, 0)
	
	local CostString = " "
	local ShortCutToolTip = " "
	local TooltipString = " "
	
	--Stuff for 7th hero button
	if gvGUI.BonusHeroId > 0 and IsExisting(gvGUI.BonusHeroId) and CurrentWidgetID == XGUIEng.GetWidgetID("FindHero7") then
		EntityID = gvGUI.BonusHeroId
	end
	
	if EntityID  ~= 0 then
		if Logic.IsEntityInCategory(EntityID,EntityCategories.Hero10) == 1 then	
			TooltipString = "AOMenuTop/Find_hero10"
		elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero11) == 1 then
			TooltipString = "AOMenuTop/Find_hero11"		
		elseif Logic.GetEntityType( EntityID )	== Entities.CU_Evil_Queen then
			TooltipString = "AOMenuTop/Find_hero12"		
		else
			GUITooltip_FindHero()
			return
		end
	end
	
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomCosts, CostString)
	XGUIEng.SetTextKeyName(gvGUI_WidgetID.TooltipBottomText, TooltipString)
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomShortCut, ShortCutToolTip)
end