
createQuestDestroyLionsDen = function()

	StartJob("QuestDestroyLionsDen")

	end


-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "QuestDestroyLionsDen"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestDestroyLionsDen = function()
	-------------------------------------------------------------------------------------------------------------------
		
		local kerberosCastle = Logic.GetEntityIDByName("lionsDen")

		-- won if castle is burning or destroyed
		if	kerberosAppeared == nil and 
			Logic.GetEntityHealth(kerberosCastle) < (Logic.GetEntityMaxHealth(kerberosCastle) * 0.5) then

			CreateEntity(5, Entities.CU_BlackKnight, GetPosition("defend1"), "Kerberos" )
			Sound.PlayGUISound(Sounds.VoicesHero7_HERO7_Attack_rnd_01)
			
			kerberosAppeared = true
			StartSimpleJob("ControlKerberos")
		end
			
		return IsDead("lionsDen")		
		
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestDestroyLionsDen = function()
	-------------------------------------------------------------------------------------------------------------------
		
		endQuestDestroyLionsDen()
		
		return true
		
		end
-----------------------------------------------------------------------------------------------------------------------	

function ControlKerberos()
	if IsAlive("Kerberos") then
		if AreEnemiesInArea(GetPlayer("Kerberos"), GetPosition("Kerberos"), 1000) then
			local HeroID = GetEntityId("Kerberos")
			if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.9) then
				GUI.SettlerAffectUnitsInArea(HeroID)
			end
			if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.5) then
				GUI.SettlerInflictFear(HeroID)
			end
		end
	end
end