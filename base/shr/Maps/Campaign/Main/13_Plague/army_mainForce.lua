MAIN_FORCE_RESPAWN_TIME = 5 * 60
if CP_Difficulty > 0 then
	MAIN_FORCE_RESPAWN_TIME = MAIN_FORCE_RESPAWN_TIME - 60
end

createArmyMainForce = function()

	--	set up

		armyMainForce					= {}
	
		armyMainForce.player 			= 3
		armyMainForce.id				= 7
		armyMainForce.strength			= 8
		armyMainForce.position			= GetPosition("spawny")
		armyMainForce.rodeLength		= 2000
		armyMainForce.control			= {}
		armyMainForce.control.startTime	= 30 * 60
		armyMainForce.control.retreat	= false
		armyMainForce.control.respawn	= MAIN_FORCE_RESPAWN_TIME
						
		SetupArmy(armyMainForce)
		
	--	troop variants
		mainForcePool = {}
		if CP_Difficulty == 0 then	
			table.insert(mainForcePool, Entities.PU_LeaderPoleArm3)
			table.insert(mainForcePool, Entities.PU_LeaderSword3)
			table.insert(mainForcePool, Entities.PU_LeaderBow3)
			table.insert(mainForcePool, Entities.PU_LeaderBow3)
			table.insert(mainForcePool, Entities.PU_LeaderBow3)
			table.insert(mainForcePool, Entities.PU_LeaderHeavyCavalry1)
			table.insert(mainForcePool, Entities.PV_Cannon3)
			table.insert(mainForcePool, Entities.PV_Cannon2)
		else
			table.insert(mainForcePool, Entities.PU_LeaderPoleArm4)
			table.insert(mainForcePool, Entities.PU_LeaderSword4)
			table.insert(mainForcePool, Entities.PU_LeaderBow4)
			table.insert(mainForcePool, Entities.PU_LeaderBow4)
			table.insert(mainForcePool, Entities.PU_LeaderBow4)
			table.insert(mainForcePool, Entities.PU_LeaderHeavyCavalry2)
			table.insert(mainForcePool, Entities.PV_Cannon4)
			table.insert(mainForcePool, Entities.PV_Cannon3)
		end
		
	--	start controlling job		
		
		StartJob("SetupArmyMainForce")
		StartJob("ControlArmyMainForce")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "SetupArmyMainForce"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_SetupArmyMainForce = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if armyMainForce.control.startTime > 0 then
		
			armyMainForce.control.startTime = armyMainForce.control.startTime -1

			if armyMainForce.control.startTime == 0 then
			
				createArmyCastleDefenders()
				
				end

			return false
			
			end
		
		armyMainForce.control.respawn = armyMainForce.control.respawn -1
		
		return armyMainForce.control.respawn <= 0
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_SetupArmyMainForce = function()
	-------------------------------------------------------------------------------------------------------------------

		armyMainForce.control.respawn = MAIN_FORCE_RESPAWN_TIME

		if HasFullStrength(armyMainForce) == false then

			local troopDescription = {
			
				minNumberOfSoldiers	= 0,
				maxNumberOfSoldiers	= 9,
				leaderType 			= mainForcePool[Logic.GetRandom(table.getn(mainForcePool)) +1],
				experiencePoints 	= HIGH_EXPERIENCE,
			}	
			
			if CP_Difficulty == 0 then	
				troopDescription.experiencePoints = VERYHIGH_EXPERIENCE
			end
		
			EnlargeArmy(armyMainForce,troopDescription)

			end
			
		return false
		
		end	
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyMainForce"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyMainForce = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("ControlArmyMainForce",5)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyMainForce = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsWeak(armyMainForce) then

			if armyMainForce.control.retreat == false then
		
				armyMainForce.control.retreat = true
	
				Retreat(armyMainForce)
				
			else
			
				Defend(armyMainForce)
				
				end
						
		else			

			armyMainForce.control.retreat = false

			Advance(armyMainForce)

			end

		return false
		
		end
	
