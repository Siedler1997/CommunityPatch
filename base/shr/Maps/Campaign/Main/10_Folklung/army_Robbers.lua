createArmyRobbers = function()
	
		Report("Setting up robbers army")
		
		
		ArmyRobbersSwampA								= {}
	
		ArmyRobbersSwampA.player 						= gvMission.PlayerIDRobbersSwamp
		ArmyRobbersSwampA.id								= 4
		ArmyRobbersSwampA.strength					= 4
		ArmyRobbersSwampA.position					= GetPosition("RobbersSwampAHQ")
		ArmyRobbersSwampA.rodeLength				= 100
		ArmyRobbersSwampA.beAgressive				= true		
		ArmyRobbersSwampA.pulse							= true		

		SetupArmy(ArmyRobbersSwampA)

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

		EnlargeArmy(ArmyRobbersSwampA,troopDescription)
		EnlargeArmy(ArmyRobbersSwampA,troopDescription)
		EnlargeArmy(ArmyRobbersSwampA,troopDescription)
		EnlargeArmy(ArmyRobbersSwampA,troopDescription)

	  StartJob("ArmyRobbersSwampA")
end

Condition_ArmyRobbersSwampA = function()
	return 1
end


Action_ArmyRobbersSwampA = function()
	if IsDead(ArmyRobbersSwampA) then
		return true
	else
		Defend(ArmyRobbersSwampA)
		return false
	end
end


RefreshRobbers = function()
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

		EnlargeArmy(ArmyRobbersSwampA,troopDescription)
		EnlargeArmy(ArmyRobbersSwampA,troopDescription)
		EnlargeArmy(ArmyRobbersSwampA,troopDescription)
		EnlargeArmy(ArmyRobbersSwampA,troopDescription)
		EnlargeArmy(ArmyRobbersSwampA,troopDescription)
		EnlargeArmy(ArmyRobbersSwampA,troopDescription)
		
		
		
		ArmyRobbersSwampA.position					= GetPosition("ArmyRobbersCenter")
		ArmyRobbersSwampA.rodeLength				= 6000
		ArmyRobbersSwampA.beAgressive				= true				

		SetupArmy(ArmyRobbersSwampA)
		
end
