function CreateArmyMerchantAttack()

	-- Init army
	ArmyMerchantAttack				= {}

	ArmyMerchantAttack.player 			=	5
	ArmyMerchantAttack.id				=	0
	ArmyMerchantAttack.strength			=	5
	ArmyMerchantAttack.position			=	GetPosition("P2_Army_MerchantIsle_SpawnPoint1")
	ArmyMerchantAttack.rodeLength		=	2000
	ArmyMerchantAttack.beAgressive		=	true

	SetupArmy(ArmyMerchantAttack)

	-- Is player near position
	local Quest 		=	{}
	Quest.Heroes		=	true
	Quest.Leaders		=	true
	Quest.Serfs			=	true
	Quest.TargetName	=	"Trigger_P2_ArmyNorth_1"
	Quest.Distance		=	2000
	Quest.Callback		=	SpawnMerchantAttackTroops
	
	SetupExpedition(Quest)
	
end
	
function SpawnMerchantAttackTroops()

	local randomPos = GetRandom(1,2)

	ArmyMerchantAttack.position		=	GetPosition("P2_Army_MerchantIsle_SpawnPoint"..randomPos)


	local troopDescription = {

		maxNumberOfSoldiers	= 16,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= CP_Difficulty,
	}

	troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
	EnlargeArmy(ArmyMerchantAttack,troopDescription)
	EnlargeArmy(ArmyMerchantAttack,troopDescription)
	EnlargeArmy(ArmyMerchantAttack,troopDescription)

	troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
	EnlargeArmy(ArmyMerchantAttack,troopDescription)
	EnlargeArmy(ArmyMerchantAttack,troopDescription)
	
	SpawnAllArmyAttackers()
	
	StartSimpleJob("ControlMerchantAttackTroops")
	
end
		
function ControlMerchantAttackTroops()

	if IsDead(ArmyMerchantAttack) then
		return true
	end
	
    if Counter.Tick2("ControlMerchantAttackTroops",5) then

		Advance(ArmyMerchantAttack)
		
	end	

end