---------------------------------------------------------------------------------------------
-- Creates a patrol army for steppe robbers
function CreateArmyPatrol()

	-- Init army
	ArmyPatrol				= {}
		
	ArmyPatrol.player 		= 	2
	ArmyPatrol.id			= 	4
	ArmyPatrol.strength		= 	4
	ArmyPatrol.position		= 	GetPosition("P2_RandomSpawn_1")
	ArmyPatrol.rodeLength	= 	2000
	ArmyPatrol.delay		=	2
	
	if CP_Difficulty == 1 then
		ArmyPatrol.strength = ArmyPatrol.strength + 3
	end

	SetupArmy(ArmyPatrol)

	StartSimpleJob("ControlArmyPatrol")

	StartSimpleJob("RandomAttacks")

end

function CreateArmyPatrolTroops()

	-- set random army position
	local RandomPos 			= GetRandom(4)+1
	ArmyPatrol.position		= GetPosition("P2_RandomSpawn_"..RandomPos)
	
	local experience = LOW_EXPERIENCE
	if CP_Difficulty == 1 then
		experience = experience + 2
	end
	local troopDescription = {

		maxNumberOfSoldiers	= 12,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= experience,
	}

	troopDescription.leaderType = Entities.PU_LeaderCavalry2
	EnlargeArmy(ArmyPatrol,troopDescription)
	EnlargeArmy(ArmyPatrol,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2
	EnlargeArmy(ArmyPatrol,troopDescription)
	EnlargeArmy(ArmyPatrol,troopDescription)
	if CP_Difficulty == 1 then
		EnlargeArmy(ArmyPatrol,troopDescription)
		EnlargeArmy(ArmyPatrol,troopDescription)
		EnlargeArmy(ArmyPatrol,troopDescription)
	end

	Redeploy(ArmyPatrol, ArmyPatrol.position)

	ArmyPatrol.delay = 2

end

---------------------------------------------------------------------------------------------
-- Job Random Attacks
function RandomAttacks()
	local minutes = 30
	if CP_Difficulty == 1 then
		minutes = minutes - 5
	end
	if Counter.Tick2("RandomAttacks", 60 * minutes) then

		CreateArmyPatrolTroops()
		
		Counter.SetLimit("RandomAttacks", (60 * 10)+(GetRandom(60*10)))
	end

end

--------------------------------------------------------------------------------------------
-- Job "ControlArmyPatrol"
function ControlArmyPatrol()

    if Counter.Tick2("ControlArmyPatrol",10) then
	    
	    if ArmyPatrol.delay <= 0 and not Counter.Tick2("ControlArmyPatrol",10) then
	    
	    	FrontalAttack(ArmyPatrol)
	    	
	    else
	    	
	    	ArmyPatrol.delay = ArmyPatrol.delay - 1
	
	    	Redeploy(ArmyPatrol, ArmyPatrol.position)
	    
	    end
	
	end

end