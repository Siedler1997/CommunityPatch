
createPlayer8 = function()

	--	describe the player structure

	local playerId = 8
	Logic.SetPlayerName(playerId, String.Player(playerId))

	
		player8 	= {}
		player8.id 	= playerId



	--	set up default information

		local description = {
		
			serfLimit				=	8,
			--------------------------------------------------
			extracting				=	true,
			--------------------------------------------------
			rebuild = {
				delay				=	5,
				randomTime			=	5
			},
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
				updateTime			=	2
			},
		}
		
		SetupPlayerAi(player8.id,description)

local position = GetPosition("p8_build1")


		construction	= {				{ type	= Entities.PB_VillageCenter1	,	pos = position			},					
							
								{ type	= Entities.PB_ClayMine1			,	pos = position			},
								{ type	= Entities.PB_SulfurMine1		,	pos = position, level=2	},
								
						}
						
		FeedAiWithConstructionPlanFile(8,construction)
	
local position = GetPosition("p8_build2")


		construction	= {
							
								{ type	= Entities.PB_StoneMine1			,	pos = position	,level=2		},

						}
						
		FeedAiWithConstructionPlanFile(8,construction)
	end
