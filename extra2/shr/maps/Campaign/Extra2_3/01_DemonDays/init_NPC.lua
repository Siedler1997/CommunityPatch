------------------------------------------------------------------------------------------------------

function InitNPCs()

	NPCshepard			=	{}
	NPCshepard.name 		=	"shepard"
	NPCshepard.callback		=	createBriefingShepard
	CreateNPC(NPCshepard)

	NPCvarg				=	{}
	NPCvarg.name 			=	"varg"
	NPCvarg.callback		=	createBriefingVarg
	CreateNPC(NPCvarg)

	NPCthief			=	{}
	NPCthief.name 			=	"thief"
	NPCthief.callback		=	createBriefingThief
	CreateNPC(NPCthief)

	local pos = GetPosition("victim_serf")	
	CreateEntity(7, Entities.CU_AfraidSerf, pos, "victim")
	local ID = GetID("victim")
	Logic.RotateEntity(ID,-90) 

	NPCvictim			=	{}
	NPCvictim.name 			=	"victim"
	NPCvictim.callback		=	createBriefingVictim
	CreateNPC(NPCvictim)

end