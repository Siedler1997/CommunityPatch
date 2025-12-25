
createPlayer2 = function()

	--	describe the player structure
	
	local playerId = 2
	Logic.SetPlayerName(2, String.MainKey.."_Player2")
	
		player2 	= {}
		player2.id 	= 2

	--	set up default information

		local description = {
		
			serfLimit				=	5,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------

			--------------------------------------------------
			resources = {
				gold				=	2000,
				clay				=	2000,
				iron				=	2000,
				sulfur				=	2000,
				stone				=	2000,
				wood				=	2000
			},
			--------------------------------------------------
			refresh = {
				gold				=	7*(CP_Difficulty+2),
				clay				=	5*(CP_Difficulty+1),
				iron				=	7*(CP_Difficulty+1),
				sulfur				=	5*(CP_Difficulty+1),
				stone				=	5*(CP_Difficulty+1),
				wood				=	7*(CP_Difficulty+1),
				updateTime			=	2
			},
		}

		SetupPlayerAi(player2.id,description)


	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 2)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightLeaderMace1, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightSoldierMace1, 2)

end
