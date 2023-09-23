CheckPlayer3 = function()

  StartJob ("Checkpl3")

end

-------------------------------------------------------------------------------------------


             Condition_Checkpl3 = function()

                return IsDead("player3")

             end


Action_Checkpl3 = function()
	ResearchAllMilitaryTechsAddOn(2)

    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 4)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)

    Tools.GiveResouces(2, 5000, 5000, 5000, 5000, 5000)
    
	ResearchAllMilitaryTechsAddOn(4)

    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 4)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 4)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 4)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 4)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 4)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 4)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 4)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 4)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 4)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 4)

    Tools.GiveResouces(4, 5000, 5000, 5000, 5000, 5000)

    return true

end