createArmyCannons = function()

	armyCannons						= {}

	armyCannons.player 				= 2
	armyCannons.id					= armyPlayer2Count
	armyCannons.strength			= 0
	armyCannons.position			= GetPosition("magicFoundry")
	armyCannons.rodeLength			= 1000
	armyCannons.control				= {}
	armyCannons.control.delay		= 60*4
	
	armyPlayer2Count = armyPlayer2Count +1
	
	SetupArmy(armyCannons)
		
	StartJob("ControlArmyCannons")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyCannons"
--
-----------------------------------------------------------------------------------------------------------------------	
	Condition_ControlArmyCannons = function()

		return true
		
		end

	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyCannons = function()
	-------------------------------------------------------------------------------------------------------------------

		if armyCannons.control.delay > 0 then
		
			armyCannons.control.delay = armyCannons.control.delay -1
			
			return false
			
			end

		if IsDead(armyCannons) or armyCannons.strength == 0 then
		
			if IsDead("magicFoundry") then
			
				return true
				
				end

			armyCannons.control.delay = 50 + Logic.GetRandom(50)
		
			Retreat(armyCannons)
			
			armyCannons.strength = armyCannons.strength +1

			if armyCannons.strength > 7 then
			
				armyCannons.strength = 7
				
				end

			local troopDescription = {
			
				maxNumberOfSoldiers	= 8,
				minNumberOfSoldiers	= 0,
				experiencePoints 	= LOW_EXPERIENCE,
			}		
			
			local cannonType = {}
		
			if 		armyCannons.strength == 1 then	
				table.insert(cannonType, Entities.PV_Cannon1)
				table.insert(cannonType, Entities.PV_Cannon1)
			elseif	armyCannons.strength == 2 then
				table.insert(cannonType, Entities.PV_Cannon1)
				table.insert(cannonType, Entities.PV_Cannon1)
			elseif	armyCannons.strength == 3 then
				table.insert(cannonType, Entities.PV_Cannon1)
				table.insert(cannonType, Entities.PV_Cannon2)
			elseif	armyCannons.strength == 4 then
				table.insert(cannonType, Entities.PV_Cannon1)
				table.insert(cannonType, Entities.PV_Cannon2)
			elseif	armyCannons.strength == 5 then
				table.insert(cannonType, Entities.PV_Cannon2)
				table.insert(cannonType, Entities.PV_Cannon3)
			elseif	armyCannons.strength == 6 then
				table.insert(cannonType, Entities.PV_Cannon2)
				table.insert(cannonType, Entities.PV_Cannon3)
			elseif	armyCannons.strength == 7 then -- <<< currently the max strength of an army!
				table.insert(cannonType, Entities.PV_Cannon3)
				table.insert(cannonType, Entities.PV_Cannon4)
			else
				table.insert(cannonType, Entities.PV_Cannon3)
				table.insert(cannonType, Entities.PV_Cannon4)
			end
				
			for i = 1 , armyCannons.strength , 1 do
				troopDescription.leaderType = cannonType[GetRandom(1, 2)]
				
				EnlargeArmy(armyCannons,troopDescription)
				
				end

			return false
			
			end

		Advance(armyCannons)

		return false

		end

	