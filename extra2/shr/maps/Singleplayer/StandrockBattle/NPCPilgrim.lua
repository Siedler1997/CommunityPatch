---------------------------------------------------------------------------------------

function NPCPilgrim()

	-- setup table for npc

	local NPCPilgrim			=	{}
	NPCPilgrim.name 			=	"Pilgrim"
	NPCPilgrim.callback			=	PilgrimSpoken
	        
	-- create npc
	CreateNPC(NPCPilgrim)
	   	
end

---------------------------------------------------------------------------------------

function PilgrimSpoken()
	SetPlayerName(5, nil)

	Logic.ChangeAllEntitiesPlayerID(5, 1)

	createBriefingPilgrim()

	PilgrimIsOn = 1

end
