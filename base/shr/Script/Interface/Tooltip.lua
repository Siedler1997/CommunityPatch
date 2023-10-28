--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Update Tooltips
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--------------------------------------------------------------------------------
-- Display the Costs and the Text for the building buttons
--------------------------------------------------------------------------------

function
GUITooltip_ConstructBuilding(_CategoryType, _NormalTooltip, _DiabledTooltip,_TechnologyType, _ShortCut)

	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()

	local PlayerID = GUI.GetPlayerID()	
	Logic.FillBuildingCostsTable( Logic.GetBuildingTypeByUpgradeCategory(_CategoryType, PlayerID ), InterfaceGlobals.CostTable )
	local CostString = InterfaceTool_CreateCostString( InterfaceGlobals.CostTable )
	local TooltipText = " "
	local ShortCutToolTip = " "
	local ShowCosts = 1
	
	if XGUIEng.IsButtonDisabled(CurrentWidgetID) == 1 then		
		TooltipText =  _DiabledTooltip		
	else
		TooltipText = _NormalTooltip
		if _ShortCut ~= nil then
			ShortCutToolTip = XGUIEng.GetStringTableText("MenuGeneric/Key_name") .. ": [" .. XGUIEng.GetStringTableText(_ShortCut) .. "]"
		end
	end
	
	if _TechnologyType ~= nil then
		local TechState = Logic.GetTechnologyState(PlayerID, _TechnologyType)			
		if TechState == 0 then
			TooltipText =  "MenuGeneric/BuildingNotAvailable"
			ShowCosts = 0
		end
	end
	
	
	if ShowCosts == 0 then
		CostString = " "
	end
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomCosts, CostString)
	XGUIEng.SetTextKeyName(gvGUI_WidgetID.TooltipBottomText, TooltipText)		
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomShortCut, ShortCutToolTip)
	
end


--------------------------------------------------------------------------------
-- Display the Costs and the Text for the upgarde buttons
--------------------------------------------------------------------------------

function
GUITooltip_UpgradeBuilding(_BuildingType, _DisabledTooltip, _NormalTooltip, _TechnologyType)
	
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local PlayerID = GUI.GetPlayerID()	
	Logic.FillBuildingUpgradeCostsTable( _BuildingType, InterfaceGlobals.CostTable )
	local CostString = InterfaceTool_CreateCostString( InterfaceGlobals.CostTable )
	local TooltipText = " "
	local ShowCosts = 1
	
	local ShortCutToolTip = XGUIEng.GetStringTableText("MenuGeneric/Key_name") .. ": [" .. XGUIEng.GetStringTableText("KeyBindings/UpgradeBuilding") .. "]"
	
		
	if XGUIEng.IsButtonDisabled(CurrentWidgetID) == 1 then		
		TooltipText = _DisabledTooltip				
	else
		TooltipText = _NormalTooltip
	end
	
	if _TechnologyType ~= nil then
		local TechState = Logic.GetTechnologyState(PlayerID, _TechnologyType)			
		if TechState == 0 then
			TooltipText =  "MenuGeneric/UpgradeNotAvailable"
			ShowCosts = 0
		end
	end
	
	if ShowCosts == 0 then		
		CostString = " "
	end
	
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomCosts, CostString)
	
	XGUIEng.SetTextKeyName(gvGUI_WidgetID.TooltipBottomText,TooltipText)
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomShortCut, ShortCutToolTip)
	
end


--------------------------------------------------------------------------------
-- Display the Costs and the Text for the technology buttons with only one additional parameter for the textkey
--------------------------------------------------------------------------------
function GUITooltip_ResearchTechnologies(_TechnologyType,_Tooltip, _ShortCut)
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local PlayerID = GUI.GetPlayerID()
	local TechState = Logic.GetTechnologyState(PlayerID, _TechnologyType)	
	Logic.FillTechnologyCostsTable(_TechnologyType, InterfaceGlobals.CostTable)	
	local CostString = InterfaceTool_CreateCostString( InterfaceGlobals.CostTable )		
	local TooltipText = " "
	local ShortCutToolTip = " "
	local ShowCosts = 1
	
	if TechState == 0 then
		TooltipText =  XGUIEng.GetStringTableText("MenuGeneric/TechnologyNotAvailable")
		ShowCosts = 0
	elseif TechState == 1 or  TechState == 5 then		
	--if XGUIEng.IsButtonDisabled(CurrentWidgetID) == 1 then		
		TooltipText = XGUIEng.GetStringTableText(_Tooltip .. "_disabled")
		ShowCosts = 1
	elseif TechState == 2 or TechState == 3 then 
	--elseif XGUIEng.IsButtonDisabled(CurrentWidgetID) == 0 then		
		TooltipText = XGUIEng.GetStringTableText(_Tooltip .. "_normal")
		if TechState == 3 then
			TooltipText = TooltipText .. " @cr @cr " .. XGUIEng.GetStringTableText("MenuGeneric/InResearch")
		else
			if _ShortCut ~= nil then
				ShortCutToolTip = XGUIEng.GetStringTableText("MenuGeneric/Key_name") .. ": [" .. XGUIEng.GetStringTableText(_ShortCut) .. "]"
			end
		end
	
	--overwright Tooltip if technology is researched
	elseif TechState == 4 then		
		TooltipText = XGUIEng.GetStringTableText(_Tooltip .. "_researched")
		ShowCosts = 1
	end
	
	if ShowCosts == 0 then
		CostString = " "
	end
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomCosts, CostString)
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomText, TooltipText)
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomShortCut, ShortCutToolTip)
	
end
--------------------------------------------------------------------------------
-- Display the Costs and the Text for the Buy Serf Button
--------------------------------------------------------------------------------

function GUITooltip_BuySerf()
	local TechState = Logic.GetTechnologyState(GUI.GetPlayerID(), Technologies.MU_Serf)	
	local CostString = ""
	local TooltipText = ""
	local ShortCutToolTip = ""

	if TechState == 0 then
		TooltipText = XGUIEng.GetStringTableText("MenuGeneric/UnitNotAvailable")
	else
		Logic.FillSerfCostsTable(InterfaceGlobals.CostTable)
		CostString = InterfaceTool_CreateCostString( InterfaceGlobals.CostTable )
		ShortCutToolTip = XGUIEng.GetStringTableText("MenuGeneric/Key_name") .. ": [" .. XGUIEng.GetStringTableText("KeyBindings/BuyUnits1") .. "]"
		TooltipText = XGUIEng.GetStringTableText("MenuHeadquarter/BuySerf")
	end
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomText, TooltipText)
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomShortCut, ShortCutToolTip)
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomCosts, CostString)
end

--------------------------------------------------------------------------------
-- Display the Costs and the Text for Buttons that buy military units
--------------------------------------------------------------------------------

function
GUITooltip_BuyMilitaryUnit(_UpgradeCategory,_NormalTooltip,_DisabledTooltip, _TechnologyType,_ShortCut)
	
	
	local PlayerID = GUI.GetPlayerID()		
	
	local SettlerTypeID = Logic.GetSettlerTypeByUpgradeCategory(_UpgradeCategory, PlayerID )
	
	Logic.FillLeaderCostsTable(PlayerID, _UpgradeCategory, InterfaceGlobals.CostTable)
	local CostString = InterfaceTool_CreateCostString( InterfaceGlobals.CostTable )
	local TooltipText = _NormalTooltip
	local NeededPlaces = Logic.GetAttractionLimitValueByEntityType(SettlerTypeID)
	local ShortCutToolTip = " "
	
	CostString = CostString .. XGUIEng.GetStringTableText("InGameMessages/GUI_NamePlaces") .. ": " .. NeededPlaces
	
	
	if _TechnologyType ~= nil then
		local TechState = Logic.GetTechnologyState(PlayerID, _TechnologyType)			
		if TechState == 0 then
			TooltipText =  "MenuGeneric/UnitNotAvailable"
			CostString = " "
		elseif TechState == 1 then
			TooltipText = _DisabledTooltip
		end
	end
	
	if _ShortCut ~= nil then
		ShortCutToolTip = XGUIEng.GetStringTableText("MenuGeneric/Key_name") .. ": [" .. XGUIEng.GetStringTableText(_ShortCut) .. "]"
	end
	
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomCosts, CostString)
	
	XGUIEng.SetTextKeyName(gvGUI_WidgetID.TooltipBottomText, TooltipText)
	
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomShortCut, ShortCutToolTip)
	
end

--------------------------------------------------------------------------------
-- Display Text and costs for a buy soldiers button
--------------------------------------------------------------------------------

function
GUITooltip_BuySoldier(_NormalTooltip, _DisabledTooltip,_ShortCut)
	
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local LeaderID = GUI.GetSelectedEntity()
	local PlayerID = GUI.GetPlayerID()
		
	
	local UpgradeCategory = Logic.LeaderGetSoldierUpgradeCategory( LeaderID )
	Logic.FillSoldierCostsTable(PlayerID, UpgradeCategory, InterfaceGlobals.CostTable)
	local CostString = InterfaceTool_CreateCostString( InterfaceGlobals.CostTable )
	local ShortCutToolTip = " "
	
	if XGUIEng.IsButtonDisabled(CurrentWidgetID) == 1 then		
		TooltipText =  _DisabledTooltip
	elseif XGUIEng.IsButtonDisabled(CurrentWidgetID) == 0 then		
		TooltipText = _NormalTooltip
	end
	
	if _ShortCut ~= nil then
		ShortCutToolTip = XGUIEng.GetStringTableText("MenuGeneric/Key_name") .. ": [" .. XGUIEng.GetStringTableText(_ShortCut) .. "]"
	end

	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomCosts, CostString)
	
	XGUIEng.SetTextKeyName(gvGUI_WidgetID.TooltipBottomText, TooltipText)	
	
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomShortCut, ShortCutToolTip)
	
end

--------------------------------------------------------------------------------
-- Display the Text for the Bless buttons
--------------------------------------------------------------------------------
function GUITooltip_BlessSettlers(_DisabledTooltip, _NormalTooltip, _NotUsed, _ShortCut, _Technology)
	local PID = GUI.GetPlayerID()
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	local TooltipText = ""
	local ShortCutToolTip = ""
	local CostString = ""
	local blessCategory = 0

	if _Technology == Technologies.T_BlessSettlers1 then
		blessCategory = BlessCategories.Construction
	elseif _Technology == Technologies.T_BlessSettlers2 then
		blessCategory = BlessCategories.Research
	elseif _Technology == Technologies.T_BlessSettlers3 then
		blessCategory = BlessCategories.Weapons
	elseif _Technology == Technologies.T_BlessSettlers4 then
		blessCategory = BlessCategories.Financial
	else
		blessCategory = BlessCategories.Canonisation
	end

	local techstate = Logic.GetTechnologyState(PID, _Technology)

	if techstate == 0 then
		TooltipText = TooltipText .. XGUIEng.GetStringTableText("MenuGeneric/TechnologyNotAvailable")
	else
		if _ShortCut ~= nil then
			ShortCutToolTip = ShortCutToolTip .. XGUIEng.GetStringTableText("MenuGeneric/Key_name") .. ": [" .. XGUIEng.GetStringTableText(_ShortCut) .. "]"
		end	

		if XGUIEng.IsButtonDisabled(CurrentWidgetID) == 0 then
			TooltipText = TooltipText .. XGUIEng.GetStringTableText(_NormalTooltip)
		else
			TooltipText = TooltipText .. XGUIEng.GetStringTableText(_DisabledTooltip)
		end
		CostString = CostString .. CreateCostString{Gold=InterfaceTool_GetBlessingCosts(PID, blessCategory)};			
	end
	
	--Message("CostString: " .. CostString .. "   TooltipText: " .. TooltipText .. "   ShortCutToolTip: " .. ShortCutToolTip)

	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomCosts, CostString)
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomText, TooltipText)
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomShortCut, ShortCutToolTip)
end

--SetPlayerColorMapping = <Function, defined in Game Engine at 0x4698E3>
--------------------------------------------------------------------------------
-- Display Text for a normal button
--------------------------------------------------------------------------------
function GUITooltip_NormalButton(_TooltipString, _ShortCut)
	local CostString = " "
	local ShortCutToolTip = " "
	local TextString = ""

	if _ShortCut ~= nil then
		ShortCutToolTip = XGUIEng.GetStringTableText("MenuGeneric/Key_name") .. ": [" .. XGUIEng.GetStringTableText(_ShortCut) .. "]"
	end

	if _TooltipString == "MenuResources/Motivation" then
		if UserTool_GetLocalPlayerSex() == 1 then
			TextString = string.format(XGUIEng.GetStringTableText(_TooltipString), XGUIEng.GetStringTableText("MenuGeneric/Female_Salut_Generic"))
		else
			TextString = string.format(XGUIEng.GetStringTableText(_TooltipString), XGUIEng.GetStringTableText("MenuGeneric/Male_Salut_Generic"))
		end
	else
		TextString = XGUIEng.GetStringTableText(_TooltipString)
	end

	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomCosts, CostString)
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomShortCut, ShortCutToolTip)
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomText, TextString)
end

--------------------------------------------------------------------------------
-- Display generic tooltip (AnSu: put Normal Button and this function together)
--------------------------------------------------------------------------------
function GUITooltip_Generic(_TooltipString)
	GUITooltip_NormalButton(_TooltipString, _ShortCut)
	if string.find(_TooltipString, "Find_") and not string.find(_TooltipString, "_hero") then
		GUITooltip_FindUnits(_TooltipString)
	end
end

--------------------------------------------------------------------------------
-- Additional tooltips for generic FindButtons (Unit amounts)
--------------------------------------------------------------------------------
function GUITooltip_FindUnits(_menu)
	local pid = GUI.GetPlayerID()
		
	local tempamount = 0
	if _menu == "MenuTop/Find_sword" then
		local SwordAmount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_LeaderSword1) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_LeaderSword2)
						+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_LeaderSword3) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_LeaderSword4)
		tempamount = tempamount + SwordAmount
	elseif _menu == "MenuTop/Find_spear" then
		local SpearAmount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_LeaderPoleArm1) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_LeaderPoleArm2)
						+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_LeaderPoleArm3) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_LeaderPoleArm4)
		tempamount = tempamount + SpearAmount
	elseif _menu == "MenuTop/Find_bow" then
		local BowAmount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_LeaderBow1) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_LeaderBow2)
						+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_LeaderBow3) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_LeaderBow4)
		tempamount = tempamount + BowAmount
	elseif _menu == "MenuTop/Find_lightcavalry" then
		local LCavAmount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_LeaderCavalry1) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_LeaderCavalry2)
		tempamount = tempamount + LCavAmount
	elseif _menu == "MenuTop/Find_heavycavalry" then
		local HCavAmount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_LeaderHeavyCavalry1) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_LeaderHeavyCavalry2)
		tempamount = tempamount + HCavAmount
	elseif _menu == "AOMenuTop/Find_rifle" then
		local RifAmount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_LeaderRifle1) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_LeaderRifle2)
		tempamount = tempamount + RifAmount
	elseif _menu == "MenuTop/Find_cannon" then
		local CanAmount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PV_Cannon1) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PV_Cannon2)
						+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PV_Cannon3) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PV_Cannon4)
						+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PV_Cannon3a) + Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PV_Cannon4a)
		tempamount = tempamount + CanAmount
	elseif _menu == "AOMenuTop/Find_scout" then
		tempamount = tempamount + Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_Scout)
	elseif _menu == "AOMenuTop/Find_Thief" then
		tempamount = tempamount + Logic.GetNumberOfEntitiesOfTypeOfPlayer(pid,Entities.PU_Thief)
	end
	local menutext = XGUIEng.GetStringTableText(_menu)
	if tempamount > 0 then
		XGUIEng.AddRawTextAtEnd("TooltipBottomText", " @cr @cr "..XGUIEng.GetStringTableText("MenuGeneric/AmountGeneric")..": "..tempamount)
	end
end

--------------------------------------------------------------------------------
-- Tooltip Levy Taxes
--------------------------------------------------------------------------------

function
GUITooltip_LevyTaxes()
	
	local PlayerID = GUI.GetPlayerID()
	local TaxAmount = Logic.GetPlayerTaxIncome( PlayerID )
	local CostString = "Taxes: " .. TaxAmount
	
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomCosts, CostString)
	XGUIEng.SetTextKeyName(gvGUI_WidgetID.TooltipBottomText, "MenuHeadquarter/levytaxes")
	
end

--------------------------------------------------------------------------------
-- Display payday tooltip
--------------------------------------------------------------------------------

function GUITooltip_Payday()
	local TooltipString = ""
	local PlayerID = GUI.GetPlayerID()
	local PaydayTimeLeft = GetClockTimeString(math.ceil(Logic.GetPlayerPaydayTimeLeft(PlayerID)/1000))
	local PaydayFrequency = Logic.GetPlayerPaydayFrequency(PlayerID)	
	local PaydayCosts = Logic.GetPlayerPaydayCost(PlayerID)
	
	local TooltipString= " @color:200,200,200,255 " .. XGUIEng.GetStringTableText("IngameMenu/NameTaxday") .. " @cr @color:255,255,255,255 " .. PaydayTimeLeft .. " " .. XGUIEng.GetStringTableText("IngameMenu/TimeUntilTaxday")
		
	XGUIEng.SetText("TooltipTopText", TooltipString)

	--Displays next weather state and when it arrives
	local WeatherTowerAmount, WeatherTowerID = Logic.GetPlayerEntities(GUI.GetPlayerID(),Entities.PB_WeatherTower1,1)
	if WeatherTowerAmount >= 1 and Logic.IsConstructionComplete(WeatherTowerID) == 1 then
		local NextWeatherState = Logic.GetNextWeatherState()
		local SecondsLeftToNextWeatherPeriod = math.floor(Logic.GetTimeToNextWeatherPeriod())
		local CurrentWeatherState = Logic.GetWeatherState()
		local CurrentWeatherString = ""
		local NextWeatherString = ""
		if CurrentWeatherState == 1 then CurrentWeatherString = CurrentWeatherString .. XGUIEng.GetStringTableText("MenuTop/payday_weather_summer")
		elseif CurrentWeatherState == 2 then CurrentWeatherString = CurrentWeatherString .. XGUIEng.GetStringTableText("MenuTop/payday_weather_rain")
		elseif CurrentWeatherState == 3 then CurrentWeatherString = CurrentWeatherString .. XGUIEng.GetStringTableText("MenuTop/payday_weather_winter") end
		if NextWeatherState == 1 then NextWeatherString = NextWeatherString .. XGUIEng.GetStringTableText("MenuTop/payday_weather_summer")
		elseif NextWeatherState == 2 then NextWeatherString = NextWeatherString .. XGUIEng.GetStringTableText("MenuTop/payday_weather_rain")
		elseif NextWeatherState == 3 then NextWeatherString = NextWeatherString .. XGUIEng.GetStringTableText("MenuTop/payday_weather_winter") end
		XGUIEng.AddRawTextAtEnd("TooltipTopText", " @cr @cr " .. XGUIEng.GetStringTableText("MenuTop/payday_weather") .. ": "..CurrentWeatherString)
		if NextWeatherState ~= CurrentWeatherState and Logic.IsWeatherChangeActive() ~= true and SecondsLeftToNextWeatherPeriod <= 3600 then
			XGUIEng.AddRawTextAtEnd("TooltipTopText", " @cr "..NextWeatherString.." " .. XGUIEng.GetStringTableText("MenuTop/payday_weather_arrive") .. " " .. GetClockTimeString(SecondsLeftToNextWeatherPeriod))
		end
	end
end 

function
GUITooltip_WokerButtons(_tooltip)

	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()

	local CostString = " "
	local ShortCutToolTip = " "
	local TooltipString = _tooltip
	
	if XGUIEng.IsButtonDisabled( CurrentWidgetID  ) == 1 then
		TooltipString = TooltipString .. "_notavailable"
	elseif XGUIEng.IsButtonHighLighted( CurrentWidgetID  ) == 1 then
		TooltipString = TooltipString .. "_upgrading"
	else
		TooltipString = TooltipString .. "_normal"
	end
	
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomCosts, CostString)
	XGUIEng.SetTextKeyName(gvGUI_WidgetID.TooltipBottomText, TooltipString)
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomShortCut, ShortCutToolTip)
end


function GUITooltip_FindHero()
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
		if Logic.GetEntityType( EntityID )	== Entities.PU_Hero1 then
			TooltipString = "MenuTop/Find_hero0"
		elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero1) == 1 then	
			TooltipString = "MenuTop/Find_hero1"
		elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero2) == 1 then
			TooltipString = "MenuTop/Find_hero2"
		elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero3) == 1 then
			TooltipString = "MenuTop/Find_hero3"
		elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero4) == 1 then
			TooltipString = "MenuTop/Find_hero4"
		elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero5) == 1 then
			TooltipString = "MenuTop/Find_hero5"
		elseif Logic.IsEntityInCategory(EntityID,EntityCategories.Hero6) == 1 then
			TooltipString = "MenuTop/Find_hero6"
		elseif Logic.GetEntityType( EntityID )	== Entities.CU_BlackKnight then
			TooltipString = "MenuTop/Find_hero7"
		elseif Logic.GetEntityType( EntityID )	== Entities.CU_Mary_de_Mortfichet then
			TooltipString = "MenuTop/Find_hero8"
		elseif Logic.GetEntityType( EntityID )	== Entities.CU_Barbarian_Hero then
			TooltipString = "MenuTop/Find_hero9"	
		end
	end
	
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomCosts, CostString)
	XGUIEng.SetTextKeyName(gvGUI_WidgetID.TooltipBottomText, TooltipString)
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomShortCut, ShortCutToolTip)
end

--------------------------------------------------------------------------------
-- Display the Text for the Formation buttons
--------------------------------------------------------------------------------
function GUITooltip_Formations(_NormalTooltip, _DisabledTooltip)
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	if XGUIEng.IsButtonDisabled(CurrentWidgetID) == 1 then		
		TooltipText =  _DisabledTooltip
	elseif XGUIEng.IsButtonDisabled(CurrentWidgetID) == 0 then		
		TooltipText = _NormalTooltip
	end
	
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomCosts, "")
	XGUIEng.SetTextKeyName(gvGUI_WidgetID.TooltipBottomText, TooltipText)
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomShortCut, "")
end

--------------------------------------------------------------------------------
-- Display Text for buttons that are only usable in singleplayer-mode
--------------------------------------------------------------------------------
function GUITooltip_SinglePlayerButton(_NormalTooltip, _ShortCut)
	local ShortCutToolTip = " "
	local TooltipText = ""

	if XNetwork.Manager_IsGameRunning() == 1 then
		TooltipText = TooltipText .. "MenuGeneric/FeatureNotAvailable"
	else
		ShortCutToolTip = XGUIEng.GetStringTableText("MenuGeneric/Key_name") .. ": [" .. XGUIEng.GetStringTableText(_ShortCut) .. "]"
		TooltipText = TooltipText .. _NormalTooltip
	end
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomShortCut, ShortCutToolTip)
	XGUIEng.SetTextKeyName(gvGUI_WidgetID.TooltipBottomText, TooltipText)
	XGUIEng.SetText(gvGUI_WidgetID.TooltipBottomCosts, "")
end