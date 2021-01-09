function CreatePlayer8()

	--	describe the player structure
		Logic.SetPlayerName(8, String.Key("_Player8Name"))
		-- SetPlayerName(8, "Glen Medden")
	
		player8 					= {}
		player8.id 					= 8

	--	set up default information

		local description = {
		
			serfLimit				=	4,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------
			resources = {
				gold				=	8000,
				clay				=	500,
				iron				=	500,
				sulfur				=	500,
				stone				=	500,
				wood				=	500
			},
			--------------------------------------------------
			refresh = {
				gold				=	60,
				clay				=	10,
				iron				=	15,
				sulfur				=	10,
				stone				=	10,
				wood				=	10,
				updateTime			=	2
			},
			rebuild = {
				delay				=	10,
				randomTime			=	5
			},
		}
		
		SetupPlayerAi(player8.id,description)
	
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, player8.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, player8.id)

		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, player8.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, player8.id)

		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, player8.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, player8.id)
	
		if CP_Difficulty == 0 then
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, player8.id)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, player8.id)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, player8.id)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, player8.id)
		end

	end
