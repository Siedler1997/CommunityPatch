---------------------------------------------------------------------------------------------
function createQuestOpenGate()
    StartSimpleJob("controlOpenGate")

    end
---------------------------------------------------------------------------------------------
function controlOpenGate()
	if Counter.Tick2("controlOpenGate", 5) then
        if not IsNear("gateKeeper","gate",1000) then
            Move("gateKeeper","gate")
        else
            LookAt("gateKeeper","Dario")
            createBriefingOpenGate()
		    return true
        end
	end
end
