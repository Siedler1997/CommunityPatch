
createPlayer8 = function()

	--	describe the player structure

	local playerId = 8
	--Logic.SetPlayerName(playerId, String.Player(playerId))
	
		Player8 					= {}
		Player8.id 					= playerId

	--	set up default information

		local description = {
		
			serfLimit				=	6,
			--------------------------------------------------
			extracting				=	true,
			--resourceFocus			=	ResourceType.WoodRaw,
			--------------------------------------------------
			resources = {
				gold				=	500,
				clay				=	500,
				iron				=	500,
				sulfur				=	500,
				stone				=	500,
				wood				=	500
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
		--	rebuild	=	{
		--			delay			=	300,
		--			randomTime		=	10
		--		},		
		}
		
		SetupPlayerAi(Player8.id,description)


		
--local position = GetPosition("p3_base")

--
--		construction	= {
--							        { type	= Entities.PB_VillageCenter1	,	pos = position			},					
--								
--							
--						}
--						
--		FeedAiWithConstructionPlanFile(3,construction)
	
--createArmyDefend()
--createArmySouthernAssault()
--createArmySpawn()		

	end
