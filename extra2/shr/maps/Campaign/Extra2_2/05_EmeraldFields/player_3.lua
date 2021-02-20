
createPlayer3 = function()

	--	describe the player structure
	
	local playerId = 3
	Logic.SetPlayerName(3, String.MainKey.."_Player3")
	
		player3 	= {}
		player3.id 	= 3

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
		
		SetupPlayerAi(player3.id,description)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 3)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 3)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 3)
	--[[
	if CP_Difficulty == 0
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 3)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 3)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 3)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 3)
	end
	--]]
end