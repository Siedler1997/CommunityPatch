CheckPlayer24 = function()

  StartJob ("Checkpl24")

end

-------------------------------------------------------------------------------------------


             Condition_Checkpl24 = function()

                return IsDead("player2") and IsDead("player4")

             end


Action_Checkpl24 = function()
	ResearchTechnology(Technologies.T_SuperTechnology, 3);

    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 3)

    Tools.GiveResouces(3, 7000, 7000, 7000, 7000, 7000)

    return true

end