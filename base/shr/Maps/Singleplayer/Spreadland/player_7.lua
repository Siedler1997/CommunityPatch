
createPlayer7 = function()

	Logic.SetPlayerName(7, String.MainKey.."_Player7Name")


	--	describe the player structure
	
		player7 	= {}
		player7.id 	= 7

	--	set up default information

		local description = {
		
			serfLimit				=	0,
			--------------------------------------------------
			extracting				=	false,
			constructing			=	true,
			--------------------------------------------------
			resources = {
				gold				=	1500,
				clay				=	1500,
				iron				=	1500,
				sulfur				=	1500,
				stone				=	1500,
				wood				=	1500
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
		
		SetupPlayerAi(player7.id,description)
	
	end
