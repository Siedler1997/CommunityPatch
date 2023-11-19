--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Widget updates
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--------------------------------------------------------------------------------
-- Update resource amount widgets
--------------------------------------------------------------------------------

function
GUIUpdate_ResourceAmount( _ResourceType, _RefinedFlag )

	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local PlayerID = GUI.GetPlayerID()
	
	local Amount = Logic.GetPlayersGlobalResource( PlayerID, _ResourceType )	
	
	local RawResourceType = Logic.GetRawResourceType( _ResourceType )
	local RawResourceAmount = Logic.GetPlayersGlobalResource( PlayerID, RawResourceType )
	
	local String = " "
	
	if _RefinedFlag == 0 then
		Amount = Amount + RawResourceAmount
		XGUIEng.SetTextByValue( CurrentWidgetID, Amount, 1 )
	else		
		--local procent = math.floor((Amount/(Amount + RawResourceAmount))*100)
		XGUIEng.SetTextByValue( CurrentWidgetID, Amount, 1 )		
	end
		
end


--------------------------------------------------------------------------------
-- Update the current and maxium polulation limit
--------------------------------------------------------------------------------

function
GUIUpdate_Population()
	
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local PlayerID = GUI.GetPlayerID()
	local SlotsUsed = Logic.GetPlayerAttractionUsage( PlayerID ) 
	local SlotLimit = Logic.GetPlayerAttractionLimit( PlayerID ) 
    
    local String = ""
    
    if SlotsUsed >= SlotLimit 
    and SlotsUsed ~= 0 then
    	String = "@color:255,120,120,255 "
    else
    	String = "@color:114,134,124,255 "
    end
    
    String = String .. "@ra " .. SlotsUsed .. "/" .. SlotLimit
    
    XGUIEng.SetText( CurrentWidgetID, String )
    	
end

--------------------------------------------------------------------------------
-- Update the amount of used and the amount of available residence places
--------------------------------------------------------------------------------

function
GUIUpdate_ResidencePlaces()

	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()

	local PlayerID = GUI.GetPlayerID()
	
	local NumberOfWorkersWithoutSleepPlace = Logic.GetNumberOfWorkerWithoutSleepPlace( PlayerID )
	
    
    XGUIEng.SetTextByValue( CurrentWidgetID, NumberOfWorkersWithoutSleepPlace, 1 )		
	
	--local AmountOfNeededPlaces = Logic.GetNumberOfAttractedWorker( PlayerID ) 
	--local SleepPlaceLimit = Logic.GetPlayerSleepPlacesLimit( PlayerID ) 
	--
	--local AmountOfWorkersWithoutResidence = AmountOfNeededPlaces - SleepPlaceLimit
	--
    --if AmountOfWorkersWithoutResidence < 0 then
    --	AmountOfWorkersWithoutResidence = 0
    --end
    --
    --XGUIEng.SetTextByValue( CurrentWidgetID, AmountOfWorkersWithoutResidence, 1 )		
    
	--local String = ""
    
    --if AmountOfNeededPlaces >= SleepPlaceLimit 
    --and AmountOfNeededPlaces ~= 0 then
    --	String = "@color:255,120,120,255 "
    --else
    --	String = "@color:114,134,124,255 "
    --end
    
    --String = String .. "@ra " .. AmountOfNeededPlaces .. "/" .. SleepPlaceLimit
    
    --XGUIEng.SetText( CurrentWidgetID, String )    
    
end

--------------------------------------------------------------------------------
-- Update the amount of used and the amount of available farm places
--------------------------------------------------------------------------------

function
GUIUpdate_FarmPlaces()
	
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local PlayerID = GUI.GetPlayerID()		
	local NumberOfWorkerWithoutEatPlace = Logic.GetNumberOfWorkerWithoutEatPlace( PlayerID )
    
    XGUIEng.SetTextByValue( CurrentWidgetID, NumberOfWorkerWithoutEatPlace, 1 )		
    
    
    --local AmountOfNeededPlaces = Logic.GetNumberOfAttractedWorker( PlayerID ) 
	--local EatPlaceLimit = Logic.GetPlayerEatPlacesLimit( PlayerID )
    --local AmountOfWorkersWithoutFarm = AmountOfNeededPlaces - EatPlaceLimit
    --
    --if AmountOfWorkersWithoutFarm < 0 then
    --	AmountOfWorkersWithoutFarm = 0
    --end
    
    --local String = ""
    --if AmountOfNeededPlaces >= EatPlaceLimit 
    --and AmountOfNeededPlaces ~= 0 then
    --	String = "@color:255,120,120,255 "
    --else
    --	String = "@color:114,134,124,255 "
    --end
    
    --String = String ..  "@ra " .. AmountOfNeededPlaces .. "/" .. EatPlaceLimit    
	
	--XGUIEng.SetText( CurrentWidgetID, String )
    
end


--------------------------------------------------------------------------------
-- Update the average motivation
--------------------------------------------------------------------------------
function
GUIUpdate_AverageMotivation()
	
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local PlayerID = GUI.GetPlayerID()
	local AverageMotivation = Logic.GetAverageMotivation(PlayerID)
	
	
	local TexturePathMotivationIcon = "Data\\Graphics\\Textures\\GUI\\i_res_motiv_good.png"
	
	if 		AverageMotivation > gvGUI.MotivationThresholds.Happy 
		then
		 		TexturePathMotivationIcon = "Data\\Graphics\\Textures\\GUI\\i_res_motiv_fine.png"
		 		
	elseif 	AverageMotivation > gvGUI.MotivationThresholds.Sad	 
		and AverageMotivation < gvGUI.MotivationThresholds.Happy
		then
			TexturePathMotivationIcon = "Data\\Graphics\\Textures\\GUI\\i_res_motiv_good.png"
			
	elseif 	AverageMotivation > gvGUI.MotivationThresholds.Angry 
		and AverageMotivation < gvGUI.MotivationThresholds.Sad
		then
			TexturePathMotivationIcon = "Data\\Graphics\\Textures\\GUI\\i_res_motiv_bad.png"
			
	elseif 	AverageMotivation > gvGUI.MotivationThresholds.Leave
		and AverageMotivation < gvGUI.MotivationThresholds.Angry 
		then	
			TexturePathMotivationIcon = "Data\\Graphics\\Textures\\GUI\\i_res_motiv_worse.png"

	end
	
	
	XGUIEng.SetMaterialTexture(gvGUI_WidgetID.IconMotivation,1,TexturePathMotivationIcon)
	
	
	AverageMotivation = math.floor(AverageMotivation * 100)
	
	local string = AverageMotivation .. "%"
	
	XGUIEng.SetText( CurrentWidgetID, string )
	
end

--------------------------------------------------------------------------------
-- Update the amount of taxes the player becomes
--------------------------------------------------------------------------------

function
GUIUpdate_SumOfTaxes()
	
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local PlayerID = GUI.GetPlayerID()
	local PaydayCosts = Logic.GetPlayerPaydayCost(PlayerID)		
	XGUIEng.SetTextByValue( CurrentWidgetID, PaydayCosts, 1 )
	
end

--------------------------------------------------------------------------------
-- Update the amount of idle serfs
--------------------------------------------------------------------------------

function
GUIUpdate_IdelSerfAmount()

	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local PlayerID = GUI.GetPlayerID()
	local IdleSerfAmount = Logic.GetNumberOfIdleSerfs(PlayerID) 
	local SerfAmount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(PlayerID,Entities.PU_Serf)
	local string = "@center " .. IdleSerfAmount .. "/" .. SerfAmount
	
	XGUIEng.SetText(CurrentWidgetID  , string )
	
end

--------------------------------------------------------------------------------
-- Update Name
--------------------------------------------------------------------------------

function
GUIUpdate_SelectionName()
	
	local EntityId = GUI.GetSelectedEntity()
	
	local EntityType = Logic.GetEntityType( EntityId )
	local EntityTypeName = Logic.GetEntityTypeName( EntityType )
	if EntityTypeName == nil then
		return
	end
	local StringKey = "names/" .. EntityTypeName
	
	
	--For later!
	--local String = "@center " .. XGUIEng.GetStringTableText( StringKey )	
	--XGUIEng.SetText(gvGUI_WidgetID.SelectionName, String)

	XGUIEng.SetTextKeyName(gvGUI_WidgetID.SelectionName, StringKey)
	
end


--------------------------------------------------------------------------------
-- Update generic Health bar
--------------------------------------------------------------------------------

function
GUIUpate_DetailsHealthBar()

	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local EntityID = GUI.GetSelectedEntity()
	
	if EntityID == nil then
		return
	end
	
	local PlayerID = GUI.GetPlayerID()	
	local ColorR, ColorG, ColorB = GUI.GetPlayerColor( PlayerID )
	XGUIEng.SetMaterialColor(CurrentWidgetID,0,ColorR, ColorG, ColorB,170)	
	
	local CurrentHealth = Logic.GetEntityHealth( EntityID )
	local Maxhealth = Logic.GetEntityMaxHealth( EntityID )
	
	XGUIEng.SetProgressBarValues(CurrentWidgetID,CurrentHealth, Maxhealth)
	
end

--------------------------------------------------------------------------------
-- Update Stars in the detailed view
--------------------------------------------------------------------------------

function
GUIUpdate_DetailsExperience()
	
	local EntityID = GUI.GetSelectedEntity()
	
	if EntityID == nil then
		return
	end
	
	local ExperienceLevel = Logic.GetLeaderExperienceLevel(EntityID)
	
		
	--disable Expirience Stars
	for i=0,4,1 do
		XGUIEng.DisableButton(gvGUI_WidgetID.DetailsExperienceLevel[i],1)		
	end
	
	if ExperienceLevel >= 0 then
		--enable them	
		for i=0,ExperienceLevel,1 do
			XGUIEng.DisableButton(gvGUI_WidgetID.DetailsExperienceLevel[i],0)		
		end
	end

	
end

--------------------------------------------------------------------------------
-- Update Health points (in numbers) for the selected entity
--------------------------------------------------------------------------------

function
GUIUpdate_DetailsHealthPoints()

	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()

	local EntityID = GUI.GetSelectedEntity()
	
	if EntityID == nil then
		return
	end
	
	local PlayerID = GUI.GetPlayerID()
	local CurrentHealth = Logic.GetEntityHealth( EntityID )
	local Maxhealth = Logic.GetEntityMaxHealth( EntityID )

	
	local String = "@center ".. CurrentHealth .. "/" .. Maxhealth
	
	XGUIEng.SetText(CurrentWidgetID, String)	

end

--------------------------------------------------------------------------------
-- Update Amount of needed Slots 
--------------------------------------------------------------------------------
function
GUIUpdate_DetailsSlots()

	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()

	local EntityID = GUI.GetSelectedEntity()
	
	if EntityID == nil then
		return
	end
	
	local NeededSlots 
	
	if Logic.IsEntityInCategory(EntityID,EntityCategories.Leader) == 1 then	
		NeededSlots = Logic.GetLeadersGroupAttractionLimitValue(EntityID)
	else
		NeededSlots = Logic.GetSettlersAttractionLimitValue(EntityID)	
	end
	
	XGUIEng.SetTextByValue( CurrentWidgetID, NeededSlots, 1 )
	
end

--------------------------------------------------------------------------------
-- Update Healthbar of the Leader depending on the amount of soldiers.
--------------------------------------------------------------------------------

function 
GUIUpdate_HealtbarSoldierAmount()
	
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local LeaderID = GUI.GetSelectedEntity()
	local AmountOfSoldiers = Logic.LeaderGetNumberOfSoldiers( LeaderID )
	local MaxAmountOfSoldiers = Logic.LeaderGetMaxNumberOfSoldiers( LeaderID )
	
	XGUIEng.SetProgressBarValues(CurrentWidgetID,AmountOfSoldiers, MaxAmountOfSoldiers)
	
end

--------------------------------------------------------------------------------
-- Update number of attached soldiers in a group (number)
--------------------------------------------------------------------------------
function GUIUpdate_GroupStrength()
    local leaderID = GUI.GetSelectedEntity()
	local sel = Logic.GetEntityType(leaderID)
    local amountOfSoldiers = Logic.LeaderGetNumberOfSoldiers(leaderID)
    local maxAmountOfSoldiers = Logic.LeaderGetMaxNumberOfSoldiers(leaderID)
    XGUIEng.ShowAllSubWidgets(gvGUI_WidgetID.DetailsGroupStrengthSoldiersContainer, 0)
    for i = 1, maxAmountOfSoldiers do
        XGUIEng.ShowWidget( gvGUI_WidgetID.DetailsGroupStrengthSoldiers[i], 1)
    end
	for j = amountOfSoldiers, maxAmountOfSoldiers do
		if amountOfSoldiers == 0 then
			XGUIEng.DisableButton(gvGUI_WidgetID.DetailsGroupStrengthSoldiers[1], 1)
		end
		if maxAmountOfSoldiers <= 8 then
			XGUIEng.DisableButton(gvGUI_WidgetID.DetailsGroupStrengthSoldiers[j], 1)
		else
			XGUIEng.DisableButton(gvGUI_WidgetID.DetailsGroupStrengthSoldiers[j/2], 1)
		end
	end
    if amountOfSoldiers == 0 then
        return
    end
	if maxAmountOfSoldiers <= 8 then
		for k = 1, amountOfSoldiers do    
			XGUIEng.DisableButton(gvGUI_WidgetID.DetailsGroupStrengthSoldiers[k], 0)    
		end
	else
		for k = 1, math.floor(amountOfSoldiers/2) do    
			XGUIEng.DisableButton(gvGUI_WidgetID.DetailsGroupStrengthSoldiers[k], 0)    
		end
	end
end


--------------------------------------------------------------------------------
-- Update action points for selected hero
--------------------------------------------------------------------------------
function
GUIUpdate_ActionPoints()

	local HeroID = GUI.GetSelectedEntity()
	
	if HeroID == nil then
		return
	end
	
	local CurrentActionPoints = Logic.HeroGetActionPoints( HeroID )
	local MaxActionPoints = Logic.HeroGetMaxActionPoints( HeroID )
	
	--center it!
	local String = CurrentActionPoints .. "/" .. MaxActionPoints
	
	XGUIEng.SetText(gvGUI_WidgetID.ActionPoints, String)	
	
end
	
--------------------------------------------------------------------------------
-- Update current armor for selected Entity
--------------------------------------------------------------------------------
function
GUIUpdate_Armor()

	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local EntityID = GUI.GetSelectedEntity()
	local Armor = Logic.GetEntityArmor(EntityID)
	
	XGUIEng.SetTextByValue( CurrentWidgetID, Armor, 1 )
	
end

--------------------------------------------------------------------------------
-- Update current damage for selected Entity
--------------------------------------------------------------------------------
function
GUIUpdate_Damage()
	
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local LeaderID = GUI.GetSelectedEntity()
	local Damage = Logic.GetEntityDamage(LeaderID)
	
	XGUIEng.SetTextByValue( CurrentWidgetID, Damage, 1 )
	
end


--------------------------------------------------------------------------------
-- Update current working workers of the selected building
--------------------------------------------------------------------------------
function
GUIUpdate_CurrentWorkersAmount()

	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()

	-- This needs to be updated due to table memory usage and was temporarily commented out
	local BuildingID = GUI.GetSelectedEntity()
	local WorkerTable = { Logic.GetAttachedWorkersToBuilding( BuildingID ) }
	local Counter = 0
	local i
	for i=1, WorkerTable[ 1 ], 1 do
		if Logic.IsSettlerAtWork( WorkerTable[ 1 + i ] ) == 1  then
			Counter = Counter + 1
		end
	end
	
	XGUIEng.SetTextByValue( CurrentWidgetID, Counter, 1 )
end


--------------------------------------------------------------------------------
-- Update payday clock
--------------------------------------------------------------------------------

function
GUIUpdate_PaydayClock()
	
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local PlayerID = GUI.GetPlayerID()
	local PaydayTimeLeft = Logic.GetPlayerPaydayTimeLeft(PlayerID)
	local PaydayFrequency = Logic.GetPlayerPaydayFrequency(PlayerID)
	local TextureNameStem = "data\\graphics\\textures\\gui\\payday00"
	
	local Temp = 15 - ( PaydayTimeLeft / PaydayFrequency ) * 16
	Temp = math.ceil( Temp )
	if Temp < 0 then
		Temp = 0
	elseif Temp > 15 then
		Temp = 15
	end
	
	if Temp < 10 then
		TextureNameStem = TextureNameStem .. "0" .. Temp .. ".png"
	else
		TextureNameStem = TextureNameStem .. Temp .. ".png"
	end
		
	XGUIEng.SetMaterialTexture(CurrentWidgetID,1, TextureNameStem)
	
end 

--------------------------------------------------------------------------------
-- Update game clock
--------------------------------------------------------------------------------

function
GUIUpdate_Clock()
	
	local Seconds = Logic.GetTime()
	
	local TotalMinutes = math.floor( Seconds / 60 )
	local Hours = math.floor( TotalMinutes / 60 )
	local Minutes = math.mod( TotalMinutes, 60 )
	local TotalSeconds = math.mod( math.floor(Seconds), 60 )
		
	local String = " "
	
	if Hours > 0 then		
		if Hours < 10 then
			String = String .. "0" .. Hours .. ":"
		else
			String = String .. Hours .. ":"
		end
	elseif Hours == 0 then
		String = String .. "00".. ":"
	end
	
	if Minutes == 0 then
		String = String .. "00" .. ":"
	else
		if Minutes <10 then
			String = String .. "0" .. Minutes .. ":"
		else
			String = String .. Minutes .. ":"
		end
	end
	
	
	if TotalSeconds < 10 then		
		String = String .. "0" .. TotalSeconds	
	else		
		String = String .. TotalSeconds	
	end

	
	
	XGUIEng.SetText(gvGUI_WidgetID.GameClock, String)	
	
end

--------------------------------------------------------------------------------
-- Update recharge time for hero ability
--------------------------------------------------------------------------------
function GUIUpdate_HeroAbility(_ability, _button)
	local button = _button
	if _ability ~= nil then
		local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
		local SelectedEntityID = GUI.GetSelectedEntity()
	
		if Logic.IsHero(SelectedEntityID) == 1 then
			SelectedEntityID = HeroSelection_GetCurrentSelectedHeroID()	
		end
	
		local RechargeTime = Logic.HeroGetAbilityRechargeTime(SelectedEntityID, _ability)
		local TimeLeft = Logic.HeroGetAbiltityChargeSeconds(SelectedEntityID, _ability)
		if TimeLeft == RechargeTime then		
			XGUIEng.SetMaterialColor(CurrentWidgetID,1,0,0,0,0)
			XGUIEng.DisableButton(button,0)
		end
		if TimeLeft < RechargeTime then
			XGUIEng.SetMaterialColor(CurrentWidgetID,1,214,44,24,189)						
			XGUIEng.DisableButton(button,1)
		end
		XGUIEng.SetProgressBarValues(CurrentWidgetID,TimeLeft, RechargeTime)
	else
		if XNetwork.Manager_IsGameRunning() == 1 then						
			XGUIEng.DisableButton(button,1)
		else						
			XGUIEng.DisableButton(button,0)
		end
	end
end


--------------------------------------------------------------------------------
-- Update recharge time Weathermachine
--------------------------------------------------------------------------------

function
GUIUpdate_WeatherEnergyProgress()

	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	local PlayerID = GUI.GetPlayerID()
	local CurrentWeatherEnergy = Logic.GetPlayersGlobalResource( PlayerID, ResourceType.WeatherEnergy )	
	
	XGUIEng.SetProgressBarValues(CurrentWidgetID,CurrentWeatherEnergy, 1000)
	
end



--------------------------------------------------------------------------------
-- Update faith in monastery
--------------------------------------------------------------------------------

function
GUIUpdate_FaithProgress()

	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	local PlayerID = GUI.GetPlayerID()
	local CurrentFaith = Logic.GetPlayersGlobalResource( PlayerID, ResourceType.Faith )	
	local MaxFaith = Logic.GetMaximumFaith( PlayerID )
	
	XGUIEng.SetProgressBarValues(CurrentWidgetID,CurrentFaith, MaxFaith)
	
end


--------------------------------------------------------------------------------
-- Toggle Stopwatch
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Update Stopwatch
--------------------------------------------------------------------------------
gvGUI.UltimatumTime = 0
gvGUI.UltimatumStartTime = 0

function
GUIUpdate_StopWatch()
	
	local CurrentTimeSeconds = Logic.GetTime()	
	local SecondsLeft=  math.floor(gvGUI.UltimatumTime-(CurrentTimeSeconds - gvGUI.UltimatumStartTime))
	
	local TotalMinutes = math.floor( SecondsLeft / 60 )	
	local Minutes = math.mod( TotalMinutes, 60 )
	local TotalSeconds = math.mod( math.floor(SecondsLeft), 60 )
		
	local String = " "
	
	if SecondsLeft < 60 then
	 	String = " @color:255,120,120,255  "
	end
	 
	if TotalSeconds < 10 then		
		String = String .. " @center " .. Minutes .. ":" .. "0" .. TotalSeconds	
	else		
		String = String .. " @center " .. Minutes .. ":" .. TotalSeconds	
	end

	if SecondsLeft == 60 then		
		--Sound.Play2DSound( Sounds.Smith01,0 )
		Sound.Play2DSound(Sounds.Misc_Countdown1, 0,50)
	end
	
	--[[
	local MiliSecondsLeft = math.floor((gvGUI.UltimatumTime*1000)-(Logic.GetTimeMs() - (gvGUI.UltimatumStartTime*1000)))
	if MiliSecondsLeft == 5000
	or MiliSecondsLeft == 4000
	or MiliSecondsLeft == 3000
	or MiliSecondsLeft == 2000
	or MiliSecondsLeft == 1000 then
		Sound.Play2DSound( Sounds.Smith01,0 )
	end
	--]]

	XGUIEng.SetText("StopWatchCounter", String)	

	StopWatchSecondsLeft = TotalSeconds

	-- do not show stopwatch when time has run out
	if TotalSeconds < 0 then
		GUIAction_ToggleStopWatch(0, 0)
	end
	
end
--AnSu: Not here!
function
GUIAction_ToggleStopWatch(_UltimatumTime, _status)
	
	XGUIEng.ShowWidget("MapProgressStuff",_status)
	
	if _status == 1 then
		gvGUI.UltimatumTime = 	_UltimatumTime
		gvGUI.UltimatumStartTime = Logic.GetTime()
	else
		gvGUI.UltimatumTime = 	0
	end
end


--------------------------------------------------------------------------------
-- Tax Window
--------------------------------------------------------------------------------

function
GUIUpdate_TaxLeaderAmount()
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	local PlayerID = GUI.GetPlayerID()
	
	local NumerOfLeaders = Logic.GetNumberOfLeader(PlayerID)
	
	XGUIEng.SetText(CurrentWidgetID, NumerOfLeaders)	
		
end


function
GUIUpdate_TaxLeaderCosts()
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	local PlayerID = GUI.GetPlayerID()
	
	local LeaderCosts = -(Logic.GetPlayerPaydayLeaderCosts(PlayerID))
	
	XGUIEng.SetText(CurrentWidgetID, LeaderCosts)	
	
end


function
GUIUpdate_TaxTaxAmountOfWorker()
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	local PlayerID = GUI.GetPlayerID()
	
	local TaxAmountOneWorker = Logic.GetTaxAmountOfWorker()
	
	XGUIEng.SetText(CurrentWidgetID, TaxAmountOneWorker)	
	
end


function
GUIUpdate_TaxWorkerAmount()
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	local PlayerID = GUI.GetPlayerID()
	
	local NumerOfWorkers = Logic.GetNumberOfAttractedWorker(PlayerID)
	
	XGUIEng.SetText(CurrentWidgetID, NumerOfWorkers)	
	
end


function GUIUpdate_TaxPaydayIncome()
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	local PlayerID = GUI.GetPlayerID()
	
	local TaxAmount = Logic.GetPlayerPaydayCost(PlayerID)
	local Payday = Logic.GetPlayerPaydayLeaderCosts(PlayerID)
		
	if Logic.GetTechnologyState(PlayerID, Technologies.T_BookKeeping) == 4 then	
		TaxAmount = TaxAmount + Logic.GetNumberOfAttractedWorker(PlayerID) * Logic.GetTaxLevel(PlayerID)
	end

	if Logic.GetPlayerPaysLeaderFlag(PlayerID) == 0 then
		Payday = 0
	end
	
	local TaxesPlayerWillGet = TaxAmount - Payday
	
	local String
	
	if TaxesPlayerWillGet < 0 then
		String = "@color:255,100,100,255 @ra " .. TaxesPlayerWillGet
    else
    	String = "@color:100,255,100,255 @ra +" .. TaxesPlayerWillGet
    end
	
	XGUIEng.SetText(CurrentWidgetID, String)	
end


function GUIUpdate_TaxSumOfTaxes()
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	local PlayerID = GUI.GetPlayerID()
	local TaxIncome = Logic.GetPlayerPaydayCost(PlayerID)	

	if Logic.GetTechnologyState(PlayerID, Technologies.T_BookKeeping) == 4 then	
		TaxIncome = TaxIncome + Logic.GetNumberOfAttractedWorker(PlayerID) * Logic.GetTaxLevel(PlayerID)
	end
	
	XGUIEng.SetText(CurrentWidgetID, TaxIncome)	
end


function
GUIUpdate_HintText()

	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local NameAndType = {Framework.GetCurrentMapTypeAndCampaignName()}
	local Type = NameAndType[1]
	
	-- is map a campaign map?
	if Type == -1 then
		local Name = Framework.GetCurrentMapName()
		local MapTitle, MapDesc = Framework.GetMapNameAndDescription( Name, -1, NameAndType[2] )		
		
		if Name == "13_Plague" then
			Name = "13_Plaque"
		end
		
		local HintText = XGUIEng.GetStringTableText( "CM01_MapHints/" .. Name )
		
		XGUIEng.SetText("GameEndScreen_OutputBG", HintText)	
		XGUIEng.SetText(CurrentWidgetID, MapTitle)	
	
	end
	
end

--------------------------------------------------------------------------------
-- CP Taxation Mod
--------------------------------------------------------------------------------
function GUIUpdate_BonusTaxation()
	local PlayerID = GUI.GetPlayerID()
	local TechState = Logic.GetTechnologyState(PlayerID, Technologies.T_BookKeeping)

	if TechState == 4 then	
		local PaydayTimeLeft = Logic.GetPlayerPaydayTimeLeft(PlayerID)
		local PaydayFrequency = Logic.GetPlayerPaydayFrequency(PlayerID)
		local extraTaxes = Logic.GetNumberOfAttractedWorker(PlayerID) * Logic.GetTaxLevel(PlayerID)

		if PaydayTimeLeft == PaydayFrequency and extraTaxes > 0 then
			Tools.GiveResouces(PlayerID, extraTaxes, 0, 0, 0, 0, 0)	
		end
	end
end 