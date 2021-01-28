function CreatePlayer5()

	--	describe the player structure
		Logic.SetPlayerName(5, String.Key("_Player5Name"))
		
		player5 					= {}
		player5.id 					= 5

	--	set up default information

		local description = {
		
			serfLimit				=	0,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------
			resources = {
				gold				=	4000,
				clay				=	0,
				iron				=	500,
				sulfur				=	0,
				stone				=	0,
				wood				=	100
			},
			--------------------------------------------------
			refresh = {
				gold				=	250,
				clay				=	0,
				iron				=	100,
				sulfur				=	0,
				stone				=	0,
				wood				=	50,
				updateTime			=	20
			},
		}
		
		SetupPlayerAi(player5.id,description)
	
	end
