InitMapNPCs = function()
 
	local NPCNames  = {}
 
	--NPCNames[1]   = "Fugitive2" 

	CreateNPCsBriefings(NPCNames)
 

	-- Enable rescue NPCs
	InitNPCLookAt("Fugitive")
	SetNPCLookAtTarget("Fugitive",1)
	EnableNpcMarker("Fugitive")
	
	InitNPCLookAt("Fugitive2")
	SetNPCLookAtTarget("Fugitive2",1)
	EnableNpcMarker("Fugitive2")


	-- Enable BuildUpNPC
	InitNPCLookAt("BuildUpNPC")
	SetNPCLookAtTarget("BuildUpNPC",1)
	EnableNpcMarker("BuildUpNPC")	
	

	-- Enable winter NPCs
	InitNPCLookAt("Banned_Info_NPC")
	SetNPCLookAtTarget("Banned_Info_NPC",1)
	EnableNpcMarker("Banned_Info_NPC")

	--EnableNpcMarker("weathermaster")
	EnableNpcMarker("weathermaster_off")


	-- Start npc near tree
	InitNPCLookAt("RainNPC")
	SetNPCLookAtTarget("RainNPC",1)
	SetNPCWaypoints("RainNPC", "RainNPCMove", 10)
	EnableNpcMarker("RainNPC")
end
 




