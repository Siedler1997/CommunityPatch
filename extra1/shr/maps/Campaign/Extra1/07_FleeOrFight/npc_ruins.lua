
function CreateNPCRuins()	

	-- setup table for npc
	NPCRuins				=	{}
	NPCRuins.name 			=	"P6_Ruins_NPC"
	NPCRuins.briefing		=	NPCRuinsBriefing
	        
	-- create npc
	CreateNPC(NPCRuins)
	
	local markerPos4 = GetPosition("FireSignalPos4")
	GUI.CreateMinimapMarker(markerPos4.X, markerPos4.Y, 1)
end

function CreateNPCRuinsBriefing()

	NPCRuinsBriefing					=	{}
	NPCRuinsBriefing.restoreCamera		=	true
	NPCRuinsBriefing.finished			=	NPCRuinsBriefingFinished

	local page = 0
	
	--	page 1
	
		page = page +1
	
		NPCRuinsBriefing[page] 							= 	{}
		NPCRuinsBriefing[page].mc						= 	{}
		NPCRuinsBriefing[page].mc.title					= 	String.Key("NPCRuinsBriefing[1].mc.title")
		NPCRuinsBriefing[page].mc.text					=	String.Key("NPCRuinsBriefing[1].mc.text")
		
		NPCRuinsBriefing[page].mc.firstText				=	String.Key("NPCRuinsBriefing[1].mc.firstText")
		NPCRuinsBriefing[page].mc.firstSelectedCallback	=	NPCRuinsFirstSelected
	
		NPCRuinsBriefing[page].mc.secondText			=	String.Key("NPCRuinsBriefing[1].mc.secondText")
		NPCRuinsBriefing[page].mc.secondSelected		=	2
		
		NPCRuinsBriefing[page].position 				=	GetPosition("P6_Ruins_NPC")
		NPCRuinsBriefing[page].dialogCamera				=	true

		NPCRuinsBriefingMC								=	NPCRuinsBriefing[page]
		

	--	page 2
	
		page = page +1
	
		NPCRuinsBriefing[page] 					= 	{}
		NPCRuinsBriefing[page].title			= 	String.Key("NPCRuinsBriefing[2].title")
		NPCRuinsBriefing[page].text				=	String.Key("NPCRuinsBriefing[2].text")
		
		NPCRuinsBriefing[page].position 		=	GetPosition("P6_Ruins_NPC")
		NPCRuinsBriefing[page].dialogCamera		=	true
				
	--	page 4
		
		page = page +2
	
		NPCRuinsBriefing[page] 					= 	{}
		NPCRuinsBriefing[page].title			= 	String.Key("NPCRuinsBriefing[2].title")
		NPCRuinsBriefing[page].text				=	String.Key("NPCRuinsBriefing[4].text")
		
		NPCRuinsBriefing[page].position 		=	GetPosition("FireSignalPos4")
		NPCRuinsBriefing[page].explore 			=	1000

	--	page 6
	
		page = page +2

		NPCRuinsBriefing[page] 					= 	{}
		NPCRuinsBriefing[page].title			= 	String.Key("NPCRuinsBriefing[2].title")
		NPCRuinsBriefing[page].text				=	String.Key("NPCRuinsBriefing[6].text")

		NPCRuinsBriefing[page].position 		=	GetPosition("P6_Ruins_NPC")
		
	--	go

	StartBriefing(NPCRuinsBriefing)

end

function NPCRuinsFirstSelected()

	-- Enough money
	if GetClay() >= 2000 then

		-- Paid
		AddClay(-2000)
		
		-- enlight fire
		ReplaceEntity("FireSignalPos4", Entities.XD_SingnalFireOn)

		PlayerPayedForSignal4 = true
		
		ResolveBriefing(NPCFireSignal3BriefingShowFirePos4)
		
		return 4
	
	else
	
		-- Not enough money
		return 6
	
	end		

end

function NPCRuinsBriefingFinished()
	if PlayerPayedForSignal4 ~= true then
		-- Reinit NPC
		CreateNPCRuins()
	else
		local markerPos4 = GetPosition("FireSignalPos4")
		GUI.DestroyMinimapPulse(markerPos4.X, markerPos4.Y)

		UpdateQuestSignalFires()
	end
end

function DestroyNPCRuins()
	if NPCRuins ~= nil and PlayerPayedForSignal4 ~= true then
		local markerPos4 = GetPosition("FireSignalPos4")
		GUI.DestroyMinimapPulse(markerPos4.X, markerPos4.Y)
	
		DestroyNPC(NPCRuins)
		
		if NPCFireSignal3BriefingShowFirePos4 ~= nil then
			ResolveBriefing(NPCFireSignal3BriefingShowFirePos4)
		end
	end
end