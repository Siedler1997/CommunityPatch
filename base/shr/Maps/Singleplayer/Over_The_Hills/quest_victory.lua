
startQuestVictory = function()
	delayVictory = 0
	StartJob("QuestVictory")
	end
	
	
-----------------------------------------------------------------------------------------------------------------------	
Condition_QuestVictory = function()
	return 		IsDead("player2") 
			and	IsDead("player3") 
			and (
					merchant1TributePaid == true 			
				or	IsDead("player4") 
				)
			and	IsBriefingActive() == false
	end
Action_QuestVictory = function()
	if delayVictory > 10 then
		destroy1stQuest()
		return true
	else
		delayVictory = delayVictory +1
		return false
		end
	end

