---------------------------------------------------------------------------------------------------------------
-- Resource Victory Condition
---------------------------------------------------------------------------------------------------------------
function MapEditor_SetupResourceVictoryCondition(_gold, _clay, _wood, _stone, _iron, _sulfur)

	MapEditor_QuestResourceVictoryData 			=	{}
	MapEditor_QuestResourceVictoryData.gold		=	_gold
	MapEditor_QuestResourceVictoryData.clay 	= 	_clay
	MapEditor_QuestResourceVictoryData.wood 	=	_wood
	MapEditor_QuestResourceVictoryData.stone	=	_stone
	MapEditor_QuestResourceVictoryData.iron		=	_iron
	MapEditor_QuestResourceVictoryData.sulfur	=	_sulfur

	Trigger.RequestTrigger( Events.LOGIC_EVENT_EVERY_SECOND,
							nil,
							"MapEditor_QuestResourceVictory",
							1,
							nil,
							{ _gold, _clay, _wood, _stone, _iron, _sulfur })

	MapEditor_CreateQuestInfo()

end
function MapEditor_QuestResourceVictory(_gold, _clay, _wood, _stone, _iron, _sulfur)

	if 	GetGold()	>= _gold	and
		GetClay()	>= _clay	and
		GetWood()	>= _wood	and
		GetStone()	>= _stone	and
		GetIron()	>= _iron	and
		GetSulfur()	>= _sulfur 	then
			
			Victory()
			
			return true
	end

end
---------------------------------------------------------------------------------------------------------------
-- Destroy player condition
---------------------------------------------------------------------------------------------------------------
function MapEditor_SetupDestroyVictoryCondition(_playerId)

	Trigger.RequestTrigger( Events.LOGIC_EVENT_EVERY_SECOND,
							nil,
							"MapEditor_QuestDestroyVictory",
							1,
							nil,
							{ _playerId })

	MapEditor_CreateQuestInfo()

end
function MapEditor_QuestDestroyVictory(_playerId)

	if Counter.Tick2("MapEditor_QuestDestroyVictory",10) then

		if Logic.GetPlayerEntitiesInArea(_playerId,0,0,0,0,1,2) == 0 then
			
			local Count, Id = Logic.GetPlayerEntitiesInArea(_playerId,0,0,0,0,1,8) 
			
			if Count <= 1 then
			
				if Id ~= nil then
					
					if Logic.IsConstructionComplete(Id) == 1 then
						return false
					end
					
				end
			
				Victory()
			
				return true
			
			end
			
		end

	end

end
---------------------------------------------------------------------------------------------------------------
-- Create Quest info for player
---------------------------------------------------------------------------------------------------------------
function MapEditor_CreateQuestInfo()

	if MapEditor_QuestTitle ~= nil and MapEditor_QuestDescription ~= nil then

		Logic.AddQuest(	1,									
						1,						
						MAINQUEST_OPEN,		
						MapEditor_QuestTitle,
						MapEditor_QuestDescription,
						1	
					)

	end
	
end
---------------------------------------------------------------------------------------------------------------
-- Setup AI 
---------------------------------------------------------------------------------------------------------------
function MapEditor_SetupAI(_playerId, _strength, _range, _techlevel, _position, _aggressiveLevel, _peaceTime, _advancedSettings)

	-- Valid
	if 	_strength == 0 or _strength > 3 or
		_techlevel < 0 or _techlevel > 3 or 
		_playerId < 1 or _playerId > 8 or
		_aggressiveLevel < 0 or _aggressiveLevel > 3 or
		type(_position) ~= "string" then
		return
	end

	-- get position
	local position = GetPosition(_position)

	-- check for buildings
	if Logic.GetPlayerEntitiesInArea(_playerId, 0, position.X, position.Y, 0, 1, 8) == 0 then
		return
	end
	
	local armyStrength = 6
	local armyGrouping = ArmyGrouping_Mixed
	local evilMod = false
	local otherUnitsToRecruit = {}
	if _advancedSettings ~= nil then
		if _advancedSettings.armyStrength ~= nil then
			armyStrength = _advancedSettings.armyStrength
		end
		if _advancedSettings.armyGrouping ~= nil then
			armyGrouping = _advancedSettings.armyGrouping
		end
		if _advancedSettings.evilMod ~= nil then
			evilMod = _advancedSettings.evilMod
		end
		if _advancedSettings.otherUnitsToRecruit ~= nil then
			otherUnitsToRecruit = _advancedSettings.otherUnitsToRecruit
		end
	end

	-- setup AI
	
		--	describe the player structure
		--Logic.SetPlayerName(2, String.MainKey.."_Player2Name")????
	
		--	set up default information
		local description = {
		
			serfLimit				=	(_strength-1)*2,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------
			resources = {
				gold				=	_strength*500,
				clay				=	_strength*250,
				iron				=	_strength*250,
				sulfur				=	_strength*250,
				stone				=	_strength*250,
				wood				=	_strength*250
			},
			--------------------------------------------------
			refresh = {
				gold				=	_strength*100,
				clay				=	_strength*50,
				iron				=	_strength*50,
				sulfur				=	_strength*50,
				stone				=	_strength*50,
				wood				=	_strength*50,
				updateTime			=	20-(2*_strength)
			},
			--------------------------------------------------
			constructing			=	true,
			--------------------------------------------------
			rebuild = {
				delay				=	10*(4-_strength),
				randomTime			=	5*(4-_strength)
			},
		}
		
		SetupPlayerAi(_playerId,description)

	-- Tech level
		
		local cannonTypes = {}
		if _techlevel == 0 then
			table.insert(cannonTypes, Entities.PV_Cannon1)
		elseif _techlevel == 1 then
			table.insert(cannonTypes, Entities.PV_Cannon1)
			table.insert(cannonTypes, Entities.PV_Cannon2)
		elseif _techlevel == 2 then
			table.insert(cannonTypes, Entities.PV_Cannon2)
			if evilMod == false then
				table.insert(cannonTypes, Entities.PV_Cannon3)
			else
				table.insert(cannonTypes, Entities.PV_Cannon3a)
			end
		elseif _techlevel == 3 then
			if evilMod == false then
				table.insert(cannonTypes, Entities.PV_Cannon3)
				table.insert(cannonTypes, Entities.PV_Cannon4)
			else
				table.insert(cannonTypes, Entities.PV_Cannon3a)
				table.insert(cannonTypes, Entities.PV_Cannon4a)
			end
		end

		-- Upgrade entities..Rifle?
		for i=1,_techlevel do
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, _playerId)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, _playerId)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, _playerId)
		end
		for i=2, ((_techlevel+1)/2) do
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, _playerId)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, _playerId)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, _playerId)
		end
		if _techlevel > 1 then
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBarbarian, _playerId)
			Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightLeaderMace1, _playerId)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBandit, _playerId)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBanditBow, _playerId)
		end

	-- army
	if MapEditor_Armies == nil then
		MapEditor_Armies = {}
	end

	local stables = Logic.GetNumberOfEntitiesOfTypeOfPlayer(_playerId, Entities.PB_Stable1)
					+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(_playerId, Entities.PB_Stable2)
	local barracks = Logic.GetNumberOfEntitiesOfTypeOfPlayer(_playerId, Entities.PB_Barracks1)
					+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(_playerId, Entities.PB_Barracks2)
	local archeries = Logic.GetNumberOfEntitiesOfTypeOfPlayer(_playerId, Entities.PB_Archery1)
					+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(_playerId, Entities.PB_Archery2)
	local foundries = Logic.GetNumberOfEntitiesOfTypeOfPlayer(_playerId, Entities.PB_Foundry1)
					+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(_playerId, Entities.PB_Foundry2)
		
	MapEditor_Armies[_playerId] = {}
		
	local allUnitTypes = { 	UpgradeCategories.LeaderBow,
							UpgradeCategories.LeaderSword,
							UpgradeCategories.LeaderPoleArm,
							UpgradeCategories.LeaderCavalry,
							UpgradeCategories.LeaderHeavyCavalry,
							UpgradeCategories.LeaderRifle }
	for c=1, table.getn(cannonTypes) do
		table.insert(allUnitTypes, cannonTypes[c])
	end
	for s=1, table.getn(otherUnitsToRecruit) do
		table.insert(allUnitTypes, otherUnitsToRecruit[s])
	end

	for i=1, _strength*2 do
		
		MapEditor_Armies[_playerId][i] 						=	{}
		MapEditor_Armies[_playerId][i].player 				=	_playerId
		MapEditor_Armies[_playerId][i].id					=	i
		MapEditor_Armies[_playerId][i].strength				=	armyStrength
		MapEditor_Armies[_playerId][i].position				=	GetPosition(_position)
		local offset = (math.mod((i-1),3)-1)
		MapEditor_Armies[_playerId][i].position.X			=	MapEditor_Armies[_playerId][i].position.X + offset*1000
		MapEditor_Armies[_playerId][i].position.Y			=	MapEditor_Armies[_playerId][i].position.Y + (math.floor((i-1)/3)*1000)
		MapEditor_Armies[_playerId][i].rodeLength			=	(_range*2)/3
		MapEditor_Armies[_playerId][i].retreatStrength		=	3
		MapEditor_Armies[_playerId][i].baseDefenseRange		=	(_range*2)/3
		MapEditor_Armies[_playerId][i].outerDefenseRange	=	_range
		MapEditor_Armies[_playerId][i].AttackAllowed		=	false
		MapEditor_Armies[_playerId][i].ArmyGrouping			=	armyGrouping
		
		if armyGrouping == ArmyGrouping_Mixed then
			--No grouping - all types
			MapEditor_Armies[_playerId][i].AllowedTypes			=	allUnitTypes
		else
			--every 3rd army is cavalry-only
			if math.mod(i, 3) == 0 then
				--Types to use if PreferredTypes aren't recruitable - usually all other types
				MapEditor_Armies[_playerId][i].BackupTypes			=	{ 	UpgradeCategories.LeaderBow,
																			UpgradeCategories.LeaderSword,
																			UpgradeCategories.LeaderPoleArm,
																			UpgradeCategories.LeaderRifle }
				for c=1, table.getn(cannonTypes) do
					table.insert(MapEditor_Armies[_playerId][i].BackupTypes, cannonTypes[c])
				end
				for s=1, table.getn(otherUnitsToRecruit) do
					table.insert(MapEditor_Armies[_playerId][i].BackupTypes, otherUnitsToRecruit[s])
				end

				--AI prefer these types for recruitment
				MapEditor_Armies[_playerId][i].PreferredTypes	= { UpgradeCategories.LeaderCavalry,
																UpgradeCategories.LeaderHeavyCavalry,
																UpgradeCategories.LeaderHeavyCavalry }
				--Initiate AllowedTypes depending on the existence of at least one stable
				if stables > 0 then
					MapEditor_Armies[_playerId][i].AllowedTypes		=	MapEditor_Armies[_playerId][i].PreferredTypes
				else
					MapEditor_Armies[_playerId][i].AllowedTypes		=	MapEditor_Armies[_playerId][i].BackupTypes
				end
			else
				MapEditor_Armies[_playerId][i].BackupTypes = allUnitTypes
				--All other armies are mixed, just without cavalry
				MapEditor_Armies[_playerId][i].PreferredTypes			=	{ 	UpgradeCategories.LeaderBow,
																			UpgradeCategories.LeaderSword,
																			UpgradeCategories.LeaderPoleArm,
																			UpgradeCategories.LeaderRifle }
				for c=1, table.getn(cannonTypes) do
					table.insert(MapEditor_Armies[_playerId][i].PreferredTypes, cannonTypes[c])
				end
				for s=1, table.getn(otherUnitsToRecruit) do
					table.insert(MapEditor_Armies[_playerId][i].PreferredTypes, otherUnitsToRecruit[s])
				end

				--If the AI doesn't have barracks, archeries or foundries it's allowed to recruit any unit for their armies (=cavalry)
				if (barracks + archeries + foundries) > 0 then
					MapEditor_Armies[_playerId][i].AllowedTypes		=	MapEditor_Armies[_playerId][i].PreferredTypes
				else
					MapEditor_Armies[_playerId][i].AllowedTypes		=	MapEditor_Armies[_playerId][i].BackupTypes
				end
			end
		end
													
		-- Spawn generator
		SetupAITroopGenerator("MapEditor_Armies_".._playerId.."_"..i, MapEditor_Armies[_playerId][i])
				
		if math.ceil((_aggressiveLevel*_strength)/2) >= i then
			
			Trigger.RequestTrigger( Events.LOGIC_EVENT_EVERY_SECOND,
									nil,
									"StartMapEditor_ArmyAttack",
									1,
									nil,
									{_playerId, i, _peaceTime})
			
		end
					
	end
	
	if MapEditor_Armies.controlerId == nil then
		MapEditor_Armies.controlerId = StartSimpleJob("ControlMapEditor_Armies")
	end
	
	SetHostile(1,_playerId)
	
end
function StartMapEditor_ArmyAttack(_playerId,_armyId,_delay)

	if Counter.Tick2("StartMapEditor_ArmyAttack".._playerId.."_".._armyId, _delay) then
		
		MapEditor_Armies[_playerId][_armyId].AttackAllowed = true
		
		return true
		
	end

end
function ControlMapEditor_Armies()
	if Counter.Tick2("ControlMapEditor_Armies",10) then
		for player=1,8 do
			--Get ammount of military buildings per player
			local stables = Logic.GetNumberOfEntitiesOfTypeOfPlayer(player, Entities.PB_Stable1)
							+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(player, Entities.PB_Stable2)
			local barracks = Logic.GetNumberOfEntitiesOfTypeOfPlayer(player, Entities.PB_Barracks1)
							+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(player, Entities.PB_Barracks2)
			local archeries = Logic.GetNumberOfEntitiesOfTypeOfPlayer(player, Entities.PB_Archery1)
							+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(player, Entities.PB_Archery2)
			local foundries = Logic.GetNumberOfEntitiesOfTypeOfPlayer(player, Entities.PB_Foundry1)
							+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(player, Entities.PB_Foundry2)
			for army=1,6 do
				if MapEditor_Armies[player] ~= nil then
					if MapEditor_Armies[player][army] ~= nil then
						--Update army allowed types depending on buildings to avoid "dead" armies
						if MapEditor_Armies[player][army].ArmyGrouping ~= ArmyGrouping_Mixed then
							--every 3rd army is cavalry-only
							if math.mod(army, 3) == 0 then
								--Set AllowedTypes depending on the existence of at least one stable
								if stables > 0 then
									MapEditor_Armies[player][army].AllowedTypes		=	MapEditor_Armies[player][army].PreferredTypes
								else
									MapEditor_Armies[player][army].AllowedTypes		=	MapEditor_Armies[player][army].BackupTypes
								end
							else
								--there might be cases where the AI have only stables
								if (barracks + archeries + foundries) > 0 then
									MapEditor_Armies[player][army].AllowedTypes		=	MapEditor_Armies[player][army].PreferredTypes
								else
									MapEditor_Armies[player][army].AllowedTypes		=	MapEditor_Armies[player][army].BackupTypes
								end
							end
						end
						
						--Actual army control
						TickOffensiveAIController(MapEditor_Armies[player][army])
					end
				end
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------
-- Default Defeat Condition...no HQ left
---------------------------------------------------------------------------------------------------------------
function MapEditor_CreateHQDefeatCondition()

	StartSimpleJob("MapEditor_DefeatCondition")

end
function MapEditor_DefeatCondition()

	local HQCount = 0
	local HQId

	for i=1,3 do

		local Count, Id = Logic.GetPlayerEntities(1,Entities["PB_Headquarters"..i],10)

		HQCount = HQCount + Count
		
		if Id ~= nil then
			HQId = Id
		end

	end

	-- One Left
	if HQCount == 1 then
		
		SetEntityName(HQId, "MapEditor_LastHQ")
		
		-- Create Defeat Condition
		AddDefeatEntity("MapEditor_LastHQ")
		
		return true
		
	end

end