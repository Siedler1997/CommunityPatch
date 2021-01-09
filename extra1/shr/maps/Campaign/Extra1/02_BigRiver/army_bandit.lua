timeForAttack = 60 * 20
------------------------------------------------------------------------------------------------------------------------------------
function createBanditArmies()
	armyBandit1 = {}
	local troopsBandit = {
        Entities.CU_BanditLeaderSword1,
        Entities.CU_BanditLeaderBow1,
        Entities.CU_BanditLeaderSword1
    	}    

	if CP_Difficulty == 0 then
        createArmy(6,1,armyBandit1,7,"banditArmy",HIGH_EXPERIENCE,troopsBandit)
    else
        createArmy(6,1,armyBandit1,5,"banditArmy",MEDIUM_EXPERIENCE,troopsBandit)
    end
	armyBandit1.control.job = 1

    StartSimpleJob("controlArmyBandit1")
    end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmyBandit1()
    if armyBandit1.control.job == 1 then
        Defend(armyBandit1)
    elseif armyBandit1.control.job == 2 then
        FrontalAttack(armyBandit1)
    elseif armyBandit1.control.job == 3 then
        if IsDead("Dario") == false then
            Redeploy(armyBandit1,GetPosition("Dario"))
        elseif IsDead("Ari") == false then
            Redeploy(armyBandit1,GetPosition("Ari"))
        elseif IsDead("Pilgrim") == false then
            Redeploy(armyBandit1,GetPosition("Pilgrim"))
            end
        end
    end
