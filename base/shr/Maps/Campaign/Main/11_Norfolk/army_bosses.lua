function SetupBossesWinterGather()
	local istDa = 0
	local istTot = false

	if IsExisting("P2_Boss") then
		if not IsNear("P2_Boss", "P2_WinterGather", 500) then
			Attack("P2_Boss", GetPosition("P2_WinterGather"))
		else
			LookAt("P2_Boss", "P2_WinterAttack")
			istDa = istDa + 1
		end
	else
		istTot = true
	end
	if IsAlive("P4_Boss") then
		if not IsNear("P4_Boss", "P4_WinterGather", 500) then
			Attack("P4_Boss", GetPosition("P4_WinterGather"))
		else
			LookAt("P4_Boss", "P4_WinterAttack")
			istDa = istDa + 1
		end
	end

	if (istDa == 2) or (istDa == 1 and istTot == true) then
		return true
	end
end

function ControlBossesWinterAttack()
	BossUseHeroAbility()
	if Counter.Tick2("ControlBossesWinterAttack", 5) then
		return BossesDoAttack();
	end
end

function BossesDoAttack()
	local bossesAlive = 0
	local bothDead = false

	if IsAlive("P4_Boss") then
		bossesAlive = bossesAlive + 1
		Attack("P4_Boss", GetPosition("P4_WinterAttack"))
	end
	if IsExisting("P2_Boss") then
		bossesAlive = bossesAlive + 1
		Attack("P2_Boss", GetPosition("P2_WinterAttack"))
	end

	if bossesAlive == 0 then
		bothDead = true
	end

	return bothDead
end

function BossUseHeroAbility()
	if IsAlive("P4_Boss") then
		if AreEnemiesInArea(GetPlayer("P4_Boss"), GetPosition("P4_Boss"), 2000) then
			local HeroID = GetEntityId("P4_Boss")
			if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.9) then
				GUI.SettlerSummon(HeroID)
			end

			GUI.SettlerAffectUnitsInArea(HeroID)
		end
	end
	if IsExisting("P2_Boss") then
		if AreEnemiesInArea(GetPlayer("P2_Boss"), GetPosition("P2_Boss"), 2000) then
			if GetRandom(1, 100) > 90 then
				CreateEntity(2,Entities.XD_Bomb1,GetPosition("P2_Boss"))
			end
		end
	end
end