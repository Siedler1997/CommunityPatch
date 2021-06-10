function CreateNPCEastVillage()

	-- setup table for npc
	NpcEastVillage				=	{}
	NpcEastVillage.name 		=	"P3_EastVillage_NPC"
	NpcEastVillage.callback		=	CreateNPCEastVillageBriefing
	        
	-- create npc
	CreateNPC(NpcEastVillage)
	   	
end

function CreateNPCEastVillageBriefing()

	end2ndChapter()

	NPCEastVillageBriefing					=	{}
	NPCEastVillageBriefing.restoreCamera	=	true
	NPCEastVillageBriefing.finished			=	NPCEastVillageBriefingFinished

	local page = 0
	
	--	page 1
	
		page = page +1
	
		NPCEastVillageBriefing[page] 				= 	{}
		NPCEastVillageBriefing[page].title			= 	String.Key("NPCEastVillageBriefing[1].title")
		NPCEastVillageBriefing[page].text			=	String.Key("NPCEastVillageBriefing[1].text")
		
		NPCEastVillageBriefing[page].position 		=	GetPosition("P3_EastVillage_NPC")

	if IsAlive("EastBridge") then

	--	page 2
	
		page = page +1
	
		NPCEastVillageBriefing[page] 				= 	{}
		NPCEastVillageBriefing[page].title			= 	String.Key("NPCEastVillageBriefing[1].title")
		NPCEastVillageBriefing[page].text			=	String.Key("NPCEastVillageBriefing[2].text")
		
		NPCEastVillageBriefing[page].position 		=	GetPosition("EastVillageBridge")
		NPCEastVillageBriefing[page].explore		=	2000
		
		NPCEastVillageBriefingShowEastBridge		=	NPCEastVillageBriefing[page]

	end

	--	page 3
	
		page = page +1
	
		NPCEastVillageBriefing[page] 				= 	{}
		NPCEastVillageBriefing[page].title			= 	String.Key("NPCEastVillageBriefing[1].title")
		NPCEastVillageBriefing[page].text			=	String.Key("NPCEastVillageBriefing[3].text")
		
		NPCEastVillageBriefing[page].position 		=	GetPosition("P3_EastVillage_NPC")
		
		
	--	page 4
	
		page = page +1
	
		NPCEastVillageBriefing[page] 				= 	{}
		NPCEastVillageBriefing[page].title			= 	String.Key("NPCEastVillageBriefing[1].title")
		NPCEastVillageBriefing[page].text			=	String.Key("NPCEastVillageBriefing[4].text")
		
		NPCEastVillageBriefing[page].position 		=	GetPosition("P3_EastVillage_NPC")
		
		
	--	page 5
	
		page = page +1
	
		NPCEastVillageBriefing[page] 				= 	{}
		NPCEastVillageBriefing[page].title			= 	String.Key("NPCEastVillageBriefing[1].title")
		NPCEastVillageBriefing[page].text			=	String.Key("NPCEastVillageBriefing[5].text")
		
		NPCEastVillageBriefing[page].position 		=	GetPosition("FireSignalPos1")
		NPCEastVillageBriefing[page].marker	 		=	ANIMATED_MARKER
		NPCEastVillageBriefing[page].noScrolling	=	true
		
		NPCEastVillageBriefingShowPos1				=	NPCEastVillageBriefing[page]

	--	page 6
	
		page = page +1
	
		NPCEastVillageBriefing[page] 				= 	{}
		NPCEastVillageBriefing[page].title			= 	String.GenericKey("MissionObjectives")
		NPCEastVillageBriefing[page].text			=	String.Key("NPCEastVillageBriefing[6].text")

		NPCEastVillageBriefing[page].position 		=	GetPosition("P3_EastVillage_NPC")

		NPCEastVillageBriefing[page].quest			=	{}
		NPCEastVillageBriefing[page].quest.id		=	4
		NPCEastVillageBriefing[page].quest.type		=	MAINQUEST_OPEN
		NPCEastVillageBriefing[page].quest.title	=	String.Key("NPCEastVillageBriefing[6].quest.title")
		NPCEastVillageBriefing[page].quest.text		=	String.Key("NPCEastVillageBriefing[6].quest.text")


		NPCEastVillageBriefingShowNPCs				=	NPCEastVillageBriefing[page]

	-- go
	
	StartBriefing(NPCEastVillageBriefing)

end

function NPCEastVillageBriefingFinished()
	DestroyEntity("P3_EastVillage_NPC")
end
