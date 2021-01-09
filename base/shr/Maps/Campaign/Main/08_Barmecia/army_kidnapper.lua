
createArmyKidnapper = function()

	--	set up

		Report("Setting up kidnapper army")
		
		
		ArmyKidnapper								= {}
	
		ArmyKidnapper.player 					= gvMission.PlayerIDRobbers1
		ArmyKidnapper.id								= 1
		ArmyKidnapper.strength					= 4
		ArmyKidnapper.position					= GetPosition("BanditsHQ1")
		ArmyKidnapper.rodeLength				= 1500
		ArmyKidnapper.beAgressive			= true

		SetupArmy(ArmyKidnapper)

	--	create
		local soldiers = 6
		local experience = LOW_EXPERIENCE
		if CP_Difficulty == 1 then
			soldiers = soldiers + 2
			experience = experience + 1
		end

		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = soldiers,
			experiencePoints 	= experience,
		}			

		troopDescription.leaderType = Entities.CU_BanditLeaderSword1
		for i = 1,4 do
			EnlargeArmy(ArmyKidnapper,troopDescription)
		end

	--	waypoints

	    local waypoints = {
	        "Robbers1_PatrolPoint1",
	        "Robbers1_PatrolPoint2",
	        "Robbers1_PatrolPoint3",
	        "Robbers1_PatrolPoint4",
	    }
		local KidnapperDescription = {}  
	  FeedArmyWithWaypoints(ArmyKidnapper.player,ArmyKidnapper.id,"KidnapperWaypointCallback",waypoints)

		end

KidnapperWaypointCallback = function(_waypointId)
   	return 1
    
    end


