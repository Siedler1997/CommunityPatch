---------------------------------------------------------------------------------------------
function createPlayer7()

	SetPlayerName(2, String.Key("_Player2Name"))
	--SetPlayerName(2, "Boeser Gouverneur")

	player7 	= {}
	player7.id 	= 7

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


	SetupPlayerAi(player7.id,description)

    end
