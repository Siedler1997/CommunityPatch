
-- Raiders from South

DEPLOY		= 1
ATTACK 		= 2
DEPLOY_A	= 3
DEPLOY_B	= 4
DEPLOY_TIME	= 8
RESPAWN_TIME = 5 * 60
SPAWN_POINT = 1
--SPAWN_BUILDING = 2

createArmySouthernAssault = function()

	--	attacking bandits a

		armySouthernAssault							= {}
	
		armySouthernAssault.player 					= 3
		armySouthernAssault.id						= 1
		armySouthernAssault.strength				= 4
		armySouthernAssault.position				= GetPosition("attackpoint1")
		armySouthernAssault.rodeLength				= 6000
		armySouthernAssault.beAgressive				= true
		armySouthernAssault.control					= {}
		armySouthernAssault.control.setupDelay		= (RESPAWN_TIME * 2) + Logic.GetRandom(RESPAWN_TIME / 2)
		armySouthernAssault.control.strength		= 2
		armySouthernAssault.control.attack			= 5	--12			--number of attacks
		armySouthernAssault.control.deployTime		= DEPLOY_TIME
		armySouthernAssault.control.mode			= ATTACK
		
		SetupArmy(armySouthernAssault)
		
	--	start controlling job		
		
		StartJob("SetupArmySouthernAssault")

	end


-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "SetupArmySouthernAssault"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_SetupArmySouthernAssault = function()
	-------------------------------------------------------------------------------------------------------------------
		
		armySouthernAssault.control.setupDelay = armySouthernAssault.control.setupDelay -1	
		
		Report("set up delay "..armySouthernAssault.control.setupDelay)
		
		if armySouthernAssault.control.setupDelay == 60 * 2 then
		
			SpokenMessage(String.MainKey.."Message_SoonAttack")
--			Message("Be prepared! Enemy troops are coming closer.")
			
			end
		
		return armySouthernAssault.control.setupDelay <= 0
		
		end





		
	-------------------------------------------------------------------------------------------------------------------
	Action_SetupArmySouthernAssault = function()
	-------------------------------------------------------------------------------------------------------------------
		
		armySouthernAssault.control.setupDelay = RESPAWN_TIME + Logic.GetRandom(RESPAWN_TIME /2)

		armySouthernAssault.strength = 2 + armySouthernAssault.control.strength / 2
		
		if armySouthernAssault.strength > 8 then
		
			armySouthernAssault.strength = 8
			
			end

		local wave = Logic.GetRandom(4)
		
		if 		wave == 0 then
			setupAttackWave1(armySouthernAssault.control.strength / 2)		
		elseif	wave == 1 then
			setupAttackWave1(armySouthernAssault.control.strength / 2)		
		elseif	wave == 2 then
			setupAttackWave1(armySouthernAssault.control.strength / 2)		
		elseif	wave >= 3 then
			setupAttackWave1(armySouthernAssault.control.strength / 2)		
			end

		armySouthernAssault.control.mode = ATTACK

		StartJob("DeployArmySouthernAssault")

		return true
		
		end



-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "DeployArmySouthernAssault"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_DeployArmySouthernAssault = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return true						
		
		end		
		
	-------------------------------------------------------------------------------------------------------------------
	Action_DeployArmySouthernAssault = function()
	-------------------------------------------------------------------------------------------------------------------

		if armySouthernAssault.control.mode == DEPLOY then		
		
		if Logic.GetRandom(100) > 50 then			

				Report("Deploy A")
				Report("Deploy A")
				Report("Deploy A")
				Report("Deploy A")
				Report("Deploy A")
		
				Redeploy(armySouthernAssault,GetPosition("attackpoint1"),4000)
		
				armySouthernAssault.control.mode = DEPLOY_A
		
			else
			
				Report("Deploy B")
				Report("Deploy B")
				Report("Deploy B")
				Report("Deploy B")
				Report("Deploy B")
		
				Redeploy(armySouthernAssault,GetPosition("attackpoint1"),4000)
		
				armySouthernAssault.control.mode = DEPLOY_B	
		
				end		
		
			return false		
		
		else
		
			Report("Deploy "..armySouthernAssault.control.deployTime.." Mode: "..armySouthernAssault.control.mode)
		
			armySouthernAssault.control.deployTime = armySouthernAssault.control.deployTime -1
		
			if armySouthernAssault.control.deployTime <= 0 then
		
				Report("southern assault army: Start Assault")
		
				StartJob("ControlArmySouthernAssault")
		
				return true
		
				end
		
			end		
		
		return false		
		
		end
	

	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmySouthernAssault"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmySouthernAssault = function()
	-------------------------------------------------------------------------------------------------------------------

		return Counter.Tick2("ControlArmySouthernAssault",4)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmySouthernAssault = function()
	-------------------------------------------------------------------------------------------------------------------
			
		if IsDead("spawnpointA")  then
                         
 			return true
		end	
	
		if IsDead(armySouthernAssault) then
			
			if armySouthernAssault.control.attack <= 0 then
			
				return true
				
			
			end			
			
	
	
			SPAWN_REGION="attackpoint1"

				
			-- end
	
			
                        armySouthernAssault.position= GetPosition(SPAWN_REGION)			
			
			armySouthernAssault.control.attack = armySouthernAssault.control.attack -1
		
			Redeploy(armySouthernAssault,GetPosition(SPAWN_REGION),4000)
			
			SPAWN_POINT=2
					
			armySouthernAssault.control.strength = armySouthernAssault.control.strength +1
			
			StartJob("SetupArmySouthernAssault")
			
			return true
		
		


			
		elseif IsVeryWeak(armySouthernAssault) and Logic.GetRandom(100) > 85 then
		
			local troopDescription = {
	
				minNumberOfSoldiers	= 0,
				maxNumberOfSoldiers	= 8,
				experiencePoints 	= MEDIUM_EXPERIENCE,
			}			
		
			local troopType = Logic.GetRandom(4)
			
			if 		troopType == 0 then
			
				troopDescription.leaderType = GetHeavyCavalry(armySouthernAssault.control.strength / 2)

			elseif	troopType == 1 then
			
				troopDescription.leaderType = GetHeavyCavalry(armySouthernAssault.control.strength / 2)
			
			elseif	troopType == 2 then
			
				troopDescription.leaderType = GetLightCavalry(armySouthernAssault.control.strength / 2)
		
			elseif	troopType == 3 then
			
				troopDescription.leaderType = GetLightCavalry(armySouthernAssault.control.strength / 2)
			
				end		

			EnlargeArmy(armySouthernAssault,troopDescription)
			
			return false
			
		else
			
			Advance(armySouthernAssault)

			return false

			end

		return false
		
		end
	
	
-----------------------------------------------------------------------------------------------------------------------	
	
setupAttackWave3 = function(_strength)

	local troopDescription = {
	
		minNumberOfSoldiers	= 0,
		maxNumberOfSoldiers	= 8,
		experiencePoints 	= MEDIUM_EXPERIENCE,
	}			

	local counter = {}
	counter.value = 0

	troopDescription.leaderType = GetBow(_strength)

--	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
--	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
--	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)

	troopDescription.leaderType = GetSword(_strength)

--	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)

	end	
	
-----------------------------------------------------------------------------------------------------------------------	

setupAttackWave2 = function(_strength)

	local troopDescription = {
	
		minNumberOfSoldiers	= 0,
		maxNumberOfSoldiers	= 8,
		experiencePoints 	= MEDIUM_EXPERIENCE,
	}			

	local counter = {}
	counter.value = 0

	troopDescription.leaderType = GetBow(_strength)

--	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
--	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
--	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)

	troopDescription.leaderType = GetSword(_strength)

--	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)

	end
	
-----------------------------------------------------------------------------------------------------------------------	
	
setupAttackWave1 = function(_strength)

	local troopDescription = {
	
		minNumberOfSoldiers	= 0,
		maxNumberOfSoldiers	= 8,
		experiencePoints 	= MEDIUM_EXPERIENCE,
	}			

	local counter = {}
	counter.value = 0

	troopDescription.leaderType = GetBow(_strength)

--	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
--	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
--	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
	
	troopDescription.leaderType = GetRifle(_strength)
	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)

	troopDescription.leaderType = GetSword(_strength)

--	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)

	end	
	
-----------------------------------------------------------------------------------------------------------------------	
	
setupAttackWave4 = function(_strength)

	local troopDescription = {
	
		minNumberOfSoldiers	= 0,
		maxNumberOfSoldiers	= 8,
		experiencePoints 	= MEDIUM_EXPERIENCE,
	}			

	local counter = {}
	counter.value = 0
	
	troopDescription.leaderType = GetPoleArm(_strength)

--	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
--	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
--	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
--	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)

	troopDescription.leaderType = GetCannon(_strength)

--	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
--	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)
	CountedEnlargeArmy(armySouthernAssault,troopDescription,counter)

	end	
	


