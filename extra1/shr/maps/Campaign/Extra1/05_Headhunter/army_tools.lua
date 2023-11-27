DEFEND = 1
ATTACK = 2
ADVANCE = 3
------------------------------------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------------------------------------
createArmy = function(_playerId,_id,_army,_strength,_position,_experience,_troops,_soldiers)
	_army.player 					= _playerId
	_army.id						= _id
	_army.position					= GetPosition(_position)
	_army.rodeLength				= 4000
	_army.strength					= _strength
	_army.control					= {}
	_army.control.mode				= DEFEND
	_army.control.defendPosition	= _army.position
	_army.control.delay				= 20
	_army.experience                = _experience

	SetupArmy(_army)

	if _soldiers == nil then
		_soldiers = 9
	end

	local troopDescription = {
		maxNumberOfSoldiers	= _soldiers,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= _experience,
	}
	for i = 0 , _army.strength , 1 do
		troopDescription.leaderType = _troops[Logic.GetRandom(table.getn(_troops))+1]
		EnlargeArmy(_army,troopDescription)
		end

	end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmy(_army,_troops)

    --Report(_army.control.name.." delay: ".._army.control.delay.." state: ".._army.control.state.." refresh: ".._army.control.refreshCount)

    if IsVeryWeak(_army) and _army.control.state ~= STATE_REFRESH and _army.control.refreshCount > 0 then
        _army.control.refreshCount = _army.control.refreshCount -1
        _army.control.state = STATE_REFRESH
        _army.control.delay = _army.control.refreshTime
        Redeploy(_army,_army.control.preparePosition)
        return false
        end

    -- execute state

    if _army.control.state == STATE_PREPARE then
        Defend(_army)
        end

    if _army.control.state == STATE_ADVANCE then
        Advance(_army)
        end

    if _army.control.state == STATE_OCCUPY  then
        simpleDefendBehaviour(_army)
        end

    if _army.control.state == STATE_FINALIZE then
        Advance(_army)
        end

    -- state condition check

	if _army.control.delay > 0 then
		_army.control.delay = _army.control.delay -1
		return false
		end

    -- switch states

    if _army.control.state == STATE_REFRESH then
        if IsWeak(_army) then
            enlarge(_army,_troops)
            _army.control.delay = _army.control.refreshTime
            return false
        else
            _army.control.state = STATE_PREPARE
            return false
            end

        end

    if _army.control.state == STATE_PREPARE then
        _army.control.state = STATE_ADVANCE
        _army.control.delay = _army.control.advanceTime
        return false
        end

    if _army.control.state == STATE_ADVANCE then
        _army.control.state = STATE_OCCUPY
        _army.control.delay = _army.control.occupyTime
        Redeploy(_army,_army.control.occupyPosition)
        return false
        end

    if _army.control.state == STATE_OCCUPY then
        _army.control.state = STATE_FINALIZE
        _army.control.delay = _army.control.finalizeTime
        return false
        end

	end
------------------------------------------------------------------------------------------------------------------------------------
function enlarge(_army,_troops)
	local troop = {
		leaderType 			= _troops[Logic.GetRandom(table.getn(_troops))+1],
		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= _army.experience,
	}
	EnlargeArmy(_army,troop)
    end
