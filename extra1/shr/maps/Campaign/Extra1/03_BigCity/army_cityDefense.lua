
-- attackers at mission start

function CreateArmyCityDefense()

	--	village raiders a

		armyCityDefense						=	{}
	                                    	
		local i                         	
		for i=1,3 do	
	                                    	
			armyCityDefense[i]				=	{}
			armyCityDefense[i].player 		=	2
			-- id 1 - 4 used
			armyCityDefense[i].id			= 	i
			armyCityDefense[i].strength		=	2
			armyCityDefense[i].position		=	GetPosition("CityDefenseSpawn"..i)
			armyCityDefense[i].rodeLength	=	3000
			
			SetupArmy(armyCityDefense[i])
			
		--	create army
				
			local troopDescription = {
			
				maxNumberOfSoldiers	= 12,
				minNumberOfSoldiers	= 4,
				experiencePoints 	= LOW_EXPERIENCE,
			}			
	
			troopDescription.leaderType = Entities.PU_LeaderPoleArm1
			EnlargeArmy(armyCityDefense[i],troopDescription)
			troopDescription.leaderType = Entities.PU_LeaderSword1
			EnlargeArmy(armyCityDefense[i],troopDescription)

		end

	StartSimpleJob("ControlCityDefense")
end

function ControlCityDefense()

	if Counter.Tick2("ControlCityDefense",10) then

		local allDead = true
	
		local i                         	
		for i=1,3 do
	
			if IsAlive(armyCityDefense[i]) then
				FrontalAttack(armyCityDefense[i])
				allDead = false
			end

		end

		return allDead

	end

end
