------------------------------------------------------------------------------------------------------------------------------------
function startChapterOne()

	Logic.SetShareExplorationWithPlayerFlag(1,4,1)
	Logic.SetShareExplorationWithPlayerFlag(1,5,1)
	Logic.SetShareExplorationWithPlayerFlag(1,6,1)
	Logic.SetShareExplorationWithPlayerFlag(1,7,1)
	Logic.SetShareExplorationWithPlayerFlag(1,8,1)
	
	-- create troops in village
	local troopDescription	= {

		minNumberOfSoldiers	= 0,
		maxNumberOfSoldiers = 9,
		experiencePoints 	= LOW_EXPERIENCE,
		leaderType          = Entities.PU_LeaderSword1,
		position            = GetPosition("supportVillage")
	}
	
    local armyVillage		= {}
    armyVillage.player		= 7
    
	troops1 = CreateTroop(armyVillage,troopDescription)
	
	-- create briefings
	StartCutscene(Cutscenes[INTROCUTSCENE],createBriefingPrelude)
	createBriefingCoward()

	--Trigger reachLighthouseQuest action directly if player tries to reach the enemy tower at that point
    if CP_Difficulty == 2 then
        lighthouseCountdown = StartCountdown(5 * 60, cancelLighthouseReached, false)
    end
end

------------------------------------------------------------------------------------------------------------------------------------
function endChapterOne()

    ResolveBriefing(briefingPrelude[briefingPreludeQuestPage])
    ResolveBriefing(briefingLighthouse[briefingLighthouseQuestPage])

	StartSimpleJob("createDefeatCondition")

    startChapterTwo()

end

------------------------------------------------------------------------------------------------------------------------------------
function startChapterTwo()
	
	createQuestSurvive()
	
	-- create briefings
	
	-- create AI armies
	createArmyWolves()
	createBarbarianAttack()
	createArmyOutpost()

end

------------------------------------------------------------------------------------------------------------------------------------
function endChapterTwo()

    startChapterThree()

end

------------------------------------------------------------------------------------------------------------------------------------
function startChapterThree()
	
	createQuestReconquerVillage()
	
	-- create briefings
	
	-- create AI armies

end




------------------------------------------------------------------------------------------------------------------------------------
function createDefeatCondition()
	if IsDestroyed("player1") then
		Defeat()
	end
end