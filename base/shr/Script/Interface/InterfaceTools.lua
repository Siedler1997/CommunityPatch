--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Interface tool functions
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--------------------------------------------------------------------------------
-- Tool function to convert a table containing costs into a string
--------------------------------------------------------------------------------

function InterfaceTool_CreateCostString( _Costs )

	local PlayerID = GUI.GetPlayerID()
	
	local PlayerClay   = Logic.GetPlayersGlobalResource( PlayerID, ResourceType.Clay ) + Logic.GetPlayersGlobalResource( PlayerID, ResourceType.ClayRaw)	
	local PlayerGold   = Logic.GetPlayersGlobalResource( PlayerID, ResourceType.Gold ) + Logic.GetPlayersGlobalResource( PlayerID, ResourceType.GoldRaw)
	local PlayerSilver = Logic.GetPlayersGlobalResource( PlayerID, ResourceType.Silver ) + Logic.GetPlayersGlobalResource( PlayerID, ResourceType.SilverRaw)
	local PlayerWood   = Logic.GetPlayersGlobalResource( PlayerID, ResourceType.Wood ) + Logic.GetPlayersGlobalResource( PlayerID, ResourceType.WoodRaw)
	local PlayerIron   = Logic.GetPlayersGlobalResource( PlayerID, ResourceType.Iron ) + Logic.GetPlayersGlobalResource( PlayerID, ResourceType.IronRaw)
	local PlayerStone  = Logic.GetPlayersGlobalResource( PlayerID, ResourceType.Stone ) + Logic.GetPlayersGlobalResource( PlayerID, ResourceType.StoneRaw)
	local PlayerSulfur = Logic.GetPlayersGlobalResource( PlayerID, ResourceType.Sulfur ) + Logic.GetPlayersGlobalResource( PlayerID, ResourceType.SulfurRaw)

	local CostString = ""
	
	if _Costs[ ResourceType.Gold ] ~= 0 then
		CostString = CostString .. XGUIEng.GetStringTableText("InGameMessages/GUI_NameMoney") .. ": " 
		if PlayerGold >= _Costs[ ResourceType.Gold ] then
			CostString = CostString .. " @color:255,255,255,255 "
		else
			CostString = CostString .. " @color:220,64,16,255 "
		end
		CostString = CostString .. _Costs[ ResourceType.Gold ] .. " @color:255,255,255,255 @cr "
	end
	
	if _Costs[ ResourceType.Wood ] ~= 0 then
		CostString = CostString .. XGUIEng.GetStringTableText("InGameMessages/GUI_NameWood") .. ": " 
		if PlayerWood >= _Costs[ ResourceType.Wood ] then
			CostString = CostString .. " @color:255,255,255,255 "
		else
			CostString = CostString .. " @color:220,64,16,255 "
		end
		CostString = CostString .. _Costs[ ResourceType.Wood ] .. " @color:255,255,255,255 @cr "
	end
	
	if _Costs[ ResourceType.Silver ] ~= 0 then
		CostString = CostString .. "Silver: " 
		if PlayerSilver >= _Costs[ ResourceType.Silver ] then
			CostString = CostString .. " @color:255,255,255,255 "
		else
			CostString = CostString .. " @color:220,64,16,255 "
		end
		CostString = CostString .. _Costs[ ResourceType.Silver ] .. " @color:255,255,255,255 @cr "
	end
		
	if _Costs[ ResourceType.Clay ] ~= 0 then
		CostString = CostString .. XGUIEng.GetStringTableText("InGameMessages/GUI_NameClay") .. ": " 
		if PlayerClay >= _Costs[ ResourceType.Clay ] then
			CostString = CostString .. " @color:255,255,255,255 "
		else
			CostString = CostString .. " @color:220,64,16,255 "
		end
		CostString = CostString .. _Costs[ ResourceType.Clay ] .. " @color:255,255,255,255 @cr "
	end
			
	if _Costs[ ResourceType.Stone ] ~= 0 then
		CostString = CostString .. XGUIEng.GetStringTableText("InGameMessages/GUI_NameStone") .. ": " 
		if PlayerStone >= _Costs[ ResourceType.Stone] then
			CostString = CostString .. " @color:255,255,255,255 "
		else
			CostString = CostString .. " @color:220,64,16,255 "
		end
		CostString = CostString .. _Costs[ ResourceType.Stone ] .. " @color:255,255,255,255 @cr "
	end
	
	if _Costs[ ResourceType.Iron ] ~= 0 then
		CostString = CostString .. XGUIEng.GetStringTableText("InGameMessages/GUI_NameIron") .. ": " 
		if PlayerIron >= _Costs[ ResourceType.Iron ] then
			CostString = CostString .. " @color:255,255,255,255 "
		else
			CostString = CostString .. " @color:220,64,16,255 "
		end
		CostString = CostString .. _Costs[ ResourceType.Iron ] .. " @color:255,255,255,255 @cr "
	end
		
	if _Costs[ ResourceType.Sulfur ] ~= 0 then
		CostString = CostString .. XGUIEng.GetStringTableText("InGameMessages/GUI_NameSulfur") .. ": " 
		if PlayerSulfur >= _Costs[ ResourceType.Sulfur ] then
			CostString = CostString .. " @color:255,255,255,255 "
		else
			CostString = CostString .. " @color:220,64,16,255 "
		end
		CostString = CostString .. _Costs[ ResourceType.Sulfur ] .. " @color:255,255,255,255 @cr "
	end

	return CostString

end

--------------------------------------------------------------------------------
-- Tool function to check if player has enough resources AND giving feedback when not
--------------------------------------------------------------------------------
-- Returns 1 when player has enough

function InterfaceTool_HasPlayerEnoughResources_Feedback( _Costs )
	
	local PlayerID = GUI.GetPlayerID()
	
	
	local Clay = Logic.GetPlayersGlobalResource( PlayerID, ResourceType.Clay ) + Logic.GetPlayersGlobalResource( PlayerID, ResourceType.ClayRaw)	
	local Wood = Logic.GetPlayersGlobalResource( PlayerID, ResourceType.Wood ) + Logic.GetPlayersGlobalResource( PlayerID, ResourceType.WoodRaw)
	local Gold   = Logic.GetPlayersGlobalResource( PlayerID, ResourceType.Gold ) + Logic.GetPlayersGlobalResource( PlayerID, ResourceType.GoldRaw)
	local Iron   = Logic.GetPlayersGlobalResource( PlayerID, ResourceType.Iron ) + Logic.GetPlayersGlobalResource( PlayerID, ResourceType.IronRaw)
	local Stone  = Logic.GetPlayersGlobalResource( PlayerID, ResourceType.Stone ) + Logic.GetPlayersGlobalResource( PlayerID, ResourceType.StoneRaw)
	local Sulfur = Logic.GetPlayersGlobalResource( PlayerID, ResourceType.Sulfur ) + Logic.GetPlayersGlobalResource( PlayerID, ResourceType.SulfurRaw)


	local Message = ""
	
	if 	_Costs[ ResourceType.Sulfur ] ~= nil and Sulfur < _Costs[ ResourceType.Sulfur ] then		
		Message = string.format(XGUIEng.GetStringTableText("InGameMessages/GUI_NotEnoughSulfur"), _Costs[ ResourceType.Sulfur ] - Sulfur )
		GUI.AddNote( Message )
		GUI.SendNotEnoughResourcesFeedbackEvent( ResourceType.Sulfur, _Costs[ ResourceType.Sulfur ] - Sulfur )
	end
		
	if _Costs[ ResourceType.Iron ] ~= nil and Iron < _Costs[ ResourceType.Iron ] then		
		Message = string.format(XGUIEng.GetStringTableText("InGameMessages/GUI_NotEnoughIron"), _Costs[ ResourceType.Iron ] - Iron )
		GUI.AddNote( Message )
		GUI.SendNotEnoughResourcesFeedbackEvent( ResourceType.Iron, _Costs[ ResourceType.Iron ] - Iron )
	end
	
	if _Costs[ ResourceType.Stone ] ~= nil and Stone < _Costs[ ResourceType.Stone ] then		
		Message = string.format(XGUIEng.GetStringTableText("InGameMessages/GUI_NotEnoughStone"), _Costs[ ResourceType.Stone ] - Stone )
		GUI.AddNote( Message )
		GUI.SendNotEnoughResourcesFeedbackEvent( ResourceType.Stone, _Costs[ ResourceType.Stone ] - Stone )
	end
	
	if _Costs[ ResourceType.Clay ] ~= nil and Clay < _Costs[ ResourceType.Clay ]  then
		Message = string.format(XGUIEng.GetStringTableText("InGameMessages/GUI_NotEnoughClay"), _Costs[ ResourceType.Clay ] - Clay )
		GUI.AddNote( Message )
		GUI.SendNotEnoughResourcesFeedbackEvent( ResourceType.Clay, _Costs[ ResourceType.Clay ] - Clay )
	end
	
	
	if _Costs[ ResourceType.Wood ] ~= nil and Wood < _Costs[ ResourceType.Wood ]  then
		Message = string.format(XGUIEng.GetStringTableText("InGameMessages/GUI_NotEnoughWood"), _Costs[ ResourceType.Wood ] - Wood )
		GUI.AddNote( Message )
		GUI.SendNotEnoughResourcesFeedbackEvent( ResourceType.Wood, _Costs[ ResourceType.Wood ] - Wood )
	end
	
	if _Costs[ ResourceType.Gold ] ~= nil and Gold < _Costs[ ResourceType.Gold ]  
	and _Costs[ ResourceType.Gold ] ~= 0 then
		Message = string.format(XGUIEng.GetStringTableText("InGameMessages/GUI_NotEnoughMoney"), _Costs[ ResourceType.Gold ] - Gold )
		GUI.AddNote( Message )
		GUI.SendNotEnoughResourcesFeedbackEvent( ResourceType.Gold, _Costs[ ResourceType.Gold ] - Gold )
	end

	-- Any message
	if Message ~= "" then
		return 0
	else
		return 1
	end
	
end


function 
InterfaceTool_IsBuildingDoingSomething( _BuildingID )

	local EntityType = Logic.GetEntityType(_BuildingID )
	local UpgradeCategory = Logic.GetUpgradeCategoryByBuildingType(EntityType)
	
	if  Logic.GetTechnologyResearchedAtBuilding(_BuildingID) ~= 0 
	or Logic.GetRemainingUpgradeTimeForBuilding(_BuildingID) ~= Logic.GetTotalUpgradeTimeForBuilding (_BuildingID)	then
	--or Logic.GetLeaderTrainingAtBuilding(_BuildingID) ~= 0 then
		return true
	
	elseif UpgradeCategory == UpgradeCategories.Foundry then		
		if Logic.GetCannonProgress(_BuildingID)~= 100 then
			return true		
		end
		
	elseif EntityType == Entities.PB_Market2 then
		if Logic.GetTransactionProgress(_BuildingID) ~= 100 then
			return true
		end
	else
		return false	
	end
	
end


--------------------------------------------------------------------------------
-- Toolfunction to fly to entity (and follow it if it is not a building)
--------------------------------------------------------------------------------

function
GUIAction_FlyToEntity(_EntityID)

	--Do not follow entity anymore
	Camera.FollowEntity(0)
	
	--FlyTo disabled for the moment. We will implement this later in a better way
	local IDPosX, IDPosY, IDPosZ = Logic.EntityGetPos( _EntityID )
	Camera.ScrollSetLookAt(IDPosX, IDPosY)	
	
	--Do not follow entity if it is a building
	if Logic.IsBuilding( _EntityID ) == 0 then				
		Camera.FollowEntity(_EntityID)		
	end
	
	--get start and target coodrinates
	--local CameraX, CameraY = Camera.ScrollGetLookAt()		
	
	
	--calculate Distance between current cameraposition and target entity position
	--local DeltaX = IDPosX - CameraX
	--local DeltaY = IDPosY - CameraY
	--local Distance = math.floor(math.sqrt((DeltaX*DeltaX)+(DeltaY*DeltaY)))
	--
	----set speed for flyTo
	--local Speed = 0 --speed in Turns!
	
	----Is distance short
	--if Distance <= 200 then
	--	--calculate speed depending on ditance
	--	Speed = 5 - (Distance/100)
	--end
	
	
	--Camera.SetControlMode( 1 )
	
	
	--Camera.FlyToLookAt(IDPosX, IDPosY, (Speed/10))	
	--Trigger.UnrequestTrigger(gvGUI.TriggerID_GUI_FollowEntity)
	
	--Do not follow entity if it is a building
	--if Logic.IsBuilding( _EntityID ) == 0 then				
	--	--Camera.SetControlMode( 0 )
	--	Camera.FollowEntity(_EntityID)
	--	--gvGUI.TriggerID_GUI_FollowEntity = Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_TURN, "GUICondition_FollowEntity", "GUIAction_FollowEntity", 1, {Speed},{_EntityID})	
	--	--GUI.SetSelectedEntity( SettlerID  )	
	--end
end

--------------------------------------------------------------------------------
-- Condition and Action for Following entity
--------------------------------------------------------------------------------

function 
GUICondition_FollowEntity(_Speed)
	return Counter.Tick2("FollowEntity_GUI",_Speed)
end

function
GUIAction_FollowEntity(_EntityID)
	Camera.SetControlMode( 0 )
	Camera.FollowEntity(_EntityID)
	Counter.Reset("FollowEntity_GUI")
	return 1
end

--------------------------------------------------------------------------------
-- Calculates blessingcosts
--------------------------------------------------------------------------------
function InterfaceTool_GetBlessingCosts(_PID, _BlessCategory)
	local BlessPrice = 0

	local constructionsPrice = 1 * (
		Logic.GetNumberOfEntitiesOfTypeOfPlayer(_PID, Entities.PU_Farmer)
		+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(_PID, Entities.PU_BrickMaker)
		+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(_PID, Entities.PU_Sawmillworker)
		+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(_PID, Entities.PU_Stonecutter)
		+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(_PID, Entities.PU_Miner)
		+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(_PID, Entities.CU_Serf))
	local researchPrice = 3 * (
		Logic.GetNumberOfEntitiesOfTypeOfPlayer(_PID, Entities.PU_Scholar)
		+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(_PID, Entities.PU_Engineer)
		+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(_PID, Entities.PU_Priest))
	local weaponsPrice = 5 * (
		Logic.GetNumberOfEntitiesOfTypeOfPlayer(_PID, Entities.PU_Smith)
		+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(_PID, Entities.PU_Alchemist)
		+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(_PID, Entities.PU_Smelter))
	local financialPrice = 10 * (
		Logic.GetNumberOfEntitiesOfTypeOfPlayer(_PID, Entities.PU_Treasurer)
		+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(_PID, Entities.PU_Trader))

	if _BlessCategory == BlessCategories.Construction then
		BlessPrice = constructionsPrice
	elseif _BlessCategory == BlessCategories.Research then
		BlessPrice = researchPrice
	elseif _BlessCategory == BlessCategories.Weapons then
		BlessPrice = weaponsPrice
	elseif _BlessCategory == BlessCategories.Financial then
		BlessPrice = financialPrice
	elseif _BlessCategory == BlessCategories.Canonisation then
		BlessPrice = constructionsPrice + researchPrice + weaponsPrice + financialPrice
	end

	return BlessPrice
end

--------------------------------------------------------------------------------
-- Tool function to sub ressources from a vanilla cost table (eg. InterfaceGlobals.CostTable)
--------------------------------------------------------------------------------
function InterfaceTool_PayResources(_Costs)
	local pID = GUI.GetPlayerID();

	if _Costs[ResourceType.Gold] ~= nil and _Costs[ResourceType.Gold] ~= 0 and GetGold(pID) >= _Costs[ResourceType.Gold] then
		AddGold(-_Costs[ResourceType.Gold]);
	end
	if _Costs[ResourceType.Clay] ~= nil and _Costs[ResourceType.Clay] ~= 0 and GetClay(pID) >= _Costs[ResourceType.Clay] then
		AddClay(-_Costs[ResourceType.Clay]);
	end
	if _Costs[ResourceType.Wood] ~= nil and _Costs[ResourceType.Wood] ~= 0 and GetWood(pID) >= _Costs[ResourceType.Wood] then
		AddWood(-_Costs[ResourceType.Wood]);
	end
	if _Costs[ResourceType.Stone] ~= nil and _Costs[ResourceType.Stone] ~= 0 and GetStone(pID) >= _Costs[ResourceType.Stone] then
		AddStone(-_Costs[ResourceType.Stone]);
	end
	if _Costs[ResourceType.Iron] ~= nil and _Costs[ResourceType.Iron] ~= 0 and GetIron(pID) >= _Costs[ResourceType.Iron] then
		AddIron(-_Costs[ResourceType.Iron]);
	end
	if _Costs[ResourceType.Sulfur] ~= nil and _Costs[ResourceType.Sulfur] ~= 0 and GetSulfur(pID) >= _Costs[ResourceType.Sulfur] then
		AddSulfur(-_Costs[ResourceType.Sulfur]);
	end
end

--------------------------------------------------------------------------------
-- Another tool function to convert a table containing costs into a string (by Noigi)
--------------------------------------------------------------------------------
function CreateCostString(_t)
	local t = {0,0,0,0,0,0,0,0,0,0,0,0,0}
	for k,v in pairs(_t) do
		assert(ResourceType[k]);
		t[ResourceType[k]] = v;
	end
	return InterfaceTool_CreateCostString(t);
end

function HasPlayerEnoughResources(_t)
	local t = {0,0,0,0,0,0,0,0,0,0,0,0,0}
	for k,v in pairs(_t) do
		assert(ResourceType[k]);
		t[ResourceType[k]] = v;
	end
	return InterfaceTool_HasPlayerEnoughResources_Feedback(t);
end

function PayResources( _tCosts, _noMessage, _onlyCheck )
	local tMissing = {};
	local enough = true;
	local pID = GUI.GetPlayerID();

	for resType,costs in pairs(_tCosts) do
		assert(ResourceType[resType]);
		if costs > 0 then
			local goodStock = 0;
			if resType == "Gold" then
				goodStock = GetGold(pID);
			elseif resType == "Clay" then
				goodStock = GetClay(pID);
			elseif resType == "Wood" then
				goodStock = GetWood(pID);
			elseif resType == "Stone" then
				goodStock = GetStone(pID);
			elseif resType == "Iron" then
				goodStock = GetIron(pID);
			elseif resType == "Sulfur" then
				goodStock = GetSulfur(pID);
			end
			if (goodStock - costs) < 0 then
				enough = false;
				tMissing[resType] = (costs - goodStock);
				if not _noMessage then
					PayResources_FeedbackNotEnoughRes(resType, tMissing[resType]);
				end
			end
		end
	end

	if not enough then
		return false,tMissing;
	end

	if not _onlyCheck then
		if _tCosts.Gold then
			AddGold(-_tCosts.Gold);
		end
		if _tCosts.Clay then
			AddClay(-_tCosts.Clay);
		end
		if _tCosts.Wood then
			AddWood(-_tCosts.Wood);
		end
		if _tCosts.Stone then
			AddStone(-_tCosts.Stone);
		end
		if _tCosts.Iron then
			AddIron(-_tCosts.Iron);
		end
		if _tCosts.Sulfur then
			AddSulfur(-_tCosts.Sulfur);
		end
	end

	return true;
end

function PayResources_FeedbackNotEnoughRes( _resType, _nMissing )
	local mistext = ""

	if _resType == "Gold" then 
		GUI.AddNote(string.format(XGUIEng.GetStringTableText("InGameMessages/GUI_NotEnoughMoney"), _nMissing))
		GUI.SendNotEnoughResourcesFeedbackEvent(ResourceType.Gold, _nMissing)
	elseif _resType == "Clay" then 
		GUI.AddNote(string.format(XGUIEng.GetStringTableText("InGameMessages/GUI_NotEnoughClay"), _nMissing))
		GUI.SendNotEnoughResourcesFeedbackEvent(ResourceType.Clay, _nMissing)
	elseif _resType == "Wood" then 
		GUI.AddNote(string.format(XGUIEng.GetStringTableText("InGameMessages/GUI_NotEnoughWood"), _nMissing))
		GUI.SendNotEnoughResourcesFeedbackEvent(ResourceType.Wood, _nMissing)
	elseif _resType == "Stone" then 
		GUI.AddNote(string.format(XGUIEng.GetStringTableText("InGameMessages/GUI_NotEnoughStone"), _nMissing))
		GUI.SendNotEnoughResourcesFeedbackEvent(ResourceType.Stone, _nMissing)
	elseif _resType == "Iron" then 
		GUI.AddNote(string.format(XGUIEng.GetStringTableText("InGameMessages/GUI_NotEnoughIron"), _nMissing))
		GUI.SendNotEnoughResourcesFeedbackEvent(ResourceType.Iron, _nMissing)
	elseif _resType == "Sulfur" then 
		GUI.AddNote(string.format(XGUIEng.GetStringTableText("InGameMessages/GUI_NotEnoughSulfur"), _nMissing))
		GUI.SendNotEnoughResourcesFeedbackEvent(ResourceType.Sulfur, _nMissing)
	end
end

--------------------------------------------------------------------------------
-- Returns a time-string  with the format "days hours" or "hours:minutes:seconds"
--------------------------------------------------------------------------------
function GetClockTimeString(_sec)
assert(type(_sec) == "number" , "ERROR: _sec must be a number!" );

	local Seconds = _sec
	local Minutes = math.floor(Seconds/60)
	local Hours = math.floor(Minutes/60)	
	local Days = math.floor(Hours/24)	
	local MSec_Rest = math.mod(math.floor(Seconds), 60)
	local SMin_Rest = math.mod(math.floor(Minutes), 60)
	local SSec_Rest = math.mod(math.floor(SMin_Rest), 60)	
	local DHour_Rest = math.mod(math.floor(Hours), 24)

	local String = " "

	if Minutes == 0 then	--less than one minute -> only seconds
		String = String .. _sec
		String = String .. " " .. XGUIEng.GetStringTableText("MenuGeneric/SecondsGeneric")
	elseif Hours == 0 then	--less than one hour -> only minutes:seconds
		String = String .. Minutes .. ":"
		if MSec_Rest < 10 then
			String = String .. "0" .. MSec_Rest
		else
			String = String .. MSec_Rest
		end
		String = String .. " " .. XGUIEng.GetStringTableText("MenuGeneric/MinutesGeneric")
	elseif days == 0 then	--less than one day -> only hours:minutes:seconds
		String = String .. Hours .. ":"
		if SMin_Rest < 10 then
			String = String .. "0" .. SMin_Rest
		else
			String = String .. SMin_Rest
		end
		if SSec_Rest < 10 then
			String = String .. "0" .. SSec_Rest
		else
			String = String .. SSec_Rest
		end
		String = String .. " " .. XGUIEng.GetStringTableText("MenuGeneric/HoursGeneric")
	else	--one day or more -> only days and hours
		String = String .. Days
		String = String .. " " .. XGUIEng.GetStringTableText("MenuGeneric/DaysGeneric")
		if DHour_Rest < 10 then
			String = String .. "0" .. DHour_Rest
		else
			String = String .. DHour_Rest
		end
		String = String .. " " .. XGUIEng.GetStringTableText("MenuGeneric/HoursGeneric")
	end

	return String
end