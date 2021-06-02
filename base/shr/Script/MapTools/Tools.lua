Tools = {}

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Tool functions
-- This file has to be loaded for each map to use the functions
-- You have to add the following line
-- Script.Load("Data\\Maps\\GlobalMissionScripts.lua")
--------------------------------------------------------------------------------------------------------------------

function Tools.OnGameStart()
	-- Get Entity type list for category types
	Tools.HQEntityTable = {Logic.GetBuildingTypesInUpgradeCategory(UpgradeCategories.Headquarters)}

	Tools.TowerEntityTable = {Logic.GetBuildingTypesInUpgradeCategory(UpgradeCategories.Tower)}
end
--------------------------------------------------------------------------------------------------------------------


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Attach Soldiers to leader
-- Paramater 1: The id of the leader
-- Paramater 2: The amount of soldiers to attach

function Tools.AttachSoldiersToLeader(_leader,_amount)

	local LeaderID = 0

	-- Is leader a string
	if type(_leader) == "string" then
		LeaderID = Logic.GetEntityIDByName(_leader)
	else
		LeaderID = _leader
	end	
	
	local i
	for i=1, _amount, 1 do
		Logic.LeaderGetOneSoldier( LeaderID )
	end
	
end
--------------------------------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Create Groups
-- Author: AnSu
-- Paramater 1: The player ID
-- Paramater 2: The type of leader
-- Paramater 3: Amount of soldiers
-- Paramater 3: X coordinate
-- Parameter 4: Y coordinate
-- Parameter 5: Orientation
-- returns: The created leader ID
-- NOTE: Formation and commad must be given seperatly!
-- NOTE: PeSp: Maximum amount of soldiers is limited by leaders maximum soldier amount!

function Tools.CreateGroup(_PlayerID, _LeaderType, _SoldierAmount, _X , _Y ,_Orientation )
		
	if _LeaderType == nil or _LeaderType == 0 then
		LuaDebugger.Break()
		assert(_LeaderType ~= nil and _LeaderType ~= 0)
		return 0
	end
	
	-- Create leader
	local LeaderID = Logic.CreateEntity(_LeaderType, _X, _Y,_Orientation,_PlayerID)
	if LeaderID == 0 then
		LuaDebugger.Break()
		assert(LeaderID~=0)
		return 0
	end
	
	-- Create soldiers
	Tools.CreateSoldiersForLeader( LeaderID, _SoldierAmount )
	
	-- Return leader ID
	return LeaderID
	
end
--------------------------------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Create soldier for passed leader
-- Author: ThHa
-- Paramater 1: The leader ID
-- Paramater 3: Amount of soldiers
-- NOTE: Formation and commad must be given seperatly!
-- NOTE: PeSp: Maximum amount of soldiers is limited by leaders maximum soldier amount!
-- TODO: Check how many soldiers ARE already attached!
-- ATTENTION: this is also used for creating groups after loading map (-> script command created by editor!)

function Tools.CreateSoldiersForLeader( _LeaderID, _SoldierAmount )
		
	-- Is a leader passed?
	if _LeaderID == 0 then
		return 0
	end
	if Logic.IsLeader( _LeaderID ) ~= 1 then
		return 0
	end
	
	-- Get soldier type ok for leader
	local SoldierType = Logic.LeaderGetSoldiersType(_LeaderID)

	-- Get maximum amount of soldier this leader can lead and change soldier amount if more soldiers should be attached than allowed
	local MaxSoldiers = Logic.LeaderGetMaxNumberOfSoldiers( _LeaderID )
	if _SoldierAmount > MaxSoldiers then
		_SoldierAmount = MaxSoldiers
	end
	
	-- Get leader data
	local LeaderX, LeaderY = Logic.GetEntityPosition( _LeaderID )
	local LeaderPlayerID = Logic.EntityGetPlayer( _LeaderID )
	
	-- Create soldiers
	local Counter
	for Counter=1, _SoldierAmount, 1 do
		local SoldierID = Logic.CreateEntity( SoldierType, LeaderX, LeaderY, 0, LeaderPlayerID )
		if SoldierID == 0 then
			LuaDebugger.Break()
			assert(SoldierID~=0)
			return 0
		end		
		Logic.LeaderGetOneSoldier( _LeaderID )					
	end
	
	-- Return number of soldiers
	return _SoldierAmount
	
end
--------------------------------------------------------------------------------------------------------------------


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Attach Soldiers to leader, this function is deprecated and will be removed after E3
-- Parameter 1: The name of the leader
-- Parameter 2: The amount of soldiers to attach

GlobalMissionScripting_AttachSoldiersToLeader = Tools.AttachSoldiersToLeader
--------------------------------------------------------------------------------------------------------------------


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Destroy Group by leader ID
-- Parameter 1: The id of the leader

function Tools.DestroyGroupByLeader(_LeaderID)
	Logic.DestroyGroupByLeader(_LeaderID)
end

--------------------------------------------------------------------------------------------------------------------



--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Check if headquarter of player is destroyed
-- Parameter 1: PlayerID

function Tools.IsHQDestroyed(_PlayerID)

	local 	ConditionFlag = 0
	local 	i = 1
	local   TableSize = Tools.HQEntityTable[1]

	while i <= TableSize and ConditionFlag == 0 
	do
		i = i+1
		local EntityType = Tools.HQEntityTable[i]
		-- check all upgrades
		if 	Logic.GetNumberOfEntitiesOfTypeOfPlayer(_PlayerID, EntityType) ~= 0 then 	
			ConditionFlag = 1
		end
	end 
	
	-- No headquarter exists
	if ConditionFlag == 0 then 
		return true
	else
		return false
	end
end
--------------------------------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Get entity position and put into table
-- Parameter 1: Entity ID or Name
-- Parameter 2: PositionTable
function Tools.GetEntityPosition(_Entity, _Position)

	if type(_Entity) == "string" then
		_Entity = Logic.GetEntityIDByName(_Entity)
	end

	_Position.X, _Position.Y = Logic.EntityGetPos(_Entity)
end
--------------------------------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Get entity position and put into table
-- Parameter 1: Entity ID or string
-- Return1,2: Position X and Y
function Tools.GetPosition(_Entity)

	-- Is type string
	if type(_Entity) == "string" then
		_Entity = Logic.GetEntityIDByName(_Entity)
	end
	return Logic.GetEntityPosition(_Entity)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Is Entity Alive
-- Parameter 1: Entity ID or name
-- return: true or false

function Tools.IsEntityAlive(_EntityID) 

	return Logic.IsEntityAlive(_EntityID)
end



--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Is Entity Destroyed
-- Parameter 1: Entity ID or Name
-- return: true or false
function Tools.IsEntityDestroyed(_EntityID)
	
	return Logic.IsEntityDestroyed(_EntityID)
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Toolfunction to Fill Table with positions
-- Author: AnSu
-- Paramater 1: Name of Script entity at position
-- Paramater 2: Amount of script entities
-- Paramater 3: Name of table (global var has to defined befor calling this function)

function Tools.FillPositionList(_Name, _Number, _Table)

	local i 
	for i = 1, _Number, 1 
	do
		-- Create Table for positions
		_Table[i] = {}
		local PositionName = _Name .. i		
		Tools.GetEntityPosition(Logic.GetEntityIDByName( PositionName ), _Table[i])
	end
	
end
--------------------------------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Give player resources
-- Author: AnSu
-- Paramater 1: PlayerID
-- Paramater 2: Gold
-- Paramater 3: clay
-- Paramater 4: wood
-- Paramater 5: Stone
-- Paramater 6: Iron
-- Paramater 7: Sulfur

function Tools.GiveResouces(_PlayerID, _gold, _clay,_wood, _stone,_iron,_sulfur)
	
	Logic.AddToPlayersGlobalResource(_PlayerID,ResourceType.GoldRaw, _gold)
	Logic.AddToPlayersGlobalResource(_PlayerID,ResourceType.ClayRaw, _clay)
	Logic.AddToPlayersGlobalResource(_PlayerID,ResourceType.WoodRaw, _wood)
	Logic.AddToPlayersGlobalResource(_PlayerID,ResourceType.StoneRaw, _stone)
	Logic.AddToPlayersGlobalResource(_PlayerID,ResourceType.IronRaw, _iron)
	Logic.AddToPlayersGlobalResource(_PlayerID,ResourceType.SulfurRaw, _sulfur)
end
--------------------------------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Don't Use this function!!!!!

function Tools.CinematicMode(_CinematicStatus)
	Interface_SetCinematicMode(_CinematicStatus)
end
--------------------------------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Change health of entity to new percentage value of max health...entity can be damager or healed
-- Parameter 1: Entity ID
-- Parameter 2: Health in percent
-- Author: PeSp

function Tools.ChangeHealthOfEntity(_EntityID, _HealthInPercent)

	if Tools.IsEntityAlive(_EntityID) == false then
		return
	end

	-- Get max health of entity
	local Health = Logic.GetEntityMaxHealth(_EntityID)
	
	-- Calculate new Health
	Health = (Health * _HealthInPercent)/100
	
	-- Get current health of entity and create delta
	local DeltaHealth = Logic.GetEntityHealth(_EntityID)
	DeltaHealth = Health - DeltaHealth
	
	-- Is Positive Value, heal entity
	if DeltaHealth > 0
	then
		Logic.HealEntity(_EntityID, DeltaHealth)
	elseif DeltaHealth < 0
	then	
	-- else hurt it	
		Logic.HurtEntity(_EntityID, -DeltaHealth)
	end
end
--------------------------------------------------------------------------------------------------------------------


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Change invulnerability state of group
-- Parameter 1: Leader ID
-- Parameter 2: invulnerability state
-- Author: PeSp

function Tools.ChangeInvulnerabilityOfGroup(_LeaderId, _Flag)
	-- Get soldiers attached to leader
	local SoldiersList = {Logic.GetSoldiersAttachedToLeader(_LeaderId)}

	-- Change all soldiers
	local i
	for i = 2, SoldiersList[1] + 1 do
		Logic.SetEntityInvulnerabilityFlag(SoldiersList[i], _Flag)
	end
	
	-- Change player id of leader
	Logic.SetEntityInvulnerabilityFlag(_LeaderId, _Flag)
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Create explore area script entity and return id for further use
-- Parameter 1: Pos X
-- Parameter 2: Pos Y
-- Parameter 3: Range in meter
-- Return:	Entity ID
-- Author: PeSp

function Tools.ExploreArea(_x, _y, _Range)
	local ViewCenter = Logic.CreateEntity(Entities.XD_ScriptEntity, _x, _y, 0, 1)
	Logic.SetEntityExplorationRange(ViewCenter, _Range)
	return ViewCenter
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Check if player has enough resources
-- Parameter 1: Player ID
-- Parameter 2: Cost table
-- Return:	true of false
-- Author: PeSp

function Tools.HasPlayerEnoughResources(_PlayerID, _Costs)

	-- Get resources
	local Silver = Logic.GetPlayersGlobalResource( _PlayerID, ResourceType.Silver ) + Logic.GetPlayersGlobalResource( _PlayerID, ResourceType.SilverRaw)
	local Gold   = Logic.GetPlayersGlobalResource( _PlayerID, ResourceType.Gold ) + Logic.GetPlayersGlobalResource( _PlayerID, ResourceType.GoldRaw)
	local Iron   = Logic.GetPlayersGlobalResource( _PlayerID, ResourceType.Iron ) + Logic.GetPlayersGlobalResource( _PlayerID, ResourceType.IronRaw)
	local Stone  = Logic.GetPlayersGlobalResource( _PlayerID, ResourceType.Stone ) + Logic.GetPlayersGlobalResource( _PlayerID, ResourceType.StoneRaw)
	local Sulfur = Logic.GetPlayersGlobalResource( _PlayerID, ResourceType.Sulfur ) + Logic.GetPlayersGlobalResource( _PlayerID, ResourceType.SulfurRaw)
	
	-- Enough
	return 		(Silver >= _Costs[ResourceType.Silver])
		and 	(Gold >= _Costs[ResourceType.Gold])
		and 	(Iron >= _Costs[ResourceType.Iron])
		and 	(Stone >= _Costs[ResourceType.Stone])
		and 	(Sulfur >= _Costs[ResourceType.Sulfur])
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Check if player has enough resources
-- Parameter 1: Player ID
-- Parameter 2: Cost table
-- Return:	New leader ID
-- Author: PeSp

function Tools.ChangeGroupPlayerID(_LeaderId, _PlayerID)
	-- Get soldiers attached to leader
	local SoldiersList = {Logic.GetSoldiersAttachedToLeader(_LeaderId)}

	-- Change all soldiers
	local i
	for i = 2, SoldiersList[1] + 1 do
		Logic.ChangeEntityPlayerID(SoldiersList[i], _PlayerID)
	end
	
	-- Change player id of leader
	local NewLeaderID = Logic.ChangeEntityPlayerID(_LeaderId, _PlayerID)
	
	-- Get soldiers
	Tools.AttachSoldiersToLeader(NewLeaderID, SoldiersList[1])
	
	-- Return new leader ID
	return NewLeaderID
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Fill up table with positions and IDs
-- Param1: Name before index
-- Param2: Highest index
-- Param3: Name after index
-- Param4: Table that should be filled
-- Author: PeSp

function Tools.GetPositionsAndIDs(_PreFix, _Count, _Ending, _Table)

	-- For each position
	local i
	for i = 1, _Count do
		-- generate name
		local Name = _PreFix..i.._Ending
		
		-- Create empty table entry for index
		_Table[i] = {}
		
		-- Get id for name
		_Table[i].ID = Logic.GetEntityIDByName(Name)
		
		-- Get position for ID
		Tools.GetEntityPosition(_Table[i].ID, _Table[i])		
	end
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Create trigger for every second
-- Param1: Name of Condition/Action function
-- Return: Trigger ID
-- Author: PeSp

function Tools.RequestTrigger(_Name)
	return Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND,"Condition_".._Name,"Action_".._Name,1)
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Add a note which will not be displayed later
-- Param1: Text
-- Return: Nothing
-- Author: SeRo
function Tools.DebugAddNote(_Text)
	if Game.IsMapDebugSet() then
		GUI.AddNote("DEBUG REPORT: ".._Text)
	end
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Add a note from a text Key
-- Param1: Text Key
-- Return: Nothing
-- Author: SeRo
function Tools.AddNote(_Text, _Duration)
	GUI.AddNote(XGUIEng.GetStringTableText(_Text), _Duration)
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Add a note from a text Key
-- Param1: Text Key
-- Return: Nothing
-- Author: SeRo
function Tools.AddStaticNote(_Text)
	GUI.AddStaticNote(XGUIEng.GetStringTableText(_Text))
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Add a note which will not be displayed later
-- Param1: Text
-- Return: Nothing
-- Author: SeRo
function Tools.DebugKeyBindDown(_Key, _Function)
	if Game.IsMapDebugSet() then
		Input.KeyBindDown(_Key,_Function)
	end
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Is entity visible
-- Param1: Entity ID
-- Return: true or false
-- Author: PeSp
function Tools.IsEntityOrGroupVisible(_PlayerID, _EntityID)
	-- Position table
	local Position = {}
	-- Is entity alive
	if not Tools.IsEntityDestroyed(_EntityID) then
		-- Is leader
		if Logic.IsLeader(_EntityID) == 1 then
			-- Get List of soldiers from leader
			local Units = {Logic.GetSoldiersAttachedToLeader(_EntityID)}
	
			-- Any unit visible?
			local j
			for j=2, Units[1]+1 do
				-- Get entity position
				Tools.GetEntityPosition(Units[i], Position)
		
				-- Is entity visible, don't remove them
				if Logic.IsMapPositionExplored(_PlayerID, Position.X, Position.Y) == 1 then
					return 1
					
				end				
			end
		end	
		-- Get entity position
		Tools.GetEntityPosition(_EntityID, Position)
		
		-- Is entity not visible, delete it
		return Logic.IsMapPositionExplored(_PlayerID, Position.X, Position.Y)
	else
		-- is already dead
		return 0
	end
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Remove unit if it moves into black fog
-- Param1: Entity ID
-- Return: Nothing
-- Author: PeSp
function Tools.RemoveEntityInFog(_PlayerID, _EntityID)
	-- Create remove trigger
	Trigger.RequestTrigger( Events.LOGIC_EVENT_EVERY_SECOND,
				"GlobalCondition_RemoveEntityInFog",
				"GlobalAction_RemoveEntityInFog_Global",
				1,
				{_PlayerID, _EntityID},
				{_EntityID} )
end
function GlobalCondition_RemoveEntityInFog(_PlayerID, _EntityID)
	-- is visible
	local visible = Tools.IsEntityOrGroupVisible(_PlayerID, _EntityID)
	return visible == 0
end
function GlobalAction_RemoveEntityInFog_Global(_EntityID)
	-- Remove entity or group
	if Logic.IsLeader(_EntityID) == 1 then
		-- Remove group
		Logic.DestroyGroupByLeader(_EntityID)
	else
		Logic.DestroyEntity(_EntityID)
	end
	return 1
end

-------------------------------------------------------------------------------------------------------
-- Set marketplace start price for resource, if playerId is optional
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _price Number new price
-- @param _resourceType Number resource type id
-- @see SetResourceDeflation.
-- @see SetResourceInflation.

function SetResourcePrice(_playerId, _price, _resourceType)
	
	if _resourceType == nil then
		_resourceType = _price
		_price = _playerId
		_playerId = GUI.GetPlayerID()
	end

	Logic.SetCurrentPrice(_playerId, _resourceType, _price)

end


-------------------------------------------------------------------------------------------------------
-- Set marketplace deflation for resource, if playerId is optional
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _value Number deflation value
-- @param _resourceType Number resource type id
-- @see SetResourcePrice.
-- @see SetResourceInflation.

function SetResourceDeflation(_playerId, _value, _resourceType)
	
	if _resourceType == nil then
		_resourceType = _value
		_value = _playerId
		_playerId = GUI.GetPlayerID()
	end

	Logic.SetCurrentDeflation(_playerId, _resourceType, _value)

end

-------------------------------------------------------------------------------------------------------
-- Set marketplace inflation for resource, if playerId is optional
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _value Number inflation value
-- @param _resourceType Number resource type id
-- @see SetResourcePrice.
-- @see SetResourceDeflation.

function SetResourceDeflation(_playerId, _value, _resourceType)
	
	if _resourceType == nil then
		_resourceType = _value
		_value = _playerId
		_playerId = GUI.GetPlayerID()
	end

	Logic.SetCurrentInflation(_playerId, _resourceType, _value)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Remove unit if it moves into black fog or arrives at its destination
-- Param1: Player ID
-- Param2: Entity ID
-- Param3: Destination
-- Return: Nothing
-- Author: Siedler1997
function Tools.RemoveEntityInFogOrDestination(_PlayerID, _EntityID, _Position)
	-- Create remove trigger
	Trigger.RequestTrigger( Events.LOGIC_EVENT_EVERY_SECOND,
				"GlobalCondition_RemoveEntityInFogOrDestination",
				"GlobalAction_RemoveEntityInFogOrDestination_Global",
				1,
				{_PlayerID, _EntityID, _Position},
				{_EntityID} )
end
function GlobalCondition_RemoveEntityInFogOrDestination(_PlayerID, _EntityID, _Position)
	-- is visible
	local visible = Tools.IsEntityOrGroupVisible(_PlayerID, _EntityID)
	local isNear = IsNear(_EntityID, _Position, 300)
	--Message("isNear: " .. isNear .. " ; visible: " .. visible)
	Message(isNear)
	return (isNear or visible == 0)
end
function GlobalAction_RemoveEntityInFogOrDestination_Global(_EntityID)
	-- Remove entity or group
	if Logic.IsLeader(_EntityID) == 1 then
		-- Remove group
		Logic.DestroyGroupByLeader(_EntityID)
	else
		Logic.DestroyEntity(_EntityID)
	end
	return 1
end