
DEFEND_PASSIVE 	= 	0
DEFEND_ACTIVE	=	1

-- directly in front of Kerberos' Castle and at the gates that lead to that point

createArmyDefendDen = function()



	--	defenders of the castle; directly in front of castle

		armyDefendDen						= {}
	
		armyDefendDen.player 				= 8
		armyDefendDen.id					= 0
		armyDefendDen.strength				= 4
		armyDefendDen.position				= GetPosition("defend1")
		armyDefendDen.rodeLength			= 1200
		armyDefendDen.control				= {}
		armyDefendDen.control.mode			= DEFEND_PASSIVE
		armyDefendDen.control.delay			= 20
		armyDefendDen.control.defendPosition= GetPosition("defend1")

		troops = {
		
			Entities.PU_LeaderSword4,
			Entities.PU_LeaderBow4,
			Entities.PV_Cannon4,
			Entities.PV_Cannon4
		
		}

		createDefender(armyDefendDen,troops)






	--	defenders of the inner circle
	-- 	before gate in front of castle

		armyDefendInnerCircle				= {}
	
		armyDefendInnerCircle.player 					= 8
		armyDefendInnerCircle.id						= 1
		armyDefendInnerCircle.strength					= 3
		armyDefendInnerCircle.position					= GetPosition("defend2")
		armyDefendInnerCircle.rodeLength				= 4000
		armyDefendInnerCircle.control					= {}
		armyDefendInnerCircle.control.mode				= DEFEND_PASSIVE
		armyDefendInnerCircle.control.delay				= 20
		armyDefendInnerCircle.control.defendPosition	= GetPosition("defend2")

		troops = {
		
			Entities.PU_LeaderSword4,
			Entities.PU_LeaderSword4,
			Entities.PU_LeaderPoleArm4,
			Entities.PU_LeaderPoleArm4
		
		}

		createDefender(armyDefendInnerCircle,troops)




	--	defenders of the outer circle






	-- at right lower gate
		armyDefend1							= {}
	
		armyDefend1.player 					= 8
		armyDefend1.id						= 2
		armyDefend1.strength				= 3
		armyDefend1.position				= GetPosition("defend3")
		armyDefend1.rodeLength				= 500
		armyDefend1.control					= {}
		armyDefend1.control.mode			= DEFEND_PASSIVE
		armyDefend1.control.delay			= 20
		armyDefend1.control.defendPosition	= GetPosition("defend3")

		troops = {
		
			Entities.PU_LeaderPoleArm4,
			Entities.PU_LeaderPoleArm4,
			Entities.PV_Cannon4
		
		}

		createDefender(armyDefend1,troops)





	-- at gate mid; after Outpost
		armyDefend2							= {}
	
		armyDefend2.player 					= 8
		armyDefend2.id						= 3
		armyDefend2.strength				= 2
		armyDefend2.position				= GetPosition("defend4")
		armyDefend2.rodeLength				= 500
		armyDefend2.control					= {}
		armyDefend2.control.mode			= DEFEND_PASSIVE
		armyDefend2.control.delay			= 20
		armyDefend2.control.defendPosition	= GetPosition("defend4")

		troops = {
		
			Entities.PU_LeaderPoleArm3,
			Entities.PU_LeaderPoleArm3
		
		}

		createDefender(armyDefend2,troops)






	-- at left lower entrance
		armyDefend3							= {}
	
		armyDefend3.player 					= 8
		armyDefend3.id						= 4
		armyDefend3.strength				= 3
		armyDefend3.position				= GetPosition("defend5")
		armyDefend3.rodeLength				= 500
		armyDefend3.control					= {}
		armyDefend3.control.mode			= DEFEND_PASSIVE
		armyDefend3.control.delay			= 20
		armyDefend3.control.defendPosition	= GetPosition("defend5")

		troops = {
		
			Entities.PV_Cannon4,
			Entities.PV_Cannon4
		
		}

		createDefender(armyDefend3,troops)


	--	activate all armies
	
		StartJob("ControlDefendDen")
		StartJob("ControlInnerCircle")
		StartJob("ControlDefend1")
		StartJob("ControlDefend2")
		StartJob("ControlDefend3")

	
	
	
	--	knights patrol along defend positions

		armyDefendPatrol					= {}
	
		armyDefendPatrol.player 			= 8
		armyDefendPatrol.id					= 5
		armyDefendPatrol.strength			= 6
		armyDefendPatrol.position			= GetPosition("defend1")
		armyDefendPatrol.rodeLength			= 500

		troops = {
		
			Entities.PU_LeaderHeavyCavalry3,
			Entities.PU_LeaderHeavyCavalry3,
			Entities.PU_LeaderHeavyCavalry3,
			Entities.PU_LeaderHeavyCavalry3,
			Entities.PU_LeaderHeavyCavalry3,
			Entities.PU_LeaderHeavyCavalry3,
		}

		createDefender(armyDefendPatrol,troops)

	--	waypoints

	    local waypoints = {
	        "defend1",
	        "defend2",
	        "defend3",
	        "defend4",
	        "defend5",
	    }
	    
	    FeedArmyWithWaypoints(armyDefendPatrol.player,armyDefendPatrol.id,"DefendPatrolWaypointCallback",waypoints)

	--	job		

		--StartJob("ControlArmyDefendDen")

	end






createDefender = function(_army,_troops)

	SetupArmy(_army)

	local troopDescription = {
	
		minNumberOfSoldiers	= 4,
		maxNumberOfSoldiers = 9,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}			

	for i = 1,table.getn(_troops),1 do
	
		troopDescription.leaderType = _troops[i]
	
		EnlargeArmy(_army,troopDescription)

		end

	end


DefendPatrolWaypointCallback = function(_waypointId)
   
    return 1
    
    end
    
    

---------------------------------------------------------------------------------------------------------------------------
Condition_ControlDefendDen = function()
	return true	
	end
Action_ControlDefendDen = function()
	return defendBehaviour(armyDefendDen)
	end

---------------------------------------------------------------------------------------------------------------------------
Condition_ControlInnerCircle = function()
	return true	
	end
Action_ControlInnerCircle = function()
	return defendBehaviour(armyDefendInnerCircle)
	end

---------------------------------------------------------------------------------------------------------------------------
Condition_ControlDefend1 = function()
	return true	
	end
Action_ControlDefend1 = function()
	return defendBehaviour(armyDefend1)
	end

---------------------------------------------------------------------------------------------------------------------------
Condition_ControlDefend2 = function()
	return true	
	end
Action_ControlDefend2 = function()
	return defendBehaviour(armyDefend2)
	end

---------------------------------------------------------------------------------------------------------------------------
Condition_ControlDefend3 = function()
	return true	
	end
Action_ControlDefend3 = function()
	return defendBehaviour(armyDefend3)
	end

defendBehaviour = function(_army)
	if _army.control.mode == DEFEND_PASSIVE then	
		Defend(_army)
		if _army.control.delay <= 0 then
			_army.control.delay = 20 + Logic.GetRandom(20)
			_army.control.mode = DEFEND_ACTIVE
			end
	elseif _army.control.mode == DEFEND_ACTIVE then	
		FrontalAttack(_army)
		if _army.control.delay <= 0 then
			_army.control.delay = 40 + Logic.GetRandom(40)
			Redeploy(_army,_army.control.defendPosition)
			_army.control.mode = DEFEND_PASSIVE
			end
		end
	_army.control.delay = _army.control.delay -1
	end