ActivatedSignalFires = 0

function CreateQuestSignalFires()
	GUIQuestTools.StartQuestInformation("Fire", "CM02_07_FleeOrFight/QI_signalFire", 1, 1)	
	GUIQuestTools.UpdateQuestInformationString("0/4")
	
	CreateNPCHermit()
	CreateNPCJohannes()
	CreateNPCFireSignal3()
	CreateNPCRuins()
end

function UpdateQuestSignalFires()
	ActivatedSignalFires = ActivatedSignalFires + 1
	if ActivatedSignalFires < 4 then
		GUIQuestTools.UpdateQuestInformationString(ActivatedSignalFires .. "/4")
	else
		EndQuestSignalFires()
	end
end

function EndQuestSignalFires()
	AllFireSignalsBurning = true
	
	GUIQuestTools.DisableQuestInformation()
	
	ResolveBriefing(NPCEastVillageBriefingShowNPCs)

	StartCutscene(Cutscenes[THRESHOLDONECUTSCENE])
end