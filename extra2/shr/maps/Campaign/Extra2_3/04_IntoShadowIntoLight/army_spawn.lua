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



createArmy = function(_playerId,_id,_army,_strength,_position,_experience,_troops,_numsol)

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
	
		maxNumberOfSoldiers	= _numsol,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= _experience,
	}			

	for i = 0 , _army.strength , 1 do	
		troopDescription.leaderType = _troops[Logic.GetRandom(table.getn(_troops))+1]			
		EnlargeArmy(_army,troopDescription)
		end
		

	end

---------------------------------------------------

createArmySpawn = function()

	Troops_1 = { Entities.PU_LeaderBow2 }
	Troops_2 = { Entities.PU_LeaderBow4 }
	Troops_3 = { Entities.PU_LeaderCavalry2 }
	Troops_4 = { Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BanditLeaderSword2,				
				}
	Troops_5 = { }
	Troops_6 = { Entities.PU_LeaderPoleArm4,
				Entities.PU_LeaderSword4 
				}
	Troops_7 = { }

	local experience = LOW_EXPERIENCE
	local soldiers = 4
	if CP_Difficulty == 1 then
		experience = experience + 2
		soldiers = soldiers * 2
		table.insert(Troops_5, Entities.PU_LeaderBow4)
		table.insert(Troops_5, Entities.PU_LeaderPoleArm4)
		table.insert(Troops_5, Entities.PU_LeaderSword4)
		
		table.insert(Troops_6, Entities.PU_LeaderHeavyCavalry2)
		table.insert(Troops_6, Entities.PU_LeaderBow4)
		
		table.insert(Troops_7, Entities.PU_LeaderBow2)
		table.insert(Troops_7, Entities.PU_LeaderPoleArm2)
		table.insert(Troops_7, Entities.PU_LeaderSword2)
	else
		table.insert(Troops_5, Entities.PU_LeaderBow1)
		table.insert(Troops_5, Entities.PU_LeaderPoleArm1)
		table.insert(Troops_5, Entities.PU_LeaderSword1)
		
		table.insert(Troops_6, Entities.PU_LeaderHeavyCavalry1)
		table.insert(Troops_6, Entities.PU_LeaderBow2)
		
		table.insert(Troops_7, Entities.PU_LeaderBow1)
		table.insert(Troops_7, Entities.PU_LeaderPoleArm1)
		table.insert(Troops_7, Entities.PU_LeaderSword1)
	end

------------------------------

	--  

		p2_def1	= {}
		createArmy(6, 8,p2_def1,1,"guards_b4",experience,Troops_2,soldiers)
		StartJob("Controlp2_def1")
	
		p2_def2	= {}
		createArmy(6, 7,p2_def2,1,"guards_b4_1",experience,Troops_2,soldiers)
		StartJob("Controlp2_def2")

		p2_def3	= {}
		createArmy(6, 6,p2_def3,0,"guards_b5_1",experience,Troops_2,soldiers)
		StartJob("Controlp2_def3")

		p2_def4	= {}
		createArmy(6, 5,p2_def4,0,"guards_b5",experience,Troops_2,soldiers)
		StartJob("Controlp2_def4")

		p2_def5	= {}
		createArmy(4, 0,p2_def5,0,"guards_b2",experience,Troops_2,soldiers)
		StartJob("Controlp2_def5")

		p2_def6	= {}
		createArmy(4, 1,p2_def6,0,"guards_b2_1",experience,Troops_2,soldiers)
		StartJob("Controlp2_def6")

		p2_def7	= {}
		createArmy(4, 2,p2_def7,1,"detect_point1",experience,Troops_6,8)
		StartJob("Controlp2_def7")

		p2_def8	= {}
		createArmy(4, 3,p2_def8,0,"p4_2",experience,Troops_1,soldiers)
		StartJob("Controlp2_def8")

		p2_def9	= {}
		createArmy(4, 4,p2_def9,0,"p4_3",experience,Troops_1,soldiers)
		StartJob("Controlp2_def9")

		p2_def10	= {}
		createArmy(4, 5,p2_def10,0,"p4_4",experience,Troops_1,soldiers)
		StartJob("Controlp2_def10")

		p2_def11	= {}
		createArmy(5, 0,p2_def11,1,"p5_1",experience,Troops_7,soldiers)	--!
		StartJob("Controlp2_def11")

		p2_def12	= {}
		createArmy(5, 1,p2_def12,0,"p5_2",experience,Troops_7,soldiers)	--!
		StartJob("Controlp2_def12")

		p2_def13	= {}
		createArmy(5, 2,p2_def13,1,"p5_3",experience,Troops_5,soldiers)
		StartJob("Controlp2_def13")

		p2_def14	= {}
		createArmy(5, 3,p2_def14,1,"p5_4",experience,Troops_5,8)
		StartJob("Controlp2_def13")

		p2_def15	= {}
		createArmy(5, 4,p2_def15,2,"p5_5",experience,Troops_6,8)
		StartJob("Controlp2_def13")

end

--------------------------------------


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
Condition_Controlp2_def10 = function()
	return true	
	end
Action_Controlp2_def10 = function()
	return simpleDefendBehaviour(p2_def10)
	end
Condition_Controlp2_def11 = function()
	return true	
	end
Action_Controlp2_def11 = function()
	return simpleDefendBehaviour(p2_def11)
	end
Condition_Controlp2_def12 = function()
	return true	
	end
Action_Controlp2_def12 = function()
	return simpleDefendBehaviour(p2_def12)
	end
Condition_Controlp2_def13 = function()
	return true	
	end
Action_Controlp2_def13 = function()
	return simpleDefendBehaviour(p2_def13)
	end
Condition_Controlp2_def14 = function()
	return true	
	end
Action_Controlp2_def14 = function()
	return simpleDefendBehaviour(p2_def14)
	end
Condition_Controlp2_def15 = function()
	return true	
	end
Action_Controlp2_def15 = function()
	return simpleDefendBehaviour(p2_def15)
	end

------------------------------

CavalryAttack = function()

	cavalry					= {}

	cavalry.player 				= 3
	cavalry.id					= 8
	cavalry.strength				= 4
	cavalry.retreatStrength			= 1
	cavalry.position				= GetPosition("AI_bridge")
	cavalry.rodeLength				= 2000
	cavalry.AllowedTypes 				= { UpgradeCategories.LeaderHeavyCavalry,
							    UpgradeCategories.LeaderCavalry,
							    UpgradeCategories.LeaderBow,
							    UpgradeCategories.LeaderRifle,
							    UpgradeCategories.LeaderSword,
							   										
										}


	cavalry.baseDefenseRange		= 3000
	cavalry.outerDefenseRange		= 2000
	cavalry.AttackPos			= GetPosition("my_castle")
	cavalry.AttackAllowed			= true

	cavalry.control			= {}
	cavalry.control.delay			= 20 * 15

	SetupArmy(cavalry)

	SetupAITroopGenerator("AI_bridge",cavalry)



	--[[
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 2)
	--]]


	StartJob("ControlCavalryArmies")	

	end

	
-----------------------------------------------------------------------------------------------------------------------
Condition_ControlCavalryArmies = function()
	if cavalry.control.delay > 0 then
		cavalry.control.delay = cavalry.control.delay -1
		return false
		end		
	return Counter.Tick2("ControlCavalryArmies",20)
	end
Action_ControlCavalryArmies = function()

	TickOffensiveAIController(cavalry)

	return false		
	end


----------------------------------

function createDarioArmy(_troopsnum)

	-- Init army
	ArmyPatrol						= 	{}
	ArmyPatrol.player 				=	6
	ArmyPatrol.id					=	3
	ArmyPatrol.strength				=	20
	ArmyPatrol.position				=	GetPosition("ArmyDario")
	ArmyPatrol.rodeLength			=	10000
	ArmyPatrol.beAgressive			=	true
	
	ArmyPatrol.retreatStrength		=	0
	ArmyPatrol.baseDefenseRange		=	10000
	ArmyPatrol.outerDefenseRange	=	10000
	ArmyPatrol.AttackAllowed		=	true
	ArmyPatrol.pulse				=	false
	
--	ArmyPatrol.patrolPointTime		=	3*60
	
	SetupArmy(ArmyPatrol)

	local troops = { 		Entities.PV_Cannon4,
				Entities.PU_LeaderBow4,
				Entities.PU_LeaderPoleArm4,
				Entities.PU_LeaderSword4,
				Entities.PU_LeaderSword4,
				Entities.PU_LeaderBow4,
				Entities.PU_LeaderRifle2
				}
	
	local experience = HIGH_EXPERIENCE
	if CP_Difficulty == 1 then
		experience = experience + 1
	end
	
	local troopDescription = {
	
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= experience,
	}			
	
	local RandomUnit={}

	for h=1,math.floor(_troopsnum / 2) + 10 ,1 do

	RandomUnit[h] = troops[Logic.GetRandom(table.getn(troops))+1]

	troopDescription.leaderType = RandomUnit[h]
	EnlargeArmy(ArmyPatrol,troopDescription)

	end

	Redeploy(ArmyPatrol, ArmyPatrol.position)

	StartSimpleJob("ControlArmyDario")

end

function ControlArmyDario()

	if Counter.Tick2("ControlArmyDario", 10) then

		if IsDead(ArmyPatrol) then
		
		return true
		end
	
		ArmyPatrol.position	=	GetPosition("my_castle")
			
		Redeploy(ArmyPatrol, ArmyPatrol.position)
			
		TickOffensiveAIController(ArmyPatrol)
	
	end
end

----------------------------

function createDarioArmy1(_troopsnum)

	-- Init army
	ArmyPatrol1						= 	{}
	ArmyPatrol1.player 				=	6
	ArmyPatrol1.id					=	2
	ArmyPatrol1.strength				=	20
	ArmyPatrol1.position				=	GetPosition("ArmyDario1")
	ArmyPatrol1.rodeLength			=	10000
	ArmyPatrol1.beAgressive			=	true
	
	ArmyPatrol1.retreatStrength		=	0
	ArmyPatrol1.baseDefenseRange		=	10000
	ArmyPatrol1.outerDefenseRange	=	10000
	ArmyPatrol1.AttackAllowed		=	true
	ArmyPatrol1.pulse				=	false
	
--	ArmyPatrol1.patrolPointTime		=	3*60
	
	SetupArmy(ArmyPatrol1)

	local troops = { 		Entities.PV_Cannon4,
				Entities.PU_LeaderBow4,
				Entities.PU_LeaderPoleArm4,
				Entities.PU_LeaderSword4,
				Entities.PU_LeaderSword4,
				Entities.PU_LeaderBow4,
				Entities.PU_LeaderRifle2
				}
	
	local experience = HIGH_EXPERIENCE
	if CP_Difficulty == 1 then
		experience = experience + 1
	end
	
				
	local troopDescription = {
	
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= experience,
	}			
	
	local RandomUnit={}

	for h=1,math.floor(_troopsnum / 2) + 10 ,1 do

	RandomUnit[h] = troops[Logic.GetRandom(table.getn(troops))+1]

	troopDescription.leaderType = RandomUnit[h]
	EnlargeArmy(ArmyPatrol1,troopDescription)

	end

	Redeploy(ArmyPatrol1, ArmyPatrol1.position)

	StartSimpleJob("ControlArmyDario1")

end


function ControlArmyDario1()

	if Counter.Tick2("ControlArmyDario1", 10) then

		if IsDead(ArmyPatrol1) then
		
		return true
		end
	
		ArmyPatrol1.position	=	GetPosition("my_castle")
			
		Redeploy(ArmyPatrol1, ArmyPatrol1.position)
			
		TickOffensiveAIController(ArmyPatrol1)
	
	end
end

----------------------------

function createDarioArmy2(_troopsnum)

	-- Init army
	ArmyPatrol2						= 	{}
	ArmyPatrol2.player 				=	3
	ArmyPatrol2.id					=	0
	ArmyPatrol2.strength				=	20
	ArmyPatrol2.position				=	GetPosition("traderoute3_1")
	ArmyPatrol2.rodeLength			=	10000
	ArmyPatrol2.beAgressive			=	true
	
	ArmyPatrol2.retreatStrength		=	0
	ArmyPatrol2.baseDefenseRange		=	10000
	ArmyPatrol2.outerDefenseRange	=	10000
	ArmyPatrol2.AttackAllowed		=	true
	ArmyPatrol2.pulse				=	false
	
--	ArmyPatrol2.patrolPointTime		=	3*60
	
	SetupArmy(ArmyPatrol2)

	local troops = { 		
				Entities.PU_LeaderHeavyCavalry2,
				Entities.PU_LeaderHeavyCavalry2,
				Entities.PU_LeaderHeavyCavalry2,
				Entities.PU_LeaderHeavyCavalry2,
				Entities.PU_LeaderHeavyCavalry2,
				Entities.PU_LeaderCavalry2,
				Entities.PU_LeaderCavalry2
				}
	
	local experience = HIGH_EXPERIENCE
	if CP_Difficulty == 1 then
		experience = experience + 1
	end
	
				
	local troopDescription = {
	
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= experience,
	}			
	
	local RandomUnit={}

	for h=1,math.floor(_troopsnum / 2) + 10 ,1 do

	RandomUnit[h] = troops[Logic.GetRandom(table.getn(troops))+1]

	troopDescription.leaderType = RandomUnit[h]
	EnlargeArmy(ArmyPatrol2,troopDescription)

	end

	Redeploy(ArmyPatrol2, ArmyPatrol2.position)

	StartSimpleJob("ControlArmyDario2")

end


function ControlArmyDario2()

	if Counter.Tick2("ControlArmyDario2", 10) then

		if IsDead(ArmyPatrol2) then
		
		return true
		end
	
		ArmyPatrol2.position	=	GetPosition("my_castle")
			
		Redeploy(ArmyPatrol2, ArmyPatrol2.position)
			
		TickOffensiveAIController(ArmyPatrol2)
	
	end
end


--**********************************[kerberos starting army]****************************************

function CreateArmyKerberos()

	ArmyKerberos					= {}

	ArmyKerberos.player 				= 1
	ArmyKerberos.id					= 0
	ArmyKerberos.strength				= 8
	ArmyKerberos.position				= GetPosition("support1")
	ArmyKerberos.rodeLength				= 7000


		local troopDescription_1 	= {
	
			leaderType 				= Entities.PU_LeaderSword4, --Entities.CU_BlackKnight_LeaderMace2,
			maxNumberOfSoldiers			= 8,
			minNumberOfSoldiers			= 0,
			experiencePoints 				= LOW_EXPERIENCE,
		}
		local troopDescription_2 	= {
	
			leaderType 				= Entities.PU_LeaderBow4, --Entities.CU_BanditLeaderSword2,
			maxNumberOfSoldiers			= 8,
			minNumberOfSoldiers			= 0,
			experiencePoints 				= LOW_EXPERIENCE,
		}
		local troopDescription_3 	= {
	
			leaderType 				= Entities.CU_BanditLeaderSword2, --Entities.CU_Barbarian_LeaderClub2,
			maxNumberOfSoldiers			= 8,
			minNumberOfSoldiers			= 0,
			experiencePoints 				= LOW_EXPERIENCE,
		}
		local troopDescription_4 	= {
	
			leaderType 				= Entities.CU_Barbarian_LeaderClub2,
			maxNumberOfSoldiers			= 8,
			minNumberOfSoldiers			= 0,
			experiencePoints 				= LOW_EXPERIENCE,
		}
		local troopDescription_5 	= {
	
			leaderType 				= Entities.CU_BlackKnight_LeaderMace2,
			maxNumberOfSoldiers			= 8,
			minNumberOfSoldiers			= 0,
			experiencePoints 				= LOW_EXPERIENCE,
		}

		support1 = CreateTroop(ArmyKerberos,troopDescription_4)
--		support2 = CreateTroop(ArmyKerberos,troopDescription_5)

ArmyKerberos.position	= GetPosition("support2")
		support3 = CreateTroop(ArmyKerberos,troopDescription_5)

ArmyKerberos.position	= GetPosition("support3")
		support4 = CreateTroop(ArmyKerberos,troopDescription_2)

ArmyKerberos.position	= GetPosition("support4")
		support5 = CreateTroop(ArmyKerberos,troopDescription_1)

ArmyKerberos.position	= GetPosition("support5")
		support6 = CreateTroop(ArmyKerberos,troopDescription_3)

--[[ArmyKerberos.position	= GetPosition("support6")
		support6 = CreateTroop(ArmyKerberos,troopDescription_4)
		support7 = CreateTroop(ArmyKerberos,troopDescription_5)]]


end
