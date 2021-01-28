createArmyRobbers = function()
	
		Report("Setting up robbers army")
		
		local strength = 4
		if CP_Difficulty == 1 then
			strength = 6
		end
		
		ArmyRobbersSwampA								= {}
	
		ArmyRobbersSwampA.player 						= gvMission.PlayerIDRobbersSwamp
		ArmyRobbersSwampA.id								= 4
		ArmyRobbersSwampA.strength					= strength
		ArmyRobbersSwampA.position					= GetPosition("RobbersSwampAHQ")
		ArmyRobbersSwampA.rodeLength				= 100
		ArmyRobbersSwampA.beAgressive				= true		
		ArmyRobbersSwampA.pulse							= true		

		SetupArmy(ArmyRobbersSwampA)

	--	create
		local soldiers = 6
		local experience = LOW_EXPERIENCE
		local etype = Entities.CU_BanditLeaderSword1
		if CP_Difficulty == 1 then
			soldiers = soldiers + 2
			experience = experience + 2
			etype = Entities.CU_BanditLeaderSword2
		end

		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = soldiers,
			experiencePoints 	= experience,
			leaderType			= etype
		}		

		for i = 1, strength do
			EnlargeArmy(ArmyRobbersSwampA,troopDescription)
		end

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
		local etype = Entities.CU_BanditLeaderSword1
		if CP_Difficulty == 1 then
			soldiers = soldiers + 2
			experience = experience + 2
			etype = Entities.CU_BanditLeaderSword2
		end

		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = soldiers,
			experiencePoints 	= experience,
			leaderType			= etype
		}			
		
		for i = 1, 6 do
			EnlargeArmy(ArmyRobbersSwampA,troopDescription)
		end
		
		
		ArmyRobbersSwampA.position					= GetPosition("ArmyRobbersCenter")
		ArmyRobbersSwampA.rodeLength				= 6000
		ArmyRobbersSwampA.beAgressive				= true				

		SetupArmy(ArmyRobbersSwampA)
		
end
