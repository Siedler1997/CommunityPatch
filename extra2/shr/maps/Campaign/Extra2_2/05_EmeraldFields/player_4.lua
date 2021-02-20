
createPlayer4 = function()

	--	describe the player structure
	
	local playerId = 4
	Logic.SetPlayerName(4, String.MainKey.."_Player4")
	
		player4 	= {}
		player4.id 	= 4

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
		
		SetupPlayerAi(player4.id,description)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 4)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 4)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 4)
	--[[
	if CP_Difficulty == 0
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 4)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 4)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 4)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 4)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 4)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 4)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 4)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 4)
	end
	--]]
end