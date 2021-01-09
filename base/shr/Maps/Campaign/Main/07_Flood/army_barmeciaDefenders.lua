createArmyBarmeciaDefenders = function()

	--	set up

		armyBarmeciaDefenders1				= {}
	
		armyBarmeciaDefenders1.player 		= 3
		armyBarmeciaDefenders1.id			= 1
		armyBarmeciaDefenders1.strength		= 10
		armyBarmeciaDefenders1.position		= GetPosition("defenders1")
		armyBarmeciaDefenders1.rodeLength	= 4000
		
		SetupArmy(armyBarmeciaDefenders1)

	--	create
		
		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 4,
			experiencePoints 	= MEDIUM_EXPERIENCE,
		}			
		
		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PU_LeaderPoleArm1
			EnlargeArmy(armyBarmeciaDefenders1,troopDescription)
			troopDescription.leaderType = Entities.PU_LeaderBow1
			for i = 1,3 do
				EnlargeArmy(armyBarmeciaDefenders1,troopDescription)
			end
			troopDescription.leaderType = Entities.PU_LeaderSword1
			for i = 1,4 do
				EnlargeArmy(armyBarmeciaDefenders1,troopDescription)
			end
		else
			troopDescription.leaderType = Entities.PU_LeaderPoleArm2
			EnlargeArmy(armyBarmeciaDefenders1,troopDescription)
			troopDescription.leaderType = Entities.PU_LeaderBow2
			for i = 1,3 do
				EnlargeArmy(armyBarmeciaDefenders1,troopDescription)
			end
			troopDescription.leaderType = Entities.PU_LeaderSword2
			for i = 1,4 do
				EnlargeArmy(armyBarmeciaDefenders1,troopDescription)
			end
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
			maxNumberOfSoldiers = 4,
			experiencePoints 	= MEDIUM_EXPERIENCE,
		}	

		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PU_LeaderBow1
			for i = 1,4 do
				EnlargeArmy(armyBarmeciaDefenders2,troopDescription)
			end
			troopDescription.leaderType = Entities.PU_LeaderSword1
			for i = 1,2 do
				EnlargeArmy(armyBarmeciaDefenders2,troopDescription)
			end
		else
			troopDescription.leaderType = Entities.PU_LeaderBow2
			for i = 1,4 do
				EnlargeArmy(armyBarmeciaDefenders2,troopDescription)
			end
			troopDescription.leaderType = Entities.PU_LeaderSword2
			for i = 1,2 do
				EnlargeArmy(armyBarmeciaDefenders2,troopDescription)
			end
		end	

	end
	
	