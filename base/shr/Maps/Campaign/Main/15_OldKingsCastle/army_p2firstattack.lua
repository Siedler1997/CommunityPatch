setupArmyP2FirstAttack = function()

	ArmyP2FirstAttack				= {}

	ArmyP2FirstAttack.player 		= 2
	ArmyP2FirstAttack.id			= 0
	ArmyP2FirstAttack.strength		= 5
	ArmyP2FirstAttack.position		= GetPosition("OccupyingPos")
	ArmyP2FirstAttack.rodeLength	= 5000
	
	-- Setup army
	SetupArmy(ArmyP2FirstAttack)

	local troopDescription = {
	
		maxNumberOfSoldiers	= 4,
		minNumberOfSolderis	= 0,
		experiencePoints 	= LOW_EXPERIENCE,
		leaderType			= Entities.PU_LeaderPoleArm1
	}			
	
	if CP_Difficulty == 0 then
		EnlargeArmy(ArmyP2FirstAttack, troopDescription)
		EnlargeArmy(ArmyP2FirstAttack, troopDescription)

		troopDescription.leaderType = Entities.PU_LeaderSword1
		EnlargeArmy(ArmyP2FirstAttack, troopDescription)
		EnlargeArmy(ArmyP2FirstAttack, troopDescription)
	else
		troopDescription.leaderType = Entities.PU_LeaderPoleArm2
		EnlargeArmy(ArmyP2FirstAttack, troopDescription)
		EnlargeArmy(ArmyP2FirstAttack, troopDescription)

		troopDescription.leaderType = Entities.PU_LeaderSword2
		EnlargeArmy(ArmyP2FirstAttack, troopDescription)
		EnlargeArmy(ArmyP2FirstAttack, troopDescription)
	end

	troopDescription.leaderType = Entities.PV_Cannon2
	troopDescription.maxNumberOfSoldiers = 0

	EnlargeArmy(ArmyP2FirstAttack, troopDescription)
end