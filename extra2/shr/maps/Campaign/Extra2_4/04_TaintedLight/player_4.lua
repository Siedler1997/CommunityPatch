
createPlayer4 = function()

	--	describe the player structure
	
		local playerId = 4
	
		Player4						= {}
		Player4.id 					= playerId

	--	set up default information

		local description = {
		
			serfLimit				=	0,
			--------------------------------------------------
			extracting				=	true,
			--resourceFocus			=	ResourceType.WoodRaw,
			--------------------------------------------------
			resources = {
				gold				=	1000,
				clay				=	1000,
				iron				=	1000,
				sulfur				=	1000,
				stone				=	1000,
				wood				=	1000
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
					delay			=	5,
					randomTime		=	10
				},		
		}
		
		SetupPlayerAi(Player4.id,description)

	
	end
