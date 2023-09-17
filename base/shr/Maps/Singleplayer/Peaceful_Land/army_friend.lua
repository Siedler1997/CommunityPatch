createArmyFriend = function()

		armyFriend						= {}
	
		armyFriend.player 				= 4
		armyFriend.id					= 1
		armyFriend.strength				= 8
		armyFriend.position				= GetPosition("merchant3")
		armyFriend.rodeLength			= 5000
		
		SetupArmy(armyFriend)
	
		local troopDescription = {
		
			maxNumberOfSoldiers	= 8,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= VERYHIGH_EXPERIENCE,
		}			
	
		troopDescription.leaderType = Entities.PU_LeaderCavalry2
		
		EnlargeArmy(armyFriend,troopDescription)
		EnlargeArmy(armyFriend,troopDescription)
		EnlargeArmy(armyFriend,troopDescription)
		EnlargeArmy(armyFriend,troopDescription)
		
		troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2

		EnlargeArmy(armyFriend,troopDescription)
		EnlargeArmy(armyFriend,troopDescription)
		EnlargeArmy(armyFriend,troopDescription)
		EnlargeArmy(armyFriend,troopDescription)
			
	end

-----------------------------------------------------------------------------------------------------------------------	
Condition_ControlArmyFriend = function()
	return Counter.Tick2("ControlArmyFriend",70)	
	end
Action_ControlArmyFriend = function()
	if IsDead(armyFriend) then
		return true		
		end
	Advance(armyFriend)
	return false
	end


	