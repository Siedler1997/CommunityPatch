
-- Crawford army player

createPlayer4 = function()

	--	describe the player structure
	
		player4 					= {}
		player4.id 					= 4

	--	set up default information

		local description = {
		
			serfLimit				=	0,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------
			resources = {
				gold				=	2000,
				clay				=	1000,
				iron				=	500,
				sulfur				=	1000,
				stone				=	1000,
				wood				=	2000
			},
			--------------------------------------------------
			refresh = {
				gold				=	200,
				clay				=	50,
				iron				=	0,
				sulfur				=	50,
				stone				=	50,
				wood				=	100,
				updateTime			=	5
			},
		}
		
		SetupPlayerAi(player4.id,description)
	
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 4)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 4)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 4)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 4)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 4)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 4)
	end
