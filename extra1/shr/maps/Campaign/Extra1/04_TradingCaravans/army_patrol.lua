---------------------------------------------------------------------------------------------
-- Creates a patrol army for steppe robbers
function CreateArmyPatrol()

	-- Init army
	ArmyPatrol				= {}
		
	ArmyPatrol.player 		= 	2
	ArmyPatrol.id			= 	4
	ArmyPatrol.strength		= 	5
	ArmyPatrol.position		= 	GetPosition("P2_RandomSpawn_1")
	ArmyPatrol.rodeLength	= 	2000
	ArmyPatrol.delay		=	2
	
	if CP_Difficulty > 0 then
		ArmyPatrol.strength = ArmyPatrol.strength + 3
	end

	SetupArmy(ArmyPatrol)

	StartSimpleJob("ControlArmyPatrol")

	StartSimpleJob("RandomAttacks")

end

function CreateArmyPatrolTroops()

	-- set random army position
	local RandomPos 			= GetRandom(1,4)
	ArmyPatrol.position		= GetPosition("P2_RandomSpawn_"..RandomPos)
	
	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty > 0 then
		experience = experience + 1
	end
	local troopDescription = {

		maxNumberOfSoldiers	= 12,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= experience,
	}

	troopDescription.leaderType = Entities.PU_LeaderSword2
	EnlargeArmy(ArmyPatrol,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderPoleArm2
	EnlargeArmy(ArmyPatrol,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderBow2
	EnlargeArmy(ArmyPatrol,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderRifle1
	EnlargeArmy(ArmyPatrol,troopDescription)
	
	if CP_Difficulty > 0 then
		troopDescription.leaderType = Entities.PU_LeaderSword2
		EnlargeArmy(ArmyPatrol,troopDescription)
		troopDescription.leaderType = Entities.PU_LeaderBow2
		EnlargeArmy(ArmyPatrol,troopDescription)
		troopDescription.leaderType = Entities.PU_LeaderRifle1
		EnlargeArmy(ArmyPatrol,troopDescription)
	end
	
	troopDescription.experiencePoints = troopDescription.experiencePoints + 1
	troopDescription.leaderType = Entities.CU_VeteranCaptain
	EnlargeArmy(ArmyPatrol,troopDescription)
	--[[
	troopDescription.leaderType = Entities.PU_LeaderCavalry2
	EnlargeArmy(ArmyPatrol,troopDescription)
	EnlargeArmy(ArmyPatrol,troopDescription)
	if CP_Difficulty > 0 then
		EnlargeArmy(ArmyPatrol,troopDescription)
	end
	troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2
	EnlargeArmy(ArmyPatrol,troopDescription)
	EnlargeArmy(ArmyPatrol,troopDescription)
	if CP_Difficulty > 0 then
		EnlargeArmy(ArmyPatrol,troopDescription)
		EnlargeArmy(ArmyPatrol,troopDescription)
		EnlargeArmy(ArmyPatrol,troopDescription)
	end
	--]]

	Redeploy(ArmyPatrol, ArmyPatrol.position)

	ArmyPatrol.delay = 2

end

---------------------------------------------------------------------------------------------
-- Job Random Attacks
function RandomAttacks()
	if Counter.Tick2("RandomAttacks", 60 * 30) then

		CreateArmyPatrolTroops()
		
		Counter.SetLimit("RandomAttacks", (60 * 10)+(GetRandom(1, 60*10)))
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