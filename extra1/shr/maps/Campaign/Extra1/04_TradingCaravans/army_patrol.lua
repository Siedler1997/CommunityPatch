---------------------------------------------------------------------------------------------
-- Creates a patrol army for steppe robbers
function CreateArmyPatrol()

	-- Init army
	ArmyPatrol				= {}
		
	ArmyPatrol.player 		= 	2
	ArmyPatrol.id			= 	4
	ArmyPatrol.strength		= 	5
	ArmyPatrol.position		= 	GetPosition("P2_RandomSpawn_1")
	ArmyPatrol.rodeLength	= 	3000
	ArmyPatrol.delay		=	2
	ArmyPatrol.AttackAllowed	=	true
	ArmyPatrol.retreatStrength	=	0
	ArmyPatrol.AttackPos			=	GetPosition("P2_RandomSpawn_1")
	
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
	ArmyPatrol.AttackPos		= GetPosition("P2_RandomSpawn_"..RandomPos)
	
	local troopDescription = {

		maxNumberOfSoldiers	= 6,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= CP_Difficulty+1,
	}


	troopDescription.leaderType = Entities.PU_LeaderRifle1
	EnlargeArmy(ArmyPatrol,troopDescription)	
	troopDescription.leaderType = Entities.CU_VeteranCaptain
	EnlargeArmy(ArmyPatrol,troopDescription)

	if CP_Difficulty < 2 then
		troopDescription.leaderType = Entities.PU_LeaderSword2
		EnlargeArmy(ArmyPatrol,troopDescription)
		troopDescription.leaderType = Entities.PU_LeaderPoleArm2
		EnlargeArmy(ArmyPatrol,troopDescription)
		troopDescription.leaderType = Entities.PU_LeaderBow2
		EnlargeArmy(ArmyPatrol,troopDescription)
	
		if CP_Difficulty > 0 then
			troopDescription.leaderType = Entities.PU_LeaderSword2
			EnlargeArmy(ArmyPatrol,troopDescription)
			troopDescription.leaderType = Entities.PU_LeaderBow2
			EnlargeArmy(ArmyPatrol,troopDescription)
			troopDescription.leaderType = Entities.PU_LeaderRifle1
			EnlargeArmy(ArmyPatrol,troopDescription)
		end
	else
		troopDescription.leaderType = Entities.PU_LeaderSword3
		EnlargeArmy(ArmyPatrol,troopDescription)
		troopDescription.leaderType = Entities.PU_LeaderPoleArm3
		EnlargeArmy(ArmyPatrol,troopDescription)
		troopDescription.leaderType = Entities.PU_LeaderBow3
		EnlargeArmy(ArmyPatrol,troopDescription)
		troopDescription.leaderType = Entities.PU_LeaderSword3
		EnlargeArmy(ArmyPatrol,troopDescription)
		troopDescription.leaderType = Entities.PU_LeaderBow3
		EnlargeArmy(ArmyPatrol,troopDescription)
		troopDescription.leaderType = Entities.PU_LeaderRifle1
		EnlargeArmy(ArmyPatrol,troopDescription)
	end

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

	--Redeploy(ArmyPatrol, ArmyPatrol.position)
	ControlArmyPatrol()
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
		if IsAlive(ArmyPatrol) then
			TickOffensiveAIController(ArmyPatrol)
		end
	end
end