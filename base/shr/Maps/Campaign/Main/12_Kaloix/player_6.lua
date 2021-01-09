createPlayer6 = function()

	-- Setup ai
	local playerId = 6
	Logic.SetPlayerName(6, String.MainKey.."_Player6Name")

	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	4,
		--------------------------------------------------
		resources = {
			gold				=	10000,
			clay				=	5000,
			iron				=	5000,
			sulfur				=	5000,
			stone				=	5000,
			wood				=	5000
		},
		--------------------------------------------------
		refresh = {
			gold				=	20,
			clay				=	20,
			iron				=	20,
			sulfur				=	20,
			stone				=	20,
			wood				=	20,
			updateTime			=	10
		},
		--------------------------------------------------
		extracting = false
	}
	SetupPlayerAi(playerId,aiDescription)

	setupArmyKI1()	
	setupArmyKI1Defense()
end

