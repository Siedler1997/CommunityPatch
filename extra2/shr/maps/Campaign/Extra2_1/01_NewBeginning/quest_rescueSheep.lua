MAX_RESCUE_SHEEP_COUNT = 10
NECESSARY_SHEEP_COUNT = 6

SHEEP_PATROL = 0

function CreateQuestRescueSheep()

	StartSimpleJob("QuestRescueSheep")

	SheepDeadCounter = 0
	SheepRescuedCounter = 0
	
	sheepFollowTarget = "Drake"
	
	--Activate and Update QuestInformation
	GUIQuestTools.StartQuestInformation("Sheep", "CM03_01_NewBeginning/QI_rescueSheep", 1, 1)	
	UpdateAmountOfRescuedAndDeadSheepInQuestInformation()
	
end

function QuestRescueSheep()

	if not IsBriefingActive() and not IsCutsceneActive() then

		destroySheepQuest 		= 	{}
		
		for i=1,MAX_RESCUE_SHEEP_COUNT do
			
			local SheepName = "sheep"..i
						
			CreateSheepNPC(SheepName)

			-- destroy quest
			destroySheepQuest[i]			=	{}
			destroySheepQuest[i].Target 	= 	SheepName
			destroySheepQuest[i].Callback 	= 	RescueSheepDiedCallback
		
			SetupDestroy(destroySheepQuest[i])	
		
			-- expedition quest
			local expeditionQuest 			= 	{}
			expeditionQuest.EntityName 		= 	SheepName
			expeditionQuest.TargetName		=	"sheepDest"
			expeditionQuest.Distance		=	2000
			expeditionQuest.Callback		=	RescueSheepHQReachedCallback
			expeditionQuest.linkToDestroy 	= 	destroySheepQuest[i]
			
			SetupExpedition(expeditionQuest)
			
			-- Sheep can be attacked
--			SetHostile(2,3)
			
		end
		
		return true
		
	end		

end

function RescueSheepHQReachedCallback(_Quest)

	DestroyQuest(_Quest.linkToDestroy)

	-- give resources to player
	AddGold(100)
--	SpokenMessage(String.Key("M_RescueSheepHQReachedCallback"))
--	ChangePlayer(_Quest.EntityName, 1)
	
	local npc = {}
	npc.name = _Quest.EntityName
	DestroyNPC(npc)

	-- move sheep to new position
	SHEEP_PATROL = SHEEP_PATROL + 1
	
	Move(_Quest.EntityName, GetPosition("sheepPatrol"..SHEEP_PATROL))

	SheepRescuedCounter = SheepRescuedCounter + 1
	
	if SheepRescuedCounter >= NECESSARY_SHEEP_COUNT then
		SetAllSheepRescued()
	else
		--UpdateQuestInformationCounter
		UpdateAmountOfRescuedAndDeadSheepInQuestInformation()
	end	
		
end

function SetAllSheepRescued()

	allSheepRescued = true
	
	--Disable QuestInformation
	GUIQuestTools.DisableQuestInformation()

	-- Disable lost condition
	if RescueQuestDefeatId ~= nil then
		
		for i=1,table.getn(RescueQuestDefeatId) do
			
			RemoveDefeatCondition(RescueQuestDefeatId[i])
		
		end
		
	end
	
end

function AllSheepRescued()

	return allSheepRescued == true

end

function RescueSheepDiedCallback(_Quest)

	SheepDeadCounter = SheepDeadCounter + 1
	
	-- Only one left
	if (SheepDeadCounter + NECESSARY_SHEEP_COUNT) == MAX_RESCUE_SHEEP_COUNT then
		
		SpokenMessage(String.Key("RescueSheepDiedCallback"))

		RescueQuestDefeatId = {}

		-- Search alive one
		for i=1,MAX_RESCUE_SHEEP_COUNT do
			
			if IsAlive("sheep"..i) then
				table.insert(RescueQuestDefeatId, AddDefeatEntity("sheep"..i, true))
			end
			
		end
		
	elseif (SheepDeadCounter + NECESSARY_SHEEP_COUNT) > MAX_RESCUE_SHEEP_COUNT then
		
		Defeat()
		
	end
	
end

function CreateSheepNPC(_name)

	local recreateSheepNPC = {}
	recreateSheepNPC.name = _name
	
	if sheepFollowTarget ~= nil then
		recreateSheepNPC.follow = sheepFollowTarget
	end
	recreateSheepNPC.callback = RescueSheepNPCCallback

	CreateNPC(recreateSheepNPC)
	
end

function RescueSheepNPCCallback(_npc, _hero)

--	SpokenMessage(String.Key("RescueSheepNPCCallback"))
	
	local sheepSound = {}
	sheepSound[1] = Sounds.AmbientSounds_Sheep_rnd_1
	sheepSound[2] = Sounds.AmbientSounds_Sheep_rnd_2
	sheepSound[3] = Sounds.AmbientSounds_Sheep_rnd_3
	
	Sound.Play2DSound(sheepSound[GetRandom(1,3)], 0,127)
	
	-- set target
	sheepFollowTarget = Logic.GetEntityName(_hero)
	
	-- recreate npcs
	
	for i=1,MAX_RESCUE_SHEEP_COUNT do
		
		local SheepName = "sheep"..i	

		if IsAlive(SheepName) then

			CreateSheepNPC(SheepName)
			
		end
		
	end

end


function UpdateAmountOfRescuedAndDeadSheepInQuestInformation()	
	GUIQuestTools.UpdateQuestInformationString(SheepRescuedCounter .. "/" .. NECESSARY_SHEEP_COUNT)
end