function CreateQuestQueenDefense()

	StartSimpleJob("QuestQueenDefense")

end

function QuestQueenDefense()

	if not IsBriefingActive() then
		
		for i=1,2 do
		
			if IsAlive(ArmyBig1[i]) or IsAlive(ArmyBig2[i]) or IsAlive(ArmyPlayerAttack) or IsExisting("NephilimBaseHQ") then
				return false
			end
			
		end

		-- both dead
		end4thChapter()
		
		return true

	end

end