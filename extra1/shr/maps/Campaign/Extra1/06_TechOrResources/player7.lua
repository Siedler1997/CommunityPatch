---------------------------------------------------------------------------------------------
function createPlayer7()

	SetPlayerName(2, String.Key("_Player2Name"))
	--SetPlayerName(2, "Boeser Gouverneur")

	player7 	= {}
	player7.id 	= 7

		local description = {

			serfLimit				=	2,
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


	SetupPlayerAi(player7.id,description)

    end
