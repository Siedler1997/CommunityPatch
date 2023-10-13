setupArmyP7Intruder = function()

	ArmyP7Intruder	=	{}

	local i
	for i=1,1 do

		ArmyP7Intruder[i] 				= 	{}
                                          	
		ArmyP7Intruder[i].player 		= 	7
		ArmyP7Intruder[i].id			= 	i
		ArmyP7Intruder[i].strength		= 	3

		ArmyP7Intruder[i].position		= 	GetPosition("P7_MilitaryUnitGenerator"..i)
		ArmyP7Intruder[i].rodeLength	= 	1000
		
		-- Setup army
		SetupArmy(ArmyP7Intruder[i])
	
		local troopDescription 			=	{	maxNumberOfSoldiers	= 	8,
												minNumberOfSoldiers	= 	0,
												experiencePoints 	= 	LOW_EXPERIENCE,
												leaderType			=	Entities.CU_BanditLeaderBow2
											}			
		EnlargeArmy(ArmyP7Intruder[i], troopDescription)

		troopDescription.leaderType = Entities.CU_BanditLeaderSword2
		EnlargeArmy(ArmyP7Intruder[i], troopDescription)
		EnlargeArmy(ArmyP7Intruder[i], troopDescription)

	
	end
	
end