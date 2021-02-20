
createPlayer6 = function()

	--	describe the player structure

	local playerId = 6
	Logic.SetPlayerName(6, String.MainKey.."_Player6")

		Player6 					= {}
		Player6.id 					= 6

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

		if CP_Difficulty == 1 then
			description.refresh = {
				gold				=	20,
				clay				=	10,
				iron				=	15,
				sulfur				=	10,
				stone				=	10,
				wood				=	15,
				updateTime			=	2
			}
		end
		
		SetupPlayerAi(Player6.id,description)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 6)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 6)

	if CP_Difficulty == 1 then
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 6)
	end
end
