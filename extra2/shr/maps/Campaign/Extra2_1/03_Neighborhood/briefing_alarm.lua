---------------------------------------------------------------------------------------------
function createBriefingAlarm()

	lighthouse = {}
	lighthouse.position = GetPosition("lighthouseOff")
	DestroyEntity("lighthouseOff")
	CreateEntity(8,Entities.CB_LighthouseActivated,lighthouse.position,"lighthouseOn")

	briefingAlarm = {}
	briefingAlarm.restoreCamera = true
	briefingAlarm.finished = briefingAlarmFinished

	local page = 0
	
	--	page #1
	
		-- next page
		page = page +1
	
		-- create table
		briefingAlarm[page] 				= 	{}
		
		-- text
		briefingAlarm[page].title			= 	String.Key("briefingAlarm[1].title")
		briefingAlarm[page].text			=	String.Key("briefingAlarm[1].text")

		briefingAlarm[page].position		=	lighthouse.position
		
	--	page #2
	
		-- next page
		page = page +1
	
		-- create table
		briefingAlarm[page] 				= 	{}
		
		-- text
		briefingAlarm[page].text			=	string.format(XGUIEng.GetStringTableText("CM03_03_Neighborhood/briefingAlarm[2].text"), timeForSupport/60)

		briefingAlarm[page].position		=	GetPosition("supportNogersundStreet")
		briefingAlarm[page].explore			=	4000
		
	--	page #3
	
		-- next page
		page = page +1
	
		-- create table
		briefingAlarm[page] 				= 	{}
		
		-- text
		briefingAlarm[page].text			=	String.Key("briefingAlarm[3].text")

		briefingAlarm[page].position		=	GetPosition("supportSword")
		
	--	page #4
	
		-- next page
		page = page +1
	
		-- create table
		briefingAlarm[page] 				= 	{}
		
		-- text
		briefingAlarm[page].text			=	String.Key("briefingAlarm[4].text")

		briefingAlarm[page].position		=	GetPosition("supportCavalry")

	--	page #5
	
		-- next page
		page = page +1
	
		-- create table
		briefingAlarm[page] 				= 	{}
		
		-- text
		briefingAlarm[page].text			=	String.Key("briefingAlarm[5].text")

		briefingAlarm[page].position		=	GetPosition("supportCannon")

	--	page #6
	
		-- next page
		page = page +1
	
		-- create table
		briefingAlarm[page] 				= 	{}
		
		-- text
		briefingAlarm[page].text			=	String.Key("briefingAlarm[6].text")

		briefingAlarm[page].position		=	GetPosition("player1")
		
		briefingAlarm[page].quest			=	{}
		briefingAlarm[page].quest.id		=	3
		briefingAlarm[page].quest.type		=	MAINQUEST_OPEN
		briefingAlarm[page].quest.title		=	String.MainKey.."briefingAlarm[6].quest.title"
		briefingAlarm[page].quest.text		=	String.MainKey.."briefingAlarm[6].quest.text"
		
		briefingAlarmQuestPage	 			=	page
		
	--	page #7
	
		-- next page
		page = page +1
	
		-- create table
		briefingAlarm[page] 				= 	{}
		
		-- text
		briefingAlarm[page].text			=	String.Key("briefingAlarm[7].text")

		briefingAlarm[page].position		=	GetPosition("bottleneck")
		
	--	page #8
	
		-- next page
		page = page +1
	
		-- create table
		briefingAlarm[page] 				= 	{}
		
		-- text
		briefingAlarm[page].text			=	String.Key("briefingAlarm[8].text")

		briefingAlarm[page].position		=	lighthouse.position	
		
		--	go!
		
		StartBriefing(briefingAlarm)
end

function briefingAlarmFinished()
	endChapterOne()

end
