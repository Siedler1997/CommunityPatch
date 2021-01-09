setupArmyP4Intruder = function()

	ArmyP4Intruder	=	{}

	local i
	for i=1,3 do

		ArmyP4Intruder[i] 				= 	{}
                                          	
		ArmyP4Intruder[i].player 		= 	4
		ArmyP4Intruder[i].id			= 	i + 6
		ArmyP4Intruder[i].strength		= 	2
		ArmyP4Intruder[i].position		= 	GetPosition("Attacker"..i)
		ArmyP4Intruder[i].rodeLength	= 	1000
		
		-- Setup army
		SetupArmy(ArmyP4Intruder[i])
	
		local troopDescription 			=	{	maxNumberOfSoldiers	= 	4,
												minNumberOfSoldiers	= 	0,
												experiencePoints 	= 	LOW_EXPERIENCE,
												leaderType			=	Entities.CU_Barbarian_LeaderClub1
											}			
	
		EnlargeArmy(ArmyP4Intruder[i], troopDescription)
		EnlargeArmy(ArmyP4Intruder[i], troopDescription)
	
	end
	
end