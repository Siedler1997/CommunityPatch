
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
				gold				=	7,
				clay				=	5,
				iron				=	7,
				sulfur				=	5,
				stone				=	5,
				wood				=	7,
				updateTime			=	2
			},
		}
		
		if CP_Difficulty > 0 then
			description.refresh = {
				gold				=	25,
				clay				=	15,
				iron				=	20,
				sulfur				=	10,
				stone				=	10,
				wood				=	20,
				updateTime			=	2
			}
		end

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
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)

end
