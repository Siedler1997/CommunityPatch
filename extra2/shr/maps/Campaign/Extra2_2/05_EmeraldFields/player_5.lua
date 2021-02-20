
createPlayer5 = function()

	--	describe the player structure

	local playerId = 5
	Logic.SetPlayerName(5, String.MainKey.."_Player5")

		Player5 					= {}
		Player5.id 					= 5

	--	set up default information

		local description = {
		
			serfLimit				=	5,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------
			rebuild = {
				delay				=	5,
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
				gold				=	15,
				clay				=	10,
				iron				=	10,
				sulfur				=	10,
				stone				=	10,
				wood				=	10,
				updateTime			=	2
			},
		}
		
		SetupPlayerAi(Player5.id,description)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 5)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 5)
	
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 5)
	--[[
	if CP_Difficulty == 0
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 5)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 5)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 5)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 5)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 5)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 5)
	end
	--]]
end
