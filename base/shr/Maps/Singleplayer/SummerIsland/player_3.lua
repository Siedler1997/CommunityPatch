createPlayer3 = function()

	local playerId = 3

	Logic.SetPlayerName(playerId, String.Player(playerId))

	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	4,
		--------------------------------------------------
		resources = {
			gold				=	3000,
			clay				=	800,
			iron				=	800,
			sulfur				=	800,
			stone				=	800,
			wood				=	800
		},
		--------------------------------------------------
		refresh = {
			gold				=	10,
			clay				=	10,
			iron				=	10,
			sulfur				=	10,
			stone				=	10,
			wood				=	10,
			updateTime			=	5
		},
		--------------------------------------------------
		extracting = false,
		--------------------------------------------------
		rebuild	=	{
				delay				=	5,
				randomTime			=	10
			}	
	}
	SetupPlayerAi(playerId,aiDescription)
	
	setupArmyP3Defense()
end