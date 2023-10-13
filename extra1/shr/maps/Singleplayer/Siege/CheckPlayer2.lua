CheckPlayer2 = function()

  StartJob ("Checkpl2")

end

-------------------------------------------------------------------------------------------


             Condition_Checkpl2 = function()

                return IsDead("player2")

             end


Action_Checkpl2 = function()
	ResearchAllMilitaryTechsAddOn(3)

    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 3)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 3)

    Tools.GiveResouces(3, 5000, 5000, 5000, 5000, 5000)
    
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
