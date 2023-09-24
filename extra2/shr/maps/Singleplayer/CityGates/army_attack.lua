baseN=0
baseE=0
baseS=0
--***********************************[army north]**********************************************
function CreateArmyNorth()

	ArmyNorth1								= {}

	ArmyNorth1.player 				= 3
	ArmyNorth1.id						= 1
	ArmyNorth1.strength			= 8
	ArmyNorth1.position			= GetPosition("armyN1")
	ArmyNorth1.rodeLength		= 7000

	SetupArmy(ArmyNorth1)

	ArmyNorth2								= {}

	ArmyNorth2.player 				= 3
	ArmyNorth2.id						= 2
	ArmyNorth2.strength			= 8
	ArmyNorth2.position			= GetPosition("armyN2")
	ArmyNorth2.rodeLength		= 7000

	SetupArmy(ArmyNorth2)

  StartSimpleJob("ArmyNorthControl")

end

--------------------------------------------------------------------------------
--	JOB: Attack after 10 sex
---------------------------------------------------------------------------------------------

function ArmyNorthControl()

-- end attack north job if castle north is destroyed

if baseN == 1 then         
return true
end

	if IsDead(ArmyNorth1) and IsDead(ArmyNorth2) then
		Redeploy(ArmyNorth1,GetPosition("armyN1"),7000)
		Redeploy(ArmyNorth2,GetPosition("armyN2"),7000)
		TMR_ArmyNorth = 0
			
		local troopDescription_1 	= {
			maxNumberOfSoldiers			= 4,
			minNumberOfSoldiers			= 0,
			experiencePoints 				= bridgeNdistroyed+bridgeEdistroyed,
		}
		local troopDescription_2 	= {
			maxNumberOfSoldiers			= 4,
			minNumberOfSoldiers			= 0,
			experiencePoints 				= bridgeNdistroyed+bridgeEdistroyed,
		}
		local troopDescription_3 	= {
			maxNumberOfSoldiers			= 4,
			minNumberOfSoldiers			= 0,
			experiencePoints 				= bridgeNdistroyed+bridgeEdistroyed,
		}

		if bridgeNdistroyed+bridgeEdistroyed < 2 then
			troopDescription_1.leaderType = Entities.PU_LeaderBow1
		else
			troopDescription_1.leaderType = Entities.PU_LeaderBow2
		end
		if bridgeNdistroyed+bridgeEdistroyed < 2 then
			troopDescription_2.leaderType = Entities.PU_LeaderSword1
		else
			troopDescription_2.leaderType = Entities.PU_LeaderSword2
		end
		if bridgeNdistroyed+bridgeEdistroyed < 2 then
			troopDescription_3.leaderType = Entities.PU_LeaderPoleArm1
		else
			troopDescription_3.leaderType = Entities.PU_LeaderPoleArm2
		end
	
		EnlargeArmy(ArmyNorth1,troopDescription_1)
		EnlargeArmy(ArmyNorth2,troopDescription_2)
		EnlargeArmy(ArmyNorth2,troopDescription_3)

	end

	TMR_ArmyNorth = TMR_ArmyNorth + 1

	if TMR_ArmyNorth < 5 then 	

		Defend(ArmyNorth1)
		Defend(ArmyNorth2)

	else

		FrontalAttack(ArmyNorth1,"mycastle")
		FrontalAttack(ArmyNorth2,"mycastle")

	end


	
end

--*********************************[army east]************************************************


function CreateArmyEast()

	ArmyEast								= {}

	ArmyEast.player 				= 3
	ArmyEast.id						= 3
	ArmyEast.strength			= 8
	ArmyEast.position			= GetPosition("armyE")
	ArmyEast.rodeLength		= 7000

	SetupArmy(ArmyEast)

  StartSimpleJob("ArmyEastControl")

end

--------------------------------------------------------------------------------
--	JOB: Attack after 5 sex
---------------------------------------------------------------------------------------------

function ArmyEastControl()

if baseE == 1 then
return true
end
	
	if IsDead(ArmyEast) then
		Redeploy(ArmyEast,GetPosition("armyE"),7000)

		TMR_ArmyEast = 0
			
		local troopDescription_1 	= {
			maxNumberOfSoldiers			= 4,
			minNumberOfSoldiers			= 0,
			experiencePoints 				= bridgeNdistroyed+bridgeEdistroyed,
		}

		local troopDescription_2 	= {
			maxNumberOfSoldiers			= 4,
			minNumberOfSoldiers			= 0,
			experiencePoints 				= bridgeNdistroyed+bridgeEdistroyed,
		}
		if bridgeNdistroyed+bridgeEdistroyed < 2 then
			troopDescription_1.leaderType = Entities.PU_LeaderBow1
		else
			troopDescription_1.leaderType = Entities.PU_LeaderBow2
		end
		if bridgeNdistroyed+bridgeEdistroyed < 2 then
			troopDescription_2.leaderType = Entities.PU_LeaderPoleArm1
		else
			troopDescription_2.leaderType = Entities.PU_LeaderPoleArm2
		end
	
		EnlargeArmy(ArmyEast,troopDescription_2)
		
		if bridgeNdistroyed==1 then
		EnlargeArmy(ArmyEast,troopDescription_1)
		end

	end

	TMR_ArmyEast = TMR_ArmyEast + 1

	if TMR_ArmyEast < 5 then 	

		Defend(ArmyEast)

	else

		FrontalAttack(ArmyEast,"mycastle")

	end


end

--*********************************[army south]************************************************


function CreateArmySouth()

	ArmySouth								= {}

	ArmySouth.player 				= 3
	ArmySouth.id						= 4
	ArmySouth.strength			= 8
	ArmySouth.position			= GetPosition("armyS")
	ArmySouth.rodeLength		= 7000

	SetupArmy(ArmySouth)

  StartSimpleJob("ArmySouthControl")

end

--------------------------------------------------------------------------------
--	JOB: Attack after 5 sex
---------------------------------------------------------------------------------------------

function ArmySouthControl()

if baseS == 1 then
return true
end

	if IsDead(ArmySouth) then
		Redeploy(ArmySouth,GetPosition("armyS"),7000)

		TMR_ArmySouth = 0
			
		local troopDescription_1 	= {
			maxNumberOfSoldiers			= 4,
			minNumberOfSoldiers			= 0,
			experiencePoints 				= bridgeNdistroyed+bridgeEdistroyed,
		}

		local troopDescription_2 	= {
			leaderType 							= Entities.PU_LeaderCavalry2,
			maxNumberOfSoldiers			= 3,
			minNumberOfSoldiers			= 0,
			experiencePoints 				= bridgeNdistroyed+bridgeEdistroyed,
		}
		if bridgeNdistroyed+bridgeEdistroyed < 2 then
			troopDescription_1.leaderType = Entities.PU_LeaderSword1
		else
			troopDescription_1.leaderType = Entities.PU_LeaderSword2
		end
	
		EnlargeArmy(ArmySouth,troopDescription_1)
		
		if bridgeEdistroyed==1 then
		EnlargeArmy(ArmySouth,troopDescription_2)
		end

	end

	TMR_ArmySouth = TMR_ArmySouth + 1

	if TMR_ArmySouth < 5 then 	

		Defend(ArmySouth)

	else

		FrontalAttack(ArmySouth,"mycastle")

	end


	
end

--*****************************[if attackers base is destroyed,the attacks from that base stop]********************

----------------------------------------------------------------------------------
	Condition_endArmyS = function()

	return IsDead("p3castle2")
		
	end
		
-------------------------------------------------------------------------------------------------------------------
	Action_endArmyS = function()
-------------------------------------------------------------------------------------------------------------------
	baseS=1

	return true
	end
----------------------------------------------------------------------------------
	Condition_endArmyE = function()

	return IsDead("tower1") and IsDead("tower2")
		
	end
		
-------------------------------------------------------------------------------------------------------------------
	Action_endArmyE = function()
-------------------------------------------------------------------------------------------------------------------
	baseE=1

	return true
	end
----------------------------------------------------------------------------------
	Condition_endArmyN = function()

	return IsDead("barrack1")
		
	end
		
-------------------------------------------------------------------------------------------------------------------
	Action_endArmyN = function()
-------------------------------------------------------------------------------------------------------------------
	baseN=1

	return true
	end
