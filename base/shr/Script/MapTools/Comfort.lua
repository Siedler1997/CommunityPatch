------------------------------------------------------------------------------------------------------
-- Comfort Layer.
-- Comfort layer which contains a set of Lua functions to simplify the access to the SettlerHoK logic.

LOW_EXPERIENCE 			= 0
MEDIUM_EXPERIENCE 		= 1
HIGH_EXPERIENCE 		= 2
VERYHIGH_EXPERIENCE 	= 3

UPGRADE     = 0
TECHNOLOGY  = 1

CP_Installed = true
CP_HeroMarkColor = 2
CP_EvilMod = {}	
for i = 1, 8 do
	CP_EvilMod[i] = {}
	CP_EvilMod[i].UnitState = 0
	CP_EvilMod[i].TowerState = 0
end

-------------------------------------------------------------------------------------------------------
-- Start the briefing system by using the specified briefing table.
-- @param _briefing Table with all pages of the briefing (see tutorial for more information).
-- @see ResolveBriefing.

function StartBriefing(_briefing)
	if waitForBriefingEndJobId~=nil then
		if JobIsRunning(waitForBriefingEndJobId) == true then
			return
			end
		end
	if backupBriefing ~= nil then
		backupBriefing = nil
		end
	backupBriefing = {}
	table.insert(backupBriefing,_briefing)
	if briefingIsActive == true then
		waitForBriefingEndJobId = StartJob("WaitForBriefingEnd")
	else
		ExecuteBriefing(backupBriefing[1])
		end
	end
	
-------------------------------------------------------------------------------------------------------
-- Resolve briefing page, hide exploration, remove marker, resolve quests etc. of given page.
-- @param _page Table page that should be resolved.
-- @see StartBriefing.

function ResolveBriefing(_page)

	--	resolve handling

		if _page.isResolved == nil then
			_page.isResolved = false
			end
		if _page.isResolved == true then
			return
			end
		_page.isResolved = true

	--	quest handling

		if _page.quest ~= nil then
			assert(_page.quest.id ~= nil)
			assert(_page.quest.type ~= nil)
			Logic.SetQuestType(1,_page.quest.id,_page.quest.type +1,1)
			end

	--	destroy all markers

		if _page.marker ~= nil then

			if type(_page.marker) == "table" then

				table.foreach(_page.marker, function(_,_marker) GUI.DestroyMinimapPulse(_marker.position.X,_marker.position.Y) end)

			else

				assert(_page.position ~= nil)
				GUI.DestroyMinimapPulse(_page.position.X,_page.position.Y)

			end

		end

	--	destroy npc information

		if _page.npc ~= nil then
			if _page.npc.id ~= nil then
				if IsValid(_page.npc.id) then
					DisableNpcMarker(_page.npc.id)
					end
				end
			end

	--	unexplore area

		if _page.explore ~= nil then
			assert(_page.position ~= nil)
			
			if Game.IsDebugVersion() == 1 then
			assert(_page.exploreId ~= nil)
			end
			
			if _page.exploreId ~= 0 and _page.exploreId ~= nil then		
				Logic.DestroyEntity(_page.exploreId)
				end
			end

	--	destroy pointer

		if _page.pointerId ~= nil then
			Logic.DestroyEffect(_page.pointerId)
			end

	end
	
-------------------------------------------------------------------------------------------------------
-- Creates a chest at every position, which is specified by an entity.  The entity needs a naming.
-- syntax: GoldChest<number>. eg. GoldChest1 , GoldChest2 , GoldChest3 , ...
-- @see CreateRandomChests.
-- @see CreateRandomGoldChest.
-- @see CreateGoldChest.
-- @see CreateIronChest.
-- @see CreateChestOpener.
-- @see StartChestQuest.

function CreateRandomGoldChests()
	local chestCount = 1
	local continueLoop = true
	while continueLoop == true do
		local name = "GoldChest"..chestCount
		if IsValid(name) then
			CreateRandomGoldChest(GetPosition(name))
			chestCount=chestCount+1
		else
			continueLoop = false
			end
		end
	end

-------------------------------------------------------------------------------------------------------
-- Creates a chest at every position, which is specified by an entity.  The entity needs a naming.
-- syntax: RandomChest<number>. eg. RandomChest1 , RandomChest2 , RandomChest3 , ...
-- @see CreateRandomGoldChests.
-- @see CreateRandomGoldChest.
-- @see CreateGoldChest.
-- @see CreateIronChest.
-- @see CreateChestOpener.
-- @see StartChestQuest.

function CreateRandomChests()
	local chestCount = 1
	local continueLoop = true
	while continueLoop == true do
		local name = "RandomChest"..chestCount
		if IsValid(name) then
			CreateChest(GetPosition(name))
			chestCount=chestCount+1
		else
			continueLoop = false
			end
		end
	end

-------------------------------------------------------------------------------------------------------
-- Creates a chest at the specified position.
-- @param _position Table with the position of the chest.
-- @see CreateRandomGoldChests.
-- @see CreateRandomChests.
-- @see CreateGoldChest.
-- @see CreateIronChest.
-- @see CreateChestOpener.
-- @see StartChestQuest.

function CreateRandomGoldChest(_position)
	return CreateChest(_position,chestDefaultCallbackRandomGold)
	end

-------------------------------------------------------------------------------------------------------
-- Creates a chest at the specified position.
-- @param _position Table with the position of the chest.
-- @see CreateRandomGoldChests.
-- @see CreateRandomChests.
-- @see CreateRandomGoldChest.
-- @see CreateIronChest.
-- @see CreateChestOpener.
-- @see StartChestQuest.

function CreateGoldChest(_position)
	return CreateChest(_position,chestDefaultCallbackGold)
	end

-------------------------------------------------------------------------------------------------------
-- Creates a chest at the specified position.
-- @param _position Table with the position of the chest.
-- @see CreateRandomGoldChests.
-- @see CreateRandomChests.
-- @see CreateRandomGoldChest.
-- @see CreateGoldChest.
-- @see CreateChestOpener.
-- @see StartChestQuest.

function CreateIronChest(_position)
	return CreateChest(_position,chestDefaultCallbackIron)
	end

-------------------------------------------------------------------------------------------------------
-- Defines an entity as chest opener.
-- @param _name String with the name of the entity.
-- @see CreateRandomGoldChests.
-- @see CreateRandomChests.
-- @see CreateRandomGoldChest.
-- @see CreateGoldChest.
-- @see CreateIronChest.
-- @see StartChestQuest.

function CreateChestOpener(_name)
	table.insert(chestOpener,_name)
	end

-------------------------------------------------------------------------------------------------------
-- Must be called to start the chest handling.
-- @see CreateRandomGoldChests.
-- @see CreateRandomChests.
-- @see CreateRandomGoldChest.
-- @see CreateGoldChest.
-- @see CreateIronChest.
-- @see CreateChestOpener.

function StartChestQuest()
	StartJob("ChestJob")
	end
	
-------------------------------------------------------------------------------------------------------
-- Returns the logic Id of an entity.
-- @param _name String with the name of the entity.
-- @return Number with the id of the entity.

function GetEntityId(_name)
	if type(_name) == "string" then
		return Logic.GetEntityIDByName(_name)
	else
		return _name
	    end
    end

-------------------------------------------------------------------------------------------------------
-- Returns a random value.
-- @param _limit Number with the upper limit. The random value is between 0 and limit-1.
-- @return Number with the random value.

function GetRandom(_limit)
	return Logic.GetRandom(_limit)
    end

-------------------------------------------------------------------------------------------------------
-- Feeds an army with default values.
-- @param _army Table with the description of an army.

function SetupArmy(_army)
	AI.Army_SetAnchor(
		_army.player,
		_army.id,
		_army.position.X,
		_army.position.Y,
		_army.rodeLength
	)
	AI.Army_SetScatterTolerance(
		_army.player,
		_army.id,
		4
	)
	if _army.beAgressive ~= nil then
		AI.Army_BeAlwaysAggressive(_army.player,_army.id)
		end
	end

-------------------------------------------------------------------------------------------------------
-- Returns true, when two entities are close together.
-- @param _entity String with the name of the first entity or Number with the id of the entity.
-- @param _entity String with the name of the second entity or Number with the id of the entity.
-- @return Number with the result flag.

function IsNear(_entity,_target,_distance)
	local entityId = GetID(_entity)
	local targetId = GetID(_target)
	-- Is any dead...never reached
	if entityId ~= 0 and targetId ~= 0 then
		return Logic.CheckEntitiesDistance(entityId, targetId, _distance) == 1
	else
		return false
	    end
    end

-------------------------------------------------------------------------------------------------------
-- Replace an entity by a new one.
-- @param _entity String with name or Number of the entity to be replaced
-- @param _entityType Number with the type of the new entity.

function ReplaceEntity(_Entity, _EntityType)
	local entityId      = GetID(_Entity)
	local pos 			= GetPosition(_Entity)
	local name 			= Logic.GetEntityName(entityId)
	local player 		= Logic.EntityGetPlayer(entityId)
	local orientation 	= Logic.GetEntityOrientation(entityId)
	local wasSelected	= IsEntitySelected(_Entity)
	if wasSelected then
		GUI.DeselectEntity(entityId)
    	end
	DestroyEntity(_Entity)
	local newEntityId = Logic.CreateEntity(_EntityType,pos.X,pos.Y,orientation,player)
	Logic.SetEntityName(newEntityId, name)
	if wasSelected then
		GUI.SelectEntity(newEntityId)
    	end
	GroupSelection_EntityIDChanged(entityId, newEntityId)
	return newEntityId
    end

-------------------------------------------------------------------------------------------------------
-- Informs the game about the victory of the human player.
-- @see Defeat.

function Victory()
	if Logic.PlayerGetGameState(gvMission.PlayerID) == 1 then
		Logic.PlayerSetGameStateToWon(gvMission.PlayerID)
    	end
	do
		
		if SetGDBFlagForExtraCampaign ~= nil then
			SetGDBFlagForExtraCampaign()
		else
			-- Get map name
			local MapName = Framework.GetCurrentMapName()
			-- Create key
			local KeyName = "Game\\Campaign01\\WonMap_" .. MapName
			-- Set GDB key
			GDB.SetValue( KeyName, 1 )
	    	end
	    end
    	
    	
	end

-------------------------------------------------------------------------------------------------------
-- Informs the game about the defeat of the human player.
-- @see Victory.

function Defeat()
	if Logic.PlayerGetGameState(gvMission.PlayerID) == 1 then
		Logic.PlayerSetGameStateToLost(gvMission.PlayerID)
    	end
	Trigger.DisableTriggerSystem(1)
	end

-------------------------------------------------------------------------------------------------------
-- Set the health of an entity.
-- @param _entity String with the name of the entity or Number with the id of the entity.
-- @param _health Number with the number of health points.

function SetHealth (_entity,_health)
	GlobalMissionScripting.ChangeHealthOfEntity(GetEntityId(_entity),_health)
	end

-------------------------------------------------------------------------------------------------------
-- Rotates an specified entity by an angle.
-- @param _entity String with the name of the entity or Number with the id of the entity.
-- @param _angle Number with the rotation angle.

function RotateEntity(_entity,_angle)
	local angle
	if _angle == nil then
		angle = Logic.GetRandom(360)
	else
		angle = _angle
		end
	Logic.RotateEntity(GetEntityId(_entity),angle)
	end

-------------------------------------------------------------------------------------------------------
-- Makes an entity vulnerable.
-- @param _entity String with the name of the entity or Number with the id of the entity.
-- @see MakeInvulnerable.

function MakeVulnerable (_entity)
	Logic.SetEntityInvulnerabilityFlag(GetEntityId(_entity),0)
	end

-------------------------------------------------------------------------------------------------------
-- Makes an entity invulnerable.
-- @param _entity String with the name of the entity or Number with the id of the entity.
-- @see MakeVulnerable.

function MakeInvulnerable(_entity)
	Logic.SetEntityInvulnerabilityFlag(GetEntityId(_entity),1)
	end

-------------------------------------------------------------------------------------------------------
-- Returns the position of an entity or an army.
-- You can use this function to receive the position of an AI army, too.
-- Use the army table as parameter.
-- @param _entity String with the name of the entity or Number with the id of the entity or Table of an AI army.
-- @return Table with the position (X,Y).

function GetPosition(_entity)
	local position = {}
	if type(_entity) == "table" then
		position.X,position.Y = AI.Army_GetPosition(_entity.player,_entity.id)
	else
		GlobalMissionScripting.GetEntityPosition(GetEntityId(_entity),position)
		end
	return position
	end

-------------------------------------------------------------------------------------------------------
-- Set the position of an entity.
-- This function works ONLY for entities.
-- @param _entity String with the name of the entity or Number with the id of the entity.
-- @param _position Table with the position (X,Y).

function SetPosition(_entity,_position)
	local entityId = GetEntityId(_entity)
	--	check entity
		assert(entityId ~= 0)
		
		if (Logic.IsLeader(entityId) ~= 0) then
			assert(Logic.LeaderGetNumberOfSoldiers(entityId) == 0)
		end
		
				
	--	collect information about entity
		local health 		= Logic.GetEntityHealth(entityId)
		local maxHealth 	= Logic.GetEntityMaxHealth(entityId)
		local hurt 			= maxHealth - health;
		local entityType 	= Logic.GetEntityType(entityId)
		local player 		= Logic.EntityGetPlayer(entityId)
		local name 			= Logic.GetEntityName(entityId)
		local wasSelected	= IsEntitySelected(entityId)
		if wasSelected then
			GUI.DeselectEntity(entityId)
    		end
	--	destroy old one
		DestroyEntity(_entity)
	--	create entity
		local newEntityId
		if type(_entity) == "string" then
			newEntityId = CreateEntity(player,entityType,_position,_entity)
		else
			newEntityId = CreateEntity(player,entityType,_position,name)
    		end
	--	select
		if wasSelected then
			GUI.SelectEntity(newEntityId)
	    	end
		GroupSelection_EntityIDChanged(entityId, newEntityId)
	--	hurt entity
		Logic.HurtEntity(_newEntityId,hurt)

	-- return new id
		return newEntityId

	end

-------------------------------------------------------------------------------------------------------
-- Returns the id of the closest enemy entity to the specified army.
-- The _range parameter is optional, without _range you will get the closest entity in range of the army activation radius.
-- @param _army Table with the description of an army.
-- @param _range Number with the search range(optional!).
-- @return Number with the id of the closest enemy entity, otherwise 0.

function GetClosestEntity(_army,_range)
	if _range ~= nil then
		return AI.Army_SearchClosestEnemy(_army.player,_army.id,_army.position.X,_army.position.Y,_range)
	else
		return AI.Army_SearchClosestEnemy(_army.player,_army.id,_army.position.X,_army.position.Y,_army.rodeLength)
		end
	end

-------------------------------------------------------------------------------------------------------
-- Returns True when the specified entity is selected, otherwise false.
-- @param _entity String with the name of the entity or Number with the id of the entity.
-- @return Bool with True when entity is selected, otherwise false.

function IsEntitySelected(_entity)
	local selectedEntities = {GUI.GetSelectedEntities()}
	if selectedEntities == nil then
		return false
	    end
	local entityID = GetEntityId(_entity)
	local i
	for i=1,table.getn(selectedEntities) do
		if selectedEntities[i] == entityID then
			return true
		    end
	    end
	return false
end

-------------------------------------------------------------------------------------------------------
-- AI army moves slowly forward to the closest enemy.
-- @param _army Table with the description of an army.
-- @see Retreat.
-- @see Defend.
-- @see FrontalAttack.
-- @see Synchronize.

function Advance(_army)
	local distanceToEnemy = AI.Army_GetDistanceBetweenAnchorAndEnemy(_army.player,_army.id)
	AI.Army_SetAnchorRodeLength(_army.player,_army.id,distanceToEnemy)
	end

-------------------------------------------------------------------------------------------------------
-- AI army defends region, defined in the army table.
-- @param _army Table with the description of an army.
-- @see Retreat.
-- @see FrontalAttack.
-- @see Advance.
-- @see Redeploy.
-- @see Synchronize.

function Defend(_army)
	local entityId = AI.Army_SearchClosestEnemy(_army.player,_army.id,_army.position.X,_army.position.Y,_army.rodeLength)
	if entityId ~= 0 then
		Redeploy(_army,GetPosition(entityId))
		_army.defend = 1
	elseif _army.defend ~= nil then
		Redeploy(_army,_army.position)
		_army.defend = nil
		end
	end

-------------------------------------------------------------------------------------------------------
-- AI army attacks cloesest enemy immediately.
-- @param _army Table with the description of an army.
-- @see Retreat.
-- @see Advance.
-- @see Defend.
-- @see Redeploy.
-- @see Synchronize.

function FrontalAttack(_army)
	local enemyId = AI.Army_GetEntityIdOfEnemy(_army.player,_army.id)
	if enemyId ~= 0 then
		local position = GetPosition(enemyId)
		AI.Army_SetAnchor(_army.player,_army.id,position.X,position.Y,_army.rodeLength)
		end
	end

-------------------------------------------------------------------------------------------------------
-- AI army moves back.
-- @param _army Table with the description of an army.
-- @param _rodeLength Number with the new activation radius.
-- @see FrontalAttack.
-- @see Advance.
-- @see Defend.
-- @see Redeploy.
-- @see Synchronize.

function Retreat(_army,_rodeLength)
	if _rodeLength == nil then
		AI.Army_SetAnchor(_army.player,_army.id,_army.position.X,_army.position.Y,_army.rodeLength)
	else
		AI.Army_SetAnchor(_army.player,_army.id,_army.position.X,_army.position.Y,_rodeLength)
		end
	end

-------------------------------------------------------------------------------------------------------
-- AI army redeploys at specified position.
-- @param _army Table with the description of an army.
-- @param _position Table with the new position.
-- @param _rodeLength Number with the new activation radius.
-- @see FrontalAttack.
-- @see Advance.
-- @see Defend.
-- @see Retreat.
-- @see Synchronize.

function Redeploy(_army,_position,_rodeLength)
	if _rodeLength == nil then
		AI.Army_SetAnchor(_army.player,_army.id,_position.X,_position.Y,_army.rodeLength)
	else
		AI.Army_SetAnchor(_army.player,_army.id,_position.X,_position.Y,_rodeLength)
		end
	end

-------------------------------------------------------------------------------------------------------
-- Synchonize the deployment of two armies.
-- @param _army Table with the description of an army to be melted.
-- @param _army Table with the description of an army to be synchronized.
-- @see FrontalAttack.
-- @see Advance.
-- @see Defend.
-- @see Retreat.
-- @see Redeploy.

function Synchronize(_army0,_army1)
	local position = {}
	position = GetPosition(_army0)
	AI.Army_SetAnchor(_army1.player,_army1.id,position.X,position.Y,_army0.rodeLength)
	end

-------------------------------------------------------------------------------------------------------
-- Starts a new job.
-- @param _name String with the name of the job.
-- @return Number with the id of the job.
-- @see StartHiResJob.
-- @see JobIsRunning.
-- @see EndJob.
-- @see StartSimpleHiResJob.

function StartJob(_name)
	return Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND,"Condition_".._name,"Action_".._name,1)
	end

-------------------------------------------------------------------------------------------------------
-- Starts a new job.
-- @param _name String with the name of the job.
-- @return Number with the id of the job.
-- @see StartHiResJob.
-- @see StartSimpleJob
-- @see JobIsRunning.
-- @see EndJob.
-- @see StartSimpleHiResJob.

function StartSimpleJob(_name)
	return Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND,"",_name,1)
	end

-------------------------------------------------------------------------------------------------------
-- Starts a new high resolution job.
-- @param _name String with the name of the job.
-- @return Number with the id of the job.
-- @see StartHiResJob.
-- @see StartSimpleJob
-- @see JobIsRunning.
-- @see EndJob.

function StartSimpleHiResJob(_name)
	return Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_TURN,"",_name,1)
	end

-------------------------------------------------------------------------------------------------------
-- Starts a new high resolution job.
-- That type of job is much faster and cost much more performance than a standard job, so be carefully by using it.
-- @param _name String with the name of the job.
-- @return Number with the id of the job.
-- @see StartJob.
-- @see JobIsRunning.
-- @see EndJob.
-- @see StartSimpleHiResJob.

function StartHiResJob(_name)
	return Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_TURN,"Condition_".._name,"Action_".._name,1)
	end

-------------------------------------------------------------------------------------------------------
-- Returns the state of a job.
-- @param _id Number with the id of the job.
-- @return Bool with the current state of the job. True when running, otherwise False.
-- @see StartHiResJob.
-- @see StartJob.
-- @see EndJob.
-- @see StartSimpleHiResJob.

function JobIsRunning(_id)
	return Trigger.IsTriggerEnabled(_id)
	end

-------------------------------------------------------------------------------------------------------
-- End a running job.
-- @param _id Number with the id of the job.
-- @see StartHiResJob.
-- @see StartJob.
-- @see JobIsRunning.
-- @see StartSimpleHiResJob.

function EndJob(_id)
	Trigger.UnrequestTrigger(_id)
	end

-------------------------------------------------------------------------------------------------------
-- Returns true when an entity is still alive.
-- @param _entity String with the name of the entity.
-- @return Bool with True when entity is alive and valid, otherwise false.

function IsValid(_entity)
	return Logic.IsEntityDestroyed(_entity) == false
	end

-------------------------------------------------------------------------------------------------------
-- Returns True when all Leaders of the army are still alive.
-- @param _army Table with the description of an army.
-- @return Bool with True, when all elements of the army are still alive, otherwise false.
-- @see IsWeak.
-- @see IsVeryWeak.

function HasFullStrength(_army)
	if AI.Army_GetNumberOfTroops(_army.player,_army.id) >= _army.strength then
		return true
	else
		return false
		end
    end

-------------------------------------------------------------------------------------------------------
-- Returns True when at least one Leader of the army is not alive anymore.
-- @param _army Table with the description of an army.
-- @return Bool with True, when one element of the army is dead.
-- @see IsVeryWeak.
-- @see HasFullStrength.

function IsWeak(_army)
	return AI.Army_GetNumberOfTroops(_army.player,_army.id) < _army.strength
    end

-------------------------------------------------------------------------------------------------------
-- Returns True when many Leaders of the army are dead.
-- @param _army Table with the description of an army.
-- @return Bool with True, when many elements are dead.
-- @see IsWeak.
-- @see HasFullStrength.

function IsVeryWeak(_army)
	return AI.Army_GetNumberOfTroops(_army.player,_army.id) < (_army.strength / 3)
    end

-------------------------------------------------------------------------------------------------------
-- Returns the number of Leaders which are attached to an AI army.
-- @param _army Table with the description of an army.
-- @return Number with the number of attached leaders.

function GetNumberOfLeaders(_army)
	return AI.Army_GetNumberOfTroops(_army.player,_army.id)
	end

-------------------------------------------------------------------------------------------------------
-- Print a message on the screen.
-- @param _text String with the message.

function Message(_text)
	GUI.AddNote(_text)
	end

-------------------------------------------------------------------------------------------------------
-- Return the id of the player.
-- @param _entity String with the name of the entity or Number with the id of the entity.
-- @return Number with the id of the player.

function GetPlayer(_entity)
	local entityId = GetEntityId(_entity)
	assert(IsValid(entityId))
	return Logic.EntityGetPlayer(entityId)
	end

-------------------------------------------------------------------------------------------------------
-- Returns True when the specified entity is dead.
-- You can use that function for AI armies, too.
-- @param _entity String with the name of the entity or Number with the id of the entity or Table of an AI army.
-- @return Bool with True when entity is dead, otherwise False.
-- @see IsAlive.
-- @see IsDestroyed.
-- @see IsExisting.

function IsDead(_entity)
	if type(_entity) == "table" then
		return AI.Army_GetNumberOfTroops(_entity.player,_entity.id) == 0
    	end
	local entityId = 0
	if type(_entity) == "string" then
		if Logic.IsEntityDestroyed(_entity) then
			return true
			end
		entityId = Logic.GetEntityIDByName(_entity)
	else
		entityId = _entity
    	end

	if entityId == 0 then
		return true
	    end
	if AI.Entity_IsDead(entityId) == 1 then
		return true
	    end
	return false
    end

-------------------------------------------------------------------------------------------------------
-- Returns True when the specified entity is destroyed(not in game).
-- @param _entity String with the name of the entity or Number with the id of the entity.
-- @return Bool with True when entity is destroyed (not on map), otherwise False.
-- @see IsAlive.
-- @see IsDead.
-- @see IsExisting.

function IsDestroyed(_entity)

	return 	Logic.IsEntityDestroyed(_entity)

end

-------------------------------------------------------------------------------------------------------
-- Returns True when the specified entity is existing in game.
-- @param _entity String with the name of the entity or Number with the id of the entity.
-- @return Bool with True when entity is existing (in game), otherwise False.
-- @see IsAlive.
-- @see IsDead.
-- @see IsDestroyed.

function IsExisting(_entity)

	return not Logic.IsEntityDestroyed(_entity)

end

-------------------------------------------------------------------------------------------------------
-- Returns True when the specified entity is alive.
-- You can not use that function for AI armies.
-- @param _entity String with the name of the entity or Number with the id of the entity.
-- @return Bool with True when entity is alive, otherwise False.
-- @see IsDead.
-- @see IsDestroyed.
-- @see IsExisting.

function IsAlive(_entity)
	return IsDead(_entity) ~= true
	end

-------------------------------------------------------------------------------------------------------
-- Creates an entity.
-- @param _playerId Number with the id of the player.
-- @param _entity Number with the type of the entity (see Entity Type List).
-- @param _position Table with the position of the entity (see Position Table).
-- @param _name String with the name of the entity.
-- @return Number with the id of the created entity.
-- @see DestroyEntity.

function CreateEntity(_playerId,_entity,_position,_name)
	local entityId = Logic.CreateEntity(_entity,_position.X,_position.Y,Logic.GetRandom(360),_playerId)
	if _name ~= nil then
		Logic.SetEntityName(entityId,_name)
		end
	return entityId
	end

-------------------------------------------------------------------------------------------------------
-- Destroys an entity.
-- @param _entity Number with the id of the entity, or String with the name of the entity.
-- @see CreateEntity.

function DestroyEntity(_entity)
	local id = GetEntityId(_entity)
	if Logic.IsLeader(id) == 1 then
		Logic.DestroyGroupByLeader(id)
	else
		Logic.DestroyEntity(id)
	    end
    end

-------------------------------------------------------------------------------------------------------
-- Enlarges the specified army with the described troop.
-- @param _army Table with the description of an army.
-- @param _troop Table with the description of a troop.

function EnlargeArmy(_army,_troop)
	AI.Entity_ConnectLeader(CreateTroop(_army,_troop),_army.id)
	end

-------------------------------------------------------------------------------------------------------
-- Order an entity to attack a position on the map.
-- @param _entity Number with the id of the entity, or String with the name of an entity.
-- @param _position Table with the attack position.
-- @see Move.

function Attack(_entity,_position)
	local entityId = GetEntityId(_entity)
	local position = {}
	if type(_position) == "string" or type(_position) == "number" then
		position = GetPosition(_position)
	else
		position = _position;
		end
	Logic.GroupAttackMove(entityId,position.X,position.Y,-1)
	end

-------------------------------------------------------------------------------------------------------
-- Move an entity to a specified position.
-- @param _entity Number with the id of the entity, or String with the name of an entity.
-- @param _position Table with the movement position.
-- @see Attack.
-- @see LookAt.

function Move(_entity,_position,_distance)
	local entityId = GetEntityId(_entity)
	-- Is distance valid...create move with approach distance
	if _distance ~= nil and _distance > 0 then
		-- Get target entity ID
		local targetEntityId = 0
		if type(_position) == "string" then
			targetEntityId = Logic.GetEntityIDByName(_position)
		else
			targetEntityId = _position;
		    end
		-- Is approach task done, do nothing
		if ApproachTask(entityId, targetEntityId, _distance) then
			return
		    end
		-- Create approach task
		Trigger.RequestTrigger(	Events.LOGIC_EVENT_EVERY_SECOND,
								nil,
								"ApproachTask",
								1,
								{},
								{entityId, targetEntityId, _distance})
	end
	local position = {}
	if type(_position) == "string" or type(_position) == "number" then
		position = GetPosition(_position)
	else
		position = _position;
		end
	Logic.MoveSettler(entityId,position.X,position.Y)
    end

-------------------------------------------------------------------------------------------------------
-- Feeds the AI system with a construction plan file.
-- @param _playerId Number with the id of the player.
-- @param _planFile Table with the plan file table (see Tables).
-- @see FeedAiWithResearchPlanFile.

function FeedAiWithConstructionPlanFile(_playerId,_planFile)
   	table.foreach(_planFile,function(_,_value)if _value.level == nil then AI.Village_StartConstruction(_playerId,_value.type,_value.pos.X,_value.pos.Y,0)else AI.Village_StartConstruction(_playerId,_value.type,_value.pos.X,_value.pos.Y,_value.level)end end)
   	end

-------------------------------------------------------------------------------------------------------
-- Feeds the AI system with a research plan file.
-- @param _playerId Number with the id of the player.
-- @param _planFile Table with the research plan file (see Tables).
-- @see FeedAiWithConstructionPlanFile.

function FeedAiWithResearchPlanFile(_playerId,_planFile)
    table.foreach(_planFile,function(_,_value)if _value.location ~= nil then AI.Village_StartResearch(_playerId,_value.type,_value.prob,_value.command,_value.location)else AI.Village_StartResearch(_playerId,_value.type,_value.prob,_value.command)end end)
	end

-------------------------------------------------------------------------------------------------------
-- Set the diplomacy state between the players.
-- @param _playerId1 Number with the id of the first player.
-- @param _playerId2 Number with the id of the second player.
-- @see SetNeutral.
-- @see SetFriendly.

function SetHostile(_playerId1,_playerId2)
    Logic.SetDiplomacyState(_playerId1,_playerId2,Diplomacy.Hostile)
	end

-------------------------------------------------------------------------------------------------------
-- Set the diplomacy state between the players.
-- @param _playerId1 Number with the id of the first player.
-- @param _playerId2 Number with the id of the second player.
-- @see SetHostile.
-- @see SetFriendly.

function SetNeutral(_playerId1,_playerId2)
    Logic.SetDiplomacyState(_playerId1,_playerId2,Diplomacy.Neutral)
	end

-------------------------------------------------------------------------------------------------------
-- Set the diplomacy state between the players.
-- @param _playerId1 Number with the id of the first player.
-- @param _playerId2 Number with the id of the second player.
-- @see SetHostile.
-- @see SetNeutral.

function SetFriendly(_playerId1,_playerId2)
    Logic.SetDiplomacyState(_playerId1,_playerId2,Diplomacy.Friendly)
	end

-------------------------------------------------------------------------------------------------------
-- Setup Normal Weather Gfx Set.
-- @see SetupEvelanceWeatherGfxSet.
-- @see SetupMediterraneanWeatherGfxSet.
-- @see SetupHighlandWeatherGfxSet.

function SetupNormalWeatherGfxSet()
	Display.SetRenderUseGfxSets(1)
	WeatherSets_SetupNormal(1)
	WeatherSets_SetupRain(2)
	WeatherSets_SetupSnow(3)
	end

-------------------------------------------------------------------------------------------------------
-- Setup Evelance Weather Gfx Set.
-- @see SetupNormalWeatherGfxSet.
-- @see SetupMediterraneanWeatherGfxSet.
-- @see SetupHighlandWeatherGfxSet.

function SetupEvelanceWeatherGfxSet()
	Display.SetRenderUseGfxSets(1)
	WeatherSets_SetupEvelance(1)
	WeatherSets_SetupEvelanceRain(2)
	WeatherSets_SetupEvelanceSnow(3)
	end

-------------------------------------------------------------------------------------------------------
-- Setup Mediterranean Weather Gfx Set.
-- @see SetupNormalWeatherGfxSet.
-- @see SetupEvelanceWeatherGfxSet.
-- @see SetupHighlandWeatherGfxSet.

function SetupMediterraneanWeatherGfxSet()
	Display.SetRenderUseGfxSets(1)
	WeatherSets_SetupMediterranean(1)
	WeatherSets_SetupMediterraneanRain(2)
	WeatherSets_SetupMediterraneanSnow(3)
	end

-------------------------------------------------------------------------------------------------------
-- Setup Highland Weather Gfx Set.
-- @see SetupNormalWeatherGfxSet.
-- @see SetupEvelanceWeatherGfxSet.
-- @see SetupMediterraneanWeatherGfxSet.

function SetupHighlandWeatherGfxSet()
	Display.SetRenderUseGfxSets(1)
	WeatherSets_SetupHighland(1)
	WeatherSets_SetupHighlandRain(2)
	WeatherSets_SetupHighlandSnow(3)
	end

-------------------------------------------------------------------------------------------------------
-- Add Summer at end of Weather Periods.
-- @param _seconds Number summer time in seconds ( minimum length is 5 seconds ).
-- @see AddPeriodicRain.
-- @see AddPeriodicWinter.
-- @see StartSummer.
-- @see StartRain.
-- @see StartWinter.

function AddPeriodicSummer(_seconds)
	AddWeatherElement(_seconds,1,1)
	end

-------------------------------------------------------------------------------------------------------
-- Add Rain at end of Weather Periods.
-- @param _seconds Number raining time in seconds ( minimum length is 5 seconds ).
-- @see AddPeriodicSummer.
-- @see AddPeriodicWinter.
-- @see StartSummer.
-- @see StartRain.
-- @see StartWinter.

function AddPeriodicRain(_seconds)
	AddWeatherElement(_seconds,2,1)
	end

-------------------------------------------------------------------------------------------------------
-- Add Winter at end of Weather Periods.
-- @param _seconds Number winter time in seconds ( minimum length is 5 seconds ).
-- @see AddPeriodicSummer.
-- @see AddPeriodicRain.
-- @see StartSummer.
-- @see StartRain.
-- @see StartWinter.

function AddPeriodicWinter(_seconds)
	AddWeatherElement(_seconds,3,1)
	end

-------------------------------------------------------------------------------------------------------
-- Switch weather to summer and let the sun shine for given time.
-- return back to periodic weather after time gone.
-- @param _seconds Number summer time in seconds ( minimum length is 5 seconds ).
-- @see AddPeriodicSummer.
-- @see AddPeriodicRain.
-- @see AddPeriodicWinter.
-- @see StartRain.
-- @see StartWinter.

function StartSummer(_seconds)
	AddWeatherElement(_seconds,1,0)
	end

-------------------------------------------------------------------------------------------------------
-- Switch weather to rain and let it rain for given time.
-- return back to periodic weather after time gone.
-- @param _seconds Number raining time in seconds ( minimum length is 5 seconds ).
-- @see AddPeriodicSummer.
-- @see AddPeriodicRain.
-- @see AddPeriodicWinter.
-- @see StartSummer.
-- @see StartWinter.

function StartRain(_seconds)
	AddWeatherElement(_seconds,2,0)
	end

-------------------------------------------------------------------------------------------------------
-- Switch weather to winter and let it snow for given time.
-- return back to periodic weather after time gone.
-- @param _seconds Number winter time in seconds ( minimum length is 5 seconds ).
-- @see AddPeriodicSummer.
-- @see AddPeriodicRain.
-- @see AddPeriodicWinter.
-- @see StartSummer.
-- @see StartRain.

function StartWinter(_seconds)
	AddWeatherElement(_seconds,3,0)
	end

-------------------------------------------------------------------------------------------------------
-- Change entities player Id.
-- @param _name String with the name of the entity.
-- @param _player Number with the target player Id.
-- @return Number Id of entity.

function ChangePlayer(_name,_player)
	-- Is entity existing
	if IsAlive(_name) then

		-- Work with given entity
		local entityID = GetID(_name)

		-- Is leader
		if Logic.IsLeader(entityID) == 1 then
			return Tools.ChangeGroupPlayerID(entityID,_player)
		else
			return Logic.ChangeEntityPlayerID(entityID,_player)
		end
	end
end

-------------------------------------------------------------------------------------------------------
-- Is an entity of special type in given area.
-- @param _player Number entity belongs to this player.
-- @param _entityType Number type of entity to search for.
-- @param _position Table position table with center of area.
-- @param _range Number range to check for.
-- @param _amount Number check for this number of entities.
-- @return Bool true if entities in area else false.

function AreEntitiesInArea(_player, _entityType, _position, _range, _amount)

	local Data = {	Logic.GetPlayerEntitiesInArea(	_player,
												_entityType,
												_position.X,
												_position.Y,
												_range,
												_amount)}

	local Counter = 0

	local i
	for i=2, Data[1]+1 do

		if Logic.IsBuilding(Data[i]) == 1 then

				if Logic.IsConstructionComplete(Data[i]) == 1 then

					Counter = Counter + 1

				end

		else

			Counter = Counter + 1

		end

	end

	return Counter >= _amount

end

-------------------------------------------------------------------------------------------------------
-- Let an entity look at another entity.
-- @param _entity Number with the id of the entity, or String with the name of an entity.
-- @param _target Number with the id of the entity, or String with the name of an entity.
-- @see Attack.
-- @see Move.

function LookAt(_entity, _target)
	Logic.EntityLookAt(_entity, _target)
end


-------------------------------------------------------------------------------------------------------
-- Allow technologies.
-- @param _technology Number with the id of the technology.
-- @param _playerID Number with the id of the player this id is optional and will be set to human player as default.
-- @see ForbidTechnology.
-- @see ForbidAllUniversityTechnologies.
-- @see ResearchTechnology.

function AllowTechnology(_technology, _playerID)

	if _playerID == nil then
		_playerID = GUI.GetPlayerID()
	end

	Logic.SetTechnologyState(_playerID, _technology,2)

end

-------------------------------------------------------------------------------------------------------
-- Forbid technologies.
-- @param _technology Number with the id of the technology.
-- @param _playerID Number with the id of the player this id is optional and will be set to human player as default.
-- @see AllowTechnology.
-- @see ForbidAllUniversityTechnologies.
-- @see ResearchTechnology.

function ForbidTechnology(_technology, _playerID)

	if _playerID == nil then
		_playerID = GUI.GetPlayerID()
	end

	Logic.SetTechnologyState(_playerID, _technology,0)

end

-------------------------------------------------------------------------------------------------------
-- Reserach technologies.
-- @param _technology Number with the id of the technology.
-- @param _playerID Number with the id of the player this id is optional and will be set to human player as default.
-- @see AllowTechnology.
-- @see ForbidTechnology.
-- @see ForbidAllUniversityTechnologies.

function ResearchTechnology(_technology, _playerID)

	if _playerID == nil then
		_playerID = GUI.GetPlayerID()
	end

	Logic.SetTechnologyState(_playerID, _technology,3)

end

-------------------------------------------------------------------------------------------------------
-- Forbid all universtiy technologies.
-- @param _playerID Number with the id of the player this id is optional and will be set to human player as default.
-- @see AllowTechnology.
-- @see ForbidTechnology.
-- @see ResearchTechnology.

function ForbidAllUniversityTechnologies(_playerID)

	if _playerID == nil then
		_playerID = GUI.GetPlayerID()
	end

	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Mercenaries,0)
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_StandingArmy,0)
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Tactics,0)
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Strategies,0)


	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Construction,0)
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_ChainBlock,0)
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_GearWheel,0)
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Architecture,0)


	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Alchemy,0)
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Alloying,0)
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Metallurgy,0)
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Chemistry,0)


	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Literacy,0)
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Trading,0)
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Printing,0)
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Library,0)


	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Mathematics,0)
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Binocular,0)
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Matchlock,0)
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_PulledBarrel,0)

end

-------------------------------------------------------------------------------------------------------
-- Set player name displayed in diplomacy window.
-- @param _playerId Number with the id of the player.
-- @param _name String containing name of player if nil name is removed from diplomacy window.

function SetPlayerName(_playerId, _name)

	local name = XGUIEng.GetStringTableText(_name)

	if name == nil then

		Logic.SetPlayerRawName(_playerId, _name)

	else

		Logic.SetPlayerName(_playerId, _name)

	end

end

-------------------------------------------------------------------------------------------------------
-- Setup ai for player.
-- @param _playerId Number with the id of the player.
-- @param _description Table with the ai description (see tutorial for more information).

function SetupPlayerAi(_playerId,_description)

	Logic.SetPlayerPaysLeaderFlag(_playerId,0)

	AI.Player_EnableAi(_playerId)

	if _description.resources ~= nil then

		AI.Player_SetResources(_playerId,_description.resources.gold,_description.resources.clay,_description.resources.iron,_description.resources.sulfur,_description.resources.stone,_description.resources.wood)

		end

	if _description.refresh ~= nil then

		AI.Player_SetResourceRefreshRates(_playerId,_description.refresh.gold,_description.refresh.clay,_description.refresh.iron,_description.refresh.sulfur,_description.refresh.stone,_description.refresh.wood,_description.refresh.updateTime)

		end

	if _description.serfLimit ~= nil then

		AI.Village_SetSerfLimit(_playerId,_description.serfLimit)

		end

	if _description.resourceFocus ~= nil then

		AI.Village_SetResourceFocus(_playerId,_description.resourceFocus)

		end

	if _description.extracting ~= nil then

		AI.Village_EnableExtracting(_playerId,_description.extracting)

		end

	if _description.rebuild ~= nil then

		AI.Entity_ActivateRebuildBehaviour(_playerId,_description.rebuild.delay,_description.rebuild.randomTime)

		AI.Village_EnableConstructing(_playerId,1)

	else

		AI.Village_DeactivateRebuildBehaviour(_playerId)

		AI.Village_EnableConstructing(_playerId,0)

		end

	if _description.constructing ~= nil then

		if _description.constructing == true then

			AI.Village_EnableConstructing(_playerId,1)

		else

			AI.Village_EnableConstructing(_playerId,0)

			end

		end

	if _description.repairing ~= nil then

		if _description.repairing then

			AI.Village_EnableRepairing(_playerId,1)

		else

			AI.Village_EnableRepairing(_playerId,0)

		end

	end

end

-------------------------------------------------------------------------------------------------------
-- Set marketplace start price for gold, if playerId is optional.
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _price Number new price.
-- @see SetClayPrice.
-- @see SetWoodPrice.
-- @see SetStonePrice.
-- @see SetIronPrice.
-- @see SetSulfurPrice.
-- @see SetGoldDeflation.
-- @see SetGoldInflation.

function SetGoldPrice(_playerId, _price)
	SetResourcePrice(_playerId, ResourceType.Gold, _price)
end
-------------------------------------------------------------------------------------------------------
-- Set marketplace start price for clay, if playerId is optional.
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _price Number new price.
-- @see SetGoldPrice.
-- @see SetWoodPrice.
-- @see SetStonePrice.
-- @see SetIronPrice.
-- @see SetSulfurPrice.
-- @see SetClayDeflation.
-- @see SetClayInflation.

function SetClayPrice(_playerId, _price)
	SetResourcePrice(_playerId, ResourceType.Clay, _price)
end
-------------------------------------------------------------------------------------------------------
-- Set marketplace start price for wood, if playerId is optional.
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _price Number new price.
-- @see SetGoldPrice.
-- @see SetClayPrice.
-- @see SetStonePrice.
-- @see SetIronPrice.
-- @see SetSulfurPrice.
-- @see SetWoodDeflation.
-- @see SetWoodInflation.

function SetWoodPrice(_playerId, _price)
	SetResourcePrice(_playerId, ResourceType.Wood, _price)
end
-------------------------------------------------------------------------------------------------------
-- Set marketplace start price for stone, if playerId is optional.
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _price Number new price.
-- @see SetGoldPrice.
-- @see SetClayPrice.
-- @see SetWoodPrice.
-- @see SetIronPrice.
-- @see SetSulfurPrice.
-- @see SetStoneDeflation.
-- @see SetStoneInflation.

function SetStonePrice(_playerId, _price)
	SetResourcePrice(_playerId, ResourceType.Stone, _price)
end
-------------------------------------------------------------------------------------------------------
-- Set marketplace start price for iron, if playerId is optional.
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _price Number new price.
-- @see SetGoldPrice.
-- @see SetClayPrice.
-- @see SetWoodPrice.
-- @see SetStonePrice.
-- @see SetSulfurPrice.
-- @see SetIronDeflation.
-- @see SetIronInflation.

function SetIronPrice(_playerId, _price)
	SetResourcePrice(_playerId, ResourceType.Iron, _price)
end
-------------------------------------------------------------------------------------------------------
-- Set marketplace start price for sulfur, if playerId is optional.
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _price Number new price.
-- @see SetGoldPrice.
-- @see SetClayPrice.
-- @see SetWoodPrice.
-- @see SetStonePrice.
-- @see SetIronPrice.
-- @see SetSulfurDeflation.
-- @see SetSulfurInflation.

function SetSulfurPrice(_playerId, _price)
	SetResourcePrice(_playerId, ResourceType.Sulfur, _price)
end

-------------------------------------------------------------------------------------------------------
-- Set marketplace deflation for gold, if playerId is optional.
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _resourceType Number resource type id.
-- @param _value Number deflation value.
-- @see SetClayDeflation.
-- @see SetWoodDeflation.
-- @see SetStoneDeflation.
-- @see SetIronDeflation.
-- @see SetSulfurDeflation.
-- @see SetGoldPrice.
-- @see SetGoldInflation.

function SetGoldDeflation(_playerId, _value)
	SetResourceDeflation(_playerId, ResourceType.Gold, _value)
end
-------------------------------------------------------------------------------------------------------
-- Set marketplace deflation for clay, if playerId is optional.
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _resourceType Number resource type id.
-- @param _value Number deflation value.
-- @see SetGoldDeflation.
-- @see SetWoodDeflation.
-- @see SetStoneDeflation.
-- @see SetIronDeflation.
-- @see SetSulfurDeflation.
-- @see SetClayPrice.
-- @see SetClayInflation.

function SetClayDeflation(_playerId, _value)
	SetResourceDeflation(_playerId, ResourceType.Clay, _value)
end
-------------------------------------------------------------------------------------------------------
-- Set marketplace deflation for wood, if playerId is optional.
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _resourceType Number resource type id.
-- @param _value Number deflation value.
-- @see SetGoldDeflation.
-- @see SetClayDeflation.
-- @see SetStoneDeflation.
-- @see SetIronDeflation.
-- @see SetSulfurDeflation.
-- @see SetWoodPrice.
-- @see SetWoodInflation.

function SetWoodDeflation(_playerId, _value)
	SetResourceDeflation(_playerId, ResourceType.Wood, _value)
end
-------------------------------------------------------------------------------------------------------
-- Set marketplace deflation for stone, if playerId is optional.
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _resourceType Number resource type id.
-- @param _value Number deflation value.
-- @see SetGoldDeflation.
-- @see SetClayDeflation.
-- @see SetWoodDeflation.
-- @see SetIronDeflation.
-- @see SetSulfurDeflation.
-- @see SetStonePrice.
-- @see SetStoneInflation.

function SetStoneDeflation(_playerId, _value)
	SetResourceDeflation(_playerId, ResourceType.Stone, _value)
end
-------------------------------------------------------------------------------------------------------
-- Set marketplace deflation for iron, if playerId is optional.
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _resourceType Number resource type id.
-- @param _value Number deflation value.
-- @see SetGoldDeflation.
-- @see SetClayDeflation.
-- @see SetWoodDeflation.
-- @see SetStoneDeflation.
-- @see SetSulfurDeflation.
-- @see SetIronPrice.
-- @see SetIronInflation.

function SetIronDeflation(_playerId, _value)
	SetResourceDeflation(_playerId, ResourceType.Iron, _value)
end
-------------------------------------------------------------------------------------------------------
-- Set marketplace deflation for sulfur, if playerId is optional.
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _resourceType Number resource type id.
-- @param _value Number deflation value.
-- @see SetGoldDeflation.
-- @see SetClayDeflation.
-- @see SetWoodDeflation.
-- @see SetStoneDeflation.
-- @see SetIronDeflation.
-- @see SetSulfurPrice.
-- @see SetSulfurInflation.

function SetSulfurDeflation(_playerId, _value)
	SetResourceDeflation(_playerId, ResourceType.Sulfur, _value)
end

-------------------------------------------------------------------------------------------------------
-- Set marketplace inflation for gold, if playerId is optional.
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _resourceType Number resource type id.
-- @param _value Number inflation value.
-- @see SetClayInflation.
-- @see SetWoodInflation.
-- @see SetStoneInflation.
-- @see SetIronInflation.
-- @see SetSulfurInflation.
-- @see SetGoldPrice.
-- @see SetGoldDeflation.

function SetGoldInflation(_playerId, _value)
	SetResourceInflation(_playerId, ResourceType.Gold, _value)
end
-------------------------------------------------------------------------------------------------------
-- Set marketplace inflation for clay, if playerId is optional.
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _resourceType Number resource type id.
-- @param _value Number inflation value.
-- @see SetGoldInflation.
-- @see SetWoodInflation.
-- @see SetStoneInflation.
-- @see SetIronInflation.
-- @see SetSulfurInflation.
-- @see SetClayPrice.
-- @see SetClayDeflation.

function SetClayInflation(_playerId, _value)
	SetResourceInflation(_playerId, ResourceType.Clay, _value)
end
-------------------------------------------------------------------------------------------------------
-- Set marketplace inflation for wood, if playerId is optional.
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _resourceType Number resource type id.
-- @param _value Number inflation value.
-- @see SetGoldInflation.
-- @see SetClayInflation.
-- @see SetStoneInflation.
-- @see SetIronInflation.
-- @see SetSulfurInflation.
-- @see SetWoodPrice.
-- @see SetWoodDeflation.

function SetWoodInflation(_playerId, _value)
	SetResourceInflation(_playerId, ResourceType.Wood, _value)
end
-------------------------------------------------------------------------------------------------------
-- Set marketplace inflation for stone, if playerId is optional.
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _resourceType Number resource type id.
-- @param _value Number inflation value.
-- @see SetGoldInflation.
-- @see SetClayInflation.
-- @see SetWoodInflation.
-- @see SetIronInflation.
-- @see SetSulfurInflation.
-- @see SetStonePrice.
-- @see SetStoneDeflation.

function SetStoneInflation(_playerId, _value)
	SetResourceInflation(_playerId, ResourceType.Stone, _value)
end
-------------------------------------------------------------------------------------------------------
-- Set marketplace inflation for iron, if playerId is optional.
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _resourceType Number resource type id.
-- @param _value Number inflation value.
-- @see SetGoldInflation.
-- @see SetClayInflation.
-- @see SetWoodInflation.
-- @see SetStoneInflation.
-- @see SetSulfurInflation.
-- @see SetIronPrice.
-- @see SetIronDeflation.

function SetIronInflation(_playerId, _value)
	SetResourceInflation(_playerId, ResourceType.Iron, _value)
end
-------------------------------------------------------------------------------------------------------
-- Set marketplace inflation for sulfur, if playerId is optional.
-- @param _playerId Number with the id of the player, this id is optional default value is 1.
-- @param _resourceType Number resource type id.
-- @param _value Number inflation value.
-- @see SetGoldInflation.
-- @see SetClayInflation.
-- @see SetWoodInflation.
-- @see SetStoneInflation.
-- @see SetIronInflation.
-- @see SetSulfurPrice.
-- @see SetSulfurDeflation.

function SetSulfurInflation(_playerId, _value)
	SetResourceInflation(_playerId, ResourceType.Sulfur, _value)
end

-------------------------------------------------------------------------------------------------------
-- Create a npc that can be used as interaction target.
-- @param _npc Table npc data table, see description of table NPC and take a look at the tutorial.
-- @see DestroyNPC.
-- @see TalkedToNPC.

function CreateNPC(_npc)

	if NPC == nil then
		NPC = {}
	end

	local npcId = GetEntityId(_npc.name)
	assert(npcId~=0)
	
	NPC[npcId] 				= _npc

	InitNPCLookAt(_npc.name)

	if type(_npc.follow) == "string" then
		SetNPCFollow(_npc.name, _npc.follow, 500)
	elseif _npc.follow == true then
		SetNPCFollow(_npc.name, 1, 500)
	end

end

-------------------------------------------------------------------------------------------------------
-- Destroy a npc.
-- @param _npc Table npc data table, see description of table NPC and take a look at the tutorial.
-- @see CreateNPC.
-- @see TalkedToNPC.

function DestroyNPC(_npc)

	local npcId = GetEntityId(_npc.name)
	NPC[npcId] = nil
	DisableNpcMarker(_npc.name)
	InitNPC(_npc.name)
	
end

-------------------------------------------------------------------------------------------------------
-- Has any hero already talked to this npc.
-- @param _npc Table npc data table, see description of table NPC and take a look at the tutorial.
-- @return Bool true if player has already talked to npc else false.
-- @see CreateNPC.
-- @see DestroyNPC.

function TalkedToNPC(_npc)

	local npcId = GetEntityId(_npc.name)
	assert(npcId~=0)
	
	if NPC[npcId] ~= nil then
		return NPC[npcId].talkedTo == true
	else
		return false
	end

end

-------------------------------------------------------------------------------------------------------
-- Get an entities name.
-- @param _entity String with the name of the entity or Number with the id of the entity.
-- @return String name of entity.
-- @see GetEntityId.
-- @see SetEntityName.

function GetEntityName(_entity)

	local id = GetEntityId(_entity)
	
	if id ~= 0 then
		return Logic.GetEntityName(id)
	end

end

-------------------------------------------------------------------------------------------------------
-- Give an entity a name.
-- @param _entity String with the name of the entity or Number with the id of the entity.
-- @param _name new name of entity
-- @see GetEntityId.
-- @see GetEntityName.

function SetEntityName(_entity, _name)

	local id = GetEntityId(_entity)
	
	if id ~= 0 then
		Logic.SetEntityName(id, _name)
	end

end

-------------------------------------------------------------------------------------------------------
-- Create military group with leader and given amount of soldiers.
-- @param _player Number with the id of the player.
-- @param _entity Number with the leadertype of the entity (see Entity Type List).
-- @param _soldiers Number amount of soldiers attached to leader.
-- @param _position Table with the position of the entity (see Position Table).
-- @param _name String with the name of the entity...optional.
-- @param _lookAt String with the name of the entity or Number with the id of the entity to look at after creation...optional.
-- @see CreateEntity.
-- @see DestroyEntity.

function CreateMilitaryGroup(_player,_entity,_soldiers,_position,_name,_lookAt)

	local id = Tools.CreateGroup(_player, _entity, _soldiers, _position.X, _position.Y,0)
	
	if _name ~= nil then
		SetEntityName(id,_name)
	end
	
	if _lookAt ~= nil then
		LookAt(id,_lookAt)
	end

end

-- Gibt die bevorzugte Spielerfarbe des Spielers zurück
function GetPlayerPreferredColor()
	local color = 1
	
	if GDB.IsKeyValid( "Config\\User\\PrefColor" ) then
		color = GDB.GetValue("Config\\User\\PrefColor")
	end

	return color
end

--- GetRandom   mcb  1.0    (Original ???)  
-- Gibt eine Pseudozufallszahl zwischen _min und _max zurück.  
-- Ist _max nicht gesetzt, zwischen 1 und _min.  
-- Wird ein numerisches table übergeben, wird ein pseudozufälliger Eintrag zurückgegeben.  
-- 
-- Benötigt:
-- nix
function GetRandom(_min, _max)
	if type(_min)=="table" then
		return _min[GetRandom(table.getn(_min))]
	end
	if not _max then
		_max = _min
		_min = 1
	end
	if not gvRandomseed then
		gvRandomseed = true
		local seed = XGUIEng.GetSystemTime()
		local str = Framework.GetSystemTimeDateString()
		for i=1, string.len(str) do
			seed = seed * string.byte(str, i, i)
		end
		math.randomseed(seed)
	end
	assert(type(_min)=="number" and type(_max)=="number")
	return math.random(_min, _max)
end

-- Feeds the AI with a recruitment plan
function SetAIUnitsToBuild( _aiID, ... )
    for i = table.getn(DataTable), 1, -1 do
        if DataTable[i].player == _aiID and DataTable[i].AllowedTypes then
            DataTable[i].AllowedTypes = arg;
        end
    end
end

--Researchs Armor-, Attack- and other useful techs for military purposes (except animal techs)
function ResearchAllMilitaryTechs(_PlayerId, _SuperTech)
	ResearchTechnology( Technologies.T_LeatherMailArmor, _PlayerId );
	ResearchTechnology( Technologies.T_ChainMailArmor, _PlayerId );
	ResearchTechnology( Technologies.T_PlateMailArmor, _PlayerId );
	ResearchTechnology( Technologies.T_SoftArcherArmor, _PlayerId );
	ResearchTechnology( Technologies.T_LeatherArcherArmor, _PlayerId );
	ResearchTechnology( Technologies.T_PaddedArcherArmor, _PlayerId );
	
	ResearchTechnology( Technologies.T_PlateBardingArmor, _PlayerId );

	ResearchTechnology( Technologies.T_MasterOfSmithery, _PlayerId );
	ResearchTechnology( Technologies.T_IronCasting, _PlayerId );

	ResearchTechnology( Technologies.T_Fletching, _PlayerId );
	ResearchTechnology( Technologies.T_BodkinArrow, _PlayerId );

	ResearchTechnology( Technologies.T_WoodAging, _PlayerId );
	ResearchTechnology( Technologies.T_Turnery, _PlayerId );

	ResearchTechnology( Technologies.T_EnhancedGunPowder, _PlayerId );
	ResearchTechnology( Technologies.T_BlisteringCannonballs, _PlayerId );

	ResearchTechnology( Technologies.T_Loom, _PlayerId );
	ResearchTechnology( Technologies.T_Shoes, _PlayerId );
	
	ResearchTechnology( Technologies.T_LightBricks, _PlayerId );
	ResearchTechnology( Technologies.T_Masonry, _PlayerId );

	ResearchTechnology( Technologies.T_BetterTrainingArchery, _PlayerId );
	ResearchTechnology( Technologies.T_BetterTrainingBarracks, _PlayerId );
	ResearchTechnology( Technologies.T_Shoeing, _PlayerId );
	ResearchTechnology( Technologies.T_BetterChassis, _PlayerId );

	if _SuperTech == true then
		ResearchTechnology( Technologies.T_SuperTechnology, _PlayerId );
	end

end

function ResearchAnimalTechs(_PlayerId, _AnimalTech2)
	ResearchTechnology( Technologies.T_AnimalTechnology1, _PlayerId );
	
	if _AnimalTech2 == true then
		ResearchTechnology( Technologies.T_AnimalTechnology2, _PlayerId );
	end
end

-- (von Peermanent? oder JugarTeam?) geändert bei Kingsia
function SucheAufDerWelt(_player, _entity, _groesse, _punkthier)
	local punktX1, punktX2, punktY1, punktY2, data
	local gefunden = {}
	local rueck
	if not _groesse then
		_groesse = Logic.WorldGetSize() 
	end
	if not _punkthier then
		_punkthier = {X = _groesse/2, Y = _groesse/2}
	end
	if _player == 0 then
		data ={
		Logic.GetEntitiesInArea(_entity, _punkthier.X, _punkthier.Y, math.floor(_groesse * 0.71), 16)
		}
	else
		data ={
		Logic.GetPlayerEntitiesInArea(_player,_entity, _punkthier.X, _punkthier.Y, math.floor(_groesse * 0.71), 16)
		}
	end
	if data[1] >= 16 then -- Aufteilen angesagt
		local _klgroesse = _groesse / 2 
		local punktX1 = _punkthier.X - _groesse / 4
		local punktX2 = _punkthier.X + _groesse / 4
		local punktY1 = _punkthier.Y - _groesse / 4
		local punktY2 = _punkthier.Y + _groesse / 4
		rueck = SucheAufDerWelt(_player, _entity, _klgroesse, {X=punktX1,Y=punktY1})
		for i = 1, table.getn(rueck) do
			if not IstDrin(rueck[i], gefunden) then -- wegen Überschneidungen
				table.insert(gefunden, rueck[i])
			end
		end
		rueck = SucheAufDerWelt(_player, _entity, _klgroesse, {X=punktX1,Y=punktY2})
		for i = 1, table.getn(rueck) do
			if not IstDrin(rueck[i], gefunden) then
				table.insert(gefunden, rueck[i])
			end
		end
		rueck = SucheAufDerWelt(_player, _entity, _klgroesse, {X=punktX2,Y=punktY1})
		for i = 1, table.getn(rueck) do
			if not IstDrin(rueck[i], gefunden) then
				table.insert(gefunden, rueck[i])
			end
		end
		rueck = SucheAufDerWelt(_player, _entity, _klgroesse, {X=punktX2,Y=punktY2})
		for i = 1, table.getn(rueck) do
			if not IstDrin(rueck[i], gefunden) then
				table.insert(gefunden, rueck[i])
			end
		end
	else
		table.remove(data,1)
		for i = 1, table.getn(data) do
			if not IstDrin(data[i], gefunden) then
				table.insert(gefunden, data[i])
			end
		end
	end
	return gefunden
end 
function IstDrin(_wert, _table)
	if _table == nil then return false end
	for k, v in pairs(_table) do
		if v == _wert then 
			return true
		end 
	end
	return false
end

-- Countdown-Comfort --------------------------------------------------------------------------------------
function StartCountdown(_Limit, _Callback, _Show)
    assert(type(_Limit) == "number")
    assert( not _Callback or type(_Callback) == "function" )
    Counter.Index = (Counter.Index or 0) + 1
    if _Show and CountdownIsVisisble() then
        assert(false, "StartCountdown: A countdown is already visible")
    end
    Counter["counter" .. Counter.Index] = {Limit = _Limit, TickCount = 0, Callback = _Callback, Show = _Show, Finished = false}
    if _Show then
        MapLocal_StartCountDown(_Limit)
    end
    if Counter.JobId == nil then
        Counter.JobId = StartSimpleJob("CountdownTick")
    end
    return Counter.Index
end
 
function StopCountdown(_Id)
    if Counter.Index == nil then
        return
    end
    if _Id == nil then
        for i = 1, Counter.Index do
            if Counter.IsValid("counter" .. i) then
                if Counter["counter" .. i].Show then
                    MapLocal_StopCountDown()
                end
                Counter["counter" .. i] = nil
            end
        end
    else
        if Counter.IsValid("counter" .. _Id) then
            if Counter["counter" .. _Id].Show then
                MapLocal_StopCountDown()
            end
            Counter["counter" .. _Id] = nil
        end
    end
end
 
function CountdownTick()
    local empty = true
    for i = 1, Counter.Index do
        if Counter.IsValid("counter" .. i) then
            if Counter.Tick("counter" .. i) then
                Counter["counter" .. i].Finished = true
            end
            if Counter["counter" .. i].Finished and not IsBriefingActive() then
                if Counter["counter" .. i].Show then
                    MapLocal_StopCountDown()
                end
 
                -- callback function
                if type(Counter["counter" .. i].Callback) == "function" then
                    Counter["counter" .. i].Callback()
                end
 
                Counter["counter" .. i] = nil
            end
            empty = false
        end
    end
    if empty then
        Counter.JobId = nil
        Counter.Index = nil
        return true
    end
end
 
function CountdownIsVisisble()
    for i = 1, Counter.Index do
        if Counter.IsValid("counter" .. i) and Counter["counter" .. i].Show then
            return true
        end
    end
    return false
end

-- CreateEffect
function CreateEffect( _player, _type, _position )
	assert(type(_player) == "number" and _player >= 1 and _player <= 8 and type(_type) == "number", "fatal error: wrong input: _player or _type (function CreateEffect())");
	assert((type(_position) == "table" and type(_position.X) == "number" and type(_position.Y) == "number") or type(_position) == "number" or type(_position) == "string", "fatal error: wrong input: _position (function CreateEffect())");
 
	if type(_position) == "table" then
		assert(_position.X >= 0 and _position.Y >= 0 and _position.X < Logic.WorldGetSize() and _position.Y < Logic.WorldGetSize(), "error: wrong position-statement (function CreateEffect())" );
		local effect = Logic.CreateEffect(_type, _position.X, _position.Y, _player);
		return effect;
	elseif type(_position) == "string" then
		local id = GetEntityId(_position);
		assert(IsExisting(id), "error: entity is dead or not existing (function CreateEffect())");
		local position = GetPosition(id);
		local effect = Logic.CreateEffect(_type, position.X, position.Y, _player);
		return effect;
	else
		assert(IsExisting(_position), "error: entity is dead or not existing (function CreateEffect())");
		local position = GetPosition(_position);
		local effect = Logic.CreateEffect(_type, position.X, position.Y, _player);
		return effect;
	end
end
function DestroyEffect( _effect )
	assert(type(_effect) == "number", "fatal error: wrong input: _effect (function DestroyEffect()");
	Logic.DestroyEffect( _effect );
end

-- Prints the current mouse position as a message
function GetMousePos()
	local position = {}
	position.X,position.Y = GUI.Debug_GetMapPositionUnderMouse()

	Message("X: " .. position.X .. "   Y: " .. position.Y)
end
--------------------------------------------------------------------------------
--[[
	Allows creation of evil units and buildings by a specific player
	_unitstate:
		0 -> deactivate (no extra units available)
		1 -> dark units (Black Knights, Barbarians, Bandits and Wolves)
		2 -> Nephilim (without effect in base game)
		3 -> All evil units from 1 and 2
	_towerstate:
		0 -> deactivate (regular towers)
		1 -> dark towers

		Notes:	
			- The comfort usually just allows the recruitment of basic units (4 soldiers per leader).
				To allow the promoted ones (8 soldiers per leader) you have to upgrade leaders and soldiers manually with
				'Logic.UpgradeSettlerCategory(_UpgradeCategory, _playerId)'
				e.g. 
					Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBarbarian, 1)
					Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBarbarian, 1)
			- It currently doesn't allow the construction of Nephilim-Towers (evil residences).
--]]
--------------------------------------------------------------------------------
function CP_ActivateEvilMod(_playerId, _unitstate, _towerstate)
    assert(type(_playerId) == "number" and type(_unitstate) == "number" and type(_towerstate) == "number");
	CP_EvilMod[_playerId].UnitState = _unitstate
	CP_EvilMod[_playerId].TowerState = _towerstate
end

function CP_GetEvilModUnitState(_playerId)
	return CP_EvilMod[_playerId].UnitState
end
function CP_SetEvilModUnitState(_playerId, _state)
	CP_EvilMod[_playerId].UnitState = _state
end

function CP_GetEvilModTowerState(_playerId)
	return CP_EvilMod[_playerId].TowerState
end
function CP_SetEvilModTowerState(_playerId, _state)
	CP_EvilMod[_playerId].TowerState = _state
end

--------------------------------------------------------------------------------
-- Erstellt ein Rudel Tiere, dass sich aktiv in seinem Revier bewegt
-- by Siedler1997

-- Some default sets
RaidersDefaultSets = {}
RaidersDefaultSets.Vanilla = {
	Entities.CU_AggressiveWolf
}
RaidersDefaultSets.Europe = {
	Entities.CU_AggressiveWolf_Grey,
	Entities.CU_AggressiveWolf_Grey,
	Entities.CU_AggressiveWolf_Grey,
	Entities.CU_AggressiveWolf_Grey,
	Entities.CU_AggressiveWolf_Grey,
	Entities.CU_AggressiveWolf_Black
}
RaidersDefaultSets.Highland = {
	Entities.CU_AggressiveWolf_White,
	Entities.CU_AggressiveWolf_White,
	Entities.CU_AggressiveWolf_White,
	Entities.CU_AggressiveWolf_White,
	Entities.CU_AggressiveWolf_White,
	Entities.CU_AggressiveWolf_White,
	Entities.CU_AggressiveWolf_White,
	Entities.CU_AggressiveWolf_Grey,
	Entities.CU_AggressiveWolf_Grey,
	Entities.CU_AggressiveWolf_Black
}
RaidersDefaultSets.Mediterranean = {
	Entities.CU_AggressiveWolf_Brown,
	Entities.CU_AggressiveWolf_Brown,
	Entities.CU_AggressiveWolf_Brown,
	Entities.CU_AggressiveWolf_Brown,
	Entities.CU_AggressiveWolf_Brown,
	Entities.CU_AggressiveWolf_Brown,
	Entities.CU_AggressiveWolf_Brown,
	Entities.CU_AggressiveWolf_Grey,
	Entities.CU_AggressiveWolf_Grey,
	Entities.CU_AggressiveWolf_Black
}
RaidersDefaultSets.Evelance = {
	Entities.CU_AggressiveWolf_Black
}

function RaidersCreate(_data)
	local dat = _data
	if dat.types == nil or table.getn(dat.types) == 0 then
		dat.types = { Entities.CU_AggressiveWolf }
	end
	if dat.experience == nil then
		dat.experience = 0
	end
	if raid_table == nil then
		raid_counter = 1
		raid_ccount = 0
		raid_table = {}
		StartSimpleJob("RaidersControl")
	else
		raid_counter = raid_counter + 1
	end
	local _runits = {}
	local position = GetPosition(dat.pos)
	for k = 1, dat.samount do 
		local indpos = Zufall_Kreis(position, 500, true)
		local eid = AI.Entity_CreateFormation(dat.player, dat.types[GetRandom(1, table.getn(dat.types))],0,0,(indpos.X),(indpos.Y),0,0,dat.experience,0);
		table.insert(_runits, eid)
	end
	local _rdata = {
		r_player = dat.player, 
		r_spos = dat.pos, 
		r_rev = dat.revier, 
		r_range = dat.range, 
		r_sam = dat.samount, 
		r_resam = dat.ramount, 
		r_types = dat.types, 
		r_cpos = position,
		r_exp = dat.experience 
		}
	local raid_group = {raid_id = raid_counter, raid_units = _runits, raid_data = _rdata}
	table.insert(raid_table, raid_group)
	return raid_counter
end

--Steuert die Wolfsrudel
function RaidersControl()
	raid_ccount = raid_ccount + 1
	local raidersToDelete = { };
	for i = 1, table.getn(raid_table) do
		local rtable = raid_table[i]
		if RaidersAreAlive(raid_table[i].raid_id) then	--Existiert das Rudel noch?
			for w = 1, table.getn(rtable.raid_units) do	--entfernt tote Wölfe aus den Tabellen
				if not IsExisting(rtable.raid_units[w]) then
					table.remove(rtable.raid_units, w)
				end
			end
			
			if math.mod(raid_ccount, 5) == 0 then	--Kontrolle (Angriff/Rückzug)
				local enemy = GetNearestEnemyInArea(rtable.raid_data.r_player, rtable.raid_data.r_cpos, rtable.raid_data.r_range)
				if enemy ~= false then
					for k = 1, table.getn(rtable.raid_units) do
						local task = Logic.GetCurrentTaskList(rtable.raid_units[k])
						if task ~= nil and string.sub(task, 1, 9) ~= "TL_BATTLE" and task ~= "TL_START_BATTLE" then
							Attack(rtable.raid_units[k], GetPosition(enemy))
						end
					end
				else
					for k = 1, table.getn(rtable.raid_units) do
						if GetDistance(GetPosition(rtable.raid_units[k]), rtable.raid_data.r_cpos) > rtable.raid_data.r_range then
							local indpos = Zufall_Kreis(rtable.raid_data.r_cpos, 500, true)
							Move(rtable.raid_units[k], indpos)
						end
					end
				end
			end
			if math.mod(raid_ccount, 60) == 0 then	--Vermehrung (wenn noch mind. 2 Wölfe vorhanden)
				if table.getn(rtable.raid_units) < rtable.raid_data.r_resam and table.getn(rtable.raid_units) >= 2 then	--Limit noch nicht erreicht? Mind. 2 Wölfe vorhanden?
					local nachw_zahl = math.ceil(table.getn(rtable.raid_units)/4)										--Nachwuchs (aufgerundet) = aktuelle Anzahl / 4
					if (table.getn(rtable.raid_units) + nachw_zahl) > rtable.raid_data.r_resam then
						nachw_zahl = nachw_zahl * 0 + rtable.raid_data.r_resam - table.getn(rtable.raid_units)			--Nachwuchs = Maximum - aktuelle Anzahl
					end
					for k = 1, nachw_zahl do
						local adultp = GetPosition(rtable.raid_units[k])
						local eid = AI.Entity_CreateFormation(rtable.raid_data.r_player, rtable.raid_data.r_types[GetRandom(1, table.getn(rtable.raid_data.r_types))],0,0,(adultp.X),(adultp.Y),0,0,rtable.raid_data.r_exp,0);
						table.insert(rtable.raid_units, eid)
					end
				end
			end
			if math.mod(raid_ccount, 120) == 0 then	--Positionswechsel (Radius/Waypoints)
				if type(rtable.raid_data.r_rev) == "table" then
					local newpos_zahl = GetRandom(1, table.getn(rtable.raid_data.r_rev))
					local newpos_anchor = GetPosition(rtable.raid_data.r_rev[newpos_zahl])
					for k = 1, table.getn(rtable.raid_units) do
						local indpos = Zufall_Kreis(newpos_anchor, 500, true)
						Attack(rtable.raid_units[k], indpos)
					end
					rtable.raid_data.r_cpos = newpos_anchor
				else
					local newpos_anchor = Zufall_Kreis(GetPosition(rtable.raid_data.r_spos), rtable.raid_data.r_rev, true)
					for k = 1, table.getn(rtable.raid_units) do
						local indpos = Zufall_Kreis(newpos_anchor, 500, true)
						Attack(rtable.raid_units[k], indpos)
					end
					rtable.raid_data.r_cpos = newpos_anchor
				end
			end
		else
			table.insert(raidersToDelete, raid_table[i].raid_id)
		end
	end
	
	if table.getn(raidersToDelete) > 0 then	--Entfernt "leere" Wolfsrudel aus dem table
		for i = 1, table.getn(raidersToDelete) do
			RaidersDelete(raidersToDelete[i])
		end
	end
	
	if raid_ccount == 120 then	--Setzt den Counter zurück, damit er keine utopischen Werte annimmt
		raid_ccount = 0
	end
end

--Gibt zurück, ob ein Rudel noch Wölfe enthält, also existent ist
function RaidersAreAlive(_id)
	local alive = false;
	for i = 1, table.getn(raid_table) do
		if raid_table[i].raid_id == _id then
			if table.getn(raid_table[i].raid_units) > 0 then
				alive = true;
			end
		end
	end
	return alive;
end

--Entfernt das Rudel aus der Liste und tötet alle verbliebenen Wölfe (falls extern aufgerufen)
function RaidersDelete(_id)
	for i = 1, table.getn(raid_table) do
		if raid_table[i].raid_id == _id then
			for k = 1, table.getn(raid_table[i].raid_units) do
				if IsExisting(raid_table[i].raid_units[k]) then
					--DestroyEntity(raid_table[i].raid_units[k])
					SetHealth(raid_table[i].raid_units[k] ,0)
				end
			end
			table.remove(raid_table,i)
			return true;
		end
	end
end

-- Gibt true zurück, wenn Gegner in der Nähe sind
-- by Tenji
function AreEnemiesInArea( _player, _position, _range)
	for i = 1,8 do
		if Logic.GetDiplomacyState( _player, i) == Diplomacy.Hostile then
			if AreEntitiesInArea( i, 0, _position, _range, 1) then
				return true
			end
		end
	end
end

-- Gibt den nächstgelegenen (lebenden) Gegner in der Nähe zurück
-- by Siedler1997
function GetNearestEnemyInArea(_player, _pos, _range)
	local minrange = _range/4
	local enemytable = {}
	local etable2 = {}
	local etable3 = {}
	local etable4 = {}
	for i = 1,8 do
		if Logic.GetDiplomacyState(_player, i) == Diplomacy.Hostile then
			local enemies = SucheAufDerWelt(i, 0, _range, _pos)
			for k = 1, table.getn(enemies) do
				if IsAlive(enemies[k]) then
					if GetDistance(enemies[k], _pos) < minrange then
						table.insert(enemytable, enemies[k])
					elseif GetDistance(enemies[k], _pos) < minrange*2 then
						table.insert(etable2, enemies[k])
					elseif GetDistance(enemies[k], _pos) < minrange*3 then
						table.insert(etable3, enemies[k])
					else
						table.insert(etable4, enemies[k])
					end
				end
			end
		end
	end
	for x = 1, table.getn(etable2) do table.insert(enemytable, etable2[x]) end
	for y = 1, table.getn(etable3) do table.insert(enemytable, etable3[y]) end
	for z = 1, table.getn(etable4) do table.insert(enemytable, etable4[z]) end
	if table.getn(enemytable) ~= 0 then
		return enemytable[1]
	else
		return false
	end
end

function GetDistance(_a, _b)
    if type(_a) ~= "table" then
        _a = GetPosition(_a)
    end
    if type(_b) ~= "table" then
        _b = GetPosition(_b)
    end
    return math.sqrt((_a.X - _b.X)^2+(_a.Y - _b.Y)^2)
end

-- Liefert eine zufällige Position innerhalb eines Kreises
-- by Siedler1997
function Zufall_Kreis(_pos, _radius, _bcheck)
	local posi = _pos
	local radi = _radius
	local punktX = posi.X + GetRandom(-radi, radi)
	local punktY = posi.Y + GetRandom(-radi, radi)
	local worldsize = Logic.WorldGetSize()--/100
	if math.sqrt((posi.X-punktX)^2+(posi.Y-punktY)^2) <= radi then
		return IsPositionInMap({X=punktX, Y=punktY}, true)
	else
		return Zufall_Kreis(_pos, _radius)
	end
end

-- Prüft, ob eine Position innerhalb der Map liegt
-- by Siedler1997
function IsPositionInMap(_pos, _correction)
	local wsize = Logic.WorldGetSize()
	local posX = _pos.X
	local posY = _pos.Y
	if _correction == false then	--nur Überprüfung?
		if posX >= 0 and posY >= 0 and posX <= wsize and posY <= wsize then
			return true
		else
			return false
		end
	else	--Werte werden korrigiert
		if posX < 0 then posX = posX * 0 end
		if posY < 0 then posY = posY * 0 end
		if posX > wsize then posX = wsize end
		if posY > wsize then posY = wsize end
		local newpos = {X=posX, Y=posY}
		return newpos
	end
end

function SetAIUnitsToBuild( _aiID, _types )
    for i = table.getn(DataTable), 1, -1 do
        if DataTable[i].player == _aiID and DataTable[i].AllowedTypes then
            DataTable[i].AllowedTypes = _types;
        end
    end
end