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
	
		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= _experience,
	}			

	for i = 0 , _army.strength , 1 do	
		troopDescription.leaderType = _troops[Logic.GetRandom(table.getn(_troops))+1]			
		EnlargeArmy(_army,troopDescription)
		end
		
	end


createArmySpawn = function()

	troops1	= { 		Entities.PU_LeaderSword2,
				Entities.PU_LeaderPoleArm2,
				}
	troops2	= { 		Entities.PU_LeaderBow2,
				}
	troops3	= { 		Entities.PU_LeaderHeavyCavalry2,
				Entities.PU_LeaderPoleArm3,
				Entities.PV_Cannon4, 
				}
	troops4	= { 		Entities.PU_LeaderHeavyCavalry2,
				}
	troops5	= { 		Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2
				}
	troops6	= { 		Entities.PU_LeaderPoleArm3,
				}
	troops7	= { 		Entities.PU_LeaderBow4,
				Entities.PU_LeaderSword4,
				}
	troops8	= { 		Entities.PU_LeaderSword3,
				Entities.PU_LeaderPoleArm3,
				}
---------------------------------------------------

	--p1 	player's starting troops

		army1Player	= {}
		createArmy(1, 0,army1Player,1,"p1_spawn1",HIGH_EXPERIENCE,troops1)


		army2Player	= {}
		createArmy(1, 1,army1Player,1,"p1_spawn2",HIGH_EXPERIENCE,troops1)


		army3Player	= {}
		createArmy(1, 2,army1Player,1,"p1_spawn4",HIGH_EXPERIENCE,troops1)


		army4Player	= {}
		createArmy(1, 3,army1Player,1,"p1_spawn3",HIGH_EXPERIENCE,troops2)

	--p2    guards from the mountains

		robbers	= {}
		createArmy(2, 0,robbers,3,"mineguard",MEDIUM_EXPERIENCE,troops1)
		StartJob("ControlarmyRobbers")

	--p3   armydefendNorth

		p3army1	= {}
		createArmy(3, 5,p3army1,2,"defendersN1",HIGH_EXPERIENCE,troops6)
		StartJob("Controlp3army1")
		p3army2	= {}
		createArmy(3, 6,p3army2,3,"defendersN2",HIGH_EXPERIENCE,troops7)
		StartJob("Controlp3army2")
  
	--p3   armydefendeast 

		p3army3	= {}
		createArmy(3, 7,p3army3,2,"defendersE1",HIGH_EXPERIENCE,troops5)
		StartJob("Controlp3army3")
		p3army4	= {}
		createArmy(3, 8,p3army4,2,"defendersE2",HIGH_EXPERIENCE,troops5)
		StartJob("Controlp3army4")

	--p4   armydefendSouth 

		p3army5	= {}
		createArmy(4, 0,p3army5,1,"defendersS1",HIGH_EXPERIENCE,troops4)
		StartJob("Controlp3army5")
		p3army6	= {}
		createArmy(4, 1,p3army6,3,"defendersS2",HIGH_EXPERIENCE,troops8)
		StartJob("Controlp3army6")
		p3army7	= {}
		createArmy(4, 2,p3army7,2,"defendersS3",HIGH_EXPERIENCE,troops3)
		StartJob("Controlp3army7")


end

Condition_ControlarmyRobbers = function()
	return true	
	end
Action_ControlarmyRobbers = function()
	return simpleDefendBehaviour(robbers)
	end
Condition_Controlp3army1 = function()
	return true	
	end
Action_Controlp3army1 = function()
	return simpleDefendBehaviour(p3army1)
	end
Condition_Controlp3army2 = function()
	return true	
	end
Action_Controlp3army2 = function()
	return simpleDefendBehaviour(p3army2)
	end
Condition_Controlp3army3 = function()
	return true	
	end
Action_Controlp3army3 = function()
	return simpleDefendBehaviour(p3army3)
	end
Condition_Controlp3army4 = function()
	return true	
	end
Action_Controlp3army4 = function()
	return simpleDefendBehaviour(p3army4)
	end
Condition_Controlp3army5 = function()
	return true	
	end
Action_Controlp3army5 = function()
	return simpleDefendBehaviour(p3army5)
	end
Condition_Controlp3army6 = function()
	return true	
	end
Action_Controlp3army6 = function()
	return simpleDefendBehaviour(p3army6)
	end
Condition_Controlp3army7 = function()
	return true	
	end
Action_Controlp3army7 = function()
	return simpleDefendBehaviour(p3army7)
	end
