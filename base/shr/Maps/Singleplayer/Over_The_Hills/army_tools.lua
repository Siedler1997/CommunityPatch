	troops1	= { Entities.PU_LeaderHeavyCavalry2,
				Entities.PU_LeaderSword4,
				Entities.PU_LeaderPoleArm4,
				Entities.PU_LeaderBow4,
				Entities.PV_Cannon3, 
				Entities.PV_Cannon4 
				}
	troops2	= { Entities.PU_LeaderHeavyCavalry2,
				Entities.PU_LeaderSword4,
				Entities.PU_LeaderBow4,
				Entities.PV_Cannon4 
				}
	troops3	= { Entities.PU_LeaderHeavyCavalry2,
				Entities.PU_LeaderHeavyCavalry1,
				Entities.PU_LeaderCavalry2
				}

	troops4	= { Entities.PU_LeaderBow4,
				Entities.PU_LeaderBow4,
				Entities.PU_LeaderSword4,
				}

	troops5	= { Entities.PV_Cannon4,
				Entities.PV_Cannon3,
				Entities.PV_Cannon3,
				Entities.PU_LeaderSword4,
				}

	troops6	= { Entities.PU_LeaderSword4,
				Entities.PU_LeaderPoleArm4
				}

DEFEND = 1
ATTACK = 2
ADVANCE = 3
	
simpleDefendBehaviour = function(_army)
	if _army.control.mode == DEFEND then
		Defend(_army)
		if _army.control.delay <= 0 then	
			_army.control.mode = ATTACK				
			_army.control.delay = 10 + Logic.GetRandom(10)			
			end
	elseif _army.control.mode == ATTACK then		
		FrontalAttack(_army)		
		if _army.control.delay <= 0 then		
			Redeploy(_army,_army.control.defendPosition)			
			_army.control.mode = DEFEND			
			_army.control.delay = 50 + Logic.GetRandom(20)			
			end
		end		
	_army.control.delay = _army.control.delay -1		
	return false		
	end
	
	
createArmy = function(_playerId,_id,_army,_strength,_position,_experience,_troops)

	_army.player 					= _playerId
	_army.id						= _id
	_army.position					= GetPosition(_position)
	_army.rodeLength				= 4000
	_army.strength					= _strength
	_army.control					= {}
	_army.control.mode				= DEFEND
	_army.control.defendPosition	= _army.position
	_army.control.delay				= 20

	SetupArmy(_army)

	local troopDescription = {
	
		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 5,
		experiencePoints 	= _experience,
	}			

	for i = 0 , _army.strength , 1 do	
		troopDescription.leaderType = _troops[Logic.GetRandom(table.getn(_troops))+1]			
		EnlargeArmy(_army,troopDescription)
		end
		
	end

globalRespawnTimer = 0
globalRespawnDelay = 60

battleBehaviour = function(_army)
	if HasFullStrength(_army) == false and globalRespawnTimer <= 0 and _army.control.spawnIsActive == true then	
		local troopDescription = {
		
			maxNumberOfSoldiers	= 8,
			minNumberOfSoldiers	= 0,
			position			= _army.control.spawnPosition,
			experiencePoints 	= HIGH_EXPERIENCE,
		}				
		troopDescription.leaderType = _army.control.troops[Logic.GetRandom(table.getn(_army.control.troops))+1]					
		EnlargeArmy(_army,troopDescription)		
		globalRespawnTimer = globalRespawnDelay + Logic.GetRandom(globalRespawnDelay)		
	else	
		globalRespawnTimer = globalRespawnTimer -1	
		end
	if IsVeryWeak(_army) then
		if _army.control.mode ~= DEFEND then	
			_army.control.mode = DEFEND			
			_army.control.delay = 20 + Logic.GetRandom(20)	
			end			
		end
	if _army.control.mode == DEFEND then
		Defend(_army)
		if _army.control.delay <= 0 then		
			if Logic.GetRandom(100) > 50 then		
				_army.control.mode = ATTACK			
				_army.control.delay = 60 + Logic.GetRandom(60)				
			else
				_army.control.mode = ADVANCE			
				_army.control.delay = (60 * 5) + Logic.GetRandom(60 * 5)
				end			
			end
	elseif _army.control.mode == ATTACK then		
		FrontalAttack(_army)		
		if _army.control.delay <= 0 then		
			Redeploy(_army,_army.control.defendPosition)			
			_army.control.mode = DEFEND			
			_army.control.delay = 20 + Logic.GetRandom(20)			
			end
	elseif _army.control.mode == ADVANCE then		
		Advance(_army)		
		if _army.control.delay <= 0 then		
			Redeploy(_army,_army.control.defendPosition)			
			_army.control.mode = DEFEND			
			_army.control.delay = 20 + Logic.GetRandom(20)			
			end
		end
	
	_army.control.delay = _army.control.delay -1
	return false		
	end
