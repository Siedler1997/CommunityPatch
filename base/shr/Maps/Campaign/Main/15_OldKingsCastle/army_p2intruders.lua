setupArmyP2Intruder = function()

	ArmyP2Intruder	=	{}

	local i
	for i=1,4 do

		ArmyP2Intruder[i] 				= 	{}
                                          	
		ArmyP2Intruder[i].player 		= 	2
		ArmyP2Intruder[i].id			= 	i + 5
		ArmyP2Intruder[i].strength		= 	2

		ArmyP2Intruder[i].position		= 	GetPosition("Intruders"..i)
		ArmyP2Intruder[i].rodeLength	= 	2000
		
		-- Setup army
		SetupArmy(ArmyP2Intruder[i])
	
		local experience = LOW_EXPERIENCE
		if CP_Difficulty == 1 then
			experience = experience + 1
		end

		local troopDescription 			=	{	maxNumberOfSoldiers	= 	4,
												minNumberOfSoldiers	= 	0,
												experiencePoints 	= 	experience,
												leaderType			=	Entities.PU_LeaderPoleArm1
											}			

		if CP_Difficulty == 0 then
			EnlargeArmy(ArmyP2Intruder[i], troopDescription)
			
			if i == 4 then
				EnlargeArmy(ArmyP2Intruder[i], troopDescription)
			end

			troopDescription.leaderType = Entities.PU_LeaderSword1
			EnlargeArmy(ArmyP2Intruder[i], troopDescription)

			if i == 4 then
				EnlargeArmy(ArmyP2Intruder[i], troopDescription)
			end
		else
			troopDescription.leaderType = Entities.PU_LeaderPoleArm2
			EnlargeArmy(ArmyP2Intruder[i], troopDescription)
			
			if i == 4 then
				EnlargeArmy(ArmyP2Intruder[i], troopDescription)
			end

			troopDescription.leaderType = Entities.PU_LeaderSword2
			EnlargeArmy(ArmyP2Intruder[i], troopDescription)

			if i == 4 then
				EnlargeArmy(ArmyP2Intruder[i], troopDescription)
			end
		end
	
	end
	
end