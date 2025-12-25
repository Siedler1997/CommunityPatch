createArmyCleycourtPatrol = function()

	patrolDelay = 0

	--	set up

		armyCleycourtPatrol				= {}
	
		armyCleycourtPatrol.player 		= 4
		armyCleycourtPatrol.id			= 1
		armyCleycourtPatrol.strength	= 2
		armyCleycourtPatrol.position	= GetPosition("waypoint1")
		armyCleycourtPatrol.rodeLength	= 50
		armyCleycourtPatrol.beAgressive	= true
		
		SetupArmy(armyCleycourtPatrol)

	--	create
		
		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 9,
			experiencePoints 	= CP_Difficulty+1,
		}			


		troopDescription.leaderType = Entities.PU_LeaderBow3
		EnlargeArmy(armyCleycourtPatrol,troopDescription)				
		EnlargeArmy(armyCleycourtPatrol,troopDescription)				

	--	waypoints

	    local waypoints = {
	        "waypoint1",
	        "waypoint2",
	        "waypoint3",
	    }
	    
	    FeedArmyWithWaypoints(armyCleycourtPatrol.player,armyCleycourtPatrol.id,"CleycourtPatrolWaypointCallback",waypoints)

		end

CleycourtPatrolWaypointCallback = function(_waypointId)
   
	if patrolDelay < 20 then
	
		patrolDelay = patrolDelay +1
		
		return 0
		
		end
		
	patrolDelay = 0
   
    return 1
    
    end	
	