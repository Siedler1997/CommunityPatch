
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
				gold				=	5,
				clay				=	5,
				iron				=	5,
				sulfur				=	5,
				stone				=	5,
				wood				=	5,
				updateTime			=	15
			},
			--------------------------------------------------
			rebuild	=	{
					delay			=	20,
					randomTime		=	10
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
		
		SetupPlayerAi(Player3.id,description)


	end

