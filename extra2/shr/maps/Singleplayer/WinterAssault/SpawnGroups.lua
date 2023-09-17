----------------------------------

--	Groups Bastille1	--

----------------------------------

function CreateB1Groups()

	troops1			= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
						}

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]


	local pos = GetPosition("B1Spawn1")
	B1Group1 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
	SetEntityName(B1Group1, "B1Group1")
	
	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]

	local pos = GetPosition("B1Spawn2")
	B1Group2 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
	SetEntityName(B1Group2, "B1Group2")

	Attack("B1Group1","AttackTargB1")
	Attack("B1Group2","AttackTargB2")

	StartJob("CheckB1Group1")
	StartJob("CheckB1Group2")


end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB1Group1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB1Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B1Group1") and IsAlive("Bastilia1")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB1Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops1	= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
				}

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]

		local pos = GetPosition("B1Spawn1")
		B1Group1 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
		SetEntityName(B1Group1, "B1Group1")

		Attack("B1Group1","AttackTargB1")

		StartJob("CheckB1Group1")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB1Group2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB1Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B1Group2") and IsAlive("Bastilia1")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB1Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops1	= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
				}

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]

		local pos = GetPosition("B1Spawn2")
		B1Group2 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
		SetEntityName(B1Group2, "B1Group2")

		Attack("B1Group2","AttackTargB2")

		StartJob("CheckB1Group2")

		return true

	end

----------------------------------

--	Groups Bastille2	--

----------------------------------

function CreateB2Groups()

	troops5			= 	{	Entities.CU_Evil_LeaderBearman1,
						Entities.CU_Evil_LeaderSkirmisher1

						}

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]


	local pos = GetPosition("B2Spawn1")
	B2Group1 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
	SetEntityName(B2Group1, "B2Group1")

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]

	local pos = GetPosition("B2Spawn2")
	B2Group2 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
	SetEntityName(B2Group2, "B2Group2")

	Attack("B2Group1","AttackTargB11")
	Attack("B2Group2","AttackTargB21")

	StartJob("CheckB2Group1")
	StartJob("CheckB2Group2")


end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB2Group1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB2Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B2Group1") and IsAlive("Bastilia2")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB2Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops5			= 	{	Entities.CU_Evil_LeaderBearman1,
						Entities.CU_Evil_LeaderSkirmisher1

						}

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]

		local pos = GetPosition("B2Spawn1")
		B2Group1 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
		SetEntityName(B2Group1, "B2Group1")

		Attack("B2Group1","AttackTargB11")

		StartJob("CheckB2Group1")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB2Group2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB2Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B2Group2") and IsAlive("Bastilia2")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB2Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops5			= 	{	Entities.CU_Evil_LeaderBearman1,
						Entities.CU_Evil_LeaderSkirmisher1

						}

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]

		local pos = GetPosition("B2Spawn2")
		B2Group2 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
		SetEntityName(B2Group2, "B2Group2")

		Attack("B2Group2","AttackTargB21")

		StartJob("CheckB2Group2")

		return true

	end

----------------------------------

--	Groups Bastille3	--

----------------------------------

function CreateB3Groups()

	troops1			= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
						}

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]


	local pos = GetPosition("B3Spawn1")
	B3Group1 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
	SetEntityName(B3Group1, "B3Group1")

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]

	local pos = GetPosition("B3Spawn2")
	B3Group2 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
	SetEntityName(B3Group2, "B3Group2")

	Attack("B3Group1","AttackTargB3")
	Attack("B3Group2","AttackTargB3")

	StartJob("CheckB3Group1")
	StartJob("CheckB3Group2")


end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB3Group1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB3Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B3Group1") and IsAlive("Bastilia3")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB3Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops1	= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
				}

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]

		local pos = GetPosition("B3Spawn1")
		B3Group1 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
		SetEntityName(B3Group1, "B3Group1")

		Attack("B3Group1","AttackTargB3")

		StartJob("CheckB3Group1")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB3Group2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB3Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B3Group2") and IsAlive("Bastilia3")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB3Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops1	= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
				}

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]

		local pos = GetPosition("B3Spawn2")
		B3Group2 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
		SetEntityName(B3Group2, "B3Group2")

		Attack("B3Group2","AttackTargB3")

		StartJob("CheckB3Group2")

		return true

	end

----------------------------------

--	Groups Bastille4	--

----------------------------------

function CreateB4Groups()

	troops1			= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
						}

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]


	local pos = GetPosition("B4Spawn1")
	B4Group1 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
	SetEntityName(B4Group1, "B4Group1")

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]

	local pos = GetPosition("B4Spawn2")
	B4Group2 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
	SetEntityName(B4Group2, "B4Group2")

	Attack("B4Group1","AttackTargB4")
	Attack("B4Group2","AttackTargB4")

	StartJob("CheckB4Group1")
	StartJob("CheckB4Group2")


end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB4Group1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB4Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B4Group1") and IsAlive("Bastilia4")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB4Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops1	= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
				}

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]

		local pos = GetPosition("B4Spawn1")
		B4Group1 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
		SetEntityName(B4Group1, "B4Group1")

		Attack("B4Group1","AttackTargB4")

		StartJob("CheckB4Group1")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB4Group2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB4Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B4Group2") and IsAlive("Bastilia4")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB4Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops1	= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
				}

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]

		local pos = GetPosition("B4Spawn2")
		B4Group2 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
		SetEntityName(B4Group2, "B4Group2")

		Attack("B4Group2","AttackTargB4")

		StartJob("CheckB4Group2")

		return true

	end

----------------------------------

--	Groups Bastille5	--

----------------------------------

function CreateB5Groups()

	troops1			= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
						}

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]


	local pos = GetPosition("B5Spawn1")
	B5Group1 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
	SetEntityName(B5Group1, "B5Group1")

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]

	local pos = GetPosition("B5Spawn2")
	B5Group2 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
	SetEntityName(B5Group2, "B5Group2")

	Attack("B5Group1","AttackTargB41")
	Attack("B5Group2","AttackTargB41")

	StartJob("CheckB5Group1")
	StartJob("CheckB5Group2")


end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB5Group1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB5Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B5Group1") and IsAlive("Bastilia5")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB5Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops1	= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
				}

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]

		local pos = GetPosition("B5Spawn1")
		B5Group1 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
		SetEntityName(B5Group1, "B5Group1")

		Attack("B5Group1","AttackTargB41")

		StartJob("CheckB5Group1")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB5Group2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB5Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B5Group2") and IsAlive("Bastilia5")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB5Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops1	= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
				}

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]

		local pos = GetPosition("B5Spawn2")
		B5Group2 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
		SetEntityName(B5Group2, "B5Group2")

		Attack("B5Group2","AttackTargB41")

		StartJob("CheckB5Group2")

		return true

	end

----------------------------------

--	Groups Bastille6	--

----------------------------------

function CreateB6Groups()

	troops5			= 	{	Entities.CU_Evil_LeaderBearman1,
						Entities.CU_Evil_LeaderSkirmisher1

						}

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]


	local pos = GetPosition("B6Spawn1")
	B6Group1 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
	SetEntityName(B6Group1, "B6Group1")

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]

	local pos = GetPosition("B6Spawn2")
	B6Group2 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
	SetEntityName(B6Group2, "B6Group2")

	Attack("B6Group1","AttackTargB41")
	Attack("B6Group2","AttackTargB41")

	StartJob("CheckB6Group1")
	StartJob("CheckB6Group2")


end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB6Group1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB6Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B6Group1") and IsAlive("Bastilia6")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB6Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops5			= 	{	Entities.CU_Evil_LeaderBearman1,
						Entities.CU_Evil_LeaderSkirmisher1

						}

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]

		local pos = GetPosition("B6Spawn1")
		B6Group1 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
		SetEntityName(B6Group1, "B6Group1")

		Attack("B6Group1","AttackTargB41")

		StartJob("CheckB6Group1")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB6Group2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB6Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B6Group2") and IsAlive("Bastilia6")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB6Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops5			= 	{	Entities.CU_Evil_LeaderBearman1,
						Entities.CU_Evil_LeaderSkirmisher1

						}

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]

		local pos = GetPosition("B6Spawn2")
		B6Group2 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
		SetEntityName(B6Group2, "B6Group2")

		Attack("B6Group2","AttackTargB41")

		StartJob("CheckB6Group2")

		return true

	end

----------------------------------

--	Groups Bastille7	--

----------------------------------

function CreateB7Groups()

	troops1			= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
						}

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]


	local pos = GetPosition("B7Spawn1")
	B7Group1 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
	SetEntityName(B7Group1, "B7Group1")

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]

	local pos = GetPosition("B7Spawn2")
	B7Group2 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
	SetEntityName(B7Group2, "B7Group2")

	Attack("B7Group1","AttackTargB21")
	Attack("B7Group2","AttackTargB11")

	StartJob("CheckB7Group1")
	StartJob("CheckB7Group2")


end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB7Group1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB7Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B7Group1") and IsAlive("Bastilia7")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB7Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops1	= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
				}

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]

		local pos = GetPosition("B7Spawn1")
		B7Group1 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
		SetEntityName(B7Group1, "B7Group1")

		Attack("B7Group1","AttackTargB21")

		StartJob("CheckB7Group1")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB7Group2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB7Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B7Group2") and IsAlive("Bastilia7")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB7Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops1	= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
				}

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]

		local pos = GetPosition("B7Spawn2")
		B7Group2 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
		SetEntityName(B7Group2, "B7Group2")

		Attack("B7Group2","AttackTargB11")

		StartJob("CheckB7Group2")

		return true

	end

----------------------------------

--	Groups Bastille8	--

----------------------------------

function CreateB8Groups()

	troops5			= 	{	Entities.CU_Evil_LeaderBearman1,
						Entities.CU_Evil_LeaderSkirmisher1

						}

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]


	local pos = GetPosition("B8Spawn1")
	B8Group1 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
	SetEntityName(B8Group1, "B8Group1")

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]

	local pos = GetPosition("B8Spawn2")
	B8Group2 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
	SetEntityName(B8Group2, "B8Group2")

	Attack("B8Group1","AttackTargB31")
	Attack("B8Group2","G3")

	StartJob("CheckB8Group1")
	StartJob("CheckB8Group2")


end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB8Group1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB8Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B8Group1") and IsAlive("Bastilia8")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB8Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops5			= 	{	Entities.CU_Evil_LeaderBearman1,
						Entities.CU_Evil_LeaderSkirmisher1

						}

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]

		local pos = GetPosition("B8Spawn1")
		B8Group1 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
		SetEntityName(B8Group1, "B8Group1")

		Attack("B8Group1","AttackTargB31")

		StartJob("CheckB8Group1")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB8Group2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB8Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B8Group2") and IsAlive("Bastilia8")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB8Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops5			= 	{	Entities.CU_Evil_LeaderBearman1,
						Entities.CU_Evil_LeaderSkirmisher1

						}

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]

		local pos = GetPosition("B8Spawn2")
		B8Group2 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
		SetEntityName(B8Group2, "B8Group2")

		Attack("B8Group2","G3")

		StartJob("CheckB8Group2")

		return true

	end



----------------------------------

--	Groups Bastille21	--

----------------------------------

function CreateB21Groups()

	troops5			= 	{	Entities.CU_Evil_LeaderBearman1,
						Entities.CU_Evil_LeaderSkirmisher1

						}

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]


	local pos = GetPosition("B2Spawn1")
	B21Group1 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
	SetEntityName(B21Group1, "B21Group1")

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]

	local pos = GetPosition("B2Spawn2")
	B21Group2 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
	SetEntityName(B21Group2, "B21Group2")

	Attack("B21Group1","AttackTargB21")
	Attack("B21Group2","AttackTargB21")

	StartJob("CheckB21Group1")
	StartJob("CheckB21Group2")


end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB21Group1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB21Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B21Group1") and IsAlive("Bastilia2")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB21Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops5			= 	{	Entities.CU_Evil_LeaderBearman1,
						Entities.CU_Evil_LeaderSkirmisher1

						}

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]

		local pos = GetPosition("B2Spawn1")
		B21Group1 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
		SetEntityName(B21Group1, "B21Group1")

		Attack("B21Group1","AttackTargB21")

		StartJob("CheckB21Group1")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB21Group2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB21Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B21Group2") and IsAlive("Bastilia2")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB21Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops5			= 	{	Entities.CU_Evil_LeaderBearman1,
						Entities.CU_Evil_LeaderSkirmisher1

						}

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]

		local pos = GetPosition("B2Spawn2")
		B21Group2 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
		SetEntityName(B21Group2, "B21Group2")

		Attack("B21Group2","AttackTargB21")

		StartJob("CheckB21Group2")

		return true

	end

----------------------------------

--	Groups Bastille61	--

----------------------------------

function CreateB61Groups()

	troops5			= 	{	Entities.CU_Evil_LeaderBearman1,
						Entities.CU_Evil_LeaderSkirmisher1

						}

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]


	local pos = GetPosition("B6Spawn1")
	B61Group1 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
	SetEntityName(B61Group1, "B61Group1")

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]

	local pos = GetPosition("B6Spawn2")
	B61Group2 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
	SetEntityName(B61Group2, "B61Group2")

	Attack("B61Group1","AttackTargB41")
	Attack("B61Group2","AttackTargB41")

	StartJob("CheckB61Group1")
	StartJob("CheckB61Group2")


end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB61Group1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB61Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B61Group1") and IsAlive("Bastilia6")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB61Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops5			= 	{	Entities.CU_Evil_LeaderBearman1,
						Entities.CU_Evil_LeaderSkirmisher1

						}

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]

		local pos = GetPosition("B6Spawn1")
		B61Group1 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
		SetEntityName(B61Group1, "B61Group1")

		Attack("B61Group1","AttackTargB41")

		StartJob("CheckB61Group1")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB61Group2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB61Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B61Group2") and IsAlive("Bastilia6")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB61Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops5			= 	{	Entities.CU_Evil_LeaderBearman1,
						Entities.CU_Evil_LeaderSkirmisher1

						}

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]

		local pos = GetPosition("B6Spawn2")
		B61Group2 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
		SetEntityName(B61Group2, "B61Group2")

		Attack("B61Group2","AttackTargB41")

		StartJob("CheckB61Group2")

		return true

	end

----------------------------------

--	Groups Bastille81	--

----------------------------------

function CreateB81Groups()

	troops5			= 	{	Entities.CU_Evil_LeaderBearman1,
						Entities.CU_Evil_LeaderSkirmisher1

						}

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]


	local pos = GetPosition("B8Spawn1")
	B81Group1 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
	SetEntityName(B81Group1, "B81Group1")

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]

	local pos = GetPosition("B8Spawn2")
	B81Group2 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
	SetEntityName(B81Group2, "B81Group2")

	Attack("B81Group1","MiddleStone2")
	Attack("B81Group2","MiddleStone2")

	StartJob("CheckB81Group1")
	StartJob("CheckB81Group2")


end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB81Group1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB81Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B81Group1") and IsAlive("Bastilia8")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB81Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops5			= 	{	Entities.CU_Evil_LeaderBearman1,
						Entities.CU_Evil_LeaderSkirmisher1

						}

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]

		local pos = GetPosition("B8Spawn1")
		B81Group1 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
		SetEntityName(B81Group1, "B81Group1")

		Attack("B81Group1","MiddleStone2")

		StartJob("CheckB81Group1")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB81Group2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB81Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B81Group2") and IsAlive("Bastilia8")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB81Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops5			= 	{	Entities.CU_Evil_LeaderBearman1,
						Entities.CU_Evil_LeaderSkirmisher1

						}

	RandomUnit5 		= 	troops5[Logic.GetRandom(table.getn(troops5))+1]

		local pos = GetPosition("B8Spawn2")
		B81Group2 = Tools.CreateGroup(2, RandomUnit5, 12, pos.X, pos.Y, 180)
		SetEntityName(B81Group2, "B81Group2")

		Attack("B81Group2","MiddleStone2")

		StartJob("CheckB81Group2")

		return true

	end