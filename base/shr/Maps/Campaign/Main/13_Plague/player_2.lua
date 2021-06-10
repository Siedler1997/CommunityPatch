
-- Morfichets army

createPlayer2 = function()

	--	describe the player structure
	
	Logic.SetPlayerName(2, String.MainKey.."_Player2Name")
	
	
		player2 					= {}
		player2.id 					= 2

	--	set up default information
	
		if CP_Difficulty > 0 then
			MapEditor_SetupAI(player2.id, 1, 2000, 2, "p2_hq", 1, 0)
		end

		local description = {
		
			serfLimit				=	10,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------
			resources = {
				gold				=	2000,
				clay				=	1000,
				iron				=	1500,
				sulfur				=	1000,
				stone				=	1000,
				wood				=	2000
			},
			--------------------------------------------------
			refresh = {
				gold				=	100,
				clay				=	10,
				iron				=	100,
				sulfur				=	50,
				stone				=	10,
				wood				=	100,
				updateTime			=	5
			},
		}
		
		SetupPlayerAi(player2.id,description)
	
	end
