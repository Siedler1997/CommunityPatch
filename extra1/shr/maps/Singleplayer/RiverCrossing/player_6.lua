
createPlayer6 = function()

	--	describe the player structure

	local playerId = 6
	Logic.SetPlayerName(playerId, String.Player(playerId))

	
		player6 	= {}
		player6.id 	= playerId



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
				gold				=	3,
				clay				=	3,
				iron				=	3,
				sulfur				=	3,
				stone				=	3,
				wood				=	3,
				updateTime			=	2
			},
		}
		
		SetupPlayerAi(player6.id,description)
		
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, playerId)

	end
