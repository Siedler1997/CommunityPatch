
createPlayer3 = function()

	--	describe the player structure

	local playerId = 3
	Logic.SetPlayerName(playerId, String.Player(playerId))
	
		Player3 					= {}
		Player3.id 					= playerId

	--	set up default information

		local description = {
		
			serfLimit				=	5,
			--------------------------------------------------
			extracting				=	false,
			
			--------------------------------------------------
			resources = {
				gold				=	10000,
				clay				=	10000,
				iron				=	10000,
				sulfur				=	10000,
				stone				=	10000,
				wood				=	10000
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
			rebuild	=	{
					delay			=	20,
					randomTime		=	10
				},		
		}
		
		SetupPlayerAi(Player3.id,description)


	end

