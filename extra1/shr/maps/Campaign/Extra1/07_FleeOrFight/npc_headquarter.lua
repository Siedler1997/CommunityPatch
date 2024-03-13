function CreateNPCHeadquarters()

	-- setup table for npc
	NPCHermit				=	{}
	NPCHermit.name 			=	"P4_Headquarter_NPC"
	NPCHermit.callback		=	CreateNPCHeadquartersBriefing
	        
	-- create npc
	CreateNPC(NPCHermit)
	   	
end

function CreateNPCHeadquartersBriefing()

	end1stChapter()
	
	NPCHeadquartersBriefing					=	{}
	NPCHeadquartersBriefing.restoreCamera	=	true
	
	-- All serfs rescued
	if AllSerfsRescued() then

		NPCHeadquartersBriefing.finished		=	NPCHeadquartersBriefingFinishedDone

		local page = 0

		--	page 1
		
			page = page +1
		
			NPCHeadquartersBriefing[page] 				= 	{}
			NPCHeadquartersBriefing[page].title			= 	String.Key("NPCHeadquartersBriefing[1].title")
			NPCHeadquartersBriefing[page].text			=	String.Key("NPCHeadquartersBriefing[1].text")
			
			NPCHeadquartersBriefing[page].position 		=	GetPosition("P4_Headquarter_NPC")
			NPCHeadquartersBriefing[page].dialogCamera	=	true
	
		--	page 2
		
			page = page +1
		
			NPCHeadquartersBriefing[page] 				= 	{}
			NPCHeadquartersBriefing[page].title			= 	String.Key("NPCHeadquartersBriefing[1].title")
			NPCHeadquartersBriefing[page].text			=	String.Key("NPCHeadquartersBriefing[2b].text")
			
			NPCHeadquartersBriefing[page].position 		=	GetPosition("P2_Army_FirstWave_AttackPoint6")

		--	page 3

			page = page +1
		
			NPCHeadquartersBriefing[page] 				= 	{}
			NPCHeadquartersBriefing[page].title			= 	String.Key("NPCHeadquartersBriefing[1].title")
			NPCHeadquartersBriefing[page].text			=	String.Key("NPCHeadquartersBriefing[2].text")
			
			NPCHeadquartersBriefing[page].position 		=	GetPosition("P1_Headquarter")
			NPCHeadquartersBriefing[page].marker		=	STATIC_MARKER
		
			NPCHeadquartersBriefingP1Headquarter		=	NPCHeadquartersBriefing[page]
		
		--	page 4
		
			page = page +1
		
			NPCHeadquartersBriefing[page] 				= 	{}
			NPCHeadquartersBriefing[page].title			= 	String.Key("NPCHeadquartersBriefing[1].title")
			NPCHeadquartersBriefing[page].text			=	String.Key("NPCHeadquartersBriefing[3].text")
			
			NPCHeadquartersBriefing[page].position 		=	GetPosition("P3_EastVillage_HQ")
			NPCHeadquartersBriefing[page].explore		=	2000
			NPCHeadquartersBriefing[page].marker	 	=	STATIC_MARKER
		
			NPCHeadquartersBriefingEastVillageHQ		=	NPCHeadquartersBriefing[page]
		
		-- page 5
		
			page = page +1
		
			NPCHeadquartersBriefing[page] 				= 	{}
			NPCHeadquartersBriefing[page].title			= 	String.Key("NPCHeadquartersBriefing[1].title")
			NPCHeadquartersBriefing[page].text			=	String.Key("NPCHeadquartersBriefing[4].text")
			
			NPCHeadquartersBriefing[page].position 		=	GetPosition("ShowBridge")
			NPCHeadquartersBriefing[page].explore		=	2000		
		
			NPCHeadquartersBriefingShowBridge			=	NPCHeadquartersBriefing[page]

		--	page 6
		
			page = page +1
		
			NPCHeadquartersBriefing[page] 				= 	{}
			NPCHeadquartersBriefing[page].title			= 	String.Key("NPCHeadquartersBriefing[1].title")
			NPCHeadquartersBriefing[page].text			=	String.Key("NPCHeadquartersBriefing[5].text")
			
			NPCHeadquartersBriefing[page].position 		=	GetPosition("P3_EastVillage_NPC")
			NPCHeadquartersBriefing[page].marker	 	=	ANIMATED_MARKER

			NPCHeadquartersBriefing[page].quest			=	{}
			NPCHeadquartersBriefing[page].quest.id		=	3
			NPCHeadquartersBriefing[page].quest.type	=	MAINQUEST_OPEN
			NPCHeadquartersBriefing[page].quest.title	=	String.MainKey.."NPCHeadquartersBriefing[5].quest.title"
			NPCHeadquartersBriefing[page].quest.text	=	String.MainKey.."NPCHeadquartersBriefing[5].quest.text"

			NPCHeadquartersBriefingShowNPC				=	NPCHeadquartersBriefing[page]
			
		--	page 7
			
			page = page +1
		
			NPCHeadquartersBriefing[page] 				= 	{}
			NPCHeadquartersBriefing[page].title			= 	String.Key("NPCHeadquartersBriefing[1].title")
			NPCHeadquartersBriefing[page].text			=	String.Key("NPCHeadquartersBriefing[6].text")
			
			NPCHeadquartersBriefing[page].position 		=	GetPosition("P4_Headquarter_NPC")
			NPCHeadquartersBriefing[page].dialogCamera	=	true

		--	page 8
			
			page = page +1
		
			NPCHeadquartersBriefing[page] 				= 	{}
			NPCHeadquartersBriefing[page].title			= 	String.GenericKey("MissionObjectives")
			NPCHeadquartersBriefing[page].text			=	String.Key("NPCHeadquartersBriefing[7].text")
			
			NPCHeadquartersBriefing[page].position 		=	GetPosition("P4_Headquarter_NPC")

			NPCHeadquartersBriefing[page].quest			=	{}
			NPCHeadquartersBriefing[page].quest.id		=	2
			NPCHeadquartersBriefing[page].quest.type	=	MAINQUEST_OPEN
			NPCHeadquartersBriefing[page].quest.title	=	String.MainKey.."NPCHeadquartersBriefing[7].quest.title"
			NPCHeadquartersBriefing[page].quest.text	=	String.MainKey.."NPCHeadquartersBriefing[7].quest.text"
			
	else
	
		NPCHeadquartersBriefing.finished		=	NPCHeadquartersBriefingFinished

		local page = 0

		--	page 1b
		
			page = page +1
		
			NPCHeadquartersBriefing[page] 				= 	{}
			NPCHeadquartersBriefing[page].title			= 	String.Key("NPCHeadquartersBriefing[1].title")
			NPCHeadquartersBriefing[page].text			=	String.Key("NPCHeadquartersBriefing[1b].text")
			
			NPCHeadquartersBriefing[page].position 		=	GetPosition("P4_Headquarter_NPC")
			NPCHeadquartersBriefing[page].dialogCamera	=	true
	
	end					
		
	-- go

	StartBriefing(NPCHeadquartersBriefing)

end

function NPCHeadquartersBriefingFinished()

	CreateNPCHeadquarters()

end

function NPCHeadquartersBriefingFinishedDone()

	Logic.SetShareExplorationWithPlayerFlag(1,3,1)
	
	-- remove from diplomacy window
	SetPlayerName(4)
	
    Logic.SetPlayerPaysLeaderFlag(1,1)
	GlobalMissionScripting.GiveResouces(1, 500, 500, 1000, 1000, 500, 0)

	ReplaceEntity("P4_Headquarter_NPC", Entities.PU_LeaderSword2)
	Logic.ChangeAllEntitiesPlayerID(4, 1)
end