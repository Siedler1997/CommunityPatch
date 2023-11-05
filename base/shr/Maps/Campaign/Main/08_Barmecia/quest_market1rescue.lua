createQuestMarket1Rescue = function()
	Report("Inserting Market1 Rescue Quest")
	KidnapperExpQuest = {}
	
	KidnapperExpQuest.TargetName = "BanditsHQ1"
	KidnapperExpQuest.Distance = 3000
	KidnapperExpQuest.Callback = KidnapperMet
	KidnapperExpQuest.Heroes = 1
	KidnapperExpQuest.Leaders = 1
	KidnapperExpQuest.Serfs = 1
	SetupExpedition(KidnapperExpQuest)
end

	
KidnapperMet = function()
	createBriefingKidnapper()

	Report("Kidnapper met!")
end


BriefingKidnapperFinished = function()
	StartJob("WaitForTribute")
	local Tribute2 = {}
	
	Tribute2.Tribute = 2

	Logic.AddTribute(	GetHumanPlayer(), 
						Tribute2.Tribute,
						0,
						0,
						String.MainKey.."tribute_kidnapper", 
						ResourceType.Gold, 
						1000 )

	
	Tribute2.Callback 	= KidnapperTributePaid
	if(talkedToMarket1NPC == 1) then
		Report("Player got quest before")
	else
		Report("Player didn't get quest before")
		DisableNpcMarker("Market1NPC")
	end
	SetupTributePaid(Tribute2)
	Report("Briefing finished")
end


KidnapperTributePaid = function()
	KidnapperTributeWasPaid = 1
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDRobbers1, Diplomacy.Neutral )
	TraderRescued()
	Report("TributePaid")
end


InitRescueFight = function()
	Logic.SetDiplomacyState( gvMission.PlayerID, gvMission.PlayerIDRobbers1, Diplomacy.Hostile )
	RescueQuest = {}	
	RescueQuest.ApproachPos = "Robbers1Tent1"
	RescueQuest.ApproachRange = 2000
	RescueQuest.Callback = KidnapperKilled
	RescueQuest.Army 	=	ArmyKidnapper
	SetupRescue(RescueQuest)
end


KidnapperKilled = function()
	Logic.RemoveTribute(GetHumanPlayer(), 2)
	TraderRescued()
	return 1
end


TraderRescued = function()
	Report("Trader has been rescued")
	if IsExisting("PrisonCage") then
		DestroyEntity("PrisonCage")
	end
	Move(GetID("TraderMarket1"), GetPosition("Market1TraderPos"))
	if(talkedToMarket1NPC == 1) then
		Report("Player got quest before")
	else
		Report("Player didn't get quest before")
	end
	Trader1Freed = 1
	createBriefingTraderFreed()
end

-------------------------------------------------------------------------------------------------------------------
Condition_WaitForTribute = function()
-------------------------------------------------------------------------------------------------------------------
	return Counter.Tick2("WaitForTribute",20)
end
	
-------------------------------------------------------------------------------------------------------------------
Action_WaitForTribute = function()
-------------------------------------------------------------------------------------------------------------------
	if KidnapperTributeWasPaid == nil then
		InitRescueFight()
	end
	return true		
end

