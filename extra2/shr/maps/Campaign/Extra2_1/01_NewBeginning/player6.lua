---------------------------------------------------------------------------------------------
function createPlayer6()

--	SetPlayerName(2, String.Key("_Player2Name"))
--	SetPlayerName(2, "Barbaren")

	player6 	= {}
	player6.id 	= 6

	local description = {
	    serfLimit = 10
    }

	SetupPlayerAi(player6.id,description)

end
