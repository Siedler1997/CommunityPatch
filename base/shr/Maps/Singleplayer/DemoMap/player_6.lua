
createPlayer6 = function()

	--	describe the player structure
	
		player6					  = {}
		player6.id 					= gvMission.PlayerIDRuinRobbers

		--Logic.SetPlayerName(gvMission.PlayerIDRuinRobbers, String.MainKey.."_Player6Name")


		--	set up default information

		local description = {
		
			serfLimit				=	10,
			--------------------------------------------------
			extracting			=	false,
			--------------------------------------------------
			resources = {
					gold				=	2000,
					clay				=	1000,
					iron				=	1500,
					sulfur				=	1000,
					stone				=	1000,
					wood				=	2000
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
		
		SetupPlayerAi(player6.id,description)
		Logic.DestroyEntity(GetID("P6Dummy"))
	end
