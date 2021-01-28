function CreatePlayer7()

	--	describe the player structure
		Logic.SetPlayerName(7, String.Key("_Player7Name"))
	
		player7 					= {}
		player7.id 					= 7

	--	set up default information

		local description = {
		
			serfLimit				=	0,
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
				gold				=	100,
				clay				=	10,
				iron				=	100,
				sulfur				=	50,
				stone				=	10,
				wood				=	100,
				updateTime			=	5
			},
		}
		
		SetupPlayerAi(player7.id,description)

	end
