
-- attacking units after barracks was built

ATTACK_START_DELAY 		= 5 * 60
WARNING_BEFORE_ATTACK	= 2 * 60

TIME_BETWEEN_ATTACKS 	= 5 * 60
NUMBER_OF_ATTACKS		= 2

APPROACH_DISTANCE		= 5000						-- distance to robbers camp when no re-spawn of enemy units


createArmyAttackingBandits = function()


	--	attacking bandits a

		armyAttackingBanditsA						= {}
	
		armyAttackingBanditsA.player 				= 7
		armyAttackingBanditsA.id					= 4
		armyAttackingBanditsA.strength				= 2
		armyAttackingBanditsA.position				= GetPosition("bossFight")
		armyAttackingBanditsA.rodeLength			= 0
		armyAttackingBanditsA.control				= {}
		armyAttackingBanditsA.control.delay			= ATTACK_START_DELAY
		armyAttackingBanditsA.control.attack		= 0
		armyAttackingBanditsA.control.units			= 4
		armyAttackingBanditsA.control.warningDelay	= WARNING_BEFORE_ATTACK
		
		
		SetupArmy(armyAttackingBanditsA)

	--	create army	a
			
		local troopDescription = {
			maxNumberOfSoldiers = armyAttackingBanditsA.control.units,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}			
		
		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1
			EnlargeArmy(armyAttackingBanditsA,troopDescription)
			troopDescription.leaderType = Entities.CU_BanditLeaderBow1
			EnlargeArmy(armyAttackingBanditsA,troopDescription)
		else
			troopDescription.maxNumberOfSoldiers = 8
			troopDescription.experiencePoints = 2
			troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace2
			EnlargeArmy(armyAttackingBanditsA,troopDescription)
			troopDescription.leaderType = Entities.CU_BanditLeaderBow2
			EnlargeArmy(armyAttackingBanditsA,troopDescription)
		end
		
	--TF
		createBriefingRobber1Attack()	--TF: Only create briefings, do not start!
		createBriefingRobber2Attack()				
			
	
	--	start controlling job

		StartJob("ControlArmyAttackingBanditsA")

		StartJob("WarnPlayer")

	end



-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "WarnPlayer"
--
-----------------------------------------------------------------------------------------------------------------------	
	Condition_WarnPlayer = function()

		if armyAttackingBanditsA.control.warningDelay > 0 then
	
			armyAttackingBanditsA.control.warningDelay = armyAttackingBanditsA.control.warningDelay -1
			
			return false
			
		end
		
		return Counter.Tick2("WarnPlayer",5)
		
	end




	-------------------------------------------------------------------------------------------------------------------
	Action_WarnPlayer = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if armyAttackingBanditsA.control.warningDelay <= 0 then

			if IsDead("Jail") then

				return true

			end


			if IsBriefingActive() ~= true and GetClosestEntity(armyAttackingBanditsA, APPROACH_DISTANCE) == 0 then

				createBriefingRobber1Warning()	

				return true
			end		

		end
				
	return false
	
	end





	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyAttackingBanditsA"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyAttackingBanditsA = function()
	-------------------------------------------------------------------------------------------------------------------
	
		if armyAttackingBanditsA.control.delay > 0 then
	
			Report("attack starts in "..armyAttackingBanditsA.control.delay.." seconds")
		
			armyAttackingBanditsA.control.delay = armyAttackingBanditsA.control.delay -1
			
			if armyAttackingBanditsA.control.delay <= 0 then
			
				-- stop countdown

				MapLocal_StopCountDown(0)
	
				--	tower existing?
				
				if IsDead("Jail") then
	
					return false
	
				end
	
				if IsBriefingActive() ~= true and GetClosestEntity(armyAttackingBanditsA, APPROACH_DISTANCE) == 0 then

					StartBriefing(briefingRobber1Attack)	-- "Take care, they attack your village!"

				end
			
			end
			
			return false
			
		end
		
		return Counter.Tick2("ControlArmyAttackingBanditsA",5)
		
	end




		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyAttackingBanditsA = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyAttackingBanditsA) then
		
			if armyAttackingBanditsA.control.attack == (NUMBER_OF_ATTACKS-1) then

				return true
				
			end
				
			armyAttackingBanditsA.control.attack = armyAttackingBanditsA.control.attack +1
		
			--	retreat army
		
				Report("retreat")
				Retreat(armyAttackingBanditsA)
					
			--	tower existing
			
				if IsDead("Jail") then
					return true
				end
						
			--	create new army	A

				armyAttackingBanditsA.strength				= 3
				armyAttackingBanditsA.control.units 		= 4
					
				local troopDescription = {
				
					maxNumberOfSoldiers	= armyAttackingBanditsA.control.units,
					minNumberOfSoldiers	= 0,
					experiencePoints 	= LOW_EXPERIENCE,
				}				
	

				if CP_Difficulty == 0 then
					troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1
					EnlargeArmy(armyAttackingBanditsA,troopDescription)
					EnlargeArmy(armyAttackingBanditsA,troopDescription)
					troopDescription.leaderType = Entities.CU_BanditLeaderBow1
					EnlargeArmy(armyAttackingBanditsA,troopDescription)
				else
					troopDescription.maxNumberOfSoldiers = 8
					troopDescription.experiencePoints = 2
					troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace2
					EnlargeArmy(armyAttackingBanditsA,troopDescription)
					EnlargeArmy(armyAttackingBanditsA,troopDescription)
					troopDescription.leaderType = Entities.CU_BanditLeaderBow2
					EnlargeArmy(armyAttackingBanditsA,troopDescription)
				end
				
			-- warn player, set time til next attack and start countdown

				armyAttackingBanditsA.control.delay = TIME_BETWEEN_ATTACKS


				if IsBriefingActive() ~= true then

					StartBriefing(briefingRobber2Attack)		-- "well done, you have defeated them"

				end
	
				createBriefingRobber1Attack() --XXX

		else
		
			Report("advancing...")

			Advance(armyAttackingBanditsA)
			
		end

	return false
		
end
	