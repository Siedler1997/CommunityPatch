------------------------------------------------------------------------------------------------------------------------------------
function startChapterOne()

	Logic.SetShareExplorationWithPlayerFlag(1,3,1)

    -- create briefings
	StartCutscene(Cutscenes[INTROCUTSCENE],createBriefingPrelude)
	createBriefingShepherd()
	
	if CP_Difficulty == 0 then
		-- create troops for village defense
		local troopDescription	= {
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 9,
			experiencePoints 	= VERYLOW_EXPERIENCE,
			leaderType          = Entities.PU_LeaderPoleArm1,
			position            = GetPosition("villageSupport")
		}
	
		local armySupport		= {}
		armySupport.player		= 4

		support1 = CreateTroop(armySupport,troopDescription)
		support2 = CreateTroop(armySupport,troopDescription)
	end
    
    -- create AI armies
	createArmyWolves()
    createArmyOutpost()
    
    createSoundWolves()
    
    createQuestHeroesAlive()
    
end

------------------------------------------------------------------------------------------------------------------------------------
function endChapterOne()

    ResolveBriefing(briefingPrelude[briefingPreludeQuestPage])

    startChapterTwo()

end

------------------------------------------------------------------------------------------------------------------------------------
function startChapterTwo()
	
	CreateNPCGovernor()
	
	CreateQuestRescueSheep()
	
    -- create briefings
	createBriefingScout()
	
end

------------------------------------------------------------------------------------------------------------------------------------
function endChapterTwo()

    ResolveBriefing(briefingShepherd[briefingShepherdQuestPage])

	-- Give player 4 to player 1
	Logic.ChangeAllEntitiesPlayerID(4, 1)
	
	EndJob(HeroesAliveJobId)

    startChapterThree()

end

------------------------------------------------------------------------------------------------------------------------------------
function startChapterThree()

	createAlarmSystem()
	
--	createQuestDefeat()
	
    -- create briefings
	createBriefingCommandant()
	controlGuardBriefing()
	
	-- create AI armies
	createArmyBlockade()
	createBarbarianAttack()
	
	meetCommandant()
end



------------------------------------------------------------------------------------------------------------------------------------
function createSoundWolves()

	SoundWolves					=	{}
--	SoundWolves.Serfs			=	true
	SoundWolves.Heroes			=	true
--	SoundWolves.Leaders			=	true
	SoundWolves.TargetName		=	"shortcut"
	SoundWolves.Distance		=	6000
	SoundWolves.Callback		=	PlaySoundWolves
	SetupExpedition(SoundWolves)

end

------------------------------------------------------------------------------------------------------------------------------------
function PlaySoundWolves()
	Sound.Play2DSound(Sounds.AmbientSounds_Wolf_rnd_1, 0,127)
end

------------------------------------------------------------------------------------------------------------------------------------
function controlGuardBriefing()
	
	GuardQuest					=	{}
	GuardQuest.Serfs			=	true
	GuardQuest.Heroes			=	true
	GuardQuest.Leaders			=	true
	GuardQuest.TargetName		=	"guardBriefing"
	GuardQuest.Distance			=	1600
	GuardQuest.Callback			=	prepareBriefingGuard
	SetupExpedition(GuardQuest)

end

------------------------------------------------------------------------------------------------------------------------------------
function prepareBriefingGuard()
	if IsAlive("guard") then
		createBriefingGuard()
	end
end