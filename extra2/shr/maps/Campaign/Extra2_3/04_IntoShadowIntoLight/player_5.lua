
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
				gold				=	5,
				clay				=	5,
				iron				=	5,
				sulfur				=	5,
				stone				=	5,
				wood				=	5,
				updateTime			=	15
			},
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
		
		SetupPlayerAi(Player5.id,description)
		
		if CP_Difficulty > 0 then
			for i = 1, 2 do
				Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 5)
				Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 5)
				Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 5)
				Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 5)
				Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 5)
				Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 5)
			end
		end
	
	end
