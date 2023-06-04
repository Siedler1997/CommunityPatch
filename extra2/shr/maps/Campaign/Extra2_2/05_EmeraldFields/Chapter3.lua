function StartChapter3()

	ChapterCount1=ChapterCount1+1

	createBriefingDestroyPart1()
	StartJob("Part1IsDown")
	setupArmyAI1Attack()
	StartAttackPos1()
	--GoYuki()
	YukiMenAttack()
	setupArmyEArmyAttack()
	ErecAttackPos1()
	setupArmyAriArmyAttack()
	AriAttackPos1()
	setupArmyDArmyAttack()
	DrakeAttackPos1()

	SpawnMoreHelp()

	StartJob("AriGetsHelp")
	StartJob("AriGetsHelp1")
	StartJob("AriGetsHelp2")

	if CP_Difficulty == 2 then
		ResearchAllMilitaryTechsAddOn(2, true)
		ResearchAllMilitaryTechsAddOn(6, true)
		ResearchAllMilitaryTechsAddOn(7, true)
	end
end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "Part1IsDown"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_Part1IsDown = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("P1_Build1") and IsDead("P1_Build2") and IsDead("P1_Build3") and IsDead("P1_Build4") and IsDead("P1_Build5") and IsDead("P1_Build6") and IsDead("P1_Build7") and IsDead("P1_Build8") and IsDead("P1_Build9") and IsDead("P1_Build10")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_Part1IsDown = function()
	-------------------------------------------------------------------------------------------------------------------

		end3rdChapter()

		return true


	end

-------------------------------------------------------------------------------------------------------------------------

function GoYuki()

	if IsAlive("Yuki") then

		Move("Yuki","YukiMove")

	end

end

-------------------------------------------------------------------------------------------------------------------------

function YukiMenAttack()

	if IsAlive("YukiArmy1") then

		Attack("YukiArmy1","P4_AttackTarg1")

	end

	if IsAlive("YukiArmy2") then

		Attack("YukiArmy2","P4_AttackTarg1")

	end

	if IsAlive("YukiArmy3") then

		Attack("YukiArmy3","P4_AttackTarg1")

	end

	if IsAlive("YukiArmy4") then

		Attack("YukiArmy4","P4_AttackTarg1")

	end

	if IsAlive("YukiArmy5") then

		Attack("YukiArmy5","P4_AttackTarg1")

	end

	if IsAlive("YukiArmy6") then

		Attack("YukiArmy6","P4_AttackTarg1")

	end

	if IsAlive("YukiArmy7") then

		Attack("YukiArmy7","P4_AttackTarg1")

	end

	if IsAlive("YukiArmy8") then

		Attack("YukiArmy8","P4_AttackTarg1")

	end

	if IsAlive("YukiArmy9") then

		Attack("YukiArmy9","P4_AttackTarg1")

	end

	if IsAlive("YukiArmy10") then

		Attack("YukiArmy10","P4_AttackTarg1")

	end

end