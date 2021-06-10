setupArmyP4Intruder = function()

	ArmyP4Intruder	=	{}

	local i
	for i=1,3 do

		ArmyP4Intruder[i] 				= 	{}
                                          	
		ArmyP4Intruder[i].player 		= 	4
		ArmyP4Intruder[i].id			= 	i + 6
		ArmyP4Intruder[i].strength		= 	2
		if CP_Difficulty == 2 then
			ArmyP4Intruder[i].strength = ArmyP4Intruder[i].strength + 1
		end
		ArmyP4Intruder[i].position		= 	GetPosition("Attacker"..i)
		ArmyP4Intruder[i].rodeLength	= 	1000
		
		-- Setup army
		SetupArmy(ArmyP4Intruder[i])
	
		local troopDescription 			=	{	maxNumberOfSoldiers	= 	8,
												minNumberOfSoldiers	= 	0,
												experiencePoints 	= 	LOW_EXPERIENCE,
												leaderType			=	Entities.CU_Barbarian_LeaderClub1
											}

		if CP_Difficulty > 1 then
			troopDescription.experiencePoints = HIGH_EXPERIENCE
		end			
	
		EnlargeArmy(ArmyP4Intruder[i], troopDescription)
		EnlargeArmy(ArmyP4Intruder[i], troopDescription)
	
	end
	
end