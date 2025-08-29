-------------------------------------------------------------------------------------------------------
--
--	PLAYER #3
--
-------------------------------------------------------------------------------------------------------


setupPlayer3 = function()

	Logic.SetPlayerName(3, String.MainKey.."_Player3Name")

	--	describe the player structure
	
		player3 					= {}
		player3.id 					= 3

	--	set up default information

		local description = {
		
			serfLimit				=	0,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------		
			rebuild	=	{
				delay				=	0,
				randomTime			=	0
			},	
			--------------------------------------------------
			resources = {
				gold				=	100,
				clay				=	500,
				iron				=	500,
				sulfur				=	500,
				stone				=	500,
				wood				=	5000
			},
			--------------------------------------------------
			refresh = {
				gold				=	1,
				clay				=	1,
				iron				=	1,
				sulfur				=	1,
				stone				=	1,
				wood				=	1,
				updateTime			=	5
			},
		}
		
		SetupPlayerAi(player3.id,description)
	
	--	construct towers
	--[[
		local towers = {
			{ type	= Entities.PB_Tower1	,	pos = GetPosition("tower1") , level = 1	},					
			{ type	= Entities.PB_Tower1	,	pos = GetPosition("tower2") , level = 2	},					
		}				
		
		FeedAiWithConstructionPlanFile(player3.id,towers)
	--]]

	--	set up army groups of player 3
		
		setupArmyTroops101A()
		setupArmyTroops101B()
		setupArmyDespair1()
	
	end
