--	___________________________________________________________________________________________
--
--											battleBehaviour
--	___________________________________________________________________________________________
--
DEFEND = 1
ATTACK = 2
ADVANCE = 3

globalRespawnTimer = 0
globalRespawnDelay = 10

battleBehaviour = function(_army)

	if HasFullStrength(_army) == false and globalRespawnTimer <= 0 and _army.control.spawnIsActive == true then
	
		local troopDescription = {
		
			maxNumberOfSoldiers	= 8,
			minNumberOfSoldiers	= 0,
			position			= _army.control.spawnPosition,
			experiencePoints 	= LOW_EXPERIENCE,
		}			
	
		troopDescription.leaderType = _army.control.troops[Logic.GetRandom(table.getn(_army.control.troops))+1]			
		
		EnlargeArmy(_army,troopDescription)
		
		globalRespawnTimer = globalRespawnDelay + Logic.GetRandom(globalRespawnDelay)
		
		globalRespawnDelay = globalRespawnDelay +1
	
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
			
				_army.control.delay = 20 + Logic.GetRandom(10)
				
			else

				_army.control.mode = ADVANCE
			
				_army.control.delay = 30 + Logic.GetRandom(20)

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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
globalRespawnTimer2 = 0	
	
	
defendBehaviour = function(_army)

	if HasFullStrength(_army) == false and globalRespawnTimer2 <= 0 then
	
		local troopDescription = {
		
			maxNumberOfSoldiers	= 8,
			minNumberOfSoldiers	= 4,
			position			= _army.control.spawnPosition,
			experiencePoints 	= VERYHIGH_EXPERIENCE,
		}			
	
		troopDescription.leaderType = _army.control.troops[Logic.GetRandom(table.getn(_army.control.troops))+1]			
		
		EnlargeArmy(_army,troopDescription)
		
		globalRespawnTimer2 = (60 * 2) + Logic.GetRandom(60*2)
		
	else
	
		globalRespawnTimer2 = globalRespawnTimer2 -1
	
		end

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
	
	
globalRespawnTimer3 = 0

attackBehaviour = function(_army)

	if HasFullStrength(_army) == false and globalRespawnTimer3 <= 0 then
	
		local troopDescription = {
		
			maxNumberOfSoldiers	= 8,
			minNumberOfSoldiers	= 4,
			position			= _army.control.spawnPosition,
			experiencePoints 	= VERYHIGH_EXPERIENCE,
		}			
	
		troopDescription.leaderType = _army.control.troops[Logic.GetRandom(table.getn(_army.control.troops))+1]			
		
		EnlargeArmy(_army,troopDescription)
		
		globalRespawnTimer3 = 100 + Logic.GetRandom(200)
		
	else
	
		globalRespawnTimer3 = globalRespawnTimer3 -1
	
		end

	if _army.control.mode == DEFEND then

		if HasFullStrength(_army) then
			
			_army.control.mode = ATTACK
			
		else
		
			Defent(_army)
			
			end

	elseif _army.control.mode == ATTACK then		
		
		if IsVeryWeak(_army) then
		
			Redeploy(_army,_army.control.defendPosition)
			
			_army.control.mode = DEFEND
			
		else	
		
			FrontalAttack(_army)
		
			end

		end
		
	return false	
	
	end