function CreateArmyReinforcement()

	-- Init army
	ArmyReinforcement		= {}
		
	ArmyReinforcement				=	{}
	ArmyReinforcement.player 		=	3
	ArmyReinforcement.id			=	1
	ArmyReinforcement.strength		=	8
	ArmyReinforcement.position		=	GetPosition("P2_Army_MerchantIsle_SpawnPoint1")
	ArmyReinforcement.rodeLength	=	2000
	ArmyReinforcement.beAgressive	=	true


	SetupArmy(ArmyReinforcement)
	
	StartSimpleJob("ControlArmyReinforcement")

end

function ControlArmyReinforcement()

	if not HasFullStrength(ArmyReinforcement) then
			

		local troopDescription = {
	
			maxNumberOfSoldiers	= 12,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= MEDIUM_EXPERIENCE,
			leaderType = Entities.PU_LeaderRifle2
		}
	
		EnlargeArmy(ArmyReinforcement,troopDescription)
		
	end
	
    if Counter.Tick2("ControlArmyReinforcement",2) then
	
		if Counter.Tick2("ControlArmyReinforcement2",20) then
			
			Retreat(ArmyReinforcement)
		
		else
		
			FrontalAttack(ArmyReinforcement)

		end

	end	

end