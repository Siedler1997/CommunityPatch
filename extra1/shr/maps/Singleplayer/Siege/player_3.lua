
createPlayer3 = function()

	--	describe the player structure
	
	local playerId = 3
	Logic.SetPlayerName(3, String.MainKey.."_Player3Name")
	
		player3 	= {}
		player3.id 	= 3

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
		
		SetupPlayerAi(player3.id,description)





local position = GetPosition("village3")


		construction	= { { type	= Entities.PB_VillageCenter3	,	pos = position , level=3} }
						
		FeedAiWithConstructionPlanFile(3,construction)
	
end
