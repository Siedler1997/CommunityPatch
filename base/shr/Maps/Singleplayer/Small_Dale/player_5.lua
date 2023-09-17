
createPlayer5 = function()

	--	describe the player structure

	local playerId = 5
	Logic.SetPlayerName(5, String.MainKey.."_Player5")

		Player5 					= {}
		Player5.id 					= 5

	--	set up default information

		local description = {
		
			serfLimit				=	10,
			--------------------------------------------------
			extracting				=	true,
			resourceFocus			=	ResourceType.WoodRaw,
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
				gold				=	15,
				clay				=	5,
				iron				=	5,
				sulfur				=	5,
				stone				=	5,
				wood				=	5,
				updateTime			=	5
			},
			--------------------------------------------------
			rebuild	=	{
					delay			=	5,
					randomTime		=	10
				},		
		}
		
		SetupPlayerAi(Player5.id,description)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, Player5.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, Player5.id)
	
end
