
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

	if CP_Difficulty == 1 then
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 7)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 7)
	end
end
