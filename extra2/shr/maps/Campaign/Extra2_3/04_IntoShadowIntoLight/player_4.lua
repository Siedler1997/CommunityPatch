
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
				gold				=	5,
				clay				=	5,
				iron				=	5,
				sulfur				=	5,
				stone				=	5,
				wood				=	5,
				updateTime			=	15
			},
			--------------------------------------------------
		--	rebuild	=	{
		--			delay			=	300,
		--			randomTime		=	10
		--		},		
		}

		if CP_Difficulty > 0 then
			description.refresh = {
				gold				=	15,
				clay				=	10,
				iron				=	10,
				sulfur				=	10,
				stone				=	10,
				wood				=	10,
				updateTime			=	10
			}
		end
		
		SetupPlayerAi(Player4.id,description)
		
		if CP_Difficulty > 0 then
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 4)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 4)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 4)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 4)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 4)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 4)
		end

	end

