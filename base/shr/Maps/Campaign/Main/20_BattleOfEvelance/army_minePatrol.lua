-- Knights patrol along mines


createArmyMinePatrol = function()

	--	set up

		armyMinePatrol							= {}
	
		armyMinePatrol.player 					= 8
		armyMinePatrol.id						= 6
		armyMinePatrol.strength					= 8
		armyMinePatrol.position					= GetPosition("minePatrol1")
		armyMinePatrol.rodeLength				= 1500
		armyMinePatrol.beAgressive				= true

		SetupArmy(armyMinePatrol)

	--	create

		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 9,
			experiencePoints 	= VERYHIGH_EXPERIENCE,
		}			

		troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2

		EnlargeArmy(armyMinePatrol,troopDescription)
		EnlargeArmy(armyMinePatrol,troopDescription)
		EnlargeArmy(armyMinePatrol,troopDescription)
		EnlargeArmy(armyMinePatrol,troopDescription)
		EnlargeArmy(armyMinePatrol,troopDescription)
		EnlargeArmy(armyMinePatrol,troopDescription)
		EnlargeArmy(armyMinePatrol,troopDescription)
		EnlargeArmy(armyMinePatrol,troopDescription)

	--	waypoints

	    local waypoints = {
	        "minePatrol1",
	        "minePatrol2",
	        "minePatrol3",
	    }
	    
	    FeedArmyWithWaypoints(armyMinePatrol.player,armyMinePatrol.id,"MinePatrolWaypointCallback",waypoints)

		end

MinePatrolWaypointCallback = function(_waypointId)
   
    return 1
    
    end