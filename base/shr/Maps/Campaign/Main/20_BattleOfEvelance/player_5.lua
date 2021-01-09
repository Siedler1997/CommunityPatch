-- Kerberos' HQ

createPlayer5 = function()

--	Logic.SetPlayerName(5, String.MainKey.."_Player5Name")


	--	describe the player structure
	
		player5 					= {}
		player5.id 					= 5

	--	set up default information
	
		if CP_Difficulty == 0 then
			MapEditor_SetupAI(player5.id, 2, 3000, 3, "lionsDen", 1, 0)
		else
			MapEditor_SetupAI(player5.id, 3, 5000, 3, "lionsDen", 2, 0)
		end
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
		
		SetupPlayerAi(player5.id,description)
	
	end
