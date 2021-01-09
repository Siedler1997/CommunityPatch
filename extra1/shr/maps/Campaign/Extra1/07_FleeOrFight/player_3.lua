function CreatePlayer3()

	--	describe the player structure
		Logic.SetPlayerName(3, String.Key("_Player3Name"))
		--SetPlayerName(3, "Oestliche Insel")
	
		player3 					= {}
		player3.id 					= 3

	--	set up default information

		local description = {
		
			serfLimit				=	1,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------
			resources = {
				gold				=	3000,
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
				updateTime			=	10
			},
--			rebuild = {
	--			delay				=	10,
		--		randomTime			=	5
			--},
		}
		
		SetupPlayerAi(player3.id,description)
	
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, player3.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, player3.id)
		if CP_Difficulty == 0 then
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, player3.id)
		end
	
	end
