createPlayer4 = function()

	-- Setup ai
	local playerId = 4
	Logic.SetPlayerName(4, "CM01_19_Wasteland_Txt/_Player4Name")
	
	for i=1,2 do
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, playerId)
	end
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, playerId)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, playerId)
end