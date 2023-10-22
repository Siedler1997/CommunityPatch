---------------------------------
------Dario ch 1



spawnDario = function()

Dario = CreateEntity(1,Entities.PU_Hero1c,GetPosition("CUTSCENE_INTRO_E3"),"Dario")


end


createBriefingSummonKeeper = function()
if IsDead("Dario") then 
			local pos = GetPosition("Dario")
			DestroyEntity("Dario")
			CreateEntity(1, Entities.PU_Hero1c, pos, "Dario" )
		end


BriefingSummonKeeper = 	{}

	BriefingSummonKeeper.finished = BriefingSummonKeeperFinished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingSummonKeeper[page] 					= 	{}
		BriefingSummonKeeper[page].title				= 	String.Key("BriefingSummonKeeper[1].title") 
		BriefingSummonKeeper[page].text					=	String.Key("BriefingSummonKeeper[1].text")
		BriefingSummonKeeper[page].position				=	GetPosition("Dario")
		--BriefingSummonKeeper[page].explore				=	10000


	
		--	page 2
		page = page +1
	
	
		BriefingSummonKeeper[page] 					= 	{}
		BriefingSummonKeeper[page].title				= 	String.Key("BriefingSummonKeeper[2].title") 
		BriefingSummonKeeper[page].text					=	String.Key("BriefingSummonKeeper[2].text")
		BriefingSummonKeeper[page].position				=	GetPosition("Dario")
		--BriefingSummonKeeper[page].explore				=	1000


		




briefingTerminatSummonKeeper = BriefingSummonKeeper[page]

StartBriefing(BriefingSummonKeeper)



end


BriefingSummonKeeperFinished = function ()
keepman = 0
createNpcKeeeper()
createBriefingKeeperSummoned ()

end


createBriefingKeeperSummoned = function ()

BriefingKeeperSummoned = 	{}

	BriefingKeeperSummoned.finished = BriefingKeeperSummonedFinished


	local page=0	

		--	page 1
	
		page = page +1
	
		BriefingKeeperSummoned[page] 					= 	{}
		BriefingKeeperSummoned[page].title				= 	String.Key("BriefingKeeperSummoned[1].title") 
		BriefingKeeperSummoned[page].text				=	String.Key("BriefingKeeperSummoned[1].text")
		BriefingKeeperSummoned[page].position				=	GetPosition("Dario")
		--BriefingKeeperSummoned[page].explore				=	10000


	
		--	page 2

		page = page +1
	
	
		BriefingKeeperSummoned[page] 					= 	{}
		BriefingKeeperSummoned[page].title				= 	String.Key("BriefingKeeperSummoned[2].title") 
		BriefingKeeperSummoned[page].text				=	String.Key("BriefingKeeperSummoned[2].text")
		BriefingKeeperSummoned[page].position				=	GetPosition("keeper")
		--BriefingKeeperSummoned[page].explore				=	1000



		--	page 3

		page = page +1
	
	
		BriefingKeeperSummoned[page] 					= 	{}
		BriefingKeeperSummoned[page].title				= 	String.Key("BriefingKeeperSummoned[3].title") 
		BriefingKeeperSummoned[page].text				=	String.Key("BriefingKeeperSummoned[3].text")
		BriefingKeeperSummoned[page].position				=	GetPosition("Dario")
		--BriefingKeeperSummoned[page].explore				=	1000



		--	page 4

		page = page +1
	
	
		BriefingKeeperSummoned[page] 					= 	{}
		BriefingKeeperSummoned[page].title				= 	String.Key("BriefingKeeperSummoned[4].title") 
		BriefingKeeperSummoned[page].text				=	String.Key("BriefingKeeperSummoned[4].text")
		BriefingKeeperSummoned[page].position				=	GetPosition("keeper")
		--BriefingKeeperSummoned[page].explore				=	1000


		




briefingTerminatKeeperSummoned = BriefingKeeperSummoned[page]

StartBriefing(BriefingKeeperSummoned)

end


BriefingKeeperSummonedFinished = function()
fire = 0
nh = 0
bt = 0
nv = 0
keepman = 1
DestroyEntity("Dario")
Dario = CreateEntity(1,Entities.PU_Hero1c,GetPosition("doorpass"),"Dario")
health = 600
StartSimpleJob("IsDarioDead")
StartSimpleJob("IsDarioNearFire")
StartSimpleJob("IsDarioNearHill")
StartSimpleJob("IsDarioNearTown")
--StartSimpleJob("IsDarioNearHeat")



end



--[[IsDarioNearHeat = function()

	local pos = GetPosition("firealtar")
	
	if AreEntitiesInArea(1,Entities.PU_Hero1c, pos, 2500,1) == true 
			then 
				if health > 0 then health = health - 20
				SetHealth("Dario",health)
				end
				return false

			elseif fire == 1 then return true
				else StartSimpleJob("IsDarioNearHeat")

	end
end]]




IsDarioNearHill = function()

if IsNear("Dario","freshair",2000) and nh == 0 and IsDead("deadBarb2") and  IsDead("deadWolf1") then createBriefingUpHill()
					return true
end

end


IsDarioNearTown =  function ()

if IsNear("Dario","burningtown",2000) and bt == 0 then createBriefingLemtrathos()
	return true
end

end



IsDarioDead = function()

if IsDead("Dario") and fire == 0 then 
				
				DestroyEntity("Dario")
				Dario = CreateEntity(1,Entities.PU_Hero1c,GetPosition("dariosummons"),"Dario")
				createBriefingDarioDead()
				
				return true

end

end


IsDarioNearFire = function()

if IsNear("Dario", "firealtar",500) then fire = 1 
					StartSimpleJob("fireOn")
					
					firepulse = 2
					DestroyEntity("door1")
					EndJob("IsDarioDead")
					quest2 = 1
					createBriefingFireAltar()
					return true

end
end

fireOn = function ()

if firepulse == 0 then 
Logic.CreateEffect(GGL_Effects.FXDarioFear, GetPosition("firealtar").X, GetPosition("firealtar").Y,0)
firepulse = 2
else firepulse = firepulse - 1
end
end




createBriefingUpHill = function()

BriefingUpHill = 	{}

	BriefingUpHill.finished = BriefingUpHillFinished
	BriefingUpHill.restoreCamera = true
	
	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingUpHill[page] 					= 	{}
		BriefingUpHill[page].title				= 	String.Key("BriefingUpHill[1].title") 
		BriefingUpHill[page].text				=	String.Key("BriefingUpHill[1].text")
		BriefingUpHill[page].position				=	GetPosition("showhill")
		BriefingUpHill[page].explore				=	1000


	
		
briefingTerminatUpHill = BriefingUpHill[page]

StartBriefing(BriefingUpHill)

end

BriefingUpHillFinished = function()
StartSimpleJob("IsDarioUpTheHill")
nh= 1
end


IsDarioUpTheHill = function ()

if IsNear("Dario","newvillage",1800) and nv == 0 then briefingNewVillage()
	return true
	end
end


createBriefingLemtrathos = function()

BriefingLemtrathos = 	{}

	BriefingLemtrathos.finished = BriefingLemtrathosFinished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingLemtrathos[page] 					= 	{}
		BriefingLemtrathos[page].title					= 	String.Key("BriefingLemtrathos[1].title") 
		BriefingLemtrathos[page].text					=	String.Key("BriefingLemtrathos[1].text")
		BriefingLemtrathos[page].position				=	GetPosition("Dario")
		--BriefingLemtrathos[page].explore				=	1000


	
		
briefingTerminatLemtrathos = BriefingLemtrathos[page]

StartBriefing(BriefingLemtrathos)


end

BriefingLemtrathosFinished = function()
bt = 1
end




createBriefingFireAltar = function()

BriefingFireAltar= {}
BriefingFireAltar.finished = BriefingFireAltarFinished
BriefingFireAltar.restoreCamera = true



	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingFireAltar[page] 						= 	{}
		BriefingFireAltar[page].title						= 	String.Key("BriefingFireAltar[1].title") 
		BriefingFireAltar[page].text						=	String.Key("BriefingFireAltar[1].text")
		BriefingFireAltar[page].position					=	GetPosition("Dario")
		--BriefingFireAltar[page].explore					=	10000


	--	page 2
	
		page = page +1
	
		BriefingFireAltar[page] 						= 	{}
		BriefingFireAltar[page].title						= 	String.Key("BriefingFireAltar[2].title") 
		BriefingFireAltar[page].text						=	String.Key("BriefingFireAltar[2].text")
		BriefingFireAltar[page].position					=	GetPosition("keeper")
		BriefingFireAltar[page].explore						=	1000

	
		
briefingTerminatFireAltar = BriefingFireAltar[page]

StartBriefing(BriefingFireAltar)



end


BriefingFireAltarFinished = function()

ResolveBriefing(briefingTerminatSecondMiracle)

local p = 0 
for p=1,14,1 do
	SetHealth("burn"..p,0)
end

createNpcKeeper2()

end



createBriefingDarioDies = function()

BriefingDarioDies= {}
BriefingDarioDies.finished = BriefingDarioDiesFinished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingDarioDies[page] 						= 	{}
		BriefingDarioDies[page].title						= 	String.Key("BriefingDarioDies[1].title") 
		BriefingDarioDies[page].text						=	String.Key("BriefingDarioDies[1].text")
		BriefingDarioDies[page].position					=	GetPosition("keeper")
		--BriefingDarioDies[page].explore					=	10000


	--	page 2
	
		page = page +1
	
		BriefingDarioDies[page] 						= 	{}
		BriefingDarioDies[page].title						= 	String.Key("BriefingDarioDies[2].title") 
		BriefingDarioDies[page].text						=	String.Key("BriefingDarioDies[2].text")
		BriefingDarioDies[page].position					=	GetPosition("Dario")
		--BriefingDarioDies[page].explore					=	10000

	
		
briefingTerminatDarioDies = BriefingDarioDies[page]

StartBriefing(BriefingDarioDies)


end


BriefingDarioDiesFinished = function()
DestroyEntity("Dario")
Dario = CreateEntity(1,Entities.PU_Hero1c,GetPosition("doorpass"),"Dario")
StartSimpleJob("IsDarioDead")

end