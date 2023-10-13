------------------------------------------------------------------------------------------------------------------------------------
function createArmyOutpost()

	armyOutpost = {}

	troopsArmyOutpost = { }

	if CP_Difficulty == 0 then
		table.insert(troopsArmyOutpost, Entities.CU_Barbarian_LeaderClub1)
		table.insert(troopsArmyOutpost, Entities.CU_BanditLeaderBow1)
	else
		table.insert(troopsArmyOutpost, Entities.CU_Barbarian_LeaderClub2)
		table.insert(troopsArmyOutpost, Entities.CU_BanditLeaderBow2)
	end

    createArmy(2,2,armyOutpost,7,"armyOutpost",CP_Difficulty,troopsArmyOutpost)

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