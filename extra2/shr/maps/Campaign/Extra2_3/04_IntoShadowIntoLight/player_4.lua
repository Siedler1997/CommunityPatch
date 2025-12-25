
createPlayer4 = function()

	--	describe the player structure

	local playerId = 4
	Logic.SetPlayerName(playerId, String.Player(playerId))
	
		Player4 					= {}
		Player4.id 					= playerId

	--	set up default information

		local description = {
		
			serfLimit				=	0,
			--------------------------------------------------
			extracting				=	false,
			
			--------------------------------------------------
			resources = {
				gold				=	5000,
				clay				=	5000,
				iron				=	5000,
				sulfur				=	5000,
				stone				=	5000,
				wood				=	5000
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
			--------------------------------------------------
		--	rebuild	=	{
		--			delay			=	300,
		--			randomTime		=	10
		--		},		
		}

		SetupPlayerAi(Player4.id,description)
		
		if CP_Difficulty == 2 then
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 4)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 4)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 4)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 4)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 4)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 4)
		end

	end

