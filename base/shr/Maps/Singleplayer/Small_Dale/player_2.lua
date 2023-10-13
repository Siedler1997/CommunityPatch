
createPlayer2 = function()

	--	describe the player structure
	
	local playerId = 2
	Logic.SetPlayerName(2, String.MainKey.."_Player2")
	
		player2 	= {}
		player2.id 	= 2

	--	set up default information

		local description = {
		
			serfLimit				=	15,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------
			rebuild = {
				delay				=	25,
				randomTime			=	25
			},
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
				gold				=	10,
				clay				=	5,
				iron				=	5,
				sulfur				=	5,
				stone				=	5,
				wood				=	5,
				updateTime			=	5
			},
		}
		
		SetupPlayerAi(player2.id,description)
	
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, player2.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, player2.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, player2.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, player2.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, player2.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, player2.id)
	end
