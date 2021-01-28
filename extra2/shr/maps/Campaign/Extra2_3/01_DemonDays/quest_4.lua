
----------------------------------------------------------------------------------------------------
----------------------------<< QUEST 4 STUFF>>------------------------------------------------------

------------------->sets invulnerability for wolf
function lup()

if IsAlive("wolf") then

local lup = Logic.GetEntityIDByName("wolf")
Logic.SetEntityInvulnerabilityFlag(lup,1)

end

if w >= 4 then

Logic.SetEntityInvulnerabilityFlag(lup,0)
return true

end

end


--***********[meeting the wolf 2 times]****************

Condition_WolfHunt = function()

	return IsNear("kerberos","wolf",1500)

end

Action_WolfHunt = function()

	if w == 0 then 
	createGeneralBriefing("kerberos","wolf.spoted")	
	end

	if w < 4 then 

	StartSimpleJob("WolfHuntTimer")
	 
	elseif w >= 4 then
	
	StartJob("WolfPack") 
	
	end

	return true
end

--***********[wolf fights for 12 seconds then run]************

WolfHuntTimer = function()


if TIMER > 12 then

TIMER = 0
w = w + 1
StartSimpleJob("MoveWolf")
StartSimpleJob("TeleportWolf")
return true

else 
TIMER = TIMER + 1
end

end

--***************[teleport wolf]******************************

function MoveWolf()

Move("wolf","wolf_run"..w)
if IsNear("wolf","wolf_run"..w,50) then
return true
end


end

function TeleportWolf()

if IsNear("wolf","wolf_run"..w,50) then

w = w + 1
SetPosition("wolf",GetPosition("wolf_run"..w))
	if w == 2 then
	createGeneralBriefing("wolf_run1","wolf.lost")
	end
StartJob("WolfHunt")
return true

end

end

--***********[Wolf Habitat area limits]************************

function WolfArea()

if IsNear("wolf","wolf_area1",1000) or IsNear("wolf","wolf_area2",1000) or IsNear("wolf","wolf_area3",1000) then
Move("wolf","wolf_run"..w) 
end

end

--***************[ a wolf pack appears from the cave]*********

Condition_WolfPack = function()

return IsNear("kerberos","wolf",1000)

end

Action_WolfPack = function()

for k = 1,4,1 do
--CreateEntity(3, Entities.CU_Barbarian_Hero_wolf, GetPosition("cave_entrance"), "wolf"..w)
CreateEntity(6, Entities.CU_AggressiveWolf, GetPosition("cave_entrance"), "wolf"..k)
Move("wolf"..k,"wolf_run4")
end

createGeneralBriefing("cave_entrance","wolf.pack")
StartSimpleJob("WolfPackDead")
return true

end

----------------->wolf can be touch only by kerberos and if his pack is dead<-----------

function WolfPackDead()

if IsDead("wolf1") and IsDead("wolf2") and IsDead("wolf3") and IsDead("wolf4") then

if IsAlive("kerberos") and IsNear("kerberos","wolf",200) then

local wolf = Logic.GetEntityIDByName("wolf")
Logic.SetEntityInvulnerabilityFlag(wolf,0)

--	if IsDead("wolf") then

	createGeneralBriefing("kerberos","wolf.dead")

	NPCmary1			=	{}
	NPCmary1.name 			=	"mary"
	NPCmary1.callback		=	createBriefingIngredient2
	CreateNPC(NPCmary1)

	return true

--	end

end

return false

end

end

