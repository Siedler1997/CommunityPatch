------------------------------------------------------------------------------------------------------------------
createBriefingPrelude = function()

	briefingPrelude = 	{}

		briefingPrelude.finished = BriefingPreludeFinished

	
		local page = 0

		page = page +1
	
		briefingPrelude[page] 				= 	{}
		briefingPrelude[page].title			= 	String.Key("Kerberos")
		briefingPrelude[page].position 			= 	GetPosition("kerberos")	
		briefingPrelude[page].text			=	String.Key("briefing.text[1]")
		briefingPrelude[page].dialogCamera 		= 	false

		StartBriefing(briefingPrelude)
		


	end 

BriefingPreludeFinished = function()

peasantRun()
createBriefingPrelude1()

end

----------------------------[running briefing peasants]--------------
peasantRun = function()

for i=1,8,1 do
Move("serf_"..i,"serf_stop",100)
end

end
---------------------------------------------------------------------

createBriefingPrelude1 = function()

		briefingPrelude = 	{}

		briefingPrelude.finished = BriefingPrelude1Finished

	
		local page = 0

		page = page +1

		local ID = GetID("kerberos")
		Logic.RotateEntity(ID,-90) 

		briefingPrelude[page] 				= 	{}
		briefingPrelude[page].title			= 	String.Key("kerberos")
		briefingPrelude[page].position 			= 	GetPosition("kerberos")	
		briefingPrelude[page].text			=	String.Key("briefing.text[2]")
		briefingPrelude[page].dialogCamera 		= 	true

	
		briefingPrelude[page].quest			=	{}
		briefingPrelude[page].quest.id			=	1
		briefingPrelude[page].quest.type		=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title		=	String.Key("quest1.title")
		briefingPrelude[page].quest.text		=	String.Key("quest1.text")


		briefing_Q1=briefingPrelude[page]

		StartBriefing(briefingPrelude)

end

BriefingPrelude1Finished = function()
	local time = 30
	if CP_Difficulty == 1 then
		time = time - 5
	end
	StartCountdown(time * 60, ThiefTimer, true)
--StartSimpleJob("ThiefTimer")
--GUIQuestTools.ToggleStopWatch(TIMER,1)

end

function createGeneralBriefing(_position,_string)

	briefingGeneral				= 	{}
--	briefingGeneral.finished =	GeneralBriefingFinished
	briefingGeneral.restoreCamera 		= 	true

	local page = 0

	page = page +1

	briefingGeneral[page] 			= 	{}
--	briefingGeneral[page].title		= 	String.GenericKey("Mentor")
	briefingGeneral[page].text		=	String.Key(_string)
	briefingGeneral[page].position 		= 	GetPosition(_position)
	briefingGeneral[page].explore		=	1500
	StartBriefing(briefingGeneral)

	end