
createPlayer5 = function()

	--	describe the player structure

	local playerId = 5
	Logic.SetPlayerName(playerId, String.MainKey.."_Player5Name")

	
		player5 	= {}
		player5.id 	= playerId



	--	set up default information

		local description = {
		
			serfLimit				=	4,
			--------------------------------------------------
			extracting				=	true,
			--------------------------------------------------
	--		rebuild = {
	--			delay				=	25,
	--			randomTime			=	25
	--		},
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
				gold				=	10,
				clay				=	10,
				iron				=	10,
				sulfur				=	10,
				stone				=	10,
				wood				=	10,
				updateTime			=	3
			},
		}
		
		SetupPlayerAi(player5.id,description)
		
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, playerId)
		
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, playerId)
		
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, playerId)

	end
