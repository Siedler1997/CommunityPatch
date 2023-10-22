
createPlayer3 = function()

	--	describe the player structure

	local playerId = 3
	Logic.SetPlayerName(playerId, String.Player(playerId))
	
		Player3 					= {}
		Player3.id 					= playerId

	--	set up default information

		local description = {
		
			serfLimit				=	15,
			--------------------------------------------------
			extracting				=	false,
			--resourceFocus			=	ResourceType.WoodRaw,
			--------------------------------------------------
			resources = {
				gold				=	3000,
				clay				=	2000,
				iron				=	2000,
				sulfur				=	2000,
				stone				=	2000,
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
				updateTime			=	5
			},
			--------------------------------------------------
			rebuild	=	{
					delay			=	20,
					randomTime		=	10
				},		
		}
		
		SetupPlayerAi(Player3.id,description)
		
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, Player3.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, Player3.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, Player3.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, Player3.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, Player3.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, Player3.id)

		
local position = GetPosition("construct1")


		construction	= {
							        { type	= Entities.PB_VillageCenter1	,	pos = position			},					
								
							
						}
						
		FeedAiWithConstructionPlanFile(3,construction)	
		

	end
