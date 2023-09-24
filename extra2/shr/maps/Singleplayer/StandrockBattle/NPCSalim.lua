---------------------------------------------------------------------------------------

function NPCSalim()

	-- setup table for npc

	local NPCSalim			=	{}
	NPCSalim.name 			=	"Salim"
	NPCSalim.callback		=	SalimSpoken
	        
	-- create npc
	CreateNPC(NPCSalim)
	   	
end

---------------------------------------------------------------------------------------

function SalimSpoken()
	SetPlayerName(4, nil)

	Logic.ChangeAllEntitiesPlayerID(4, 1)

	createBriefingSalim()

	SalimIsOn = 1

	NPCPilgrim()

end
