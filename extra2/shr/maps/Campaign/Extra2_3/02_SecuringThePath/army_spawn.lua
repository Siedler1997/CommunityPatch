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



createArmy = function(_playerId,_id,_army,_strength,_position,_experience,_troops)

	_army.player 					= _playerId
	_army.id					= _id
	_army.position					= GetPosition(_position)
	_army.rodeLength				= 1000
	_army.strength					= _strength
	_army.control					= {}
	_army.control.mode				= DEFEND
	_army.control.defendPosition			= _army.position
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
--------------------------------------------------------------------------

createArmySpawn = function()
	Troops4	= { 		Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BanditLeaderSword2,	
				Entities.CU_BanditLeaderBow2				
				}
	Troops5	= { 		
				Entities.PV_Cannon2
				}
	Troops6 = { 		Entities.PV_Cannon4,
				Entities.PU_LeaderHeavyCavalry2,
				Entities.PU_LeaderBow4,
				Entities.PU_LeaderPoleArm4,
				Entities.PU_LeaderSword4,
				}

	if CP_Difficulty < 2 then
		Troops1	= { 		Entities.PU_LeaderSword2,
					Entities.PU_LeaderSword2,
					Entities.PU_LeaderPoleArm2,
					}
		Troops2 = { 		Entities.PU_LeaderBow2,
					Entities.PU_LeaderBow2,
					Entities.PU_LeaderBow4,
					Entities.PU_LeaderPoleArm2,
					}
		Troops3	= { 		Entities.PU_LeaderHeavyCavalry1			
					}

		table.insert(Troops5, Entities.PV_Cannon1)
	else
		Troops1	= { 		Entities.PU_LeaderSword3,
					Entities.PU_LeaderSword3,
					Entities.PU_LeaderPoleArm3,
					}
		Troops2 = { 		Entities.PU_LeaderBow3,
					Entities.PU_LeaderBow3,
					Entities.PU_LeaderBow4,
					Entities.PU_LeaderPoleArm3,
					}
		Troops3	= { 		Entities.PU_LeaderHeavyCavalry2				
					}

		table.insert(Troops5, Entities.PV_Cannon3)
	end
------------------------------

	--south bridge defend	groups 

		p2_def1	= {}
		createArmy(2, 0,p2_def1,1,"target10",CP_Difficulty,Troops5)
		StartJob("Controlp2_def1")

		p2_def2	= {}
		createArmy(2, 1,p2_def2,0,"target1",CP_Difficulty,Troops5)
		StartJob("Controlp2_def2")

	--middle bridge defense groups
		
		p2_def3	= {}
		createArmy(2, 2,p2_def3,1,"camp1",CP_Difficulty,Troops2)
		StartJob("Controlp2_def3")

		p2_def4	= {}
		createArmy(2, 3,p2_def4,1,"target2_6",CP_Difficulty,Troops3)
		StartJob("Controlp2_def4")

		p2_def5	= {}
		createArmy(2, 4,p2_def5,0,"target2_9",CP_Difficulty,Troops2)
		StartJob("Controlp2_def5")
		
		p2_def6	= {}
		createArmy(2, 5,p2_def6,1,"target2_13",CP_Difficulty,Troops1)
		StartJob("Controlp2_def6")

	--north bridge defense groups

		p2_def7	= {}
		createArmy(2, 6,p2_def7,1,"target3_5",CP_Difficulty,Troops2)
		StartJob("Controlp2_def7")

		p2_def8	= {}
		createArmy(2, 7,p2_def8,1,"target3_7",CP_Difficulty,Troops5)
		StartJob("Controlp2_def8")

	--middle bridge player 3 defense groups

		p2_def9	= {}
		createArmy(3, 2,p2_def9,1,"spawn2_6",CP_Difficulty,Troops2)
		StartJob("Controlp2_def9")

	--north base defence troops

		p3_def1	= {}
		createArmy(3, 3,p3_def1,3,"defend_1",CP_Difficulty,Troops6)
		StartJob("Controlp3_def1")

		p3_def2	= {}
		createArmy(3, 4,p3_def2,3,"defend_2",CP_Difficulty,Troops6)
		StartJob("Controlp3_def2")

		p3_def3	= {}
		createArmy(3, 5,p3_def3,3,"defend_3",CP_Difficulty,Troops6)
		StartJob("Controlp3_def3")

	--player support starting groups

		p1_1	= {}
		createArmy(1, 0,p1_1,0,"support1",VERYHIGH_EXPERIENCE-CP_Difficulty,Troops4)

		p1_2	= {}
		createArmy(1, 1,p1_2,0,"support2",VERYHIGH_EXPERIENCE-CP_Difficulty,Troops4)

		p1_3	= {}
		createArmy(1, 2,p1_3,0,"support3",VERYHIGH_EXPERIENCE-CP_Difficulty,Troops4)
		

end






----------
Condition_Controlp2_def1 = function()
	return true	
	end
Action_Controlp2_def1 = function()
	return simpleDefendBehaviour(p2_def1)
	end
Condition_Controlp2_def2 = function()
	return true	
	end
Action_Controlp2_def2 = function()
	return simpleDefendBehaviour(p2_def2)
	end
Condition_Controlp2_def3 = function()
	return true	
	end
Action_Controlp2_def3 = function()
	return simpleDefendBehaviour(p2_def3)
	end
Condition_Controlp2_def4 = function()
	return true	
	end
Action_Controlp2_def4 = function()
	return simpleDefendBehaviour(p2_def4)
	end
Condition_Controlp2_def5 = function()
	return true	
	end
Action_Controlp2_def5 = function()
	return simpleDefendBehaviour(p2_def5)
	end
Condition_Controlp2_def6 = function()
	return true	
	end
Action_Controlp2_def6 = function()
	return simpleDefendBehaviour(p2_def6)
	end
Condition_Controlp2_def7 = function()
	return true	
	end
Action_Controlp2_def7 = function()
	return simpleDefendBehaviour(p2_def7)
	end
Condition_Controlp2_def8 = function()
	return true	
	end
Action_Controlp2_def8 = function()
	return simpleDefendBehaviour(p2_def8)
	end
Condition_Controlp2_def9 = function()
	return true	
	end
Action_Controlp2_def9 = function()
	return simpleDefendBehaviour(p2_def9)
	end
Condition_Controlp3_def1 = function()
	return true	
	end
Action_Controlp3_def1 = function()
	return simpleDefendBehaviour(p3_def1)
	end
Condition_Controlp3_def2 = function()
	return true	
	end
Action_Controlp3_def2 = function()
	return simpleDefendBehaviour(p3_def2)
	end
Condition_Controlp3_def3 = function()
	return true	
	end
Action_Controlp3_def3 = function()
	return simpleDefendBehaviour(p3_def3)
	end




--**********************************[army tower3]*********************
function CreateArmyTower3_1()

	ArmyTower3_1					= {}

	ArmyTower3_1.player 				= 2
	ArmyTower3_1.id					= 8
	ArmyTower3_1.strength				= 8
	ArmyTower3_1.position				= GetPosition("spawn3_1")
	ArmyTower3_1.rodeLength				= 1000
	ArmyTower3_1.AttackAllowed			= false
	ArmyTower3_1.experiencePoints		=	CP_Difficulty
	
	SetupArmy(ArmyTower3_1)
	SPAWN_3 = GetRandom(6) + GetRandom(11)
	StartSimpleJob("ControlArmyTower3_1")
end

function ControlArmyTower3_1()

	if IsDead("tower3") then
	return true
	
	else
		if IsDead(ArmyTower3_1) then

		if SPAWN_3 == 0 then
			SpawnT3_1()
		
		else 
			SPAWN_3 = SPAWN_3 - 1
		
		end

		end
	end
end

SpawnT3_1 = function()
		local etype = Entities.PU_LeaderBow2
		if CP_Difficulty == 2 then
			etype = Entities.PU_LeaderBow3
		end

		Redeploy(ArmyTower3_1,GetPosition("spawn3_1"),3000)
	
		local troopDescription 	= {
	
			leaderType 				= etype,
			maxNumberOfSoldiers			= 8,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= CP_Difficulty,
		}


		
		EnlargeArmy(ArmyTower3_1,troopDescription)
		EnlargeArmy(ArmyTower3_1,troopDescription)

		SPAWN_3 = GetRandom(6) + GetRandom(11)

end


--**********************************[army tower2]*********************
function CreateArmyTower2_1()

	ArmyTower2_1					= {}

	ArmyTower2_1.player 				= 3
	ArmyTower2_1.id					= 0
	ArmyTower2_1.strength				= 8
	ArmyTower2_1.position				= GetPosition("spawn2_1")
	ArmyTower2_1.rodeLength				= 2000
	ArmyTower2_1.AttackAllowed			= false
	ArmyTower2_1.experiencePoints		=	CP_Difficulty
	
	SetupArmy(ArmyTower2_1)
	SPAWN_1 = GetRandom(6) + GetRandom(11)
	StartSimpleJob("ControlArmyTower2_1")
end

function ControlArmyTower2_1()

	if IsDead("tower2") then
	return true
	
	else
		if IsDead(ArmyTower2_1) then

		if SPAWN_1 == 0 then
			SpawnT2_1()
		
		else 
			SPAWN_1 = SPAWN_1 - 1
		
		end

		end

	end
end

SpawnT2_1 = function()
		local etype = Entities.PU_LeaderSword2
		if CP_Difficulty == 2 then
			etype = Entities.PU_LeaderSword3
		end

		Redeploy(ArmyTower2_1,GetPosition("spawn2_1"),2000)
	
		local troopDescription 	= {
	
			leaderType 				= etype,
			maxNumberOfSoldiers			= 8,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= CP_Difficulty,
		}
		
		EnlargeArmy(ArmyTower2_1,troopDescription)
		EnlargeArmy(ArmyTower2_1,troopDescription)
		-- SPAWN_1 = GetRandom(6) + GetRandom(11)
		SPAWN_1 = 10 + GetRandom(10)

end

--**********************************[army tower1]*********************
function CreateArmyTower1_1()

	ArmyTower1_1					= {}

	ArmyTower1_1.player 				= 3
	ArmyTower1_1.id					= 1
	ArmyTower1_1.strength				= 8
	ArmyTower1_1.position				= GetPosition("spawn1_1")
	ArmyTower1_1.rodeLength				= 2500
	ArmyTower1_1.AttackAllowed			= false
	ArmyTower1_1.experiencePoints		=	CP_Difficulty
	
	SetupArmy(ArmyTower1_1)
	SPAWN_2 = GetRandom(6) + GetRandom(11)
	StartSimpleJob("ControlArmyTower1_1")
end

function ControlArmyTower1_1()

	if IsDead("tower1") then
	return true
	
	else
		if IsDead(ArmyTower1_1) then

		if SPAWN_2 == 0 then
			SpawnT1_1()
		
		else 
			SPAWN_2 = SPAWN_2 - 1
		
		end

		end


	end
end

SpawnT1_1 = function()
		local etype = Entities.PU_LeaderSword2
		if CP_Difficulty == 2 then
			etype = Entities.PU_LeaderSword3
		end

		Redeploy(ArmyTower1_1,GetPosition("spawn1_1"),2500)
	
		local troopDescription 	= {
	
			leaderType 				= Entities.PU_LeaderRifle1,
			maxNumberOfSoldiers			= 8,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= CP_Difficulty,
		}

		local troopDescription_1 	= {
	
			leaderType 				= etype,
			maxNumberOfSoldiers			= 8,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= CP_Difficulty,
		}
		
		EnlargeArmy(ArmyTower1_1,troopDescription)
		EnlargeArmy(ArmyTower1_1,troopDescription)
		EnlargeArmy(ArmyTower1_1,troopDescription_1)

		-- SPAWN_2 = GetRandom(6) + GetRandom(11)
		SPAWN_2 = 10 + GetRandom(11)


end
--**********************************[if village buildings are destroyed the player must learn a lesson]*********
SpawnArmyVillage = function()


	if IsDead("b_1") or IsDead("b_2") or IsDead("b_3") or IsDead("b_4") or IsDead("b_5") or IsDead("b_6") or IsDead("b_7") or IsDead("b_8") or IsDead("b_9") or IsDead("b_10") or IsDead("b_11") then
	CreateArmyVillage()
	return true
	end


end

--**********************************[army defend spawned if village buildings are destroyed]*********************
function CreateArmyVillage()

	ArmyVillage					= {}

	ArmyVillage.player 				= 3
	ArmyVillage.id					= 6
	ArmyVillage.strength				= 8
	ArmyVillage.position				= GetPosition("army_village")
	ArmyVillage.rodeLength				= 7000
	ArmyVillage.AttackAllowed			= true

			local troopDescription 	= {
	
			leaderType 				= Entities.PU_LeaderBow4,
			maxNumberOfSoldiers			= 8,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= CP_Difficulty,
		}
			local troopDescription_1 	= {
	
			leaderType 				= Entities.PU_LeaderSword4,
			maxNumberOfSoldiers			= 8,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= CP_Difficulty,
		}
			local troopDescription_2 	= {
	
			leaderType 				= Entities.PU_LeaderPoleArm4,
			maxNumberOfSoldiers			= 8,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= CP_Difficulty,
		}
			local troopDescription_3 	= {
	
			leaderType 				= Entities.PU_LeaderHeavyCavalry2,
			maxNumberOfSoldiers			= 3,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= CP_Difficulty,
		}

	EnlargeArmy(ArmyVillage,troopDescription)
	EnlargeArmy(ArmyVillage,troopDescription_1)
	EnlargeArmy(ArmyVillage,troopDescription_2)
	EnlargeArmy(ArmyVillage,troopDescription_3)
	EnlargeArmy(ArmyVillage,troopDescription_3)

	SetupArmy(ArmyVillage)

--	Move(ArmyVillage,"market",100)
	
end

