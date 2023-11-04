---------------------------------------------------------------------------------------------
function createQuestPriest()

    timeCreateArmySeven = 60

    StartSimpleJob("controlPriest")

    end
---------------------------------------------------------------------------------------------
function controlPriest()

    if timeCreateArmySeven > 0 then
        timeCreateArmySeven = timeCreateArmySeven -1
        return false
        end

    if IsDead(armySeven) and not IsExisting("PrisonCage") then
    	--DestroyEntity("npcPriestGate")
        createPriestBriefing()
        return true
        end

    end