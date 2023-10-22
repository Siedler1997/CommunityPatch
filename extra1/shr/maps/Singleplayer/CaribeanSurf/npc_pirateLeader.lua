function CreateNPCPirateLeader()

	-- setup table for npc
	NPCPirateLeader				=	{}
	NPCPirateLeader.name 			=	"pirateLeaderNpc"
	NPCPirateLeader.callback		=	CreateNPCPirateLeaderBriefing
	        
	-- create npc
	CreateNPC(NPCPirateLeader)
	   	
end

function CreateNPCPirateLeaderBriefing()

	PirateLeaderBriefing = {}
	PirateLeaderBriefing.restoreCamera = true

	PirateLeaderBriefing.finished =	PirateLeaderBriefingFinished

	page = 0

	--	page #1

		page = page + 1

		PirateLeaderBriefing[page] 				= 	{}

		PirateLeaderBriefing[page].title		= 	String.Key("pirates2.title")
		PirateLeaderBriefing[page].text			=	String.Key("pirates2[1].text")
		
		PirateLeaderBriefing[page].position		=	GetPosition("pirateleader")
		PirateLeaderBriefing[page].dialogCamera	=	true

	--	page #2

		page = page + 1

		PirateLeaderBriefing[page] 				    	= 	{}
		PirateLeaderBriefing[page].mc                	=	{}
        PirateLeaderBriefing[page].mc.title				= 	String.Key("pirates2.mctitle")
		PirateLeaderBriefing[page].mc.text				=	String.Key("pirates2.mctext")
		PirateLeaderBriefing[page].mc.firstText			=	String.Key("pirates2.quest")
		PirateLeaderBriefing[page].mc.secondText		=	String.Key("pirates2.quest[2]")
		PirateLeaderBriefing[page].mc.firstSelectedCallback		=	PirateLeaderMCCallback
		PirateLeaderBriefing[page].mc.secondSelected	=	3

		PirateLeaderBriefingMCPage 						= PirateLeaderBriefing[page]

	--	page #3

		page = 3

		PirateLeaderBriefing[page] 				= 	{}
		PirateLeaderBriefing[page].title		= 	String.Key("pirates2.title")
		PirateLeaderBriefing[page].text			=	String.Key("pirates2.attack")

	--	page #5

		page = 5

		PirateLeaderBriefing[page] 				= 	{}
		PirateLeaderBriefing[page].title		= 	String.Key("pirates2.title")
		PirateLeaderBriefing[page].text			=	String.Key("pirates2[4].text")
			
		page = 6
			
		PirateLeaderBriefing[page] 				= 	{}
		PirateLeaderBriefing[page].title		= 	String.Key("pirates2.title")
		PirateLeaderBriefing[page].text			=	String.Key("pirates2.attack")
	
	
		page = 8
	
			
		PirateLeaderBriefing[page] 				= 	{}
		PirateLeaderBriefing[page].title		= 	String.Key("pirates2.title")
		PirateLeaderBriefing[page].text			=	String.Key("pirates2[2].text")
		
		page = page + 1  
		              	            	
		PirateLeaderBriefing[page] 				= 	{}
		PirateLeaderBriefing[page].title		= 	String.Key("pirates2.title")
		PirateLeaderBriefing[page].text			=	String.Key("pirates2[3].text")
		PirateLeaderBriefing[page].position 	= 	GetPosition("cave1")
		PirateLeaderBriefing[page].explore 		= 	1500
	
		PirateLeaderBriefingShowCave1			=	PirateLeaderBriefing[page]
	
	
	StartBriefing(PirateLeaderBriefing)

    end

function PirateLeaderMCCallback()

	if GetGold() < 500 then

		return 5

	else

		AddGold(-500)
		goldPaid=1

		return 8

	end

end


function PirateLeaderBriefingFinished()

    if GetSelectedBriefingMCButton(PirateLeaderBriefingMCPage) == 1 then
    	
		if goldPaid == 1 then
			TributePaid1()
		else
			TributePaid2()
		end

    else

		TributePaid2()

    end

end

-------------------pay

TributePaid1 = function()
	
	ChangePlayer("pirateLeaderNpc", 1)

	end2ndQuest()
	
	return true

end
------------------------------------or fight
TributePaid2 = function()

	local	 pos = GetPosition("pirates2")
		
	Pgroup = Tools.CreateGroup(2, Entities.CU_BanditLeaderSword1, 4, pos.X, pos.Y, 180)
	
	StartSimpleJob("TakePrissoner") 

	return true

end


function TakePrissoner()

	if IsDead(Pgroup) then
		
		createBriefingBandits2_prisonner()
		
		ChangePlayer("pirateLeaderNpc", 1)

		end2ndQuest()

		return true

	end

end