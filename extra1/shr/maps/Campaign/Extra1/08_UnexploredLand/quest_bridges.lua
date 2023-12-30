NECESSARY_BRIDGE_COUNT = 4
BridgeCount = 0

function CreateQuestBridges()

	GUIQuestTools.StartQuestInformation("Bridge", "CM02_08_UnexploredLand/QI_bridges", 1, 1)	
	GUIQuestTools.UpdateQuestInformationString(BridgeCount  .. "/" .. NECESSARY_BRIDGE_COUNT)


	for i=1,NECESSARY_BRIDGE_COUNT do

		local position = GetPosition("Bridge"..i)
		local BridgeType
		
		if i ~= 2 then
			BridgeType = Entities.PB_Bridge2
		else
			BridgeType = Entities.PB_Bridge1
		end
		
		Trigger.RequestTrigger( Events.LOGIC_EVENT_EVERY_SECOND,
								nil,
								"BridgeBuildTest",
								1,
								nil,
								{ position.X, position.Y, i, BridgeType } )
	end
	
	StartSimpleJob("AllBridgesBuild")	

end

function BridgeBuildTest( _x, _y, _index, _type)

	local count, BridgeId = Logic.GetEntitiesInArea(_type, _x, _y, 1000, 1)

	if BridgeId ~= 0 and Logic.IsConstructionComplete(BridgeId) == 1 then
		
		BridgeCount = BridgeCount + 1
		
		GUIQuestTools.UpdateQuestInformationString(BridgeCount  .. "/" .. NECESSARY_BRIDGE_COUNT)
		
		RedeployArmyBridges(_index)
		
		ResolveBriefing(_G["briefingBridgesShowBridge".._index])
				
		return true
	end

end


function AllBridgesBuild()

	if IsBriefingActive() then
		return false
	end

	if BridgeCount >= NECESSARY_BRIDGE_COUNT then
		GUIQuestTools.DisableQuestInformation()
		end2ndChapter()
		return true
	end

end

function IsBridgeQuestDone()

	return BridgeCount >= NECESSARY_BRIDGE_COUNT

end