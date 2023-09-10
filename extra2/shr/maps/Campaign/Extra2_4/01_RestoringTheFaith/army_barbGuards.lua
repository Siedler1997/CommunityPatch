setupGuards = function()

	Guards 				= {}

	Guards.player 			        = 2
	Guards.id				= 1
	Guards.position		        = GetPosition("barbcamp")
	Guards.rodeLength		        = 3000
	
	-- Spawn parameter
	if CP_Difficulty == 0 then
		Guards.strength		        = 1
		Guards.spawnTypes 			= { 
			{ Entities.CU_BanditLeaderBow1, 8}
		}
	else
		Guards.strength		        = 2
		Guards.spawnTypes 			= {
			{ Entities.CU_BanditLeaderBow2, 8},
			{ Entities.CU_BanditLeaderSword2, 8}
		}
	end
	Guards.spawnPos				= GetPosition("barbcamp")
	Guards.spawnGenerator		        = "LeaderB"
	Guards.respawnTime			= 60*(5-CP_Difficulty)
	Guards.maxSpawnAmount		        = 1
	Guards.endless				= false
	Guards.refresh				= false

	Guards.retreatStrength			= 2
	Guards.baseDefenseRange			= 2000
	Guards.outerDefenseRange		= 4000
	Guards.Attack				= false
	Guards.AttackAllowed			= false
	Guards.experiencePoints	=	CP_Difficulty+1

	-- Setup army
	SetupArmy(Guards)
	
	-- Army generator
	SetupAITroopSpawnGenerator("Guards", Guards)

	-- Control army
	StartJob("ControlGuards")

end

--------------------------------------------------------------------------------------------
--
--	JOB: "ControlGuards"
--
--------------------------------------------------------------------------------------------	
	--------------------------------------------------------------------------------------------
	Condition_ControlGuards = function()
	--------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlGuards",10)
	end
		
	--------------------------------------------------------------------------------------------
	Action_ControlGuards = function()
	--------------------------------------------------------------------------------------------
		TickOffensiveAIController(Guards)
		return false		
	end
--------------------------------------------------------------------------------------------