
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
			rebuild = {
				delay				=	2,
				randomTime			=	5
			},
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
				gold				=	3*(CP_Difficulty+2),
				clay				=	3*(CP_Difficulty+1),
				iron				=	3*(CP_Difficulty+1),
				sulfur				=	3*(CP_Difficulty+1),
				stone				=	3*(CP_Difficulty+1),
				wood				=	3*(CP_Difficulty+1),
				updateTime			=	5
			},
		}
		
		SetupPlayerAi(player2.id,description)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
	
	if CP_Difficulty == 2 then
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightLeaderMace1, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightSoldierMace1, 2)
	end
	
end
