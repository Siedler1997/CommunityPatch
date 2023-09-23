
createPlayer2 = function()

	--	describe the player structure
	
	local playerId = 2
	Logic.SetPlayerName(2, String.MainKey.."_Player2Name")
	
		player2 	= {}
		player2.id 	= 2

	--	set up default information

		local description = {
		
			serfLimit				=	5,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------
			rebuild = {
				delay				=	5,
				randomTime			=	5
			},
			--------------------------------------------------
			resources = {
				gold				=	2000,
				clay				=	2000,
				iron				=	2000,
				sulfur				=	2000,
				stone				=	2000,
				wood				=	2000
			},
			--------------------------------------------------
			refresh = {
				gold				=	5,
				clay				=	5,
				iron				=	5,
				sulfur				=	5,
				stone				=	5,
				wood				=	5,
				updateTime			=	3
			},
		}
		
		SetupPlayerAi(player2.id,description)





local position = GetPosition("village2")


		construction	= { { type	= Entities.PB_VillageCenter3	,	pos = position , level=3} }
						
		FeedAiWithConstructionPlanFile(2,construction)
	
end
