delayBombQuest = 60 * 10
timeForAttack = 60 * 20
------------------------------------------------------------------------------------------------------------------------------------
function createBombQuest()

    StartSimpleJob("createBombArmyBriefing")

    return true

    end

------------------------------------------------------------------------------------------------------------------------------------
function createBombArmyBriefing()

    if delayBombQuest > 0 then

        delayBombQuest = delayBombQuest -1

        if delayBombQuest == 2 then

            CreateEntity(4,Entities.PU_Serf,GetPosition("bombNpcStart"),"bombNpc")

            end

        return false

        end

    Move("bombNpc","bombNpcEnd",1000)

	briefingNpc = {}

	briefingNpc.restoreCamera = true

	briefingNpc.finished = createBombArmy

	local page = 0

	--	page #1

		page = page + 1

		briefingNpc[page] 				    = 	{}
		briefingNpc[page].title		        = 	String.Key("briefingNpc[1].title")
		briefingNpc[page].text			    =	String.Key("briefingNpc[1].text")
		briefingNpc[page].position 	        = 	GetPosition("bombNpc")
		briefingNpc[page].explore           = 	2000
		briefingNpc[page].dialogCamera	    =	true
		briefingNpc[page].npc				=	{}
		briefingNpc[page].npc.id			=	GetEntityId("bombNpc")
		briefingNpc[page].npc.isObserved	=	true

	--	page #2

		page = page + 1

		briefingNpc[page] 				= 	{}
		briefingNpc[page].text			=	String.Key("briefingNpc[2].text")
		briefingNpc[page].dialogCamera	=	true

	--	page #3

		page = page + 1

		briefingNpc[page] 				= 	{}
		briefingNpc[page].text			=	String.Key("briefingNpc[3].text")
		briefingNpc[page].dialogCamera	=	true

	--AnSu: Extra function needed, because the StartCutscne function does not support pramaters for the callback
	--AnSu: Commented because Cutscene does ot fit to position. I will talk to Ralf!
    --StartCutscene(Cutscenes[THRESHOLDONECUTSCENE],StartBriefingAfterNPCCutsceneWasPlayed)
    StartBriefing(briefingNpc)

    return true

    end
------------------------------------------------------------------------------------------------------------------------------------
function createBombArmy()

    DisableNpcMarker(GetEntityId("bombNpc"))

    StartSimpleJob("startBombArmy")

    -- start timer

    GUIQuestTools.ToggleStopWatch(timeForAttack,1)

    end
------------------------------------------------------------------------------------------------------------------------------------
function startBombArmy()

    if timeForAttack > 0 then

        timeForAttack = timeForAttack -1

        --Report("time for attack "..timeForAttack)

        return false

        end

	briefingNpc2 = {}

	briefingNpc2.restoreCamera = true

	briefingNpc2.finished = createBombQuestTroops

	local page = 0

	--	page #1

		page = page + 1

		briefingNpc2[page] 				    = 	{}
		briefingNpc2[page].title		    = 	String.Key("briefingNpc2[1].title")
		briefingNpc2[page].text			    =	String.Key("briefingNpc2[1].text")
		briefingNpc2[page].position 	    = 	GetPosition("bombNpc")
		briefingNpc2[page].explore          = 	2000
		briefingNpc2[page].dialogCamera	    =	true

    StartBriefing(briefingNpc2)

    return true

    end

------------------------------------------------------------------------------------------------------------------------------------
function createBombQuestTroops()

    delayBombPeople = 5

    for i = 1,12,1 do

        CreateEntity(2,Entities.PU_LeaderHeavyCavalry2,GetPosition("bombSpawny"),"bomb"..i)

        end

    StartSimpleJob("controlBombQuest")

    return true

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlBombQuest()

    for i = 1,12,1 do

        local name = "bomb"..i

        if IsDead(name) == false then

            if GetRandom(100) > 95 then

                CreateEntity(2,Entities.XD_Bomb1,GetPosition(name),"bang")

                end

            end

        end

    if delayBombPeople > 0 then

        delayBombPeople = delayBombPeople-1

        return

        end

    delayBombPeople = 5

    for i = 1,12,1 do
        local name = "bomb"..i
        if IsDead(name) == false then
	        if CP_Difficulty < 2 then
                Move(name,"t"..GetRandom(1,10))
            else
                Attack(name,"t"..GetRandom(1,10))
            end
        end
    end

end

------------------------------------------------------------------------------------------------------------------------------------
function StartBriefingAfterNPCCutsceneWasPlayed()
	StartBriefing(briefingNpc)
	end