-----------  Dario's meeting with the smugglers - take 1


createNpcSmugglerIntro = function ()

	local npc	= {}
	npc.name = "outlaw"
	npc.callback  = checkTime


	CreateNPC(npc)



end

checkTime = function ()
if mines1free == 1 and first == 0 then  createBriefingOutlawFirstTime()

	elseif mines1free == 1 and first == 1  then createBriefingOutlawAccepted()
		elseif  mines1free == 0 and first == 1  then createBriefingOutlawStillNot()
			elseif  mines1free == 0 and first == 0  then createBriefingOutlawNotYet()
	
end

end

createBriefingOutlawFirstTime = function()

		briefingOutlawFirstTime 				= 	{}	
		briefingOutlawFirstTime.finished 			= 	BriefingOutlawFirstTimeFinished


		local page = 0

	--	page
	
		page = page +1
	
		briefingOutlawFirstTime[page] 				= 	{}
		briefingOutlawFirstTime[page].title			= 	String.Key("briefingOutlawFirstTime[1].title") 
		briefingOutlawFirstTime[page].text			=	String.Key("briefingOutlawFirstTime[1].text")
		briefingOutlawFirstTime[page].position			=	GetPosition("Dario")
		--briefingOutlawFirstTime[page].explore			=	2000

	--	page
	
		page = page +1
	
		briefingOutlawFirstTime[page] 				= 	{}
		briefingOutlawFirstTime[page].title			= 	String.Key("briefingOutlawFirstTime[2].title") 
		briefingOutlawFirstTime[page].text			=	String.Key("briefingOutlawFirstTime[2].text")
		briefingOutlawFirstTime[page].position			=	GetPosition("Dario")
		--briefingOutlawFirstTime[page].explore			=	2000


	--	page
	
		page = page +1
	
		briefingOutlawFirstTime[page] 				= 	{}
		briefingOutlawFirstTime[page].title			= 	String.Key("briefingOutlawFirstTime[3].title") 
		briefingOutlawFirstTime[page].text			=	String.Key("briefingOutlawFirstTime[3].text")
		briefingOutlawFirstTime[page].position			=	GetPosition("declaration1")
		briefingOutlawFirstTime[page].explore			=	2000

	--	page
	
		page = page +1
	
		briefingOutlawFirstTime[page] 				= 	{}
		briefingOutlawFirstTime[page].title			= 	String.Key("briefingOutlawFirstTime[3].title") 
		briefingOutlawFirstTime[page].text			=	String.Key("briefingOutlawFirstTime[3].text")
		briefingOutlawFirstTime[page].position			=	GetPosition("declaration2")
		briefingOutlawFirstTime[page].explore			=	2000



	--	page
	
		page = page +1
	
		briefingOutlawFirstTime[page] 				= 	{}
		briefingOutlawFirstTime[page].title			= 	String.Key("briefingOutlawFirstTime[4].title") 
		briefingOutlawFirstTime[page].text			=	String.Key("briefingOutlawFirstTime[4].text")
		briefingOutlawFirstTime[page].position			=	GetPosition("Dario")
		--briefingOutlawFirstTime[page].explore			=	2000


	--	page
	
		page = page +1
	
		briefingOutlawFirstTime[page] 				= 	{}
		briefingOutlawFirstTime[page].title			= 	String.Key("briefingOutlawFirstTime[5].title") 
		briefingOutlawFirstTime[page].text			=	String.Key("briefingOutlawFirstTime[5].text")
		briefingOutlawFirstTime[page].position			=	GetPosition("bruda")
		--briefingOutlawFirstTime[page].explore			=	2000

	
		briefingOutlawFirstTime[page].quest				=	{}
		briefingOutlawFirstTime[page].quest.id				=	2
		briefingOutlawFirstTime[page].quest.type			=	MAINQUEST_OPEN
		briefingOutlawFirstTime[page].quest.title			=	String.Key("briefingOutlawFirstTime.quest.title")
		briefingOutlawFirstTime[page].quest.text			=	String.Key("briefingOutlawFirstTime.quest.text") 


                briefingTerminatOutlawFirstTime = briefingOutlawFirstTime[page]
	
		StartBriefing(briefingOutlawFirstTime)

end


BriefingOutlawFirstTimeFinished = function()
local x,y = Tools.GetPosition("thieftransport1")
	GUI.DestroyMinimapPulse(x,y)

local x,y = Tools.GetPosition("thieftransport1")
	GUI.CreateMinimapMarker(x,y)

questDestroyTowers()
end


createBriefingOutlawNotYet = function()

briefingOutlawNotYet 				= 	{}	
		briefingOutlawNotYet.finished 			= 	BriefingOutlawNotYetFinished


		local page = 0

	--	page
	
		page = page +1
	
		briefingOutlawNotYet[page] 				= 	{}
		briefingOutlawNotYet[page].title			= 	String.Key("briefingOutlawNotYet[1].title") 
		briefingOutlawNotYet[page].text				=	String.Key("briefingOutlawNotYet[1].text")
		briefingOutlawNotYet[page].position			=	GetPosition("Dario")
		--briefingOutlawNotYet[page].explore			=	2000

	--	page
	
		page = page +1
	
		briefingOutlawNotYet[page] 				= 	{}
		briefingOutlawNotYet[page].title			= 	String.Key("briefingOutlawNotYet[2].title") 
		briefingOutlawNotYet[page].text				=	String.Key("briefingOutlawNotYet[2].text")
		briefingOutlawNotYet[page].position			=	GetPosition("outlaw")
		--briefingOutlawNotYet[page].explore			=	2000


	--	page
	
		page = page +1
	
		briefingOutlawNotYet[page] 				= 	{}
		briefingOutlawNotYet[page].title			= 	String.Key("briefingOutlawNotYet[3].title") 
		briefingOutlawNotYet[page].text				=	String.Key("briefingOutlawNotYet[3].text")
		briefingOutlawNotYet[page].position			=	GetPosition("Dario")
		--briefingOutlawNotYet[page].explore			=	2000

	
		

                briefingTerminatOutlawNotYet = briefingOutlawNotYet[page]
	
		StartBriefing(briefingOutlawNotYet)


end

BriefingOutlawNotYetFinished = function()

first = 1
createNpcSmugglerIntro()
end




createBriefingOutlawStillNot = function()

briefingOutlawStillNot 				= 	{}	
		briefingOutlawStillNot.finished 			= 	BriefingOutlawStillNotFinished


		local page = 0

	--	page
	
		page = page +1
	
		briefingOutlawStillNot[page] 				= 	{}
		briefingOutlawStillNot[page].title			= 	String.Key("briefingOutlawStillNot[1].title") 
		briefingOutlawStillNot[page].text				=	String.Key("briefingOutlawStillNot[1].text")
		briefingOutlawStillNot[page].position			=	GetPosition("Dario")
		--briefingOutlawStillNot[page].explore			=	2000

	--	page
	
		page = page +1
	
		briefingOutlawStillNot[page] 				= 	{}
		briefingOutlawStillNot[page].title			= 	String.Key("briefingOutlawStillNot[2].title") 
		briefingOutlawStillNot[page].text			=	String.Key("briefingOutlawStillNot[2].text")
		briefingOutlawStillNot[page].position			=	GetPosition("outlaw")
		--briefingOutlawStillNot[page].explore			=	2000





	--	page
	
		page = page +1
	
		briefingOutlawStillNot[page] 				= 	{}
		briefingOutlawStillNot[page].title			= 	String.Key("briefingOutlawStillNot[3].title") 
		briefingOutlawStillNot[page].text				=	String.Key("briefingOutlawStillNot[3].text")
		briefingOutlawStillNot[page].position			=	GetPosition("Dario")
		--briefingOutlawStillNot[page].explore			=	2000

	
		

                briefingTerminatOutlawStillNot = briefingOutlawStillNot[page]
	
		StartBriefing(briefingOutlawStillNot)


end

BriefingOutlawStillNotFinished = function()

createNpcSmugglerIntro()
end


createBriefingOutlawAccepted = function()

briefingOutlawAccepted 				= 	{}	
		briefingOutlawAccepted.finished 			= 	BriefingOutlawAcceptedFinished


		local page = 0

	--	page
	
		page = page +1
	
		briefingOutlawAccepted[page] 				= 	{}
		briefingOutlawAccepted[page].title			= 	String.Key("briefingOutlawAccepted[1].title") 
		briefingOutlawAccepted[page].text			=	String.Key("briefingOutlawAccepted[1].text")
		briefingOutlawAccepted[page].position			=	GetPosition("Dario")
		--briefingOutlawAccepted[page].explore			=	2000

	--	page
	
		page = page +1
	
		briefingOutlawAccepted[page] 				= 	{}
		briefingOutlawAccepted[page].title			= 	String.Key("briefingOutlawAccepted[2].title") 
		briefingOutlawAccepted[page].text				=	String.Key("briefingOutlawAccepted[2].text")
		briefingOutlawAccepted[page].position			=	GetPosition("outlaw")
		--briefingOutlawAccepted[page].explore			=	2000


	--	page
	
		page = page +1
	
		briefingOutlawAccepted[page] 				= 	{}
		briefingOutlawAccepted[page].title			= 	String.Key("briefingOutlawAccepted[3].title") 
		briefingOutlawAccepted[page].text			=	String.Key("briefingOutlawAccepted[3].text")
		briefingOutlawAccepted[page].position			=	GetPosition("declaration2")
		briefingOutlawAccepted[page].explore			=	2000


	--	page
	
		page = page +1
	
		briefingOutlawAccepted[page] 				= 	{}
		briefingOutlawAccepted[page].title			= 	String.Key("briefingOutlawAccepted[3].title") 
		briefingOutlawAccepted[page].text			=	String.Key("briefingOutlawAccepted[3].text")
		briefingOutlawAccepted[page].position			=	GetPosition("declaration1")
		briefingOutlawAccepted[page].explore			=	2000






	--	page
	
		page = page +1
	
		briefingOutlawAccepted[page] 				= 	{}
		briefingOutlawAccepted[page].title			= 	String.Key("briefingOutlawAccepted[4].title") 
		briefingOutlawAccepted[page].text			=	String.Key("briefingOutlawAccepted[4].text")
		briefingOutlawAccepted[page].position			=	GetPosition("Dario")
		--briefingOutlawAccepted[page].explore			=	2000


	--	page
	
		page = page +1
	
		briefingOutlawAccepted[page] 				= 	{}
		briefingOutlawAccepted[page].title			= 	String.Key("briefingOutlawAccepted[5].title") 
		briefingOutlawAccepted[page].text			=	String.Key("briefingOutlawAccepted[5].text")
		briefingOutlawAccepted[page].position			=	GetPosition("bruda")
		--briefingOutlawAccepted[page].explore			=	2000
	
	
		briefingOutlawAccepted[page].quest				=	{}
		briefingOutlawAccepted[page].quest.id				=	2
		briefingOutlawAccepted[page].quest.type				=	MAINQUEST_OPEN
		briefingOutlawAccepted[page].quest.title			=	String.Key("briefingOutlawFirstTime.quest.title")
		briefingOutlawAccepted[page].quest.text				=	String.Key("briefingOutlawFirstTime.quest.text") 
	
	



                briefingTerminatOutlawFirstTime = briefingOutlawAccepted[page]
	
		StartBriefing(briefingOutlawAccepted)



end

BriefingOutlawAcceptedFinished = function()
local x,y = Tools.GetPosition("thieftransport1")
	GUI.DestroyMinimapPulse(x,y)

local x,y = Tools.GetPosition("thieftransport1")
	GUI.CreateMinimapMarker(x,y)

questDestroyTowers()
end



createBriefingTemplarsTurncoat = function()

briefingTemplarsTurncoat 				= 	{}	
		briefingTemplarsTurncoat.finished 			= 	BriefingTemplarsTurncoatFinished


		local page = 0

	--	page
	
		page = page +1
	
		briefingTemplarsTurncoat[page] 				= 	{}
		briefingTemplarsTurncoat[page].title			= 	String.Key("briefingTemplarsTurncoat[1].title") 
		briefingTemplarsTurncoat[page].text			=	String.Key("briefingTemplarsTurncoat[1].text")
		briefingTemplarsTurncoat[page].position			=	GetPosition("tlidah")
		--briefingTemplarsTurncoat[page].explore		=	2000

	--	page
	
		page = page +1
	
		briefingTemplarsTurncoat[page] 				= 	{}
		briefingTemplarsTurncoat[page].title			= 	String.Key("briefingTemplarsTurncoat[2].title") 
		briefingTemplarsTurncoat[page].text			=	String.Key("briefingTemplarsTurncoat[2].text")
		briefingTemplarsTurncoat[page].position			=	GetPosition("tlidah")
		--briefingTemplarsTurncoat[page].explore		=	2000

                briefingTerminatTemplarsTurncoat = briefingTemplarsTurncoat[page]
	
		StartBriefing(briefingTemplarsTurncoat)





end

BriefingTemplarsTurncoatFinished = function ()
	AI.Entity_ConnectLeader(GetEntityId("tlidah"), armyTemplar1.id)
	armyTemplar1.control.job = 2
end