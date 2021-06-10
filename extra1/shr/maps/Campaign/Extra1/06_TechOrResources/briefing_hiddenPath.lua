---------------------------------------------------------------------------------------------
function createHiddenPathBriefing()

	briefingHiddenPath = {}

    briefingHiddenPath.finished = hiddenPathBriefingFinished
    briefingHiddenPath.restoreCamera = true

	local page = 0

	--	page #1

		page = page + 1

		briefingHiddenPath[page] 				= 	{}
		briefingHiddenPath[page].title			= 	String.Key("briefingHiddenPath[1].title")
		briefingHiddenPath[page].text			=	String.Key("briefingHiddenPath[1].text")
		briefingHiddenPath[page].position 		= 	GetPosition("npcFarmer")
		briefingHiddenPath[page].dialogCamera	=	true

	--	page #1

		page = page + 1

		briefingHiddenPath[page] 				= 	{}
		briefingHiddenPath[page].title			= 	String.Key("briefingHiddenPath[1].title")
		briefingHiddenPath[page].text			=	String.Key("briefingHiddenPath[2].text")
		briefingHiddenPath[page].position 		= 	GetPosition("gate1")
		briefingHiddenPath[page].explore        = 	2000


	--	go!

		StartBriefing(briefingHiddenPath)

	end
---------------------------------------------------------------------------------------------
function hiddenPathBriefingFinished()
	StartSimpleJob("farmerInFrontOfPath")
end
	
function farmerInFrontOfPath()
	if Counter.Tick2("farmerInFrontOfPath", 5) then
		if IsExisting("gate1") then
			if not IsNear("npcFarmer", "gate1_pos", 500) then
				Move("npcFarmer", "gate1_pos")
			else
				CreateEffect(1, GGL_Effects.FXBuildingSmoke, "gate1");
				DestroyEntity("gate1") 
			end
		else
			if not IsNear("npcFarmer", "npcFarmer_pos", 500) then
				Move("npcFarmer", "npcFarmer_pos")
			else
				return true
			end
		end
	end
end