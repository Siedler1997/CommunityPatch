createQuestAriFriends = function()

	local i
	for i=1,3 do
		local type = Entities.CU_BanditLeaderSword2
		if i == 2 then
			type = Entities.CU_BanditLeaderBow2
		end

		local pos = GetPosition("AriFriends"..i)
		
		local Leader = Tools.CreateGroup(7, type, 4, pos.X, pos.Y, 180)
		InitNPCLookAt(Leader)
		
		Logic.SetEntityName(Leader, "AriFriendsLeader"..i)
		
		local Quest 			=	{}
		Quest.GiftEntity 		=	Leader
		Quest.ApproachPos 		=	Leader
		if i == 1 then
			Quest.ApproachRange		=	1000
		else
			Quest.ApproachRange		=	500
		end
		
		Quest.Callback			=	FoundAriFriend
	
		SetupRescue(Quest)
	
	end
end

FoundAriFriend = function(_Quest)

	if AriFriendsTalkCount == nil then

		-- Stop moving entity and destroy task
			local movingID = Logic.GetEntityIDByName("Dario")
			if Logic.IsEntityMoving(movingID) then
				Move(movingID, movingID)
			end
			local movingID = Logic.GetEntityIDByName("Erec")
			if Logic.IsEntityMoving(movingID) then
				Move(movingID, movingID)
			end
			local movingID = Logic.GetEntityIDByName("Pilgrim")
			if Logic.IsEntityMoving(movingID) then
				Move(movingID, movingID)
			end
			local movingID = Logic.GetEntityIDByName("Salim")
			if Logic.IsEntityMoving(movingID) then
				Move(movingID, movingID)
			end


		AriFriendsTalkCount = 1

		end6thSubQuest()

	else
		SpokenMessage(String.MainKey.."Message_ArisRobbersFollow")
	end
end