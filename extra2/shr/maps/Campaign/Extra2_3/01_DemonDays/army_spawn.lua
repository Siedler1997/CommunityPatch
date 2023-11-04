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



createArmy = function(_playerId,_id,_army,_strength,_position,_experience,_troops,_max)

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

		if _max==nil then
		maxNumber	= 20
		else
		maxNumber	= _max
		end

	local troopDescription = {
	
		maxNumberOfSoldiers	= maxNumber,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= _experience,
	}			

	for i = 0 , _army.strength , 1 do	
		troopDescription.leaderType = _troops[Logic.GetRandom(table.getn(_troops))+1]			
		EnlargeArmy(_army,troopDescription)
		end
		
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
	
			leaderType 				= Entities.CU_BlackKnight_LeaderMace2,
			maxNumberOfSoldiers			= 6,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= LOW_EXPERIENCE,
		}
		local troopDescription_2 	= {
	
			leaderType 				= Entities.CU_BanditLeaderSword2,
			maxNumberOfSoldiers			= 6,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= LOW_EXPERIENCE,
		}
		local troopDescription_3 	= {
	
			leaderType 				= Entities.CU_Barbarian_LeaderClub2,
			maxNumberOfSoldiers			= 6,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= LOW_EXPERIENCE,
		}
		local troopDescription_4 	= {
	
			leaderType 				= Entities.CU_BanditLeaderBow2,
			maxNumberOfSoldiers			= 6,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= LOW_EXPERIENCE,
		}

		support1 = CreateTroop(ArmyKerberos,troopDescription_1)
		support2 = CreateTroop(ArmyKerberos,troopDescription_2)
		support3 = CreateTroop(ArmyKerberos,troopDescription_3)
		support4 = CreateTroop(ArmyKerberos,troopDescription_4)
	



Move("kerberos","intro_start")
local ID = GetID("kerberos")
Logic.RotateEntity(ID,180)
Move(support1,"intro_start",BRIEFING_TALK_DISTANCE)
Move(support2,"intro_start",500)
Move(support3,"intro_start",400)
Move(support4,"intro_start",700)


end

--********************************[support armys from Varg]****************************************


function CreateArmyVarg()

	ArmyVarg					= {}

	ArmyVarg.player 				= 1
	ArmyVarg.id					= 1
	ArmyVarg.strength				= 8
	ArmyVarg.position				= GetPosition("spawn_varg")
	ArmyVarg.rodeLength				= 7000


		local troopDescription_1 	= {
	
			leaderType 				= Entities.CU_BlackKnight_LeaderMace2,
			maxNumberOfSoldiers			= 8,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= LOW_EXPERIENCE,
		}

		local troopDescription_2 	= {
	
			leaderType 				= Entities.CU_Barbarian_LeaderClub2,
			maxNumberOfSoldiers			= 8,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= LOW_EXPERIENCE,
		}

		support4 = CreateTroop(ArmyVarg,troopDescription_1)
		support5 = CreateTroop(ArmyVarg,troopDescription_1)
		support6 = CreateTroop(ArmyVarg,troopDescription_2)
		support7 = CreateTroop(ArmyVarg,troopDescription_2)

Move(support4,"kerberos",400)
Move(support5,"kerberos",400)
Move(support6,"kerberos",400)
Move(support7,"kerberos",400)

end

--********************************[village archers defenders from archery]**************************

function CreateArmyVillage()

	ArmyVillage					= {}

	ArmyVillage.player 				= 4
	ArmyVillage.id					= 0
	ArmyVillage.strength				= 8
	ArmyVillage.position				= GetPosition("p3_def5")
	ArmyVillage.rodeLength				= 3000
	ArmyVillage.AttackAllowed			= false
	
	SetupArmy(ArmyVillage)
	SPAWN_TIMER = GetRandom(5) + GetRandom(10)
	StartSimpleJob("ControlArmyVillage")
end

function ControlArmyVillage()

	if IsDead("archery") then
	createArmyBarrack()  		--army spawned now because of ID=0 that is repeating
	return true
	
	else
		if IsDead(ArmyVillage) then

				
			if SPAWN_TIMER == 0 then
			SpawnArchery()
		
			else 
			SPAWN_TIMER = SPAWN_TIMER - 1
		
			end
		
		end

	end
	


end

--**********[archers spawned at random 5 seconds]**************************

SpawnArchery = function()

		Redeploy(ArmyVillage,GetPosition("p3_def5"),3000)
	
		local etype = Entities.PU_LeaderBow1
		if CP_Difficulty == 2 then
			etype = Entities.PU_LeaderBow2
		end

		local troopDescription 	= {
	
			leaderType 				= etype,
			maxNumberOfSoldiers			= 4,
			minNumberOfSoldiers			= 0,
			experiencePoints 				= CP_Difficulty,
		}
		
		EnlargeArmy(ArmyVillage,troopDescription)
	--	SPAWN_TIMER = GetRandom(5) + GetRandom(10)
		SPAWN_TIMER = GetRandom(10) + 10

		return true

end



--************************[village defenders battleserfs groups]**************************

function createBattleserfDef() 
		
	local pos = GetPosition("p3_def4")
	local pos1 = GetPosition("p3_def3")

	for i=1,4,1 do

	bserf = CreateEntity(4,Entities.PU_BattleSerf,GetPosition("p3_def4"),"bserf"..i)
	pos.X=pos.X+i
	Move(bserf,pos)
	bserf1 = CreateEntity(4,Entities.PU_BattleSerf,GetPosition("p3_def3"),"bserf1"..i)
	pos1.X=pos1.X+i
	Move(bserf1,pos1)


	end

end

--***********************[spawned group when farms are destroyed]**************************

function createFarmDef() 
		
local house1 = Logic.GetEntityIDByName("p3_2")
local house2 = Logic.GetEntityIDByName("p3_3")
local farm = Logic.GetEntityIDByName("p3_4")

	if Logic.GetEntityHealth(house1) < (Logic.GetEntityMaxHealth(house1) * 0.7) then
	createGeneralBriefing("p3_2","farmers.revolt")
	for i=1,5,1 do
	local defender = CreateEntity(4,Entities.PU_BattleSerf,GetPosition("p3_def2"),"bserf"..i)
	Move( defender,"p3_2",1000)
	end
	return true
	
	elseif Logic.GetEntityHealth(house2) < (Logic.GetEntityMaxHealth(house2) * 0.7) then
	createGeneralBriefing("p3_3","farmers.revolt")
	for i=1,5,1 do
	local defender = CreateEntity(4,Entities.PU_BattleSerf,GetPosition("p3_def6"),"bserf"..i)
	Move( defender,"p3_3",1000)
	end
	return true

	elseif  Logic.GetEntityHealth(farm) < (Logic.GetEntityMaxHealth(farm) * 0.7) then
	createGeneralBriefing("p3_4","farmers.revolt")
	for i=1,5,1 do
	local defender = CreateEntity(4,Entities.PU_BattleSerf,GetPosition("p3_def6"),"bserf"..i)
	Move( defender,"p3_4",1000)
	end
	return true

	end

end

--****************************[barrack Mary army guards]*****************************************

function createArmyBarrack()

	ArmyBarrack					= {}

	ArmyBarrack.player 				= 4
	ArmyBarrack.id					= 0
	ArmyBarrack.strength				= 1
	ArmyBarrack.position				= GetPosition("guards_7")
	ArmyBarrack.rodeLength				= 3000
	ArmyBarrack.AttackAllowed			= false
	
	SetupArmy(ArmyBarrack)
	SPAWN_TIMER = GetRandom(5) + GetRandom(10)
	StartSimpleJob("ControlArmyBarrack")
end

function ControlArmyBarrack()

	if IsDead("barrack") then
	return true
	
	else
		if IsDead(ArmyBarrack) then

		if SPAWN_TIMER == 0 then
		Redeploy(ArmyBarrack,GetPosition("guards_7"),3000)
	--	SPAWN_TIMER = GetRandom(5) + GetRandom(10)
		SPAWN_TIMER = GetRandom(10) + 10
	
		local etype = Entities.PU_LeaderSword3
		local soldiers = 4 + CP_Difficulty*2
		if CP_Difficulty > 0 then
			etype = Entities.PU_LeaderSword4
		end

		local troopDescription 	= {
	
			leaderType 				= etype,
			maxNumberOfSoldiers			= soldiers,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= CP_Difficulty+1,
		}
		
		EnlargeArmy(ArmyBarrack,troopDescription)	
		else 
		SPAWN_TIMER = SPAWN_TIMER - 1
		end
		
		end

	end
	


end

--*****************[army spawned to hunt mary near prison gates]***********************

function createLightCavalry(_spawnPos,_entityDescription)

	LightCavalry					= {}

	LightCavalry.player 				= 4
	LightCavalry.id					= 0
	LightCavalry.strength				= 8
	LightCavalry.position				= GetPosition(_spawnPos)
	LightCavalry.rodeLength				= 3000
	LightCavalry.AttackAllowed			= true
	
		local troopDescription 	= {
	
			leaderType 				= _entityDescription,
			maxNumberOfSoldiers			= 3,
			minNumberOfSoldiers			= 0,
			experiencePoints 			= CP_Difficulty+1,
		}

		cavalry1 = CreateTroop(LightCavalry,troopDescription)
		cavalry2 = CreateTroop(LightCavalry,troopDescription)
		



		Attack(cavalry1,"mary")
		Attack(cavalry2,"mary")




end

---------------------------------------------------------------------------------------------


createArmySpawn = function()

	troops1 = {}
	troops2 = {}
	troops3 = {}
	troops4 = { Entities.PU_LeaderRifle2 }
	troops5 = {}
	troops6 = {}
	troops7 = {}
	troops8 = { Entities.PU_LeaderRifle2 }
	troops9 = { Entities.CU_Evil_LeaderBearman1,
				Entities.CU_Evil_LeaderSkirmisher1 }

	if CP_Difficulty == 0 then
		table.insert(troops1, Entities.PU_LeaderBow1)
		
		table.insert(troops2, Entities.PU_LeaderBow2)
		table.insert(troops2, Entities.PU_LeaderSword2)
		
		table.insert(troops3, Entities.PU_LeaderPoleArm2)
		table.insert(troops3, Entities.PU_LeaderSword2)
		
		table.insert(troops4, Entities.PU_LeaderBow2)

		table.insert(troops5, Entities.PU_LeaderHeavyCavalry1)

		table.insert(troops6, Entities.PU_LeaderRifle1)

		table.insert(troops7, Entities.PU_LeaderBow3)
		
		table.insert(troops8, Entities.PU_LeaderBow1)
	elseif CP_Difficulty == 1 then
		table.insert(troops1, Entities.PU_LeaderBow2)
		
		table.insert(troops2, Entities.PU_LeaderBow3)
		table.insert(troops2, Entities.PU_LeaderSword3)
		
		table.insert(troops3, Entities.PU_LeaderPoleArm3)
		table.insert(troops3, Entities.PU_LeaderSword3)
		
		table.insert(troops4, Entities.PU_LeaderBow3)

		table.insert(troops5, Entities.PU_LeaderHeavyCavalry1)

		table.insert(troops6, Entities.PU_LeaderRifle1)

		table.insert(troops7, Entities.PU_LeaderBow4)

		table.insert(troops8, Entities.PU_LeaderBow2)
	else
		table.insert(troops1, Entities.PU_LeaderBow3)
		
		table.insert(troops2, Entities.PU_LeaderBow3)
		table.insert(troops2, Entities.PU_LeaderSword4)
		
		table.insert(troops3, Entities.PU_LeaderPoleArm4)
		table.insert(troops3, Entities.PU_LeaderSword4)
		
		table.insert(troops4, Entities.PU_LeaderBow4)

		table.insert(troops5, Entities.PU_LeaderHeavyCavalry2)

		table.insert(troops6, Entities.PU_LeaderRifle2)

		table.insert(troops7, Entities.PU_LeaderBow4)

		table.insert(troops8, Entities.PU_LeaderBow2)
	end

---------------------------------------------------

	--p4 	*******village defenders(2 archer troops)**************

		armyp4_1	= {}
		createArmy(4, 1,armyp4_1,0,"p3_def1",CP_Difficulty+1,troops1)
		StartJob("Controlarmyp4_1")

	--	*******mary prison guardians***************************

		armyp4_2	= {}
		createArmy(4, 2,armyp4_2,0,"guards_1",CP_Difficulty+1,troops3)
		StartJob("Controlarmyp4_2")
	
		armyp4_3	= {}
		createArmy(4, 3,armyp4_3,1,"guards_2",CP_Difficulty+1,troops2)
		StartJob("Controlarmyp4_3")

		armyp4_4	= {}
		createArmy(4, 4,armyp4_4,1,"guards_8",CP_Difficulty+1,troops3)
		StartJob("Controlarmyp4_4")

		armyp4_5	= {}
		createArmy(4, 5,armyp4_5,1,"guards_3",CP_Difficulty+1,troops2)
		StartJob("Controlarmyp4_5")

		armyp4_6	= {}
		createArmy(4, 6,armyp4_6,0,"guards_4",CP_Difficulty+1,troops4)
		StartJob("Controlarmyp4_6")

		armyp4_7	= {}
		createArmy(4, 7,armyp4_7,1,"guards_5",CP_Difficulty+1,troops2)
		StartJob("Controlarmyp4_7")

		armyp4_8	= {}
		createArmy(4, 8,armyp4_8,1,"guards_6",CP_Difficulty+1,troops4)
		StartJob("Controlarmyp4_8")


	--p3 	*******town troops**************

		armyp3_3	= {}
		createArmy(3, 3,armyp3_3,1,"adef_7",CP_Difficulty+1,troops5)
		StartJob("Controlarmyp3_3")

		armyp3_4	= {}
		createArmy(3, 4,armyp3_4,1,"adef_4",CP_Difficulty+1,troops7)
		StartJob("Controlarmyp3_4")

		armyp3_5	= {}
		createArmy(3, 5,armyp3_5,1,"adef_6",CP_Difficulty+1,troops1)
		StartJob("Controlarmyp3_5")

		armyp3_6	= {}
		createArmy(3, 6,armyp3_6,1,"adef_5",CP_Difficulty+1,troops6)
		StartJob("Controlarmyp3_6")

		armyp3_7	= {}
		createArmy(3, 7,armyp3_7,1,"adef_8",CP_Difficulty+1,troops8)
		StartJob("Controlarmyp3_7")

		armyp3_8	= {}
		createArmy(3, 8,armyp3_8,1,"adef_9",CP_Difficulty+1,troops8)
		StartJob("Controlarmyp3_8")

	--p2 	*******bearman troops**************

		armyp2_1	= {}
		createArmy(2, 0,armyp2_1,0,"p2_1",CP_Difficulty+1,troops9)
		StartJob("Controlarmyp2_1")

		armyp2_2	= {}
		createArmy(2, 1,armyp2_2,0,"p2_2",CP_Difficulty+1,troops9)
		StartJob("Controlarmyp2_2")

		armyp2_3	= {}
		createArmy(2, 2,armyp2_3,0,"p2_3",CP_Difficulty+1,troops9)
		StartJob("Controlarmyp2_3")

		armyp2_4	= {}
		createArmy(2, 3,armyp2_4,0,"p2_4",CP_Difficulty+1,troops9)
		StartJob("Controlarmyp2_4")

		armyp2_5	= {}
		createArmy(2, 4,armyp2_5,1,"p2_5",CP_Difficulty+1,troops9)
		StartJob("Controlarmyp2_5")

		armyp2_6	= {}
		createArmy(2, 5,armyp2_6,0,"p2_6",CP_Difficulty+1,troops9)
		StartJob("Controlarmyp2_6")

		armyp2_7	= {}
		createArmy(2, 6,armyp2_7,0,"p2_7",CP_Difficulty+1,troops9)
		StartJob("Controlarmyp2_7")


end



Condition_Controlarmyp4_1 = function()
	return true	
	end
Action_Controlarmyp4_1 = function()
	return simpleDefendBehaviour(armyp4_1)
	end
Condition_Controlarmyp4_2 = function()
	return true	
	end
Action_Controlarmyp4_2 = function()
	return simpleDefendBehaviour(armyp4_2)
	end
Condition_Controlarmyp4_3 = function()
	return true	
	end
Action_Controlarmyp4_3 = function()
	return simpleDefendBehaviour(armyp4_3)
	end
Condition_Controlarmyp4_4 = function()
	return true	
	end
Action_Controlarmyp4_4 = function()
	return simpleDefendBehaviour(armyp4_4)
	end
Condition_Controlarmyp4_5 = function()
	return true	
	end
Action_Controlarmyp4_5 = function()
	return simpleDefendBehaviour(armyp4_5)
	end
Condition_Controlarmyp4_6 = function()
	return true	
	end
Action_Controlarmyp4_6 = function()
	return simpleDefendBehaviour(armyp4_6)
	end
Condition_Controlarmyp4_7 = function()
	return true	
	end
Action_Controlarmyp4_7 = function()
	return simpleDefendBehaviour(armyp4_7)
	end
Condition_Controlarmyp4_8 = function()
	return true	
	end
Action_Controlarmyp4_8 = function()
	return simpleDefendBehaviour(armyp4_8)
	end
------------------------------------------
Condition_Controlarmyp3_3 = function()
	return true	
	end
Action_Controlarmyp3_3 = function()
	return simpleDefendBehaviour(armyp3_3)
	end
Condition_Controlarmyp3_4 = function()
	return true	
	end
Action_Controlarmyp3_4 = function()
	return simpleDefendBehaviour(armyp3_4)
	end
Condition_Controlarmyp3_5 = function()
	return true	
	end
Action_Controlarmyp3_5 = function()
	return simpleDefendBehaviour(armyp3_5)
	end
Condition_Controlarmyp3_6 = function()
	return true	
	end
Action_Controlarmyp3_6 = function()
	return simpleDefendBehaviour(armyp3_6)
	end
Condition_Controlarmyp3_7 = function()
	return true	
	end
Action_Controlarmyp3_7 = function()
	return simpleDefendBehaviour(armyp3_7)
	end
Condition_Controlarmyp3_8 = function()
	return true	
	end
Action_Controlarmyp3_8 = function()
	return simpleDefendBehaviour(armyp3_8)
	end
------------------------------------------
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
Condition_Controlarmyp2_3 = function()
	return true	
	end
Action_Controlarmyp2_3 = function()
	return simpleDefendBehaviour(armyp2_3)
	end
Condition_Controlarmyp2_4 = function()
	return true	
	end
Action_Controlarmyp2_4 = function()
	return simpleDefendBehaviour(armyp2_4)
	end
Condition_Controlarmyp2_5 = function()
	return true	
	end
Action_Controlarmyp2_5 = function()
	return simpleDefendBehaviour(armyp2_5)
	end
Condition_Controlarmyp2_6 = function()
	return true	
	end
Action_Controlarmyp2_6 = function()
	return simpleDefendBehaviour(armyp2_6)
	end
Condition_Controlarmyp2_7 = function()
	return true	
	end
Action_Controlarmyp2_7 = function()
	return simpleDefendBehaviour(armyp2_7)
	end