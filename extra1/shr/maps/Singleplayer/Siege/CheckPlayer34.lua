CheckPlayer34 = function()

  StartJob ("Checkpl34")

end

-------------------------------------------------------------------------------------------


             Condition_Checkpl34 = function()

                return IsDead("player3") and IsDead("player4")

             end


Action_Checkpl34 = function()
	ResearchTechnology(Technologies.T_SuperTechnology, 2);

    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 2)

    Tools.GiveResouces(2, 7000, 7000, 7000, 7000, 7000)

    return true

end