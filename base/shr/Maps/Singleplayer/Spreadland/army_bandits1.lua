BANDITS1_DEFEND = 1
BANDITS1_ATTACK = 2

createArmyBandits1 = function()

	armyBandits1				= {}

	armyBandits1.player 		= 7
	armyBandits1.id				= armyPlayer2Count
	armyBandits1.strength		= 8
	armyBandits1.position		= GetPosition("GoldChest11")
	armyBandits1.rodeLength		= 2000
	armyBandits1.control		= {}
	armyBandits1.control.delay	= 40
	armyBandits1.control.mode	= BANDITS1_DEFEND
	
	armyPlayer2Count = armyPlayer2Count +1
	
	SetupArmy(armyBandits1)

	local troopDescription = {
	
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= MEDIUM_EXPERIENCE,
	}			

	troopDescription.leaderType = Entities.CU_BanditLeaderBow2
		
	EnlargeArmy(armyBandits1,troopDescription)
	EnlargeArmy(armyBandits1,troopDescription)
	EnlargeArmy(armyBandits1,troopDescription)
	--EnlargeArmy(armyBandits1,troopDescription)
	
	troopDescription.leaderType = Entities.CU_BanditLeaderSword2
	
	EnlargeArmy(armyBandits1,troopDescription)
	EnlargeArmy(armyBandits1,troopDescription)
	EnlargeArmy(armyBandits1,troopDescription)
	EnlargeArmy(armyBandits1,troopDescription)
	
	troopDescription.leaderType = Entities.CU_LeaderOutlaw1
	troopDescription.experiencePoints = HIGH_EXPERIENCE
	EnlargeArmy(armyBandits1,troopDescription)

	StartJob("ControlArmyBandits1")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyBandits1"
--
-----------------------------------------------------------------------------------------------------------------------	
	Condition_ControlArmyBandits1 = function()
		return Counter.Tick2("ControlArmyBandits1",2)
		end
	
	Action_ControlArmyBandits1 = function()
		if IsDead(armyBandits1) then
			return true
			end			
		if attackSignalForAllBandits ~= nil then		
			Advance(armyBandits1)			
			return false			
			end			
		armyBandits1.control.delay = armyBandits1.control.delay -1
		if armyBandits1.control.mode == BANDITS1_DEFEND then	
			Defend(armyBandits1)			
			if armyBandits1.control.delay <= 0 then			
				armyBandits1.control.delay = 4
				armyBandits1.control.mode = BANDITS1_ATTACK
				return false
				end
			end
		if armyBandits1.control.mode == BANDITS1_ATTACK then	
			FrontalAttack(armyBandits1)
			if armyBandits1.control.delay <= 0 then			
				armyBandits1.control.delay = 10 + Logic.GetRandom(5)
				armyBandits1.control.mode = BANDITS1_DEFEND
				Redeploy(armyBandits1,GetPosition("GoldChest11"))
				end
			return false
			end	
		return false
		end

