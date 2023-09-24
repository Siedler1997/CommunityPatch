DEFEND = 1
ATTACK = 2
ADVANCE = 3
	
globalRespawnTimer2 = 0	
	
simpleDefendBehaviour = function(_army)
	if _army.control.mode == DEFEND then
		Defend(_army)
		if _army.control.delay <= 0 then	
			_army.control.mode = DEFEND				
			_army.control.delay = 10 + Logic.GetRandom(10)			
			end
	elseif _army.control.mode == ATTACK then		
		FrontalAttack(_army)		
		if _army.control.delay <= 0 then		
			Redeploy(_army,_army.control.defendPosition)			
			_army.control.mode = ADVANCE			
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
	_army.rodeLength				= 1000
	_army.strength					= _strength
	_army.control					= {}
	_army.control.mode				= DEFEND
	_army.control.defendPosition	= _army.position
	_army.control.delay				= 20

	SetupArmy(_army)

	local troopDescription = {
	
		maxNumberOfSoldiers	= 20,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= _experience,
	}			

	for i = 0 , _army.strength , 1 do	
		troopDescription.leaderType = _troops[Logic.GetRandom(table.getn(_troops))+1]			
		EnlargeArmy(_army,troopDescription)
	end
		
end




---------------------------------------------------------------------------------------------


createArmySpawn = function()

	troops1	= { 		Entities.CU_Evil_LeaderBearman1,
				--Entities.CU_Evil_LeaderSkirmisher1,

				}
	troops2	= { 		--Entities.CU_Evil_LeaderBearman1,
				Entities.CU_Evil_LeaderSkirmisher1,

				}

	
				
---------------------------------------------------

	--p4 	*******forest savages**************

		armyp2_1	= {}
		createArmy(2, 0,armyp2_1,0,"p2_1",VERYHIGH_EXPERIENCE,troops1)
		StartJob("Controlarmyp2_1")

		armyp2_2	= {}
		createArmy(2, 1,armyp2_2,0,"p2_2",VERYHIGH_EXPERIENCE,troops2)
		StartJob("Controlarmyp2_2")



end



Condition_Controlarmyp2_1 = function()
	return true	
	end
Action_Controlarmyp2_1 = function()
	return simpleDefendBehaviour(armyp2_1)
	end
Condition_Controlarmyp2_2 = function()
	return true	
	end
Action_Controlarmyp2_2 = function()
	return simpleDefendBehaviour(armyp2_2)
	end



