----------------- Game control : Tainted light



----------------------------
Start1stChapter = function ()
local f = 0
for f=1,3,1 do 
	SetHealth("weather"..f,25)
	end
spawnScouts()
spawnStartArmies()

createBriefingPrelude()


end




--Start3rdchapter = function()
--SpawnAdditionalArmies()
--createBriefingAlliesArrive()

--end