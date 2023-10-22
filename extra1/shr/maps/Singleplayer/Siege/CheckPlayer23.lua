CheckPlayer23 = function()

  StartJob ("Checkpl23")

end

-------------------------------------------------------------------------------------------


             Condition_Checkpl23 = function()

                return IsDead("player2") and IsDead("player3")

             end


Action_Checkpl23 = function()
	ResearchTechnology(Technologies.T_SuperTechnology, 4);

    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 4)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 4)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 4)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 4)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 4)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 4)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 4)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 4)

    Tools.GiveResouces(4, 7000, 7000, 7000, 7000, 7000)

    return true

end