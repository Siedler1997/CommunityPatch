---------------------------------------------------------------------------------------------
function createPlayer2()

	--SetPlayerName(2, "Boeser Gouverneur")

	player2 	= {}
	player2.id 	= 2
	
		if CP_Difficulty == 1 then
			MapEditor_SetupAI(player2.id, 2, 3000, 3, "p2_hq", 1, 0)
		else
			MapEditor_SetupAI(player2.id, 3, 5000, 3, "p2_hq", 3, 0)
		end

		local description = {

			serfLimit				=	4,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------
			rebuild = {
				delay				=	15,
				randomTime			=	15
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
				gold				=	150,
				clay				=	25,
				iron				=	100,
				sulfur				=	50,
				stone				=	25,
				wood				=	100,
				updateTime			=	10
			},
		}


	SetupPlayerAi(player2.id,description)

    end
