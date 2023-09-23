CheckPlayer4 = function()

  StartJob ("Checkpl4")

end

-------------------------------------------------------------------------------------------


             Condition_Checkpl4 = function()

                return IsDead("player4")

             end


Action_Checkpl4 = function()
	ResearchAllMilitaryTechsAddOn(3)

    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 3)

    Tools.GiveResouces(3, 5000, 5000, 5000, 5000, 5000)
    
	ResearchAllMilitaryTechsAddOn(2)

    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)

    Tools.GiveResouces(2, 5000, 5000, 5000, 5000, 5000)

    return true

end