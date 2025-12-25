
createPlayer7 = function()

	--	describe the player structure

	local playerId = 7
	Logic.SetPlayerName(7, String.MainKey.."_Player7")

		Player7 					= {}
		Player7.id 					= 7

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
		
		SetupPlayerAi(Player7.id,description)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 7)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 7)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 7)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 7)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 7)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 7)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 7)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 7)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 7)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 7)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 7)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 7)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 7)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 7)

	if CP_Difficulty == 2 then
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightLeaderMace1, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightSoldierMace1, 7)
	end
end
