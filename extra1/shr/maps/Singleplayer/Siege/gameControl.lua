-------------------------------------------------------------------------------------------------------------

create1stQuest = function()


	Report("start 1st Quest")

----------------------------------------------------

		createBriefingIntro()
                createdestroypl6()

----------------------------------------------------

		StartChestQuest()

end

-------------------------------------------------------------------------------------------------------------------------
	
destroy1stQuest = function()

	ResolveBriefing(briefingVillageRescued)

	Report("end 1st Quest")

	end



-------------------------------------------------------------------------------------------------------------

createsiegeQuest = function()


	Report("start 2nd Quest")

----------------------------------------------------



----------------------------------------------------

		MinesToPlayer()
                createBriefingsiege()

----------------------------------------------------

		startQuestDefeat()
		startQuestVictory()
		
        StartCountdown(30 * 60, firstUnitUpgrades, false)
end

function firstUnitUpgrades()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
	
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 3)
	
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 4)
end

-------------------------------------------------------------------------------------------------------------------------
	
destroysiegeQuest = function()

	ResolveBriefing(briefingWinning)
	Victory()
	Report("end 2nd Quest")

	end

-------------------------------------------------------------------------------------------------------------------------

