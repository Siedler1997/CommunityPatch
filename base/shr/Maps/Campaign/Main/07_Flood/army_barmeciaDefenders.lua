createArmyBarmeciaDefenders = function()

	local spearType = Entities.PU_LeaderPoleArm1
	local bowType = Entities.PU_LeaderBow1
	local swordType = Entities.PU_LeaderSword1
	if CP_Difficulty == 1 then	
		spearType = Entities.PU_LeaderPoleArm2
		bowType = Entities.PU_LeaderBow2
		swordType = Entities.PU_LeaderSword2
	elseif CP_Difficulty == 2 then	
		spearType = Entities.PU_LeaderPoleArm2a
		bowType = Entities.PU_LeaderBow2a
		swordType = Entities.PU_LeaderSword2a
	end

	--	set up

		armyBarmeciaDefenders1				= {}
	
		armyBarmeciaDefenders1.player 		= 3
		armyBarmeciaDefenders1.id			= 1
		armyBarmeciaDefenders1.strength		= 8
		armyBarmeciaDefenders1.position		= GetPosition("defenders1")
		armyBarmeciaDefenders1.rodeLength	= 4000
		
		SetupArmy(armyBarmeciaDefenders1)

	--	create
		
		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 8,
			experiencePoints 	= CP_Difficulty,
		}			
		
		troopDescription.leaderType = spearType
		EnlargeArmy(armyBarmeciaDefenders1,troopDescription)
		troopDescription.leaderType = bowType
		for i = 1,3 do
			EnlargeArmy(armyBarmeciaDefenders1,troopDescription)
		end
		troopDescription.leaderType = swordType
		for i = 1,4 do
			EnlargeArmy(armyBarmeciaDefenders1,troopDescription)
		end

	--	set up

		armyBarmeciaDefenders2				= {}
	
		armyBarmeciaDefenders2.player 		= 3
		armyBarmeciaDefenders2.id			= 2
		armyBarmeciaDefenders2.strength		= 8
		armyBarmeciaDefenders2.position		= GetPosition("defenders2")
		armyBarmeciaDefenders2.rodeLength	= 2000
		
		SetupArmy(armyBarmeciaDefenders2)

	--	create
		
		local troopDescription = {
		
			minNumberOfSoldiers	= 1,
			maxNumberOfSoldiers = 8,
			experiencePoints 	= CP_Difficulty,
		}	

		troopDescription.leaderType = bowType
		for i = 1,4 do
			EnlargeArmy(armyBarmeciaDefenders2,troopDescription)
		end
		troopDescription.leaderType = swordType
		for i = 1,2 do
			EnlargeArmy(armyBarmeciaDefenders2,troopDescription)
		end

	end
	
	