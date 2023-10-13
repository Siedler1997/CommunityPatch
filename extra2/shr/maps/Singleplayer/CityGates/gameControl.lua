caravan=1
timeForAttack=600
caravanback = 0
caravanback2 =0

bridgeNdistroyed=0
bridgeEdistroyed=0
bridgeSdistroyed=0

wait=10
-------------------------------------------------------------------------------
function start1stQuest()

--Report("start 1st quest")
Logic.SetShareExplorationWithPlayerFlag(1, 7, 1)

createBriefingPrelude()
	
CreateNPCsMAP()
EnableNpcMarker("thief")
--EnableNpcMarker("merchant1")
EnableNpcMarker("merchant2")

createArmySpawn()
CreateArmyNorth()
CreateArmyEast()
CreateArmySouth()

StartJob("endArmyS")
StartJob("endArmyE")
StartJob("endArmyN")

StartJob("bridgeNdown")
StartJob("bridgeEdown")
--StartJob("bridgeSdown")

StartSimpleJob("Quest2")


startQuestVictory()
startQuestDefeat()


end

----------------destroy enemy base
Quest2 = function()

if bridgeNdistroyed==1 and bridgeEdistroyed==1 then
ResolveBriefing(briefing_p)
CreateQ2Briefing()
return true
end

end




---------------------------------------

	-------------------------[is bridge North still alive?]-------------------------------------
	Condition_bridgeNdown = function()

	return bridgeNdistroyed==1
		
	end
	-------------------------------------------------------------------------------------------------------------------
	Action_bridgeNdown = function()

	createGeneralBriefing("bridgeE","bridgeE.attack","Drake")	

	return true

	end

	-------------------------[is bridge East still alive?]-------------------------------------
	Condition_bridgeEdown = function()

	return bridgeEdistroyed==1
		
	end
	-------------------------------------------------------------------------------------------------------------------
	Action_bridgeEdown = function()

	createGeneralBriefing2("bridgeS","bridgeS.attack","tavern","tavern.changeplayer")	

	return true

	end

	-------------------------[is bridge South still alive?]-------------------------------------
	Condition_bridgeSdown = function()

	return IsDead("bridge1")
		
	end
	-------------------------------------------------------------------------------------------------------------------
	Action_bridgeSdown = function()

	createGeneralBriefing("gates","gates.attack","Drake")	

	return true

	end

-------------------------------------------------------------------------------


function CreateNPCsMAP()

	-- setup table for npc
	NPCmerchant1				=	{}
	NPCmerchant1.name 			=	"merchant1"
--	NPCmerchant1.callback			=	CreateNPCBandits1Briefing
	NPCmerchant2				=	{}
	NPCmerchant2.name 			=	"merchant2"
	NPCthief				=	{}
	NPCthief.name 				=	"thief"

	        
	-- create npc
--	CreateNPC(NPCmerchant1)
	CreateNPC(NPCmerchant2)
	CreateNPC(NPCthief)
	   	
end


-------------------------------------------------------------------------------------------------------------------------
--
--						GameCallback_NPCInteraction
--
-------------------------------------------------------------------------------------------------------------------------

GameCallback_NPCInteraction = function(_heroId,_npcId)

	if IsBriefingActive() then
		return
		end

	if Logic.IsHero(_heroId) then

		if _npcId == GetEntityId("thief") then
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("thief")
				CreateBriefingThief()
			--	createGeneralBriefing("thief","thief.quest")
			--	local job = {}
			--	job.Tribute = 1
			--	Logic.AddTribute(	GetHumanPlayer(),
			--						job.Tribute,
			--						0,
			--						0,
			--						String.Key("thief.sulfur"),
			--						ResourceType.Sulfur,
			--						10000 )
			--	job.Callback    = TributePaid1
			--	SetupTributePaid(job)
    			end
	    	end

		if _npcId == GetEntityId("merchant1") then
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) and caravan==1 then
				DisableNpcMarker("merchant1")
				createGeneralBriefing("merchant1","merchant1.quest[1]","trader1")
				local job = {}
				job.Tribute = 2
				Logic.AddTribute(	GetHumanPlayer(),
									job.Tribute,
									0,
									0,
									String.Key("merchant1.tribute[1]"),
									ResourceType.Wood,
									1000 )

				job.Callback = TributePaid2
				SetupTributePaid(job)

			
			elseif IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) and caravan==2 then
				DisableNpcMarker("merchant1")
				createGeneralBriefing("drake","merchant1.quest[2]","trader1")
				local job = {}
				job.Tribute = 3
				Logic.AddTribute(	GetHumanPlayer(),
									job.Tribute,
									0,
									0,
									String.Key("merchant1.tribute[2]"),
									ResourceType.Stone,
									1000 )

				job.Callback = TributePaid2
				SetupTributePaid(job)


    			end
	    	end



		if _npcId == GetEntityId("merchant2") then
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("merchant2")
				createGeneralBriefing("drake","merchant2.info","trader2")

        		end
    		end

        end
    end

-------------------------------------[the thief should blow up some bridge here]--------------------------------------------
TributePaid1 = function()
	
StartSimpleJob("DestroyBridge")

return true

end

---------------------[move thief to bridge, wait, destroy bridge then return]----------------------------------

	DestroyBridge = function()
	
	if bridge ==1 and bridgeNdistroyed==0 then
	Move("thief","bthief1",200)
	sulfurPaid=0
	
		if IsNear("thief","bthief1",200) then
		StartSimpleJob("Wait")
  	--	GUIQuestTools.ToggleStopWatch(wait,1)
		return true
		end
	
	elseif bridge ==2 and bridgeEdistroyed==0 then
	Move("thief","bthief2")

		if IsNear("thief","bthief2",200) then
		StartSimpleJob("Wait")
	--  	GUIQuestTools.ToggleStopWatch(wait,1)
		return true
		end

	end


	end

---------------------[move thief to bridge, wait, destroy bridge then return]----------------------------------

	Wait = function()

	if wait > 0 then
        wait = wait - 1

		if wait == 5 then
		Return()
		end

        return false
	end
	
	if bridge == 1 then
	Logic.CreateEffect(GGL_Effects.FXExplosion, GetPosition("bridge3").X, GetPosition("bridge3").Y,0) --EXPLODE bridgeN
	DestroyEntity("bridge3")
	bridgeNdistroyed=1
	else
	Logic.CreateEffect(GGL_Effects.FXExplosion, GetPosition("bridge2").X, GetPosition("bridge2").Y,0) --EXPLODE bridgeE
	DestroyEntity("bridge2")
	bridgeEdistroyed=1
	end
	


	return true	

	end

---------------------[return thief to the tavern]----------------------------------

	Return = function()

--	Move("thief","tavern1")

	StartSimpleJob("NearTavern")
	


	return true	

	end

----------------------[when thief is Near tavern]--------------------------------

	NearTavern = function()

	Move("thief","tavern1")

	if IsNear("thief","tavern1","50") then
		wait=10
		if bridge==1 then
		EnableNpcMarker("thief")
		return true
		
		elseif bridge==2 then 
		DestroyEntity("thief")
		CreateEntity(1,Entities.PU_Thief,GetPosition("tavern1"),"thief")
		ChangePlayer("tavern",1)
		return true
		end	
	
	

	end

	end
---------------------------------------------


TributePaid2 = function()

	if caravan==1 then
	caravanNPC = CreateEntity(7,Entities.PU_Travelling_Salesman,GetPosition("caravan"),"caravanNpc")
	end

	createGeneralBriefing(caravanNPC,"merchant1.caravan","trader1")
   	GUIQuestTools.ToggleStopWatch(timeForAttack,1)
	StartJob("ControlCaravan")
	StartJob("CaravanReturn")
	StartSimpleJob("CaravanReturnBriefing")
	StartJob("EnableNPCmerchant1")
 	return true
	
	end
---------------------[move caravan after 20 sex either to market 1 or 2 if 2nd time]----------------------------------
	Condition_ControlCaravan = function()

	return Counter.Tick2("ControlCaravan",20)
		
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlCaravan = function()
	-------------------------------------------------------------------------------------------------------------------
	
	if caravan==1 then
	Move(caravanNPC, "market1")
	caravanback = 0

	else
	Move(caravanNPC, "market2")
	caravanback = 0

	end

	return true
	end

	-------------------------[caravan returns after 10 minutes, including the ride home]-------------------------------------
	Condition_CaravanReturn = function()

	return Counter.Tick2("CaravanReturn",530)
		
	end
	-------------------------------------------------------------------------------------------------------------------
	Action_CaravanReturn = function()

	Move(caravanNPC,"caravan")
	caravanback = 1
	return true

	end

	-----------------------------[caravan enters the city gates]----------------------------------------
--[[	Condition_CaravanReturnBriefing = function()

	return IsNear(caravanNPC,"gates",500) and caravanback == 1
		
	end
	-------------------------------------------------------------------------------------------------------------------
	Action_CaravanReturnBriefing = function()

	createGeneralBriefing(caravanNPC,"caravan.returns")
	caravanback2 =caravanback2 + 1
	return true

	end  ]]

	CaravanReturnBriefing = function()

	if IsNear(caravanNPC,"gates",500) and caravanback == 1 then
	createGeneralBriefing3(caravanNPC,"caravan.returns","trader1")
	caravanback2 =caravanback2 + 1
	return true
	end

	end



	-------------------------------[the user receives the sulfur]--------------------------------------------
	Condition_EnableNPCmerchant1 = function()

	return IsNear(caravanNPC,"caravan",500) and caravanback == 1
		
	end
	-------------------------------------------------------------------------------------------------------------------
	Action_EnableNPCmerchant1 = function()
	
--	if caravan == 1 then 
--	caravan=2
--	caravanback=0
--	AddSulfur(10000)
--	EnableNpcMarker("merchant1")

--	elseif caravan==2 then
--	AddSulfur(10000)
--	caravanback=0

--	end

	if caravan == 1 then
	EnableNpcMarker("merchant1")
	end
-----------------------------
if caravanback2 == 2 then 
StartJob("CaravanLeave3")
StartJob("CaravanReturn")
StartSimpleJob("CaravanReturnBriefing")
StartJob("CaravanReturn3")
caravanback2=caravanback2+1
end
-------------------------------
	
	caravan=caravan+1
	caravanback=caravanback-1
	AddSulfur(10000)
		
	return true

	end
