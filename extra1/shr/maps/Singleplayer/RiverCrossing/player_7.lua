
createPlayer7 = function()

	--	describe the player structure

	local playerId = 7
	Logic.SetPlayerName(playerId, String.Player(playerId))

	
		player7 	= {}
		player7.id 	= playerId



	--	set up default information

		local description = {
		
			serfLimit				=	2,
			--------------------------------------------------
			extracting				=	true,
			--------------------------------------------------
		--	rebuild = {
		--		delay				=	25,
		--		randomTime			=	25
		--	},
			--------------------------------------------------
			resources = {
				gold				=	1000,
				clay				=	1000,
				iron				=	1000,
				sulfur				=	1000,
				stone				=	1000,
				wood				=	1000
			},
			--------------------------------------------------
			refresh = {
				gold				=	5,
				clay				=	5,
				iron				=	5,
				sulfur				=	5,
				stone				=	5,
				wood				=	5,
				updateTime			=	3
			},
		}
		
		SetupPlayerAi(player7.id,description)
		
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, playerId)
		
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, playerId)
	end
