first_time = true


function conquerCity()

for g = 1,10,1 do

ChangePlayer("gate"..g,2)

end

StartJob("GateDown")
StartJob("Cannons")

end

--------------

Condition_GateDown = function()

return IsDead("gate9") or IsDead("gate10") 

end

Action_GateDown= function()

StartSimpleJob("DetectUnits1")
createArmydef7()
return true
end
------------------

Condition_Cannons = function()

return IsDead("gate5") or IsDead("gate6") or IsDead("gate7") or IsDead("gate8") 

end

Action_Cannons= function()

for p=1,6,1 do
ChangePlayer("c"..p,4)
end
return true
end


------------

DetectUnits1 = function()

	local point = GetPosition("detect_point")
	local Troops1 = {Logic.GetEntitiesInArea(Entities.PU_LeaderBow1,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderBow2,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderBow3,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderBow4,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderCavalry1,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderCavalry2,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderHeavyCavalry1,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderHeavyCavalry2,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderPoleArm1,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderPoleArm2,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderPoleArm3,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderPoleArm4,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderRifle1,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderRifle2,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderSword1,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderSword2,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderSword3,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderSword4,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PV_Cannon1,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PV_Cannon2,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PV_Cannon3,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.PV_Cannon4,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.CU_BlackKnight_LeaderMace2,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.CU_BanditLeaderSword2,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.CU_Barbarian_LeaderClub2,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.CU_Barbarian_Hero,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.CU_BlackKnight,point.X,point.Y,2000,1,1),
			Logic.GetEntitiesInArea(Entities.CU_Mary_de_Mortfichet,point.X,point.Y,2000,1,1),
			}

for g = 1,28,1 do
    if Troops1[g] ~=  0 then
	
	Logic.SetDiplomacyState( 1, 2, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 1, 6, Diplomacy.Neutral )
	createBriefingFight()
	
    return true
    end

end

end




-----------------------------------

HeroicFight = function()

if IsAlive("erec") then

  local HeroID =  GetID("erec")

  if first_time == true then
	if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.9) then
	GUI.SettlerCircularAttack(HeroID)
	first_time = false
	end
  else
	GUI.SettlerCircularAttack(HeroID)
  end

 GUI.SettlerAffectUnitsInArea(HeroID)
end

if IsDead(ker_sup1) and IsDead(ker_sup2) and IsDead(ker_sup3) and IsDead("varg") then
Defeat()
return true

elseif IsDead(erec_sup1) and IsDead(erec_sup2) and IsDead("erec") then
end3rdQuest()
return true	
end

end

---------------------------
HeroicResistance = function()
	if Counter.Tick2("HeroicResistance", 10) then
		if IsDead(ArmyPatrol) and IsDead(ArmyPatrol1) and IsDead(ArmyPatrol2) and IsDead("erec") then
			if CP_Difficulty == 0 then
				end3rdQuest()
				return true
			else
				if CP_Difficulty == 1 then
					if IsDead(ArmyPatrol3) and IsDead(ArmyPatrolCavalry1) and IsDead("helias") then
						end3rdQuest()
						return true
					end
				else
					if IsDead(ArmyPatrol3) and IsDead(ArmyPatrolCavalry1) and IsDead(ArmyPatrolCavalry2) and IsDead(ArmyPatrolCavalry3) and IsDead("helias") then
						end3rdQuest()
						return true
					end
				end
			end
		elseif ErecOnTheMove == 1 then
			if IsAlive("erec") then
				Attack("erec","my_castle")
				local ErecID =  GetID("erec")
				if CP_Difficulty == 2 and Logic.GetEntityHealth(ErecID) <= (Logic.GetEntityMaxHealth(ErecID) * 0.95) then
					if AreEnemiesInArea(GetPlayer("erec"), GetPosition("erec"), 400) then
						GUI.SettlerCircularAttack(ErecID)
					end
					if AreEnemiesInArea(GetPlayer("erec"), GetPosition("erec"), 2000) then
						GUI.SettlerAffectUnitsInArea(ErecID)
					end
				end
			end
			if IsAlive("helias") then
				Attack("helias","my_castle")
				local HeliasID =  GetID("helias")
				if CP_Difficulty == 2 and Logic.GetEntityHealth(HeliasID) <= (Logic.GetEntityMaxHealth(HeliasID) * 0.95) then
					if AreEnemiesInArea(GetPlayer("helias"), GetPosition("helias"), 2000) then
						GUI.SettlerAffectUnitsInArea(HeliasID)
					end
				end
			end
		end
	end
end


