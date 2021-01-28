TIME_OPEN = 25

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

-----------------------------------
createArmySpawn = function()
	local experience = LOW_EXPERIENCE
	Troops_1	= {}
	Troops_2	= { Entities.PU_LeaderBow4 }
	Troops_3	= { Entities.PU_LeaderCavalry2 }
	Troops_4	= { Entities.CU_BlackKnight_LeaderMace2,
					Entities.CU_Barbarian_LeaderClub2,
					Entities.CU_BanditLeaderSword2 }
	Troops_5	= { Entities.PV_Cannon2 }
	Troops_6	= { Entities.PV_Cannon4,
					Entities.PU_LeaderBow4,
					Entities.PU_LeaderPoleArm4,
					Entities.PU_LeaderSword4 }
	
	if CP_Difficulty == 0 then	
		table.insert(Troops_1, Entities.PU_LeaderSword2)
		table.insert(Troops_1, Entities.PU_LeaderSword2)
		table.insert(Troops_1, Entities.PU_LeaderPoleArm2)
		
		table.insert(Troops_2, Entities.PU_LeaderBow2)
		table.insert(Troops_2, Entities.PU_LeaderBow2)
		table.insert(Troops_2, Entities.PU_LeaderPoleArm2)
		
		table.insert(Troops_5, Entities.PV_Cannon1)
		
		table.insert(Troops_6, Entities.PU_LeaderHeavyCavalry1)
	else
		table.insert(Troops_1, Entities.PU_LeaderSword3)
		table.insert(Troops_1, Entities.PU_LeaderSword3)
		table.insert(Troops_1, Entities.PU_LeaderPoleArm3)
		
		table.insert(Troops_2, Entities.PU_LeaderBow3)
		table.insert(Troops_2, Entities.PU_LeaderBow3)
		table.insert(Troops_2, Entities.PU_LeaderPoleArm3)
		
		table.insert(Troops_3, Entities.PU_LeaderHeavyCavalry2)
		
		table.insert(Troops_5, Entities.PV_Cannon3)
		
		table.insert(Troops_6, Entities.PU_LeaderHeavyCavalry2)

		experience = experience + 2
	end

	------------------------------

	-- Pilgrim defend groups 

		p2_def1	= {}
		createArmy(2, 4,p2_def1,3,"def1",experience,Troops_6)
		StartJob("Controlp2_def1")
	
	-- market defend groups
	
		p3_def1	= {}
		createArmy(2, 5,p3_def1,3,"def3_1",experience,Troops_2)
		StartJob("Controlp3_def1")
		p3_def2	= {}
		createArmy(2, 6,p3_def2,4,"def3_2",experience,Troops_3)
		StartJob("Controlp3_def2")
		p3_def3	= {}
		createArmy(2, 7,p3_def3,3,"def3_3",experience,Troops_1)
		StartJob("Controlp3_def3")
		p3_def4	= {}
		createArmy(2, 8,p3_def4,2,"def3_4",experience,Troops_1)
		StartJob("Controlp3_def4")
		p3_def5	= {}
		createArmy(3, 0,p3_def5,1,"def3_5",experience,Troops_2)
		StartJob("Controlp3_def5")
		p3_def6	= {}
		createArmy(3, 1,p3_def6,1,"def3_6",experience,Troops_2)
		StartJob("Controlp3_def6")
		p3_def7	= {}
		createArmy(3, 2,p3_def7,2,"def3_7",experience,Troops_1)
		StartJob("Controlp3_def7")
		p3_def8	= {}
		createArmy(3, 3,p3_def8,2,"def3_8",experience,Troops_1)
		StartJob("Controlp3_def8")
		p3_def9	= {}
		createArmy(3, 4,p3_def9,1,"def3_9",experience,Troops_1)
		StartJob("Controlp3_def9")
		p3_def10	= {}
		createArmy(3, 5,p3_def10,1,"def3_10",experience,Troops_1)
		StartJob("Controlp3_def10")

end

Condition_Controlp2_def1 = function()
	return true	
	end
Action_Controlp2_def1 = function()
	return simpleDefendBehaviour(p2_def1)
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
Condition_Controlp3_def4 = function()
	return true	
	end
Action_Controlp3_def4 = function()
	return simpleDefendBehaviour(p3_def4)
	end
Condition_Controlp3_def5 = function()
	return true	
	end
Action_Controlp3_def5 = function()
	return simpleDefendBehaviour(p3_def5)
	end
Condition_Controlp3_def6 = function()
	return true	
	end
Action_Controlp3_def6 = function()
	return simpleDefendBehaviour(p3_def6)
	end
Condition_Controlp3_def7 = function()
	return true	
	end
Action_Controlp3_def7 = function()
	return simpleDefendBehaviour(p3_def7)
	end
Condition_Controlp3_def8 = function()
	return true	
	end
Action_Controlp3_def8 = function()
	return simpleDefendBehaviour(p3_def8)
	end
Condition_Controlp3_def9 = function()
	return true	
	end
Action_Controlp3_def9 = function()
	return simpleDefendBehaviour(p3_def9)
	end
Condition_Controlp3_def10 = function()
	return true	
	end
Action_Controlp3_def10 = function()
	return simpleDefendBehaviour(p3_def10)
	end
--**********************************[kerberos starting army]****************************************

function CreateArmyKerberos()

	ArmyKerberos					= {}

	ArmyKerberos.player 				= 1
	ArmyKerberos.id					= 0
	ArmyKerberos.strength				= 8
	ArmyKerberos.position				= GetPosition("p1_spawn")
	ArmyKerberos.rodeLength				= 7000


		local troopDescription_1 	= {
			leaderType 				= Entities.PU_LeaderSword3, --Entities.CU_BlackKnight_LeaderMace2,
			maxNumberOfSoldiers		= 8,
			minNumberOfSoldiers		= 0,
			experiencePoints 		= LOW_EXPERIENCE,
		}
		local troopDescription_2 	= {
			leaderType 				= Entities.PU_LeaderBow3, --Entities.CU_BanditLeaderSword2,
			maxNumberOfSoldiers		= 8,
			minNumberOfSoldiers		= 0,
			experiencePoints 		= LOW_EXPERIENCE,
		}
		local troopDescription_3 	= {
			leaderType 				= Entities.CU_BanditLeaderSword2, --Entities.CU_Barbarian_LeaderClub2,
			maxNumberOfSoldiers		= 8,
			minNumberOfSoldiers		= 0,
			experiencePoints 		= LOW_EXPERIENCE,
		}
		local troopDescription_4 	= {
			leaderType 				= Entities.CU_Barbarian_LeaderClub2,
			maxNumberOfSoldiers		= 8,
			minNumberOfSoldiers		= 0,
			experiencePoints 		= LOW_EXPERIENCE,
		}
		local troopDescription_5 	= {
			leaderType 				= Entities.CU_BlackKnight_LeaderMace2,
			maxNumberOfSoldiers		= 8,
			minNumberOfSoldiers		= 0,
			experiencePoints 		= LOW_EXPERIENCE,
		}

		support1 = CreateTroop(ArmyKerberos,troopDescription_1)
		support2 = CreateTroop(ArmyKerberos,troopDescription_2)
		support3 = CreateTroop(ArmyKerberos,troopDescription_5)
	
ArmyKerberos.position				= GetPosition("p1_spawn1")
		support4 = CreateTroop(ArmyKerberos,troopDescription_1)
		support5 = CreateTroop(ArmyKerberos,troopDescription_4)
		support6 = CreateTroop(ArmyKerberos,troopDescription_2)
		support7 = CreateTroop(ArmyKerberos,troopDescription_3)

varg = CreateEntity(1,Entities.CU_Barbarian_Hero,GetPosition("varg"),"varg")
Move("varg","kerberos",BRIEFING_TALK_DISTANCE*0.9)
LookAt("varg","kerberos")

Move(support1,"kerberos",600)
Move(support2,"kerberos",450)
Move(support3,"kerberos",500)
Move(support4,"kerberos",780)
Move(support5,"kerberos",780)
Move(support6,"kerberos",700)
Move(support7,"kerberos",780)


end

--------------------------------------army spawned at the bridge to kill thief---
function CreateArmyBridge()

	ArmyBridge					= {}

	ArmyBridge.player 				= 4
	ArmyBridge.id					= 8
	ArmyBridge.strength				= 8
	ArmyBridge.position				= GetPosition("spawn_archers")
	ArmyBridge.rodeLength				= 5000
	ArmyBridge.AttackAllowed			= true
	
			local troopDescription 	= {
	
			leaderType 				= Entities.PV_Cannon4,
			maxNumberOfSoldiers			= 8,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= VERYHIGH_EXPERIENCE,
		}
	for e = 1,4,1 do
	EnlargeArmy(ArmyBridge,troopDescription)
	end

	SetupArmy(ArmyBridge)

	Attack(ArmyBridge,"thief")
end

-------------------------------------army that attacks when the market west is destroyed

function cavalryAttack(_target)
	local cavalrytype = Entities.PU_LeaderHeavyCavalry1
	local bowtype = Entities.PU_LeaderBow3
	if CP_Difficulty == 1 then	
		cavalrytype = Entities.PU_LeaderHeavyCavalry2
		bowtype = Entities.PU_LeaderBow4
	end
	ReplaceEntity("bridge3",Entities.PB_DrawBridgeClosed1)
	StartSimpleJob("timerBridgeOpen")

	local pos = GetPosition("cavalry_attack")
	for n=1,4,1 do
		local Armycavalry = Tools.CreateGroup(2, cavalrytype, 3, pos.X, pos.Y, 180)
		SetEntityName(Armycavalry, "Armycavalry"..n)
		Attack("Armycavalry"..n,_target)
	end
	local Armycavalry = Tools.CreateGroup(2, bowtype, 8, pos.X, pos.Y, 180)
	SetEntityName(Armycavalry, "Armycavalry5")
	Attack("Armycavalry5",_target)

end



timerBridgeOpen = function()

if TIME_OPEN <= 0 then
ReplaceEntity("bridge3",Entities.XD_DrawBridgeOpen1)
return true
else
TIME_OPEN = TIME_OPEN - 1
--Attack(Armycavalry,"traderoute4_8")

end

end

--------------------------------------------------attack troops for caravans dead

function baseAttack(_target)

	if TDEAD == true then
	return true
	else
	Atroops = { Entities.PU_LeaderRifle2,
				Entities.PU_LeaderCavalry2 }
				
	if CP_Difficulty == 0 then	
		table.insert(Atroops, Entities.PU_LeaderSword2)
		table.insert(Atroops, Entities.PU_LeaderBow3)
		table.insert(Atroops, Entities.PU_LeaderPoleArm2)
		table.insert(Atroops, Entities.PU_LeaderHeavyCavalry1)
		table.insert(Atroops, Entities.PU_LeaderSword2)
		table.insert(Atroops, Entities.PU_LeaderBow2)
	else
		table.insert(Atroops, Entities.PU_LeaderSword3)
		table.insert(Atroops, Entities.PU_LeaderBow4)
		table.insert(Atroops, Entities.PU_LeaderPoleArm3)
		table.insert(Atroops, Entities.PU_LeaderHeavyCavalry2)
		table.insert(Atroops, Entities.PU_LeaderSword3)
		table.insert(Atroops, Entities.PU_LeaderBow3)
	end

	ReplaceEntity("bridge3",Entities.PB_DrawBridgeClosed1)
	StartSimpleJob("timerBridgeOpen")

	local pos = GetPosition("cavalry_attack")
	local rndm = Logic.GetRandom(3) + 2
	for n=1,rndm,1 do
	local RandomUnit 	= 	Atroops[Logic.GetRandom(table.getn(Atroops))+1]
	local Armycavalry = Tools.CreateGroup(2, RandomUnit, 8, pos.X, pos.Y, 180)
	SetEntityName(Armycavalry, "AttackArmy"..n)
	Attack("AttackArmy"..n,_target)
	end

	end

end

---------------------------------------------------------city attack

function cityAttack(_target)
	Citytroops	= 	{	
				Entities.PU_LeaderRifle1,
				Entities.PU_LeaderCavalry1
				}
				
	if CP_Difficulty == 0 then
		table.insert(Citytroops, Entities.PU_LeaderSword1)
		table.insert(Citytroops, Entities.PU_LeaderBow1)
		table.insert(Citytroops, Entities.PU_LeaderPoleArm1)
		table.insert(Citytroops, Entities.PU_LeaderSword1)
		table.insert(Citytroops, Entities.PU_LeaderBow1)
	else
		table.insert(Citytroops, Entities.PU_LeaderSword3)
		table.insert(Citytroops, Entities.PU_LeaderBow3)
		table.insert(Citytroops, Entities.PU_LeaderPoleArm3)
		table.insert(Citytroops, Entities.PU_LeaderSword3)
		table.insert(Citytroops, Entities.PU_LeaderBow3)
	end

	local pos = GetPosition("city_attack")
	local rndm = Logic.GetRandom(3) + 2
	for n=1,rndm,1 do
	local RandomUnit 	= 	Citytroops[Logic.GetRandom(table.getn(Citytroops))+1]
	local Armycavalry = Tools.CreateGroup(2, RandomUnit, 8, pos.X, pos.Y, 180)
	SetEntityName(Armycavalry, "cityArmy"..n)
	Attack("cityArmy"..n,_target)
	end


end


--------------------------------------------Pilgrim Army--------------------
function createArmyPilgrim()

	ArmyPilgrim					= {}

	ArmyPilgrim.player 				= 4
	ArmyPilgrim.id					= 6
	ArmyPilgrim.strength				= 8
	ArmyPilgrim.position				= GetPosition("pilgrim_army1")
	ArmyPilgrim.rodeLength				= 3000
	ArmyPilgrim.AttackAllowed			= true
	
	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty == 0 then
		experience = experience + 2
	end
	
			local troopDescription1 	= {
	
			leaderType 				= Entities.PU_LeaderSword2,
			maxNumberOfSoldiers			= 8,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= experience,
		}
			local troopDescription2 	= {
	
			leaderType 				= Entities.PU_LeaderPoleArm2,
			maxNumberOfSoldiers			= 8,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= experience,
		}
			local troopDescription3 	= {
	
			leaderType 				= Entities.PU_LeaderBow2,
			maxNumberOfSoldiers			= 8,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= experience,
		}

		if CP_Difficulty == 1 then
			troopDescription1.leaderType = Entities.PU_LeaderSword3
			troopDescription2.leaderType = Entities.PU_LeaderPoleArm3
			troopDescription3.leaderType = Entities.PU_LeaderBow3
		end

		group1 = CreateTroop(ArmyPilgrim,troopDescription1)
		group2 = CreateTroop(ArmyPilgrim,troopDescription2)
		group3 = CreateTroop(ArmyPilgrim,troopDescription2)
		ArmyPilgrim.position				= GetPosition("pilgrim_army2")
		group4 = CreateTroop(ArmyPilgrim,troopDescription3)
		group5 = CreateTroop(ArmyPilgrim,troopDescription1)
		group6 = CreateTroop(ArmyPilgrim,troopDescription1)	
		ArmyPilgrim.position				= GetPosition("pilgrim_army3")
		group7 = CreateTroop(ArmyPilgrim,troopDescription3)
		group8 = CreateTroop(ArmyPilgrim,troopDescription3)

		StartSimpleJob("DeadArmyPilgrim")
		


end

function DeadArmyPilgrim()

	if IsDead(group1) and IsDead(group2) and IsDead(group3) and IsDead(group4) and IsDead(group5) and IsDead(group6) and IsDead(group7) and IsDead(group8) then
		pilgrim = CreateEntity(8,Entities.PU_Hero2,GetPosition("spawn_pilgrim"),"pilgrim")
		createBriefingPilgrim()	
		return true
	end
end
