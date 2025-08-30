

createBriefingEscapingBishop = function()

	Logic.SetShareExplorationWithPlayerFlag(1, 7, 1)


	briefingEscapingBishop = 	{}	

	briefingEscapingBishop.finished = BriefingEscapingBishopFinished

		local page = 0

	--	page1
	
		page = page +1
		pageExploreMap = page

		briefingEscapingBishop[page] 					= 	{}
		briefingEscapingBishop[page].title				= 	String.GenericKey("Bishop")
		briefingEscapingBishop[page].text				=	String.Key("briefingEscapingBishop[1].text")
		briefingEscapingBishop[page].position			=	GetPosition("bishop")
		briefingEscapingBishop[page].explore			=	1500
		briefingEscapingBishop[page].dialogCamera 		= 	true

		briefingEscapingBishop[page].npc				=	{}
		briefingEscapingBishop[page].npc.id				=	GetEntityId("bishop")
		briefingEscapingBishop[page].npc.isObserved		=	true

	--	page2
	
		page = page +1

		briefingEscapingBishop[page] 					= 	{}
		briefingEscapingBishop[page].title				= 	String.GenericKey("Regent")
		briefingEscapingBishop[page].text				=	String.Key("briefingEscapingBishop[2].text")
		briefingEscapingBishop[page].position			=	GetPosition("ArrestBishop")
--		briefingEscapingBishop[page].npc				=	{}
--		briefingEscapingBishop[page].npc.id				=	GetEntityId("regent")
--		briefingEscapingBishop[page].npc.isObserved		=	true
		briefingEscapingBishop[page].dialogCamera 		= 	true


	--	page3
	
		page = page +1

		briefingEscapingBishop[page] 					= 	{}
		briefingEscapingBishop[page].title				= 	String.Key("briefingEscapingBishop[3].title")
		briefingEscapingBishop[page].text				=	String.Key("briefingEscapingBishop[3].text")
		briefingEscapingBishop[page].position			=	GetPosition("Guardian3")
		briefingEscapingBishop[page].npc				=	{}
		briefingEscapingBishop[page].npc.id				=	GetEntityId("Guardian3")
		briefingEscapingBishop[page].npc.isObserved		=	true
		briefingEscapingBishop[page].dialogCamera 		= 	true

	--	page4
	
		page = page +1

		briefingEscapingBishop[page] 					= 	{}
		briefingEscapingBishop[page].title				= 	String.GenericKey("Bishop")
		briefingEscapingBishop[page].text				=	String.Key("briefingEscapingBishop[4].text")
		briefingEscapingBishop[page].position			=	GetPosition("bishop")
		briefingEscapingBishop[page].npc				=	{}
		briefingEscapingBishop[page].npc.id				=	GetEntityId("bishop")
		briefingEscapingBishop[page].npc.isObserved		=	true
		briefingEscapingBishop[page].dialogCamera 		= 	true


	--	go!
	
		StartBriefing(briefingEscapingBishop)

	end
	
	
BriefingEscapingBishopFinished = function()
	MapLocal_CameraPositionRestore()
end





-- 2nd part of briefing

createBriefingEscapingBishop2 = function()

	-- set them new in front of Dovbar
		local x, y 		= Logic.GetEntityPosition(Logic.GetEntityIDByName("ArrestBishop"))
		ArrestedBishop 	= Logic.CreateEntity(Entities.CU_BishopOfCrawford, x, y, 0, 7)
	
		local x, y		= Logic.GetEntityPosition(Logic.GetEntityIDByName("ArrestGuard1"))
		guard1 			= Logic.CreateEntity(Entities.PU_LeaderPoleArm3, x, y, 0, 7)
	
		local x, y		= Logic.GetEntityPosition(Logic.GetEntityIDByName("ArrestGuard2"))
		guard2 			= Logic.CreateEntity(Entities.PU_LeaderPoleArm3, x, y, 0, 7)
	
	-- open gate
		ReplaceEntity("stone", Entities.XD_WallStraightGate)

	briefingEscapingBishop2 = 	{}	

	briefingEscapingBishop2.finished = BriefingEscapingBishopEND

		local page = 0

	--	page5
	
		page = page +1
		PageDovbarGotHim = page
		
		briefingEscapingBishop2[page] 					= 	{}
		briefingEscapingBishop2[page].title				= 	String.GenericKey("Regent")
		briefingEscapingBishop2[page].text				=	String.Key("briefingEscapingBishop[5].text")
		briefingEscapingBishop2[page].position			=	GetPosition("regent")
		briefingEscapingBishop2[page].npc				=	{}
		briefingEscapingBishop2[page].npc.id			=	GetEntityId("regent")
		briefingEscapingBishop2[page].npc.isObserved	=	true

	--	page6
	
		page = page +1
		
		briefingEscapingBishop2[page] 					= 	{}
		briefingEscapingBishop2[page].title				= 	String.GenericKey("Regent")
		briefingEscapingBishop2[page].text				=	String.Key("briefingEscapingBishop[6].text")
		briefingEscapingBishop2[page].position			=	GetPosition("regent")

	--	page7
	
		page = page +1
		
		briefingEscapingBishop2[page] 					= 	{}
		briefingEscapingBishop2[page].title				= 	String.GenericKey("Regent")
		briefingEscapingBishop2[page].text				=	String.Key("briefingEscapingBishop[7].text")
		briefingEscapingBishop2[page].position			=	GetPosition("Dario")


	--	page8
	
		page = page +1

		briefingEscapingBishop2[page] 					= 	{}
		briefingEscapingBishop2[page].title				= 	String.GenericKey("Mentor")
		briefingEscapingBishop2[page].text				=	String.Key("briefingEscapingBishop[8].text")
--		briefingEscapingBishop2[page].explore			=	1500
		briefingEscapingBishop2[page].position			=	stonePosition

	--	go!
	
		StartBriefing(briefingEscapingBishop2)


end



BriefingEscapingBishopEND = function()

	-- remove Bishop and guard
		DestroyEntity("bishop")
		DestroyEntity("Guardian3")
		DestroyEntity("Guardian4")
	

		DestroyEntity(ArrestedBishop)
		DestroyEntity(guard1)
		DestroyEntity(guard2)

		MapLocal_CameraPositionRestore()

		ResolveBriefing(briefingEscapingBishop2[PageDovbarGotHim])
		ResolveBriefing(briefingEscapingBishop[pageExploreMap])
	
		Logic.SetShareExplorationWithPlayerFlag(1, 7, 0)
	

end