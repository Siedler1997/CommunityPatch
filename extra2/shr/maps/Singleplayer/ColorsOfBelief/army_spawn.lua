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

	troops1	= { 		Entities.CU_BanditLeaderBow2,

				}

	troops2	= { 		Entities.CU_BanditLeaderSword2,
				
				}


				
---------------------------------------------------

	--p4 	*******sheep bandits**************

		armyp4_1	= {}
		createArmy(4, 0,armyp4_1,1,"p4_1",MEDIUM_EXPERIENCE,troops1)
		StartJob("Controlarmyp4_1")

		armyp4_2	= {}
		createArmy(4, 1,armyp4_2,1,"p4_2",MEDIUM_EXPERIENCE,troops2)
		StartJob("Controlarmyp4_2")

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



function createWeddingArmy() 

	local troops = { 	Entities.PU_LeaderBow4,
				Entities.PU_LeaderPoleArm4,
				Entities.PU_LeaderSword4,
				Entities.PU_LeaderSword4,
				Entities.PU_LeaderBow4,
				Entities.PU_LeaderRifle2,
				Entities.PU_LeaderPoleArm4,
				}
	local RandomUnit={}

	for h=1,5,1 do
	local pos = GetPosition("w_army"..h)
	RandomUnit = troops[Logic.GetRandom(table.getn(troops))+1]
	Tools.CreateGroup(2, RandomUnit, 8, pos.X, pos.Y, 0)
	RandomUnit = troops[Logic.GetRandom(table.getn(troops))+1]
	Tools.CreateGroup(3, RandomUnit, 8, pos.X+100, pos.Y+100, 0)
	end


end


--[[function createWeddingArmy()

	-- Init army
	WeddingArmy						= 	{}
	WeddingArmy.player 				=	2
	WeddingArmy.id					=	8
	WeddingArmy.strength				=	20
	WeddingArmy.position				=	GetPosition("w_army")
	WeddingArmy.rodeLength			=	0
	WeddingArmy.beAgressive			=	false
	
	WeddingArmy.retreatStrength		=	0
	WeddingArmy.baseDefenseRange		=	0
	WeddingArmy.outerDefenseRange		=	0
	WeddingArmy.AttackAllowed		=	false
	WeddingArmy.pulse			=	false
	
--	WeddingArmy.patrolPointTime		=	3*60
	
	SetupArmy(WeddingArmy)

	local troops = { 	Entities.PU_LeaderBow4,
				Entities.PU_LeaderPoleArm4,
				Entities.PU_LeaderSword4,
				Entities.PU_LeaderSword4,
				Entities.PU_LeaderBow4,
				Entities.PU_LeaderRifle2,
				Entities.PU_LeaderPoleArm4,
				}
	
				
	local troopDescription = {
	
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= LOW_EXPERIENCE,
	}			
	
	local RandomUnit={}

	for h=1,2,1 do

	RandomUnit[h] = troops[Logic.GetRandom(table.getn(troops))+1]

	troopDescription.leaderType = RandomUnit[h]
	EnlargeArmy(WeddingArmy,troopDescription)
	WeddingArmy.position = GetPosition("w_army1")
	WeddingArmy.player   =	3
	WeddingArmy.id	     =	8
	troopDescription.leaderType = RandomUnit[h]
	EnlargeArmy(WeddingArmy,troopDescription)
	WeddingArmy.position = GetPosition("w_army2")
	WeddingArmy.player   =	2
	troopDescription.leaderType = RandomUnit[h]
	EnlargeArmy(WeddingArmy,troopDescription)
	WeddingArmy.position = GetPosition("w_army3")
	WeddingArmy.player   =	3
	troopDescription.leaderType = RandomUnit[h]
	EnlargeArmy(WeddingArmy,troopDescription)
	WeddingArmy.position = GetPosition("w_army4")
	WeddingArmy.player   =	3
	troopDescription.leaderType = RandomUnit[h]
	EnlargeArmy(WeddingArmy,troopDescription)
	WeddingArmy.position = GetPosition("w_army")
	WeddingArmy.player   =	2

	end



	Redeploy(WeddingArmy, WeddingArmy.position)

	--LookAt(WeddingArmy,"johannes")

end
]]
-------------------------------------------------------EDWARD-------------

createArmydefEdward = function()

	ArmydefEdward 					= {}       

	ArmydefEdward .player 				= 2
	ArmydefEdward .id					= 1
	ArmydefEdward .strength				= 8
	ArmydefEdward .retreatStrength			= 1
	ArmydefEdward .position				= GetPosition("a2")
	ArmydefEdward .rodeLength				= 10000
	ArmydefEdward .AllowedTypes 				= { 	UpgradeCategories.LeaderHeavyCavalry,
									UpgradeCategories.LeaderCavalry,
									UpgradeCategories.LeaderBow,
									UpgradeCategories.LeaderSword,
									Entities.PV_Cannon4,
								
							  }


	ArmydefEdward .baseDefenseRange		= 10000
	ArmydefEdward .outerDefenseRange		= 10000
	ArmydefEdward .AttackPos			= GetPosition("fight")
	ArmydefEdward .AttackAllowed			= true
	ArmydefEdward.beAgressive			= true

	ArmydefEdward .control			= {}
	ArmydefEdward .control.delay			= 20 * 15

	SetupArmy(ArmydefEdward )

	SetupAITroopGenerator("a2",ArmydefEdward )

	StartSimpleJob("ControlArmiesEdward")
	createEdwardArmy()

	


end


function ControlArmiesEdward()

	if Counter.Tick2("ControlArmiesEdward", 10) then

		if IsDead(ArmydefEdward) then
	
		Redeploy(ArmydefEdward, ArmydefEdward.AttackPos)
			
		TickOffensiveAIController(ArmydefEdward)

		end
	
	end

	if peace == 1 then
	ArmydefEdward .position			= GetPosition("a2")
	Redeploy(ArmydefEdward, ArmydefEdward.position)
	end

end


------------------------------------------------------
function createEdwardArmy()

	-- Init army
	EdwardArmy						= 	{}
	EdwardArmy.player 				=	2
	EdwardArmy.id					=	2
	EdwardArmy.strength				=	20
	EdwardArmy.position				=	GetPosition("a2")
	EdwardArmy.rodeLength			=	10000
	EdwardArmy.beAgressive			=	true
	
	EdwardArmy.retreatStrength		=	0
	EdwardArmy.baseDefenseRange		=	10000
	EdwardArmy.outerDefenseRange	=	10000
	EdwardArmy.AttackAllowed		=	true
	EdwardArmy.pulse				=	false
	
--	EdwardArmy.patrolPointTime		=	3*60
	
	SetupArmy(EdwardArmy)


		-- Init army2
	EdwardArmy1						= 	{}
	EdwardArmy1.player 				=	2
	EdwardArmy1.id					=	3
	EdwardArmy1.strength				=	20
	EdwardArmy1.position				=	GetPosition("a2")
	EdwardArmy1.rodeLength			=	10000
	EdwardArmy1.beAgressive			=	true
	
	EdwardArmy1.retreatStrength		=	0
	EdwardArmy1.baseDefenseRange		=	10000
	EdwardArmy1.outerDefenseRange	=	10000
	EdwardArmy1.AttackAllowed		=	true
	EdwardArmy1.pulse				=	false
	
	SetupArmy(EdwardArmy1)
	



	troops = { 	Entities.PV_Cannon4,
				Entities.PU_LeaderHeavyCavalry2,
				Entities.PU_LeaderBow4,
				Entities.PU_LeaderPoleArm4,
				Entities.PU_LeaderSword4,
				Entities.PU_LeaderSword4,
				Entities.PU_LeaderBow4,
				Entities.PU_LeaderRifle2,
				}
	
				
	troopDescription = {
	
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= HIGH_EXPERIENCE,
	}			
	
	RandomUnit={}

	for h=1,4,1 do

	RandomUnit[h] = troops[Logic.GetRandom(table.getn(troops))+1]

	troopDescription.leaderType = RandomUnit[h]
	EnlargeArmy(EdwardArmy,troopDescription)
	EnlargeArmy(EdwardArmy1,troopDescription)

	end

	Redeploy(EdwardArmy, EdwardArmy.position)
	Redeploy(EdwardArmy1, EdwardArmy1.position)

	StartSimpleJob("ControlEdwardArmy")
	StartSimpleJob("ControlEdwardArmy1")

end


function ControlEdwardArmy()

	if Counter.Tick2("ControlEdwardArmy", 10) then

		if IsDead(EdwardArmy) then

		EdwardArmy.position	=	GetPosition("a2")

			for h=1,8,1 do

			RandomUnit[h] = troops[Logic.GetRandom(table.getn(troops))+1]

			troopDescription.leaderType = RandomUnit[h]
			EnlargeArmy(EdwardArmy,troopDescription)

			end
		
		Redeploy(EdwardArmy, EdwardArmy.position)

		end
	
		EdwardArmy.position	=	GetPosition("fight")
			
		Redeploy(EdwardArmy, EdwardArmy.position)
			
		TickOffensiveAIController(EdwardArmy)
	
	end

	if peace == 1 then
	EdwardArmy .position			= GetPosition("a2")
	Redeploy(EdwardArmy, EdwardArmy.position)
	end
end


function ControlEdwardArmy1()

	if Counter.Tick2("ControlEdwardArmy1", 10) then

		if IsDead(EdwardArmy1) then

		EdwardArmy1.position	=	GetPosition("a2")

			for h=1,4,1 do

			RandomUnit[h] = troops[Logic.GetRandom(table.getn(troops))+1]

			troopDescription.leaderType = RandomUnit[h]
			EnlargeArmy(EdwardArmy1,troopDescription)

			end
		
		Redeploy(EdwardArmy1, EdwardArmy1.position)

		end
	
		EdwardArmy1.position	=	GetPosition("fight")
			
		Redeploy(EdwardArmy1, EdwardArmy1.position)
			
		TickOffensiveAIController(EdwardArmy1)
	
	end

	if peace == 1 then
	EdwardArmy1 .position			= GetPosition("a2")
	Redeploy(EdwardArmy1, EdwardArmy1.position)
	end
end



----------------




------------------------------------------DOVBAR-----------------------------

createArmydefDovbar = function()

	ArmydefDovbar 					= {}       

	ArmydefDovbar .player 				= 3
	ArmydefDovbar .id					= 1
	ArmydefDovbar .strength				= 8
	ArmydefDovbar .retreatStrength			= 1
	ArmydefDovbar .position				= GetPosition("a3")
	ArmydefDovbar .rodeLength				= 10000
	ArmydefDovbar .AllowedTypes 				= { 	UpgradeCategories.LeaderHeavyCavalry,
									UpgradeCategories.LeaderCavalry,
									UpgradeCategories.LeaderBow,
									UpgradeCategories.LeaderSword,
									Entities.PV_Cannon4,
								
							  }


	ArmydefDovbar .baseDefenseRange		= 10000
	ArmydefDovbar .outerDefenseRange		= 10000
	ArmydefDovbar .AttackPos			= GetPosition("fight")
	ArmydefDovbar .AttackAllowed			= true
	ArmydefDovbar.beAgressive			= true

	ArmydefDovbar .control			= {}
	ArmydefDovbar .control.delay			= 20 * 15

	SetupArmy(ArmydefDovbar )

	SetupAITroopGenerator("a3",ArmydefDovbar )

	StartSimpleJob("ControlArmiesDovbar")
	createDovbarArmy()



end


function ControlArmiesDovbar()

	if Counter.Tick2("ControlArmiesDovbar", 10) then

		if IsDead(ArmydefDovbar) then
	
		Redeploy(ArmydefDovbar, ArmydefDovbar.AttackPos)
			
		TickOffensiveAIController(ArmydefDovbar)

		end
	
	end

	if peace == 1 then
	ArmydefDovbar .position			= GetPosition("a3")
	Redeploy(ArmydefDovbar, ArmydefDovbar.position)
	end
end

--------------------------------------------

function createDovbarArmy()

	-- Init army
	DovbarArmy						= 	{}
	DovbarArmy.player 				=	3
	DovbarArmy.id					=	2
	DovbarArmy.strength				=	20
	DovbarArmy.position				=	GetPosition("a3")
	DovbarArmy.rodeLength			=	10000
	DovbarArmy.beAgressive			=	true
	
	DovbarArmy.retreatStrength		=	0
	DovbarArmy.baseDefenseRange		=	10000
	DovbarArmy.outerDefenseRange	=	10000
	DovbarArmy.AttackAllowed		=	true
	DovbarArmy.pulse				=	false
	
--	DovbarArmy.patrolPointTime		=	3*60
	
	SetupArmy(DovbarArmy)

	

		-- Init army2
	DovbarArmy1						= 	{}
	DovbarArmy1.player 				=	3
	DovbarArmy1.id					=	3
	DovbarArmy1.strength				=	20
	DovbarArmy1.position				=	GetPosition("a3")
	DovbarArmy1.rodeLength			=	10000
	DovbarArmy1.beAgressive			=	true
	
	DovbarArmy1.retreatStrength		=	0
	DovbarArmy1.baseDefenseRange		=	10000
	DovbarArmy1.outerDefenseRange	=	10000
	DovbarArmy1.AttackAllowed		=	true
	DovbarArmy1.pulse				=	false
	
--	DovbarArmy.patrolPointTime		=	3*60
	
	SetupArmy(DovbarArmy1)


	troops1 = { 		Entities.PV_Cannon4,
				Entities.PU_LeaderHeavyCavalry2,
				Entities.PU_LeaderBow4,
				Entities.PU_LeaderPoleArm4,
				Entities.PU_LeaderSword4,
				Entities.PU_LeaderSword4,
				Entities.PU_LeaderBow4,
				Entities.PU_LeaderRifle2,
				}
	
				
	troopDescription1 = {
	
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= HIGH_EXPERIENCE,
	}			
	
	RandomUnit1={}

	for f=1,4,1 do

	RandomUnit1[f] = troops1[Logic.GetRandom(table.getn(troops1))+1]

	troopDescription1.leaderType = RandomUnit1[f]
	EnlargeArmy(DovbarArmy,troopDescription1)
	EnlargeArmy(DovbarArmy1,troopDescription1)

	end

	Redeploy(DovbarArmy, DovbarArmy.position)
	Redeploy(DovbarArmy1, DovbarArmy1.position)

	StartSimpleJob("ControlDovbarArmy")
	StartSimpleJob("ControlDovbarArmy1")

end


function ControlDovbarArmy()

	if Counter.Tick2("ControlDovbarArmy", 10) then

		if IsDead(DovbarArmy) then

		DovbarArmy.position	=	GetPosition("a3")
		for f=1,8,1 do

		RandomUnit1[f] = troops1[Logic.GetRandom(table.getn(troops1))+1]

		troopDescription1.leaderType = RandomUnit1[f]
		EnlargeArmy(DovbarArmy,troopDescription1)

		end
		
		Redeploy(DovbarArmy, DovbarArmy.position)

		end
	
		DovbarArmy.position	=	GetPosition("fight")
			
		Redeploy(DovbarArmy, DovbarArmy.position)
			
		TickOffensiveAIController(DovbarArmy)
	
	end

	if peace == 1 then
	DovbarArmy .position			= GetPosition("a3")
	Redeploy(DovbarArmy, DovbarArmy.position)
	end
end


function ControlDovbarArmy1()

	if Counter.Tick2("ControlDovbarArmy1", 10) then

		if IsDead(DovbarArmy1) then

		DovbarArmy1.position	=	GetPosition("a3")
		for f=1,4,1 do

		RandomUnit1[f] = troops1[Logic.GetRandom(table.getn(troops1))+1]

		troopDescription1.leaderType = RandomUnit1[f]
		EnlargeArmy(DovbarArmy1,troopDescription1)

		end
		
		Redeploy(DovbarArmy1, DovbarArmy1.position)

		end
	
		DovbarArmy1.position	=	GetPosition("fight")
			
		Redeploy(DovbarArmy1, DovbarArmy1.position)
			
		TickOffensiveAIController(DovbarArmy1)
	
	end

	if peace == 1 then
	DovbarArmy1 .position			= GetPosition("a3")
	Redeploy(DovbarArmy1, DovbarArmy1.position)
	end
end

----------------

