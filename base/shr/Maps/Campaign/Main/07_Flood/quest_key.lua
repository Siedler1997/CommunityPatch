
createQuestKey = function()

--	oneTimeMessageOutput  = true

	ariHasTheKey = false

	Report("quest: key now created!")

	InitNPC("merchant3")
	SetNPCLookAtTarget("merchant3",1)
	EnableNpcMarker("merchant3")
	end

destroyQuestKey = function()

	DisableNpcMarker("merchant3")

	end

	
createQuestSearchChest = function()
-- Ari in Barmecia spawnen lassen

	Report("quest: search chest with ari")

	DestroyEntity("AriInCage")
	CreateEntity(GetHumanPlayer(),Entities.PU_Hero5,GetPosition("Cutscene1AriSpawn"),"Ari")
	CreateEntity(3, Entities.PU_LeaderPoleArm1, GetPosition("Cutscene1Guard1Spawn"), "Cutscene1Guard1" )
	CreateEntity(3, Entities.PU_LeaderPoleArm1, GetPosition("Cutscene1Guard2Spawn"), "Cutscene1Guard2" )
 
       	local ID = GetID("Cutscene1Guard1")
	Logic.RotateEntity(ID, 180)
       	local ID = GetID("Cutscene1Guard2")
	Logic.RotateEntity(ID, 180)
 
	local EntityID = GetID("Ari")
	Logic.RotateEntity(EntityID,180)
 	GUI.SetSelectedEntity(EntityID)

	questSearchChest = {}
	
	CreateEntity(0,Entities.XD_Sparkles,GetPosition("entry"),"cave")
	
	StartJob("QuestEnterCleycourt")	

	end
	
destroyQuestSearchChest = function()

	ariHasTheKey = true
--	ResolveBriefing(briefingMerchant3[page_Key])

	InitNPC("merchant3")
	SetNPCLookAtTarget("merchant3",1)
	EnableNpcMarker("merchant3")

	end	
	
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "QuestEnterCleycourt"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestEnterCleycourt = function()
	-------------------------------------------------------------------------------------------------------------------
	
		return IsNear("Ari","entry",500)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestEnterCleycourt = function()
	-------------------------------------------------------------------------------------------------------------------

		Report("Ari enters Cleycourt")
--Ari in Cleycourt	
		BackupPositionChest1 = GetPosition("chest1")
		BackupPositionChest2 = GetPosition("chest2")
		BackupPositionChest3 = GetPosition("chest3")
		KeyAlreadyFound = false
	
		AriInCleyCourt = true
		createQuestAriDead()
		SetPosition("Ari",GetPosition("exit"))

		local PosX, PosY = Tools.GetPosition("exit")
		Camera.ScrollSetLookAt(PosX, PosY)


		if IsDead("cave") == false then
			DestroyEntity("cave")
		end

		StartJob("QuestSearchChest")	
		StartJob("QuestSearchDummyChest1")	
		StartJob("QuestSearchDummyChest2")	
		
		return true
		
		end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "QuestSearchChest"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestSearchChest = function()
	-------------------------------------------------------------------------------------------------------------------
	
		return IsNear("Ari","chest3",500) and KeyAlreadyFound == false
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestSearchChest = function()
	-------------------------------------------------------------------------------------------------------------------

--		Report("Ari opens chest")
--		Message(XGUIEng.GetStringTableText(String.MainKey.."chest_KeyFound"))


		if briefingChestFoundCreated == nil 
			then
				createBriefingChestFound()
				briefingChestFoundCreated = true
			end

		StartBriefing(briefingChestFound)

		KeyAlreadyFound = true		
		CreateEntity(0,Entities.XD_Sparkles,GetPosition("exit"),"cave")
		
		DestroyEntity("chest3")
		CreateEntity(0,Entities.XD_ChestOpen,BackupPositionChest3,"chest3")

--		ReplaceEntity("chest3",Entities.XD_ChestOpen)
		
		StartJob("QuestExitCleycourt")	
		
		return true
		
		end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "QuestSearchDummyChest1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestSearchDummyChest1 = function()
	-------------------------------------------------------------------------------------------------------------------
	
		return IsNear("Ari","chest1",500)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestSearchDummyChest1 = function()
	-------------------------------------------------------------------------------------------------------------------

--		Message("- Empty -")
		if EmptyChest1AlreadyFound ~= true then
			SpokenMessage(String.MainKey.."chest_EmptyChest1")
			EmptyChest1AlreadyFound = true
		end
		
		DestroyEntity("chest1")
		CreateEntity(0,Entities.XD_ChestOpen,BackupPositionChest1,"chest1")
--		ReplaceEntity("chest1",Entities.XD_ChestOpen)
		
		return true
		
		end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "QuestSearchDummyChest2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestSearchDummyChest2 = function()
	-------------------------------------------------------------------------------------------------------------------
	
		return IsNear("Ari","chest2",500)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestSearchDummyChest2 = function()
	-------------------------------------------------------------------------------------------------------------------

--		Message("- Empty -")
		if EmptyChest2AlreadyFound ~= true then
			SpokenMessage(String.MainKey.."chest_EmptyChest2")
			EmptyChest2AlreadyFound = true
		end

		DestroyEntity("chest2")
		CreateEntity(0,Entities.XD_ChestOpen,BackupPositionChest2,"chest2")
--		ReplaceEntity("chest2",Entities.XD_ChestOpen)
		
		return true
		
		end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "QuestExitCleycourt"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestExitCleycourt = function()
	-------------------------------------------------------------------------------------------------------------------
	
		return IsNear("Ari","exit",500) and KeyAlreadyFound == true
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestExitCleycourt = function()
	-------------------------------------------------------------------------------------------------------------------

		Report("Ari exits Cleycourt")
		AriInCleyCourt = false
		SetPosition("Ari",GetPosition("AriRespawn"))
		
		local PosX, PosY = Tools.GetPosition("entry")
		Camera.ScrollSetLookAt(PosX, PosY)

		if IsDead("cave") == false then
			DestroyEntity("cave")
			ReplaceEntity("entry",Entities.XD_Rock7)
			end
		
		destroyQuestSearchChest()
--		StartJob("QuestGoBackToTrader")	

		
		return true
		
		end

		

	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestEnterCleycourtForbidden = function()
	-------------------------------------------------------------------------------------------------------------------
	
		return IsNear("Dario","entry",500) or IsNear("Helias","entry",500) or IsNear("Erec","entry",500)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestEnterCleycourtForbidden = function()
	-------------------------------------------------------------------------------------------------------------------

		EntryCounter = EntryCounter + 1
		if EntryCounter >=5 then 
			EntryCounter = 5
		end
					
		SpokenMessage(String.MainKey.."CaveEntryForbidden"..EntryCounter)
		
		StartJob("QuestEnterCleycourtForbiddenDelay")	

		return true

		end
		
	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestEnterCleycourtForbiddenDelay = function()
	-------------------------------------------------------------------------------------------------------------------
	
		return Counter.Tick2("DelayDummy",5)				
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestEnterCleycourtForbiddenDelay = function()
	-------------------------------------------------------------------------------------------------------------------
		
		StartJob("QuestEnterCleycourtForbidden")	

		return true

		end
		
		
		
--	------------------------------------------------------------------------------------------------------------------
--	Condition_QuestEnterCleycourtForbidden = function()
--	-------------------------------------------------------------------------------------------------------------------
--	
--		return true
--		
--		end
--		
--	-------------------------------------------------------------------------------------------------------------------
--	Action_QuestEnterCleycourtForbidden = function()
--	-------------------------------------------------------------------------------------------------------------------
--
--		if IsNear("Dario","entry",500) then
--		
--			if oneTimeMessageOutput == true then 
--			
--				Message(XGUIEng.GetStringTableText(String.MainKey.."CaveEntryForbidden"..EntryCounter))
--				
--				oneTimeMessageOutput = false
--				
--				end
--			
--		else 
--			
--			oneTimeMessageOutput = true
--				
--			end
--			
--		return false
--					
--		end
--		
