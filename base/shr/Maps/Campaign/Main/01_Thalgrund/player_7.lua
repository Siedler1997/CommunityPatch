
createPlayer7 = function()

	--	describe the player structure
	
		player7 					= {}
		player7.id 					= 7

		Logic.SetPlayerName(7, String.MainKey.."_Player7Name")


	--	set up default information

		local description = {
		
			serfLimit				=	10,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------
			resources = {
				gold				=	0,
				clay				=	0,
				iron				=	0,
				sulfur				=	0,
				stone				=	0,
				wood				=	0
			},
			--------------------------------------------------
			refresh = {
				gold				=	0,
				clay				=	0,
				iron				=	0,
				sulfur				=	0,
				stone				=	0,
				wood				=	0,
				updateTime			=	5
			},
		}
		
		SetupPlayerAi(player7.id,description)
	
		if CP_Difficulty > 0 then
			Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightLeaderMace1, 7)
			Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightSoldierMace1, 7)
		end
	end
