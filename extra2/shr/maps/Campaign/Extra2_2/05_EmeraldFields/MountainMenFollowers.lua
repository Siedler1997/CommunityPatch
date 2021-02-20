---------------------------------------------------------------------------------------

function MountainFollowers()
		local experience = LOW_EXPERIENCE
		local looper = 4
		if CP_Difficulty == 0 then
			experience = experience + 2
			looper = looper + 4
		end

		for i = 1, looper do
			local poscount = i
			if i > 6 then
				poscount = 6
			end
			local pos = GetPosition("MMSpawn"..poscount)
			local Follower = AI.Entity_CreateFormation(1,Entities.CU_VeteranLieutenant,0,0,pos.X,pos.Y,0,0,experience,0)
			SetEntityName(Follower, "Follower"..i)
		end

		--FollowersAreDead=1
		ControlMMSupport()

		--StartJob("MMAreDead")
		StartSimpleJob("MMAreDeadJob")
end

function MMAreDeadJob()
	local looper = (8 - CP_Difficulty * 4)
	local alivecount = 0
	for i = 1, looper do
		if IsAlive("Follower"..i) then
			alivecount = alivecount + 1
		end
	end
	if alivecount == 0 then
		NPCMMLeader()
		return true
	end
end

-------------------------------------------------------------------------------------------

QUESTFollow_DELAY 		=       5
QUESTFollow_COUNTER 		=	QUESTFollow_DELAY  

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimeControler"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimeControler = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if QUESTFollow_COUNTER > 0 then

                   QUESTFollow_COUNTER = QUESTFollow_COUNTER - 1

                   return false

                	elseif QUESTFollow_COUNTER==0 then 

			return true

			end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimeControler = function()
	-------------------------------------------------------------------------------------------------------------------

		ControlMMSupport()

		QUESTFollow_DELAY 		=       5
		QUESTFollow_COUNTER 		=	QUESTFollow_DELAY

		StartJob("TimeControler")

		return true

	end

-------------------------------------------------------------------------------------------

function ControlMMSupport()

	if IsAlive("Follower1") then

		pos1 = GetPosition("Pilgrim")
		pos1.X = pos1.X+600

		Attack("Follower1",pos1)

	end

	if IsAlive("Follower2") then

		pos2 = GetPosition("Pilgrim")
		pos2.Y = pos2.Y+600

		Attack("Follower2",pos2)

	end

	if IsAlive("Follower3") then

		pos3 = GetPosition("Pilgrim")
		pos3.X = pos3.X-600

		Attack("Follower3",pos3)

	end

	if IsAlive("Follower4") then

		pos4 = GetPosition("Pilgrim")
		pos4.Y = pos4.Y-600

		Attack("Follower4",pos4)

	end

	if IsAlive("Follower5") then

		pos5 = GetPosition("Pilgrim")
		pos5.X = pos5.X+600
		pos5.Y = pos5.Y+600

		Attack("Follower5",pos5)

	end

	if IsAlive("Follower6") then

		pos6 = GetPosition("Pilgrim")
		pos6.X = pos6.X-600
		pos6.Y = pos6.Y-600

		Attack("Follower6",pos6)

	end

	if IsAlive("Follower7") then

		pos7 = GetPosition("Pilgrim")
		pos7.X = pos7.X+600
		pos7.Y = pos7.Y-600

		Attack("Follower7",pos7)

	end

	if IsAlive("Follower8") then

		pos8 = GetPosition("Pilgrim")
		pos8.X = pos8.X-600
		pos8.Y = pos8.Y+600

		Attack("Follower8",pos8)

	end

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MMAreDead"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MMAreDead = function()
	-------------------------------------------------------------------------------------------------------------------

                
                return IsDead("Follower1") and IsDead("Follower2") and IsDead("Follower3") and IsDead("Follower4") and IsDead("Follower5") and IsDead("Follower6") and IsDead("Follower7") and IsDead("Follower8")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_MMAreDead = function()
	-------------------------------------------------------------------------------------------------------------------

		FollowersAreDead=0
		NPCMMLeader()

		return true

	end
