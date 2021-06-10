
createArmyDefendRoute = function()


	--	set up

		armyDefendRoute					= {}
	
		armyDefendRoute.player 			= 3
		armyDefendRoute.id				= 1
		armyDefendRoute.strength		= 2
		armyDefendRoute.position		= GetPosition("defendRoute")
		armyDefendRoute.rodeLength		= 500
		armyDefendRoute.control			= {}
		armyDefendRoute.control.delay	= 50 * 60
		
		SetupArmy(armyDefendRoute)

	--	create 
		local soldiers = 4
		local experience = 0
		local etype = Entities.CU_BanditLeaderSword1
		if CP_Difficulty > 0 then
			soldiers = 8
			experience = 2
			etype = Entities.CU_BanditLeaderSword2
		end
		local troopDescription = {
		
			maxNumberOfSoldiers	= soldiers,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= experience,
		}			

		troopDescription.leaderType = etype
	
		EnlargeArmy(armyDefendRoute,troopDescription)
		EnlargeArmy(armyDefendRoute,troopDescription)


	--	job
	
		StartJob("ControlArmyDefendRoute")

	end
	

	
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyDefendRoute"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyDefendRoute = function()
	-------------------------------------------------------------------------------------------------------------------
		
		armyDefendRoute.control.delay = armyDefendRoute.control.delay -1
		
		return armyDefendRoute.control.delay <= 0
		
	end




		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyDefendRoute = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyDefendRoute) then
		
			return true
			
		end


		if armyDefendRoute.control.delay == 0 then
			
		--	waypoints
	
		    local waypoints = {
				"defendRoute",
		        "robbers1",
		        "robbers2",
		        "robbers3",
		    }
		    
		    FeedArmyWithWaypoints(armyDefendRoute.player, armyDefendRoute.id, "DefendRouteWaypointCallback", waypoints)
    	end


		-- FrontalAttack(armyDefendRoute)

		return false
		
	end		
-----------------------------------------------------------------------------------------------------------------------	


	

DefendRouteWaypointCallback  = function(_waypointId)


	if _waypointId < 0 then
		return 1
	end


	if _waypointId == 3 then

		FrontalAttack(armyDefendRoute)
        AI.Army_ClearWaypoints(armyDefendRoute.player, armyDefendRoute.id)

		return 1

	elseif Counter.Tick2("Robbers", 100) then

    	return 1
	else

		return 0

	end

end

	