------------------------------------------------------------------------------------------------------------------------------------
function createQuestReachLighthouse()
	reachLighthouseQuest				=	{}
	reachLighthouseQuest.Serfs			=	true
	reachLighthouseQuest.Heroes			=	true
	reachLighthouseQuest.Leaders		=	true
	reachLighthouseQuest.TargetName		=	"lighthouseOff"
	reachLighthouseQuest.Distance		=	6000
	reachLighthouseQuest.Callback		=	controlLighthouseReached
	SetupExpedition(reachLighthouseQuest)
end

function controlLighthouseReached()
    if CP_Difficulty == 2 then
		StopCountdown(lighthouseCountdown)
	end
	createArmyLighthouse()
	createBriefingLighthouse()
	return true
end

function cancelLighthouseReached()
	DestroyQuest(reachLighthouseQuest)
	controlLighthouseReached()
end