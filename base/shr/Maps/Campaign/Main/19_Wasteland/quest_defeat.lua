createQuestDefeat = function()

	StartJob("Defeat")

end

Condition_Defeat = function()

	return (IsDead("start_1") or IsDead("p6hq") or IsDead("p5hq") or IsDead("p4hq") --[[or IsDead("p3hq")--]])
end

Action_Defeat = function()
	Defeat()
	return true
end