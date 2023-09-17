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
function MapEditor_SetupAI(_playerId, _strength, _range, _techlevel, _position, _aggressiveLevel, _peaceTime)

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
				updateTime			=	20
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
	
		local CannonEntityType = Entities["PV_Cannon"..(_techlevel+1)]

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
		
	MapEditor_Armies[_playerId] = {}
		
	for i=1, _strength*2 do
		
		MapEditor_Armies[_playerId][i] 						=	{}
		MapEditor_Armies[_playerId][i].player 				=	_playerId
		MapEditor_Armies[_playerId][i].id					=	i
		MapEditor_Armies[_playerId][i].strength				=	6
		MapEditor_Armies[_playerId][i].position				=	GetPosition(_position)
		local offset = (math.mod((i-1),3)-1)
		MapEditor_Armies[_playerId][i].position.X			=	MapEditor_Armies[_playerId][i].position.X + offset*1000
		MapEditor_Armies[_playerId][i].position.Y			=	MapEditor_Armies[_playerId][i].position.Y + (math.floor((i-1)/3)*1000)
		MapEditor_Armies[_playerId][i].rodeLength			=	(_range*2)/3
		MapEditor_Armies[_playerId][i].retreatStrength		=	3
		MapEditor_Armies[_playerId][i].baseDefenseRange		=	(_range*2)/3
		MapEditor_Armies[_playerId][i].outerDefenseRange	=	_range
		MapEditor_Armies[_playerId][i].AttackAllowed		=	false
		
		MapEditor_Armies[_playerId][i].AllowedTypes			=	{ 	UpgradeCategories.LeaderBow,
																	UpgradeCategories.LeaderSword,
																	UpgradeCategories.LeaderPoleArm,
																	UpgradeCategories.LeaderCavalry,
																	UpgradeCategories.LeaderHeavyCavalry,
																	UpgradeCategories.LeaderRifle,
																	CannonEntityType }
													
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
			
			for army=1,6 do
				
				if MapEditor_Armies[player] ~= nil then
					
					if MapEditor_Armies[player][army] ~= nil then
						
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