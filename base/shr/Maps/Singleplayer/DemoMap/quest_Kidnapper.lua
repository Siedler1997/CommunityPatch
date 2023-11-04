createQuestKidnapper = function()
	StartJob("KidnappersDead")
end

Condition_KidnappersDead = function()
	return IsDead("CoastBanditsHQ") and IsBriefingActive() == false and IsDead(ArmyCoastBanditsA) and not IsExisting("PrisonCage")
end

Action_KidnappersDead = function()
	end3rdQuest()
	return 1
end