------------------------------------------------------------------------------------------------------------------------------------
function createArmyOutpost()

	armyOutpost = {}

	troopsArmyOutpost = {
    	Entities.CU_Barbarian_LeaderClub1,
    	Entities.CU_BanditLeaderBow1,
    	}

	local experience = HIGH_EXPERIENCE
	if CP_Difficulty == 1 then
		experience = experience + 1
	end

    createArmy(2,2,armyOutpost,7,"armyOutpost",experience,troopsArmyOutpost)

    armyOutpost.rodeLength = 1000

    ArmyOutpostJobId = StartSimpleJob("controlArmyOutpostDefend")
--	StartSimpleJob("controlArmyOutpostDefend")

	controlSwitchToAttack				=	{}
--	controlSwitchToAttack.Serfs			=	false
	controlSwitchToAttack.Heroes		=	true
	controlSwitchToAttack.Leaders		=	true
	controlSwitchToAttack.TargetName	=	"switchToAttack"
	controlSwitchToAttack.Distance		=	4000
	controlSwitchToAttack.Callback		=	controlArmyOutpostAdvance1
	SetupExpedition(controlSwitchToAttack)

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmyOutpostDefend()
	simpleDefendBehaviour(armyOutpost)
end


function controlArmyOutpostAdvance1()
	EndJob(ArmyOutpostJobId)
	StartSimpleJob("controlArmyOutpostAdvance2")
end

function controlArmyOutpostAdvance2()
	Advance(armyOutpost)
end