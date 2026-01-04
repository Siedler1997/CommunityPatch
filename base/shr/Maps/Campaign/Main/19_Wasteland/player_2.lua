createPlayer2 = function()

	local playerId = 2
	Logic.SetPlayerName(2, "CM01_19_Wasteland_Txt/_Player2Name")

	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	0,
		extracting = false
	}

	if CP_Difficulty == 0 then
		aiDescription.resources = {
			gold				=	1000,
			clay				=	400,
			iron				=	400,
			sulfur				=	400,
			stone				=	400,
			wood				=	400
		}

		aiDescription.refresh = {
			gold				=	10,
			clay				=	10,
			iron				=	10,
			sulfur				=	10,
			stone				=	10,
			wood				=	10,
			updateTime			=	10
		}
	else
		aiDescription.resources = {
			gold				=	2000,
			clay				=	800,
			iron				=	800,
			sulfur				=	800,
			stone				=	800,
			wood				=	800
		}

		aiDescription.refresh = {
			gold				=	50,
			clay				=	20,
			iron				=	20,
			sulfur				=	20,
			stone				=	20,
			wood				=	20,
			updateTime			=	5
		}
	end

	SetupPlayerAi(playerId,aiDescription)

	-- upgrade soldiers
	local i
	for i=1,3 do
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
	end
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightLeaderMace1, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightSoldierMace1, 2)
	
	setupArmyLeftFortress()
	setupArmyRightFortress()
	setupArmyCenterOutpost()

	if CP_Difficulty > 0 then
		setupArmyAttackPlayerA()
		StartCountdown(60 * (30/CP_Difficulty), MakeArmyAttackPlayerAggressive, false)
	end
	
	StartSimpleJob("ControlP2Serfs")
	StartCountdown(60 * 3, GiveVCtoPlayer5, false)
end

function ControlP2Serfs()
	local p2SerfAmmount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(2,Entities.PU_Serf)
	
	if IsExisting("p2_hq") then
		local middlePos = GetPosition("KI1_DefensePos")
		local serfsAtLeftFortress = Logic.GetPlayerEntitiesInArea(2, Entities.PU_Serf, middlePos.X, middlePos.Y, 10000, 8);
		if serfsAtLeftFortress < 4 and p2SerfAmmount < 20 then
			local spawnPos = GetPosition("KI1_SpawnPos")
			AI.Entity_CreateFormation(2,Entities.PU_Serf,0,0,spawnPos.X,spawnPos.Y,0,0,0,0)
		end
	end
	if IsExisting("KI3_HQ") then
		local middlePos = GetPosition("KI3_AttackPos")
		local serfsAtRightFortress = Logic.GetPlayerEntitiesInArea(2, Entities.PU_Serf, middlePos.X, middlePos.Y, 10000, 8);
		if serfsAtRightFortress < 4 and p2SerfAmmount < 20 then
			local spawnPos = GetPosition("KI3_SpawnPos")
			AI.Entity_CreateFormation(2,Entities.PU_Serf,0,0,spawnPos.X,spawnPos.Y,0,0,0,0)
		end
	end
	if IsExisting("KI2_Outpost") then
		local middlePos = GetPosition("KI2_SpawnPos")
		local serfsAtCenterOutpost = Logic.GetPlayerEntitiesInArea(2, Entities.PU_Serf, middlePos.X, middlePos.Y, 5000, 8);
		if serfsAtCenterOutpost < 4 and p2SerfAmmount < 20 then
			local spawnPos = GetPosition("KI2_SpawnPos")
			AI.Entity_CreateFormation(2,Entities.PU_Serf,0,0,spawnPos.X,spawnPos.Y,0,0,0,0)
		end
	end
end

--Give village center to its rightful owner
function GiveVCtoPlayer5()
	--Very unlikely but just to be safe
	if IsExisting("p5vc") then
		ChangePlayer("p5vc", 5)
	end
end