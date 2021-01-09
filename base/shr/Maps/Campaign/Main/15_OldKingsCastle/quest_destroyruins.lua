
-- Destroy annoying ruins by tribute

createQuestDestroyRuins = function()

	local Job1 = {}
	
	if 	uniqueTributeCounter == nil then 
		uniqueTributeCounter = 1
	end

	Job1.Tribute = uniqueTributeCounter
	
	uniqueTributeCounter = uniqueTributeCounter +1

	Logic.AddTribute(	GetHumanPlayer(), 
						Job1.Tribute,
						0,
						0,
						String.MainKey.."tribute_DestroyRuins", 
						ResourceType.Gold, 
						2000)

	Job1.Callback 	= TributeDestroyRuinsPaid

	SetupTributePaid(Job1)

end




TributeDestroyRuinsPaid = function()
	local allruins = {}

	local ruins1 = SucheAufDerWelt(0,Entities.XD_RuinWall2) 
	local ruins2 = SucheAufDerWelt(0,Entities.XD_RuinWall4) 
	local ruins3 = SucheAufDerWelt(0,Entities.XD_RuinWall6) 
	local ruins4 = SucheAufDerWelt(0,Entities.XD_RuinMonastery2) 
	local ruins5 = SucheAufDerWelt(0,Entities.XD_RuinResidence2) 
	local ruins6 = SucheAufDerWelt(0,Entities.XD_RuinSmallTower2) 
	local ruins7 = SucheAufDerWelt(0,Entities.XD_RuinTower2) 
	local ruins8 = SucheAufDerWelt(0,Entities.XD_RuinFragment2) 
	local ruins9 = SucheAufDerWelt(0,Entities.XD_RuinFragment4) 
	local ruins10 = SucheAufDerWelt(0,Entities.XD_RuinFragment6) 
	local ruins11 = SucheAufDerWelt(0,Entities.XD_RuinResidence1) 
	local ruins12 = SucheAufDerWelt(0,Entities.XD_RuinSmallTower3) 
	local ruins13 = SucheAufDerWelt(0,Entities.XD_RuinSmallTower4) 
	
	for a = 1, table.getn(ruins1) do
		table.insert(allruins, ruins1[a])
	end
	for b = 1, table.getn(ruins2) do
		table.insert(allruins, ruins2[b])
	end
	for c = 1, table.getn(ruins3) do
		table.insert(allruins, ruins3[c])
	end
	for d = 1, table.getn(ruins4) do
		table.insert(allruins, ruins4[d])
	end
	for e = 1, table.getn(ruins5) do
		table.insert(allruins, ruins5[e])
	end
	for f = 1, table.getn(ruins6) do
		table.insert(allruins, ruins6[f])
	end
	for g = 1, table.getn(ruins7) do
		table.insert(allruins, ruins7[g])
	end
	for h = 1, table.getn(ruins8) do
		table.insert(allruins, ruins8[h])
	end
	for i = 1, table.getn(ruins9) do
		table.insert(allruins, ruins9[i])
	end
	for j = 1, table.getn(ruins10) do
		table.insert(allruins, ruins10[j])
	end
	for k = 1, table.getn(ruins11) do
		table.insert(allruins, ruins11[k])
	end
	for l = 1, table.getn(ruins12) do
		table.insert(allruins, ruins12[l])
	end
	for m = 1, table.getn(ruins13) do
		table.insert(allruins, ruins13[m])
	end

	for z = 1, table.getn(allruins) do
		local pos = GetPosition(allruins[z])
		Logic.CreateEffect( GGL_Effects.FXCrushBuilding, pos.X, pos.Y, 0 )
		DestroyEntity(allruins[z])
	end

	AddWood(100)
	AddStone(1000)
	
	SpokenMessage(String.MainKey.."tribute_DestroyRuins_ResourcesBack")
	
end