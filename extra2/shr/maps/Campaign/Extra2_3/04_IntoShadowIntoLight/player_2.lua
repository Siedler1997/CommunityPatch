
createPlayer2 = function()

	--	describe the player structure

	local playerId = 2
	--Logic.SetPlayerName(playerId, String.Player(playerId))
	
		Player2 					= {}
		Player2.id 					= playerId

	--	set up default information

		local description = {
		
			serfLimit				=	0,
			--------------------------------------------------
			extracting				=	true,
			--------------------------------------------------
			resources = {
				gold				=	10000,
				clay				=	10000,
				iron				=	10000,
				sulfur				=	10000,
				stone				=	10000,
				wood				=	10000
			},
			--------------------------------------------------
			refresh = {
				gold				=	5*(CP_Difficulty+2),
				clay				=	5*(CP_Difficulty+1),
				iron				=	5*(CP_Difficulty+1),
				sulfur				=	5*(CP_Difficulty+1),
				stone				=	5*(CP_Difficulty+1),
				wood				=	5*(CP_Difficulty+1),
				updateTime			=	15-5*CP_Difficulty
			},
			--------------------------------------------------
			--rebuild	=	{
			--		delay			=	5,
			--		randomTime		=	10
			--	},		
		}

		SetupPlayerAi(Player2.id,description)


--[[	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 2) ]]

		if CP_Difficulty > 0 then
			for i = 1, 2 do
				Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
			end
			if CP_Difficulty == 2 then
				Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)

				Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 2)
			end
		end
end
