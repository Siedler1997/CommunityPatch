
createArmyKidnapper = function()

	--	set up

		Report("Setting up kidnapper army")
		
		ArmyKidnapper								= {}
	
		ArmyKidnapper.player 					= gvMission.PlayerIDRobbers1
		ArmyKidnapper.id								= 1
		ArmyKidnapper.strength					= 4 + 2 * CP_Difficulty
		ArmyKidnapper.position					= GetPosition("BanditsHQ1")
		ArmyKidnapper.rodeLength				= 1500
		ArmyKidnapper.beAgressive			= true

		SetupArmy(ArmyKidnapper)

	--	create

		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 4 + 2 * CP_Difficulty,
			experiencePoints 	= CP_Difficulty
		}			
		
		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.CU_BanditLeaderBow1
			EnlargeArmy(ArmyKidnapper,troopDescription)
			
			troopDescription.leaderType = Entities.CU_BanditLeaderSword1
			EnlargeArmy(ArmyKidnapper,troopDescription)
			EnlargeArmy(ArmyKidnapper,troopDescription)
			EnlargeArmy(ArmyKidnapper,troopDescription)
		else
			troopDescription.leaderType = Entities.CU_BanditLeaderBow2
			EnlargeArmy(ArmyKidnapper,troopDescription)
			EnlargeArmy(ArmyKidnapper,troopDescription)
			if CP_Difficulty == 2 then
				EnlargeArmy(ArmyKidnapper,troopDescription)
				EnlargeArmy(ArmyKidnapper,troopDescription)
			end
			
			troopDescription.leaderType = Entities.CU_BanditLeaderSword2
			EnlargeArmy(ArmyKidnapper,troopDescription)
			EnlargeArmy(ArmyKidnapper,troopDescription)
			EnlargeArmy(ArmyKidnapper,troopDescription)
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


