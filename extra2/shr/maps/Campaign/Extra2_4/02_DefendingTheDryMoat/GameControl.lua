---------------------------------------
------ Defending the dry moat ---------
------- Game control ------------------




------------- Chapter I - False Alarm -------
a=0
b=0
c=0
d=0
e=0

Start1stChapter = function()
	Logic.SetShareExplorationWithPlayerFlag(1,8,1)

SetHostile(1,2)
SetHostile(8,2)
SetFriendly(2,6)
SetFriendly(1,6)
SetHostile(8,6)
--setupBattle()

--spawnTemplarArmy()
Move("Templaru","mayortalkt")
spawnWorkersBeginning()
StartCutscene(Cutscenes[INTROCUTSCENE],BriefingIntro)
--BriefingIntro()
--CreateNPCMayor()
--StartSimpleJob("JobChapter1")
--SpawnArmies()
end



------------- Chapter II - Threat is on -------

Start2ndChapter = function()



CreateNPCMayor1()

end


------------- Chapter III - Besieged -------

Start3rdChapter = function()
EndJob("LastLineDead")
spawnSiegers()
createBriefingBesieged()
--StartSimpleJob("purgeBarbs")

--CreateNPCMayor2()

end
createBriefingBesieged = function ()




BriefingBesieged = 	{}

	BriefingBesieged.finished = BriefingBesiegedFinished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingBesieged[page] 					= 	{}
		BriefingBesieged[page].title				= 	String.Key("BriefingBesieged[1].title") 
		BriefingBesieged[page].text				=	String.Key("BriefingBesieged[1].text")
		BriefingBesieged[page].position				=	GetPosition("Primaru")
		--BriefingBesieged[page].explore				=	10000


	
briefingTerminatBesieged = BriefingBesieged[page]

StartBriefing(BriefingBesieged)
		
end

	


BriefingBesiegedFinished = function()
CreateNPCMayor2 ()
end












------------- Chapter IV - Breaking the siege -------

Start4thChapter = function()



end