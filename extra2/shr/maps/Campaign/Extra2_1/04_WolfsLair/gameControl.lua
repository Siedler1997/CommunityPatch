TIMER_WINTER_END = 20 * 60

------------------------------------------------------------------------------------------------------------------------------------
function startChapterOne()

	Logic.SetShareExplorationWithPlayerFlag(1,3,1)
	Logic.SetShareExplorationWithPlayerFlag(1,4,1)
	
	-- create troops in village
	local leadertype = Entities.PU_LeaderSword3
	local experience = HIGH_EXPERIENCE
	if CP_Difficulty > 0 then
		leadertype = Entities.PU_LeaderSword2
		experience = experience - 1
	end

	local troopDescription	= {

		minNumberOfSoldiers	= 0,
		maxNumberOfSoldiers = 9,
		experiencePoints 	= experience,
		leaderType          = leadertype,
		position            = GetPosition("supportVillage")
	}
	
    local armyVillage		= {}
    
	troops1 = CreateTroop(armyVillage,troopDescription)
	
	-- create briefings
	StartCutscene(Cutscenes[INTROCUTSCENE],createBriefingPrelude)
	createBriefingShepherd()
	
	-- create AI armies
	
	createQuestWolves()
	
	StartSimpleJob("createDefeatCondition")
	
end

------------------------------------------------------------------------------------------------------------------------------------
function endChapterOne()
	
	startChapterTwo()

end

------------------------------------------------------------------------------------------------------------------------------------
function startChapterTwo()
	
	-- start winter and timer is set to end winter
	StartWinter(10000000)
	createBriefingWinter()
	createTimerWinterEnd()
	
	-- create briefings
	createBriefingMiner()	
	controlBriefingFarmer()
	
	-- create AI armies
	createBarbarianAttack()
	createArmyOutpost()
	
	-- create Quests
	createQuestVargWolves()
	MakeInvulnerable("player2")

end

------------------------------------------------------------------------------------------------------------------------------------
function endChapterTwo()

	if BRIEFING_LEONARDO == 1 then
		ResolveBriefing(briefingLeonardo[briefingLeonardoQuestPage])
	end

	startChapterThree()

end

------------------------------------------------------------------------------------------------------------------------------------
function startChapterThree()

	SetHostile(1,2)
	
	-- create AI armies
	createArmyVargWolves()
	
	-- create Quests
	createQuestVarg()

end

------------------------------------------------------------------------------------------------------------------------------------
function endChapterThree()

	ResolveBriefing(briefingVargWolves[briefingVargWolvesQuestPage])

	startChapterFour()

end

------------------------------------------------------------------------------------------------------------------------------------
function startChapterFour()

	SetHostile(1,2)
	
	-- create AI armies
	createArmyWolves()

	createQuestVictory()

end



------------------------------------------------------------------------------------------------------------------------------------
function createDefeatCondition()
	if IsDestroyed("player1") then
		Defeat()
	end
end

------------------------------------------------------------------------------------------------------------------------------------
function createTimerWinterEnd()
	StartSimpleJob("controlTimerWinterEnd")
end

------------------------------------------------------------------------------------------------------------------------------------
function controlTimerWinterEnd()

    if TIMER_WINTER_END > 0 then

        TIMER_WINTER_END = TIMER_WINTER_END -1

        return false

	end

	StartWinter(1)
	createBriefingWinterEnd()
	return true

end

---------------------------------------------------------------------------------------------
function controlBriefingFarmer()
	FarmerQuest					=	{}
--	FarmerQuest.Serfs			=	true
	FarmerQuest.Heroes			=	true
	FarmerQuest.Leaders			=	true
	FarmerQuest.TargetName		=	"farmer"
	FarmerQuest.Distance		=	3000
	FarmerQuest.Callback		=	createBriefingFarmer
	SetupExpedition(FarmerQuest)
end