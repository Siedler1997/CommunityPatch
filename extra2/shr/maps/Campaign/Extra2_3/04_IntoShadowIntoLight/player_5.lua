
createPlayer5 = function()

	--	describe the player structure

	local playerId = 5
	--Logic.SetPlayerName(playerId, String.Player(playerId))
	
		Player5 					= {}
		Player5.id 					= playerId

	--	set up default information

		local description = {
		
			serfLimit				=	0,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------
			resources = {
				gold				=	4000,
				clay				=	4000,
				iron				=	4000,
				sulfur				=	4000,
				stone				=	4000,
				wood				=	4000
			},
			--------------------------------------------------
			refresh = {
				gold				=	5*(CP_Difficulty+2),
				clay				=	5*(CP_Difficulty+1),
				iron				=	5*(CP_Difficulty+1),
				sulfur				=	5*(CP_Difficulty+1),
				stone				=	5*(CP_Difficulty+1),
				wood				=	5*(CP_Difficulty+1),
				updateTime			=	15-5*CP_Difficulty
			},
		}
		
		SetupPlayerAi(Player5.id,description)
		
		if CP_Difficulty > 0 then
			for i = 1, CP_Difficulty do
				Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 5)
				Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 5)
				Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 5)
				Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 5)
				Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 5)
				Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 5)
			end
		end
	
	end
