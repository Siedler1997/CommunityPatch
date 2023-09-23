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
			--	Entities.PV_Cannon4,
				Entities.PU_LeaderPoleArm2,
				}
	troops2	= { 		Entities.PU_LeaderBow4,
				--Entities.PV_Cannon4,
				Entities.PU_LeaderPoleArm3,
                                Entities.PU_LeaderSword3,
				}
	troops3	= { 		Entities.PU_LeaderBow4,
				Entities.PU_LeaderRifle1,
				Entities.PU_LeaderCavalry2,
				Entities.PU_LeaderHavyCavalry1,
				}
	troops4= { 		Entities.PU_LeaderSword1,
			--	Entities.CU_BanditLeaderSword1,
				Entities.PU_LeaderPoleArm1,
				}
	troops5= { 	--	Entities.PU_LeaderSword1,
				Entities.CU_BanditLeaderSword2,
				Entities.CU_BanditLeaderSword2,
				Entities.CU_BanditLeaderBow2,
			--	Entities.PU_LeaderPoleArm1,
				}

	troops6	= { 		Entities.PU_LeaderCavalry2,
				Entities.PU_LeaderHavyCavalry2,
				Entities.PU_LeaderSword4,
				Entities.PU_LeaderHavyCavalry2,
				}

	troops7	= { Entities.PU_LeaderHeavyCavalry2,
			--	Entities.PU_LeaderPoleArm3,
				Entities.PV_Cannon4, 
				Entities.PU_LeaderHeavyCavalry2,
				Entities.PU_LeaderHeavyCavalry2,
				Entities.PV_Cannon4,
				Entities.PU_LeaderPoleArm3,
 				Entities.PV_Cannon4,
				Entities.PU_LeaderRifle2
				}

	troops8	= { 		Entities.PV_Cannon4,
				}

	troops9	= { 		Entities.PU_LeaderSword4,
				Entities.PU_LeaderHeavyCavalry4,
				Entities.PU_LeaderHeavyCavalry4,
				Entities.PU_LeaderSword4,
				Entities.PU_LeaderHeavyCavalry4,
				}
	troops10	= { 	Entities.PU_LeaderSword3,
			--	Entities.PV_Cannon4,
				Entities.PU_LeaderPoleArm3,
				}
	troops11	= { 	Entities.PU_LeaderBow4,
				Entities.PU_LeaderBow3,
				Entities.PU_LeaderCavalry2,
				Entities.PU_LeaderHavyCavalry2,
				Entities.PU_LeaderRifle2
				}
	troops12	= { 	Entities.PU_LeaderBow2,
				Entities.PU_LeaderBow2,
				Entities.PU_LeaderRifle1
				}



	--p1 	Dario's starting troops

		armyDario	= {}
		createArmy(1, 0,armyDario,1,"p1_spawn",MEDIUM_EXPERIENCE,troops1)
		StartJob("ControlArmyDario")


----------------------------------------
	--p3 base1	army <1>

		armyDefend1	= {}
		createArmy(6, 0,armyDefend1,1,"p4_spawn1",HIGH_EXPERIENCE,troops1)
		StartJob("ControlArmyDefend1")

	--p3 base2	army <2>

		armyDefend2	= {}
		createArmy(6, 1,armyDefend2,1,"p4_spawn2",HIGH_EXPERIENCE,troops12)
		StartJob("ControlArmyDefend2")


--------------
	--bandits	group <1>

		bandits1	= {}
		createArmy(2, 0,bandits1,1,"rob1",LOW_EXPERIENCE,troops4)
		StartJob("ControlBandits1")

	--bandits	group <2>

		bandits2	= {}
		createArmy(2, 1,bandits2,0,"rob2",LOW_EXPERIENCE,troops4)
		StartJob("ControlBandits2")

	--bandits	group <3>

		bandits3	= {}
		createArmy(2, 2,bandits3,1,"rob3",LOW_EXPERIENCE,troops4)
		StartJob("ControlBandits3")

	--bandits	group <4>

		bandits4	= {}
		createArmy(2, 3,bandits4,1,"rob4",LOW_EXPERIENCE,troops4)
		StartJob("ControlBandits4")

	--bandits	group <5>

		bandits5	= {}
		createArmy(2, 4,bandits5,1,"rob5",LOW_EXPERIENCE,troops4)
		StartJob("ControlBandits5")

	--bandits	group <6>

		bandits6	= {}
		createArmy(2, 5,bandits6,2,"rob6",MEDIUM_EXPERIENCE,troops5)
		StartJob("ControlBandits6")


------------------------------
	--player 5	group <1> islefoundry

		p4group1	= {}
		createArmy(5, 0,p4group1,3,"p5_spawn1",HIGH_EXPERIENCE,troops2)
		StartJob("ControlP4group1")

	--player 5	group <1> islefoundry cannons

		p4group0	= {}
		createArmy(5, 9,p4group0,1,"p5_spawn0",HIGH_EXPERIENCE,troops8)
		StartJob("ControlP4group0")


	--player 5	group <2> hidden west mountains

		p4group2	= {}
		createArmy(7, 1,p4group2,5,"p5_spawn2",MEDIUM_EXPERIENCE,troops1)
		StartJob("ControlP4group2")

	--player 5	group <X> onTop west mountains

		p4group11	= {}
		createArmy(7, 9,p4group11,1,"p5_spawn11",MEDIUM_EXPERIENCE,troops3)
		StartJob("ControlP4group11")


	--player 5	group <3> gate1 group

		p4group3	= {}
		createArmy(5, 2,p4group3,3,"p5_spawn3",MEDIUM_EXPERIENCE,troops10)
		StartJob("ControlP4group3")

	--player 5	group <4> gate2 group

		p4group4	= {}
		createArmy(5, 3,p4group4,2,"p5_spawn4",HIGH_EXPERIENCE,troops11)
		StartJob("ControlP4group4")

	--player 5	group <5> archers1 middle

		p4group7	= {}
		createArmy(5, 4,p4group7,0,"p5_spawn5",HIGH_EXPERIENCE,troops11)
		StartJob("ControlP4group7")

	--player 5	group <6> archers2 middle

		p4group5	= {}
		createArmy(5, 5,p4group5,1,"p5_spawn6",HIGH_EXPERIENCE,troops11)
		StartJob("ControlP4group5")

	--player 5	group <7> middle castle defenders

		p4group6	= {}
		createArmy(5, 6,p4group6,4,"p5_spawn7",HIGH_EXPERIENCE,troops9)
		StartJob("ControlP4group6")

	--player 5	group <8> west castle defenders

		p4group8	= {}
		createArmy(5, 7,p4group8,4,"p5_spawn8",HIGH_EXPERIENCE,troops7)
		StartJob("ControlP4group8")


	--player 5	group <9> swamp archery defenders

		p4group9	= {}
		createArmy(5, 8,p4group9,1,"p5_spawn9",HIGH_EXPERIENCE,troops10)
		StartJob("ControlP4group9")






end

Condition_ControlArmyDario = function()
	return true	
	end
Action_ControlArmyDario = function()
	return simpleDefendBehaviour(armyDario)
	end
--------

Condition_ControlArmyDefend1 = function()
	return true	
	end
Action_ControlArmyDefend1 = function()
	return simpleDefendBehaviour(armyDefend1)
	end

Condition_ControlArmyDefend2 = function()
	return true	
	end
Action_ControlArmyDefend2 = function()
	return simpleDefendBehaviour(armyDefend2)
	end


----------
Condition_ControlBandits1 = function()
	return true	
	end
Action_ControlBandits1 = function()
	return simpleDefendBehaviour(bandits1)
	end
Condition_ControlBandits2 = function()
	return true	
	end
Action_ControlBandits2 = function()
	return simpleDefendBehaviour(bandits2)
	end
Condition_ControlBandits3 = function()
	return true	
	end
Action_ControlBandits3 = function()
	return simpleDefendBehaviour(bandits3)
	end
Condition_ControlBandits4 = function()
	return true	
	end
Action_ControlBandits4 = function()
	return simpleDefendBehaviour(bandits4)
	end
Condition_ControlBandits5 = function()
	return true	
	end
Action_ControlBandits5 = function()
	return simpleDefendBehaviour(bandits5)
	end
Condition_ControlBandits6 = function()
	return true	
	end
Action_ControlBandits6 = function()
	return simpleDefendBehaviour(bandits6)
	end

--------------
Condition_ControlP4group1 = function()
	return true	
	end
Action_ControlP4group1 = function()
	return simpleDefendBehaviour(p4group1)
	end
Condition_ControlP4group2 = function()
	return true	
	end
Action_ControlP4group2 = function()
	return simpleDefendBehaviour(p4group2)
	end

Condition_ControlP4group3 = function()
	return true	
	end
Action_ControlP4group3 = function()
	return simpleDefendBehaviour(p4group3)
	end

Condition_ControlP4group4 = function()
	return true	
	end
Action_ControlP4group4 = function()
	return simpleDefendBehaviour(p4group4)
	end
Condition_ControlP4group5 = function()
	return true	
	end
Action_ControlP4group5 = function()
	return simpleDefendBehaviour(p4group5)
	end
Condition_ControlP4group6 = function()
	return true	
	end
Action_ControlP4group6 = function()
	return simpleDefendBehaviour(p4group6)
	end
Condition_ControlP4group7 = function()
	return true	
	end
Action_ControlP4group7 = function()
	return simpleDefendBehaviour(p4group7)
	end
Condition_ControlP4group8 = function()
	return true	
	end
Action_ControlP4group8 = function()
	return simpleDefendBehaviour(p4group8)
	end
Condition_ControlP4group9 = function()
	return true	
	end
Action_ControlP4group9 = function()
	return simpleDefendBehaviour(p4group9)
	end
Condition_ControlP4group0 = function()
	return true	
	end
Action_ControlP4group0 = function()
	return simpleDefendBehaviour(p4group0)
	end
Condition_ControlP4group11 = function()
	return true	
	end
Action_ControlP4group11 = function()
	return simpleDefendBehaviour(p4group11)
	end