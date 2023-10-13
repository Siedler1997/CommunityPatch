createPlayer1 = function()

	local playerId = 1
	
	Logic.SetPlayerName(playerId, String.Player(playerId))
	if CP_Difficulty == 0 then
		Tools.GiveResouces(playerId, 3000,1500,1300,1000,500,500) 
	else
		Tools.GiveResouces(playerId, 2000,1000,900,800,400,200) 
	end
	
	CP_ActivateEvilMod(1, 1, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBarbarian, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBarbarian, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightLeaderMace1, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightSoldierMace1, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBandit, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBandit, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBanditBow, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBanditBow, 1)

	ForbidTechsForPlayer()
end

function ForbidTechsForPlayer()
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_University, 0)

	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_StoneMason, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Alchemist, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Brickworks, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Market, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Bank, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Monastery, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Outpost, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Weathermachine, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_PowerPlant, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Stables, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Foundry, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Tower, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Tavern, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_GunsmithWorkshop, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Bridge, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_MasterBuilderWorkshop, 0)
	
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Beautification01, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Beautification02, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Beautification03, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Beautification04, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Beautification05, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Beautification06, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Beautification07, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Beautification08, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Beautification09, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Beautification10, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Beautification11, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Beautification12, 0)
	
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.UP1_Village, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.UP1_Barracks, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.UP1_Archery, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.UP1_Sawmill, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.UP1_Blacksmith, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.UP1_Residence, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.UP1_Farm, 0)

	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_ChainMailArmor, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_PlateMailArmor, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_PaddedArcherArmor, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_LeatherArcherArmor, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_MasterOfSmithery, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_IronCasting, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_Fletching, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_BodkinArrow, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_WoodAging, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_Turnery, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_Loom, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_Shoes, 0)
	
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_BetterTrainingBarracks, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_BetterTrainingArchery, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_UpgradeSword2, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_UpgradeSpear2, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_UpgradeBow2, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.MU_LeaderRifle, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_UpgradeRifle1, 0)

end