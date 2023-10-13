
createPlayer3 = function()

	--	describe the player structure

	local playerId = 3
	Logic.SetPlayerName(playerId, String.Player(playerId))
	
		Player3 					= {}
		Player3.id 					= playerId

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
				updateTime			=	5
			},
			--------------------------------------------------
		--	rebuild	=	{
		--			delay			=	300,
		--			randomTime		=	10
		--		},		
		}
		
		SetupPlayerAi(Player3.id,description)
		
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, playerId)
		
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
