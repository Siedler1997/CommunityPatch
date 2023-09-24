---------------------------------------------------------------------------------------

function NPCErec()

	-- setup table for npc

	local NPCErec			=	{}
	NPCErec.name 			=	"Erec"
	NPCErec.callback		=	ErecSpoken
	        
	-- create npc
	CreateNPC(NPCErec)
	   	
end

---------------------------------------------------------------------------------------

function ErecSpoken()
	SetPlayerName(3, nil)

	Logic.ChangeAllEntitiesPlayerID(3, 1)
	ChangePlayer("Father",3)

	createBriefingErec()

	ErecIsOn = 1

	NPCSalim()

end
