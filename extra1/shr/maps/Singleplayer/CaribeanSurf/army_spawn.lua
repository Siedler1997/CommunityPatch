DEFEND = 1
ATTACK = 2
ADVANCE = 3
-----------------------------------ARMY SPAWN BEHAVIOUR	
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



createArmy = function(_playerId,_id,_army,_strength,_position,_experience,_troops,_soldiers)

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
--------------------------------------------------------------------------

createArmySpawn = function()

	troops1	= { 		Entities.PU_LeaderSword2,
				}

	troops2	= { 		Entities.PU_LeaderPoleArm2,
				}

	troops3	= { 		Entities.CU_BanditLeaderSword2,
				Entities.CU_Barbarian_LeaderClub2,
				}
	troops4	= { 		Entities.CU_BanditLeaderSword2,
				Entities.CU_BanditLeaderSword2,
				Entities.CU_BanditLeaderBow2
				}

	troops5	= { 		Entities.PU_LeaderSword2,
				Entities.PU_LeaderSword2,
				Entities.PU_LeaderPoleArm2,
				}

	troops6 = { 		Entities.PU_LeaderBow2,
				Entities.PU_LeaderBow2,
				Entities.PU_LeaderBow4,
				Entities.PU_LeaderPoleArm2,
				}
	troops7	= { 		Entities.PU_LeaderHeavyCavalry1,
				Entities.PU_LeaderCavalry2,				
				}

	troops8	= { 		--Entities.PU_LeaderBow2,
				Entities.PU_LeaderBow4,
				}
	troops9	= { 		
				Entities.PU_LeaderHeavyCavalry2,
				Entities.PV_Cannon4,
				--Entities.PU_LeaderHavyCavalry2,
				--Entities.PV_Cannon4,
				}
------------------------------

	--pirate's  troops	group <1>

		pirates1	= {}
		createArmy(2, 0,pirates1,1,"pirates1",LOW_EXPERIENCE,troops3, 6)
		StartJob("ControlPirates1")

	--pirate's  troops 	group <3>

		pirates3	= {}
		createArmy(2, 1,pirates3,1,"pirates3",MEDIUM_EXPERIENCE,troops4, 6)
		StartJob("ControlPirates3")


	--pirate's  troops 	group <4>

		pirates4	= {}
		createArmy(2, 2,pirates4,2,"pirates4",MEDIUM_EXPERIENCE,troops3, 6)
		StartJob("ControlPirates4")

	--pirate's  troops 	group <5> sulfur island

		pirates5	= {}
		createArmy(2, 3,pirates5,2,"bandits1",MEDIUM_EXPERIENCE,troops1)
		StartJob("ControlPirates5")


	--pirate's  troops 	group <6> sulfur island

		pirates6	= {}
		createArmy(2, 4,pirates6,1,"bandits2",MEDIUM_EXPERIENCE,troops2)
		StartJob("ControlPirates6")


------------------------------


--------------
	--dario's starting troops	group <1+2>
--		army1	= {}
--		createArmy(1, 0,army1,0,"startpoint1",MEDIUM_EXPERIENCE,troops1)
	--	StartJob("ControlArmy1")

--				Logic.SetEntityName(darioarmy1, "darioarmy1")

--		army2	= {}
--		createArmy(1, 1,army2,0,"startpoint2",HIGH_EXPERIENCE,troops2)
	--	StartJob("ControlArmy2")


-------------------
--player 4 defend


		p4army1	= {}
		createArmy(4, 0,p4army1,2,"base1_1",LoW_EXPERIENCE,troops7)
		StartJob("Controlp4army1")

		p4army2	= {}
		createArmy(4, 1,p4army2,3,"base1_2",HIGH_EXPERIENCE,troops6)
		StartJob("Controlp4army2")

		p4army3	= {}
		createArmy(4, 2,p4army3,2,"construct2",HIGH_EXPERIENCE,troops5)
		StartJob("Controlp4army3")

--player3 Mansion

		
		p3army1	= {}
		createArmy(3, 9,p3army1,1,"attackpoint1",MEDIUM_EXPERIENCE,troops1)
		StartJob("Controlp3army1")

--player 5 defend


		p5army1	= {}
		createArmy(5, 7,p5army1,1,"p5sp1",LoW_EXPERIENCE,troops7)
		StartJob("Controlp5army1")

		p5army2	= {}
		createArmy(5, 8,p5army2,1,"p5sp2",MEDIUM_EXPERIENCE,troops8)
		StartJob("Controlp5army2")

		p5army3	= {}
		createArmy(5, 9,p5army3,3,"p5_4",HIGH_EXPERIENCE,troops9)
		StartJob("Controlp5army3")





end






----------
Condition_ControlPirates1 = function()
	return true	
	end
Action_ControlPirates1 = function()
	return simpleDefendBehaviour(pirates1)
	end
Condition_ControlPirates3 = function()
	return true	
	end
Action_ControlPirates3 = function()
	return simpleDefendBehaviour(pirates3)
	end
Condition_ControlPirates4 = function()
	return true	
	end
Action_ControlPirates4 = function()
	return simpleDefendBehaviour(pirates4)
	end
Condition_ControlPirates5 = function()
	return true	
	end
Action_ControlPirates5 = function()
	return simpleDefendBehaviour(pirates5)
	end
Condition_ControlPirates6 = function()
	return true	
	end
Action_ControlPirates6 = function()
	return simpleDefendBehaviour(pirates6)
	end
--------------

Condition_Controlp4army1 = function()
	return true	
	end
Action_Controlp4army1 = function()
	return simpleDefendBehaviour(p4army1)
	end

Condition_Controlp4army2 = function()
	return true	
	end
Action_Controlp4army2 = function()
	return simpleDefendBehaviour(p4army2)
	end

Condition_Controlp4army3 = function()
	return true	
	end
Action_Controlp4army3 = function()
	return simpleDefendBehaviour(p4army3)
	end

Condition_Controlp3army1 = function()
	return true	
	end
Action_Controlp3army1 = function()
	return simpleDefendBehaviour(p3army1)
	end

Condition_Controlp5army1 = function()
	return true	
	end
Action_Controlp5army1 = function()
	return simpleDefendBehaviour(p5army1)
	end

Condition_Controlp5army2 = function()
	return true	
	end
Action_Controlp5army2 = function()
	return simpleDefendBehaviour(p5army2)
	end

Condition_Controlp5army3 = function()
	return true	
	end
Action_Controlp5army3 = function()
	return simpleDefendBehaviour(p5army3)
	end



createArmySpawndario = function(_point)

	troops1	= { 		Entities.PU_LeaderSword2,
				}

	troops2	= { 		Entities.PU_LeaderPoleArm2,
				}



--------------
	--dario's starting troops	group <1+2>
		army1	= {}
		createArmy(1, 0,army1,0,_point,MEDIUM_EXPERIENCE,troops1)
	--	StartJob("ControlArmy1")

		army2	= {}
		createArmy(1, 1,army2,0,_point,HIGH_EXPERIENCE,troops2)
	--	StartJob("ControlArmy2")


end

createArmySpawndario1 = function(_point)

	troops1	= { 		Entities.PU_LeaderBow2,
				}



--------------
	--dario's starting troops	group <1+2>
		army1	= {}
		createArmy(1, 0,army1,0,_point,MEDIUM_EXPERIENCE,troops1)


end




createArmyDario = function()

	--	set up

		armyErec					= {}
	
		armyErec.player 			= 1
		armyErec.id					= 2
		armyErec.strength			= 5
		armyErec.position			= GetPosition("startpoint1")
		armyErec.rodeLength			= 1000
		armyErec.control			= {}
		armyErec.control.delay		= 0
		
--		SetupArmy(armyErec)


	-- create
		local troopDescription = {
			
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}			
	
		
		troopDescription.leaderType = Entities.PU_LeaderSword4
		support1 = CreateTroop(armyErec,troopDescription)  
		support2 = CreateTroop(armyErec,troopDescription)
		troopDescription.leaderType = Entities.PU_LeaderPoleArm4
		support3 = CreateTroop(armyErec,troopDescription)
		support4 = CreateTroop(armyErec,troopDescription)
 

		armyErec.position			= GetPosition("startpoint2")
		troopDescription.leaderType = Entities.PU_LeaderBow4
		support5 = CreateTroop(armyErec,troopDescription)  
		support6 = CreateTroop(armyErec,troopDescription)
		troopDescription.leaderType = Entities.PU_LeaderRifle2
		support7 = CreateTroop(armyErec,troopDescription)  

		Logic.SetEntityName(support1, "support1_1")
		Logic.SetEntityName(support2, "support2_1")
		Logic.SetEntityName(support3, "support3_1")
		Logic.SetEntityName(support4, "support4_1")
		Logic.SetEntityName(support5, "support5_1")
		Logic.SetEntityName(support6, "support6_1")
		Logic.SetEntityName(support7, "support7_1")

	
	end

---------------------------------------------
createArmyDario1 = function()

	--	set up

		armyDario					= {}
	
		armyDario.player 			= 1
		armyDario.id					= 8
		armyDario.strength			= 5
		armyDario.position			= GetPosition("archery1")
		armyDario.rodeLength			= 1000
		armyDario.control			= {}
		armyDario.control.delay		= 0
		
--		SetupArmy(armyDario)


	-- create
		local troopDescription = {
			
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}			
	
		
		troopDescription.leaderType = Entities.PU_LeaderSword3
		support8 = CreateTroop(armyDario,troopDescription)  
		troopDescription.leaderType = Entities.PU_LeaderPoleArm3
 		support9 = CreateTroop(armyDario,troopDescription)

		troopDescription.leaderType = Entities.PU_LeaderBow3  
		support0 = CreateTroop(armyDario,troopDescription)
  
		Logic.SetEntityName(support8, "support8_1")
		Logic.SetEntityName(support9, "support9_1")
		Logic.SetEntityName(support0, "support0_1")



	
	end



-------------------------------------------------
createArmyHelp = function()

	--	set up

		armyErec					= {}
	
		armyErec.player 			= 7
		armyErec.id					= 1
		armyErec.strength			= 1
		armyErec.position			= GetPosition("barracks1")
		armyErec.rodeLength			= 1000
		armyErec.control			= {}
		armyErec.control.delay		= 100
		



	-- create
		local troopDescription = {
			
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 4,
			experiencePoints 	= HIGH_EXPERIENCE,
		}			
	
		
		troopDescription.leaderType = Entities.PU_LeaderSword1
		 help1 = CreateTroop(armyErec,troopDescription)  

 

		armyErec.position			= GetPosition("barracks1")
		troopDescription.leaderType = Entities.PU_LeaderPoleArm1
		 help2 = CreateTroop(armyErec,troopDescription)
	--	 help3 = CreateTroop(armyErec,troopDescription)  
     



	SetupArmy(armyErec)

	StartJob("ControlArmyErec")
	
	end

	Condition_ControlArmyErec = function()
		return Counter.Tick2("ControlArmyErec",15)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyErec = function()
	-------------------------------------------------------------------------------------------------------------------
	Move(help1, "pirates4")
	Move(help2, "pirates4")
    --    Move(help3, "pirates4")

		return true
		
		end