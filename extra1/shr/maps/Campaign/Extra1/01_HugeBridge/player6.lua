---------------------------------------------------------------------------------------------
function createPlayer6()

	SetPlayerName(6, String.Key("_Player6Name"))
	--SetPlayerName(2, "Nebelvolk")

	player6 	= {}
	player6.id 	= 6

	local description = {
	    serfLimit = 10
    }

	SetupPlayerAi(player6.id,description)

    end
