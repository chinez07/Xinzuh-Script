local Y = game.Players;
local d = Y.LocalPlayer;
local R = d.Character.HumanoidRootPart;
local Q = game:GetService("ReplicatedStorage");
local r = d.Data.Level.Value;
local a = game:GetService("TeleportService");
local w = game:GetService("TweenService");
local F = game:GetService("Lighting");
local M = workspace.Enemies;
local K = game:GetService("VirtualInputManager");
local n = game:GetService("VirtualUser");
local I = d.Team;
local W = game:GetService("RunService");
local N = game:GetService("Stats");
local D = d.Character.Energy.Value;
local A = game:GetService("Players");
local u = A.LocalPlayer:WaitForChild("PlayerGui");
local g = A.LocalPlayer;
local z = g:WaitForChild("Backpack");
local i = g.Character or g.CharacterAdded:Wait();
local U = {};
local C = {};
local v = {};
local m = {};
local y = false;
local b = false;
local c = true;
local H = false;
local S = false;
local o = false;
local Z = false;
local T = .1;
local L = 0;
local P = 25;
repeat
	local Y = (d.PlayerGui:WaitForChild("Main")):WaitForChild("Loading") and game:IsLoaded();
	wait();
until Y;
if game.PlaceId == 2753915549 or game.PlaceId == 85211729168715 then
	World1 = true;
elseif game.PlaceId == 4442272183 or game.PlaceId == 79091703265657 then
	World2 = true;
elseif game.PlaceId == 7449423635 or game.PlaceId == 100117331123089 then
	World3 = true;
end;
Marines = function()
		Q.Remotes.CommF_:InvokeServer("SetTeam", "Marines");
	end;
Pirates = function()
		Q.Remotes.CommF_:InvokeServer("SetTeam", "Pirates");
	end;
if World1 then
	U = {
			"The Gorilla King",
			"Bobby",
			"The Saw",
			"Yeti",
			"Mob Leader",
			"Vice Admiral",
			"Saber Expert",
			"Warden",
			"Chief Warden",
			"Swan",
			"Magma Admiral",
			"Fishman Lord",
			"Wysper",
			"Thunder God",
			"Cyborg",
			"Ice Admiral",
			"Greybeard",
		};
elseif World2 then
	U = {
			"Diamond",
			"Jeremy",
			"Fajita",
			"Don Swan",
			"Smoke Admiral",
			"Awakened Ice Admiral",
			"Tide Keeper",
			"Darkbeard",
			"Cursed Captain",
			"Order",
		};
elseif World3 then
	U = {
			"Stone",
			"Hydra Leader",
			"Kilo Admiral",
			"Captain Elephant",
			"Beautiful Pirate",
			"Cake Queen",
			"Longma",
			"Soul Reaper",
		};
end;
if World1 then
	v = {
			"Leather + Scrap Metal",
			"Angel Wings",
			"Magma Ore",
			"Fish Tail",
		};
elseif World2 then
	v = {
			"Leather + Scrap Metal",
			"Radioactive Material",
			"Ectoplasm",
			"Mystic Droplet",
			"Magma Ore",
			"Vampire Fang",
		};
elseif World3 then
	v = {
			"Scrap Metal",
			"Demonic Wisp",
			"Conjured Cocoa",
			"Dragon Scale",
			"Gunpowder",
			"Fish Tail",
			"Mini Tusk",
		};
end;
local j = {
		"Flame",
		"Ice",
		"Quake",
		"Light",
		"Dark",
		"String",
		"Rumble",
		"Magma",
		"Human: Buddha",
		"Sand",
		"Bird: Phoenix",
		"Dough",
	};
local G = {
		"Snow Lurker",
		"Arctic Warrior",
		"Hidden Key",
		"Awakened Ice Admiral",
	};
local q = {
		Mob = "Mythological Pirate",
		Mob2 = "Cursed Skeleton",
		"Hell's Messenger",
		Mob3 = "Cursed Skeleton",
		"Heaven's Guardian",
	};
local t = {
		"Part",
		"SpawnLocation",
		"Terrain",
		"WedgePart",
		"MeshPart",
	};
local X = { "Swan Pirate", "Jeremy" };
local h = { "Forest Pirate", "Captain Elephant" };
local B = { "Fajita", "Jeremy", "Diamond" };
local l = {
		"Beast Hunter",
		"Lantern",
		"Guardian",
		"Grand Brigade",
		"Dinghy",
		"Sloop",
		"The Sentinel",
	};
local p = { "Cookie Crafter" };
local E = { "Reborn Skeleton" };
local e = {
		["Pirate Millionaire"] = CFrame.new(-712.82727050781, 98.577049255371, 5711.9541015625),
		["Pistol Billionaire"] = CFrame.new(-723.43316650391, 147.42906188965, 5931.9931640625),
		["Dragon Crew Warrior"] = CFrame.new(7021.5043945312, 55.762702941895, -730.12908935547),
		["Dragon Crew Archer"] = CFrame.new(6625, 378, 244),
		["Female Islander"] = CFrame.new(4692.7939453125, 797.97668457031, 858.84802246094),
		["Venomous Assailant"] = CFrame.new(4902, 670, 39),
		["Marine Commodore"] = CFrame.new(2401, 123, -7589),
		["Marine Rear Admiral"] = CFrame.new(3588, 229, -7085),
		["Fishman Raider"] = CFrame.new(-10941, 332, -8760),
		["Fishman Captain"] = CFrame.new(-11035, 332, -9087),
		["Forest Pirate"] = CFrame.new(-13446, 413, -7760),
		["Mythological Pirate"] = CFrame.new(-13510, 584, -6987),
		["Jungle Pirate"] = CFrame.new(-11778, 426, -10592),
		["Musketeer Pirate"] = CFrame.new(-13282, 496, -9565),
		["Reborn Skeleton"] = CFrame.new(-8764, 142, 5963),
		["Living Zombie"] = CFrame.new(-10227, 421, 6161),
		["Demonic Soul"] = CFrame.new(-9579, 6, 6194),
		["Posessed Mummy"] = CFrame.new(-9579, 6, 6194),
		["Peanut Scout"] = CFrame.new(-1993, 187, -10103),
		["Peanut President"] = CFrame.new(-2215, 159, -10474),
		["Ice Cream Chef"] = CFrame.new(-877, 118, -11032),
		["Ice Cream Commander"] = CFrame.new(-877, 118, -11032),
		["Cookie Crafter"] = CFrame.new(-2021, 38, -12028),
		["Cake Guard"] = CFrame.new(-2024, 38, -12026),
		["Baking Staff"] = CFrame.new(-1932, 38, -12848),
		["Head Baker"] = CFrame.new(-1932, 38, -12848),
		["Cocoa Warrior"] = CFrame.new(95, 73, -12309),
		["Chocolate Bar Battler"] = CFrame.new(647, 42, -12401),
		["Sweet Thief"] = CFrame.new(116, 36, -12478),
		["Candy Rebel"] = CFrame.new(47, 61, -12889),
		Ghost = CFrame.new(5251, 5, 1111),
	};
	EquipWeapon = function(Y)
		if not Y then
			return;
		end;
		if d.Backpack:FindFirstChild(Y) then
			d.Character.Humanoid:EquipTool(d.Backpack:FindFirstChild(Y));
		end;
	end;
weaponSc = function(Y)
		for d, R in pairs(d.Backpack:GetChildren()) do
			if R:IsA("Tool") then
				if R.ToolTip == Y then
					EquipWeapon(R.Name);
				end;
			end;
		end;
	end;
hookfunction(require((game:GetService("ReplicatedStorage")).Effect.Container.Death), function()
 
end);
hookfunction((require((game:GetService("ReplicatedStorage")):WaitForChild("GuideModule"))).ChangeDisplayedNPC, function()
 
end);
hookfunction(error, function()
 
end);
hookfunction(warn, function()
 
end);
local O = workspace:FindFirstChild("Rocks");
if O then
	O:Destroy();
end;
gay = (function()
		local Y = game:GetService("Lighting");
		local d = Y:FindFirstChild("LightingLayers");
		if d and (game:GetService("Lighting") and game:GetService("Lighting")) then
			local Y = d:FindFirstChild("DarkFog");
			if Y then
				Y:Destroy();
			end;
		end;
		local R = workspace._WorldOrigin["Foam;"];
		if R and workspace._WorldOrigin["Foam;"] then
			R:Destroy();
		end;
	end)();
local f = {};
f.__index = f;
f.Alive = function(Y)
		if not Y then
			return;
		end;
		local d = Y:FindFirstChild("Humanoid");
		return d and d.Health > 0;
	end;
f.Pos = function(Y, d)
		return (R.Position - mode.Position).Magnitude <= d;
	end;
f.Dist = function(Y, d)
		return (R.Position - (Y:FindFirstChild("HumanoidRootPart")).Position).Magnitude <= d;
	end;
f.DistH = function(Y, d)
		return (R.Position - (Y:FindFirstChild("HumanoidRootPart")).Position).Magnitude > d;
	end;
	f.Kill = function(Y, d)
		if Y and d then
			if not Y:GetAttribute("Locked") then
				Y:SetAttribute("Locked", Y.HumanoidRootPart.CFrame);
			end;
			PosMon = (Y:GetAttribute("Locked")).Position;
			BringEnemy();
			EquipWeapon(_G.SelectWeapon);
			local d = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool");
			local R = d.ToolTip;
			if R == "Blox Fruit" then
				_tp((Y.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)) * CFrame.Angles(0, math.rad(90), 0));
			else
				_tp((Y.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) * CFrame.Angles(0, math.rad(180), 0));
			end;
			if RandomCFrame then
				wait(.5);
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25));
				wait(.5);
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0));
				wait(.5);
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0));
				wait(.5);
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25));
				wait(.5);
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0));
			end;
		end;
	end;
f.Kill2 = function(Y, d)
		if Y and d then
			if not Y:GetAttribute("Locked") then
				Y:SetAttribute("Locked", Y.HumanoidRootPart.CFrame);
			end;
			PosMon = (Y:GetAttribute("Locked")).Position;
			BringEnemy();
			EquipWeapon(_G.SelectWeapon);
			local d = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool");
			local R = d.ToolTip;
			if R == "Blox Fruit" then
				_tp((Y.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)) * CFrame.Angles(0, math.rad(90), 0));
			else
				_tp((Y.HumanoidRootPart.CFrame * CFrame.new(0, 30, 8)) * CFrame.Angles(0, math.rad(180), 0));
			end;
			if RandomCFrame then
				wait(.1);
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25));
				wait(.1);
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0));
				wait(.1);
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0));
				wait(.1);
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25));
				wait(.1);
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0));
			end;
		end;
	end;
f.KillSea = function(Y, d)
		if Y and d then
			if not Y:GetAttribute("Locked") then
				Y:SetAttribute("Locked", Y.HumanoidRootPart.CFrame);
			end;
			PosMon = (Y:GetAttribute("Locked")).Position;
			BringEnemy();
			EquipWeapon(_G.SelectWeapon);
			local d = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool");
			local R = d.ToolTip;
			if R == "Blox Fruit" then
				_tp((Y.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)) * CFrame.Angles(0, math.rad(90), 0));
			else
				notween(Y.HumanoidRootPart.CFrame * CFrame.new(0, 50, 8));
				wait(.85);
				notween(Y.HumanoidRootPart.CFrame * CFrame.new(0, 400, 0));
				wait(1);
			end;
		end;
	end;
	f.Sword = function(Y, d)
		if Y and d then
			if not Y:GetAttribute("Locked") then
				Y:SetAttribute("Locked", Y.HumanoidRootPart.CFrame);
			end;
			PosMon = (Y:GetAttribute("Locked")).Position;
			BringEnemy();
			weaponSc("Sword");
			_tp(Y.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0));
			if RandomCFrame then
				wait(.1);
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25));
				wait(.1);
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0));
				wait(.1);
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0));
				wait(.1);
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25));
				wait(.1);
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0));
			end;
		end;
	end;
f.Mas = function(Y, d)
		if Y and d then
			if not Y:GetAttribute("Locked") then
				Y:SetAttribute("Locked", Y.HumanoidRootPart.CFrame);
			end;
			PosMon = (Y:GetAttribute("Locked")).Position;
			BringEnemy();
			if Y.Humanoid.Health <= HealthM then
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0));
				Useskills("Blox Fruit", "Z");
				Useskills("Blox Fruit", "X");
				Useskills("Blox Fruit", "C");
			else
				weaponSc("Melee");
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0));
			end;
		end;
	end;
f.Masgun = function(Y, d)
		if Y and d then
			if not Y:GetAttribute("Locked") then
				Y:SetAttribute("Locked", Y.HumanoidRootPart.CFrame);
			end;
			PosMon = (Y:GetAttribute("Locked")).Position;
			BringEnemy();
			if Y.Humanoid.Health <= HealthM then
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(0, 35, 8));
				Useskills("Gun", "Z");
				Useskills("Gun", "X");
			else
				weaponSc("Melee");
				_tp(Y.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0));
			end;
		end;
	end;
statsSetings = function(Y, R)
		if Y == "Melee" then
			if d.Data.Points.Value ~= 0 then
				Q.Remotes.CommF_:InvokeServer("AddPoint", "Melee", R);
			end;
		elseif Y == "Defense" then
			if d.Data.Points.Value ~= 0 then
				Q.Remotes.CommF_:InvokeServer("AddPoint", "Defense", R);
			end;
		elseif Y == "Sword" then
			if d.Data.Points.Value ~= 0 then
				Q.Remotes.CommF_:InvokeServer("AddPoint", "Sword", R);
			end;
		elseif Y == "Gun" then
			if d.Data.Points.Value ~= 0 then
				Q.Remotes.CommF_:InvokeServer("AddPoint", "Gun", R);
			end;
		elseif Y == "Devil" then
			if d.Data.Points.Value ~= 0 then
				Q.Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", R);
			end;
		end;
	end;
	BringEnemy = function()
		if not _B then
			return;
		end;
		for Y, R in pairs(workspace.Enemies:GetChildren()) do
			if R:FindFirstChild("Humanoid") and R.Humanoid.Health > 0 then
				if (R.PrimaryPart.Position - PosMon).Magnitude <= 300 then
					R.PrimaryPart.CFrame = CFrame.new(PosMon);
					R.PrimaryPart.CanCollide = true;
					(R:FindFirstChild("Humanoid")).WalkSpeed = 0;
					(R:FindFirstChild("Humanoid")).JumpPower = 0;
					if R.Humanoid:FindFirstChild("Animator") then
						R.Humanoid.Animator:Destroy();
					end;
					d.SimulationRadius = math.huge;
				end;
			end;
		end;
	end;
Useskills = function(Y, d)
		if Y == "Melee" then
			weaponSc("Melee");
			if d == "Z" then
				K:SendKeyEvent(true, "Z", false, game);
				K:SendKeyEvent(false, "Z", false, game);
			elseif d == "X" then
				K:SendKeyEvent(true, "X", false, game);
				K:SendKeyEvent(false, "X", false, game);
			elseif d == "C" then
				K:SendKeyEvent(true, "C", false, game);
				K:SendKeyEvent(false, "C", false, game);
			end;
		elseif Y == "Sword" then
			weaponSc("Sword");
			if d == "Z" then
				K:SendKeyEvent(true, "Z", false, game);
				K:SendKeyEvent(false, "Z", false, game);
			elseif d == "X" then
				K:SendKeyEvent(true, "X", false, game);
				K:SendKeyEvent(false, "X", false, game);
			end;
		elseif Y == "Blox Fruit" then
			weaponSc("Blox Fruit");
			if d == "Z" then
				K:SendKeyEvent(true, "Z", false, game);
				K:SendKeyEvent(false, "Z", false, game);
			elseif d == "X" then
				K:SendKeyEvent(true, "X", false, game);
				K:SendKeyEvent(false, "X", false, game);
			elseif d == "C" then
				K:SendKeyEvent(true, "C", false, game);
				K:SendKeyEvent(false, "C", false, game);
			elseif d == "V" then
				K:SendKeyEvent(true, "V", false, game);
				K:SendKeyEvent(false, "V", false, game);
			end;
		elseif Y == "Gun" then
			weaponSc("Gun");
			if d == "Z" then
				K:SendKeyEvent(true, "Z", false, game);
				K:SendKeyEvent(false, "Z", false, game);
			elseif d == "X" then
				K:SendKeyEvent(true, "X", false, game);
				K:SendKeyEvent(false, "X", false, game);
			end;
		end;
		if Y == "nil" and d == "Y" then
			K:SendKeyEvent(true, "Y", false, game);
			K:SendKeyEvent(false, "Y", false, game);
		end;
	end;
	local s = getrawmetatable(game);
local x = s.__namecall;
setreadonly(s, false);
s.__namecall = newcclosure(function(...)
		local Y = getnamecallmethod();
		local d = { ... };
		if tostring(Y) == "FireServer" then
			if tostring(d[1]) == "RemoteEvent" then
				if tostring(d[2]) ~= "true" and tostring(d[2]) ~= "false" then
					if _G.FarmMastery_G and not b or _G.FarmMastery_Dev or _G.FarmBlazeEM or _G.Prehis_Skills or _G.SeaBeast1 or _G.FishBoat or _G.PGB or _G.Leviathan1 or _G.Complete_Trials or _G.AimMethod and ABmethod == "AimBots Skill" or _G.AimMethod and ABmethod == "Auto Aimbots" then
						d[2] = MousePos;
						return x(unpack(d));
					end;
				end;
			end;
		end;
		return x(...);
	end);
GetConnectionEnemies = function(Y)
		for d, R in pairs(Q:GetChildren()) do
			if R:IsA("Model") and ((typeof(Y) == "table" and table.find(Y, R.Name) or R.Name == Y) and (R:FindFirstChild("Humanoid") and R.Humanoid.Health > 0)) then
				return R;
			end;
		end;
		for d, R in next, game.Workspace.Enemies:GetChildren() do
			if R:IsA("Model") and ((typeof(Y) == "table" and table.find(Y, R.Name) or R.Name == Y) and (R:FindFirstChild("Humanoid") and R.Humanoid.Health > 0)) then
				return R;
			end;
		end;
	end;
LowCpu = function()
		local Y = true;
		local d = game;
		local R = d.Workspace;
		local Q = d.Lighting;
		local r = R.Terrain;
		r.WaterWaveSize = 0;
		r.WaterWaveSpeed = 0;
		r.WaterReflectance = 0;
		r.WaterTransparency = 0;
		Q.GlobalShadows = false;
		Q.FogEnd = 9000000000.0;
		Q.Brightness = 0;
		(settings()).Rendering.QualityLevel = "Level01";
		for d, R in pairs(d:GetDescendants()) do
			if R:IsA("Part") or R:IsA("Union") or R:IsA("CornerWedgePart") or R:IsA("TrussPart") then
				R.Material = "Plastic";
				R.Reflectance = 0;
			elseif R:IsA("Decal") or R:IsA("Texture") and Y then
				R.Transparency = 1;
			elseif R:IsA("ParticleEmitter") or R:IsA("Trail") then
				R.Lifetime = NumberRange.new(0);
			elseif R:IsA("Explosion") then
				R.BlastPressure = 1;
				R.BlastRadius = 1;
			elseif R:IsA("Fire") or R:IsA("SpotLight") or R:IsA("Smoke") or R:IsA("Sparkles") then
				R.Enabled = false;
			elseif R:IsA("MeshPart") then
				R.Material = "Plastic";
				R.Reflectance = 0;
				R.TextureID = 10385902758728957;
			end;
		end;
		for Y, d in pairs(Q:GetChildren()) do
			if d:IsA("BlurEffect") or d:IsA("SunRaysEffect") or d:IsA("ColorCorrectionEffect") or d:IsA("BloomEffect") or d:IsA("DepthOfFieldEffect") then
				d.Enabled = false;
			end;
		end;
	end;
	CheckF = function()
		if GetBP("Dragon-Dragon") or GetBP("Gas-Gas") or GetBP("Yeti-Yeti") or GetBP("Kitsune-Kitsune") or GetBP("T-Rex-T-Rex") then
			return true;
		end;
	end;
CheckBoat = function()
		for Y, R in pairs(workspace.Boats:GetChildren()) do
			if tostring(R.Owner.Value) == tostring(d.Name) then
				return R;
			end;
		end;
		return false;
	end;
CheckEnemiesBoat = function()
		for Y, d in pairs(workspace.Enemies:GetChildren()) do
			if d.Name == "FishBoat" and (d:FindFirstChild("Health")).Value > 0 then
				return true;
			end;
		end;
		return false;
	end;
CheckPirateGrandBrigade = function()
		for Y, d in pairs(workspace.Enemies:GetChildren()) do
			if (d.Name == "PirateGrandBrigade" or d.Name == "PirateBrigade") and (d:FindFirstChild("Health")).Value > 0 then
				return true;
		end;
		end;
		return false;
	end;
CheckShark = function()
		for Y, d in pairs(workspace.Enemies:GetChildren()) do
			if d.Name == "Shark" and f.Alive(d) then
				return true;
		end;
		end;
		return false;
	end;
CheckTerrorShark = function()
		for Y, d in pairs(workspace.Enemies:GetChildren()) do
			if d.Name == "Terrorshark" and f.Alive(d) then
				return true;
		end;
		end;
		return false;
	end;
CheckPiranha = function()
		for Y, d in pairs(workspace.Enemies:GetChildren()) do
			if d.Name == "Piranha" and f.Alive(d) then
				return true;
		end;
		end;
		return false;
	end;
CheckFishCrew = function()
		for Y, d in pairs(workspace.Enemies:GetChildren()) do
			if (d.Name == "Fish Crew Member" or d.Name == "Haunted Crew Member") and f.Alive(d) then
				return true;
		end;
		end;
		return false;
	end;
CheckHauntedCrew = function()
		for Y, d in pairs(workspace.Enemies:GetChildren()) do
			if d.Name == "Haunted Crew Member" and f.Alive(d) then
				return true;
		end;
		end;
		return false;
	end;
CheckSeaBeast = function()
		if workspace.SeaBeasts:FindFirstChild("SeaBeast1") then
			return true;
		end;
		return false;
	end;
CheckLeviathan = function()
		if workspace.SeaBeasts:FindFirstChild("Leviathan") then
			return true;
		end;
		return false;
	end;
	UpdStFruit = function()
		for Y, R in next, d.Backpack:GetChildren() do
			StoreFruit = R:FindFirstChild("EatRemote", true);
			if StoreFruit then
				Q.Remotes.CommF_:InvokeServer("StoreFruit", StoreFruit.Parent:GetAttribute("OriginalName"), d.Backpack:FindFirstChild(R.Name));
			end;
		end;
	end;
collectFruits = function(Y)
		if Y then
			local Y = d.Character;
			for d, R in pairs(workspace:GetChildren()) do
				if string.find(R.Name, "Fruit") then
					R.Handle.CFrame = Y.HumanoidRootPart.CFrame;
				end;
			end;
		end;
	end;
Getmoon = function()
		if World1 then
			return F.FantasySky.MoonTextureId;
		elseif World2 then
			return F.FantasySky.MoonTextureId;
		elseif World3 then
			return F.Sky.MoonTextureId;
		end;
	end;
DropFruits = function()
		for Y, R in next, d.Backpack:GetChildren() do
			if string.find(R.Name, "Fruit") then
				EquipWeapon(R.Name);
				wait(.1);
				if d.PlayerGui.Main.Dialogue.Visible == true then
					d.PlayerGui.Main.Dialogue.Visible = false;
				end;
				EquipWeapon(R.Name);
				(d.Character:FindFirstChild(R.Name)).EatRemote:InvokeServer("Drop");
			end;
		end;
		for Y, R in pairs(d.Character:GetChildren()) do
			if string.find(R.Name, "Fruit") then
				EquipWeapon(R.Name);
				wait(.1);
				if d.PlayerGui.Main.Dialogue.Visible == true then
					d.PlayerGui.Main.Dialogue.Visible = false;
				end;
				EquipWeapon(R.Name);
				(d.Character:FindFirstChild(R.Name)).EatRemote:InvokeServer("Drop");
			end;
		end;
	end;
GetBP = function(Y)
		return d.Backpack:FindFirstChild(Y) or d.Character:FindFirstChild(Y);
	end;
GetIn = function(Y)
		for R, Q in pairs(Q.Remotes.CommF_:InvokeServer("getInventory")) do
			if type(Q) == "table" then
				if Q.Name == Y or d.Character:FindFirstChild(Y) or d.Backpack:FindFirstChild(Y) then
					return true;
			end;
			end;
		end;
		return false;
	end;
GetM = function(Y)
		for d, R in pairs(Q.Remotes.CommF_:InvokeServer("getInventory")) do
			if type(R) == "table" then
				if R.Type == "Material" then
					if R.Name == Y then
						return R.Count;
				end;
				end;
			end;
		end;
		return 0;
	end;
GetWP = function(Y)
		for R, Q in pairs(Q.Remotes.CommF_:InvokeServer("getInventory")) do
			if type(Q) == "table" then
				if Q.Type == "Sword" then
					if Q.Name == Y or d.Character:FindFirstChild(Y) or d.Backpack:FindFirstChild(Y) then
						return true;
				end;
				end;
			end;
		end;
		return false;
	end;
	getinfinity_Ability = function(Y, Q)
		if not R then
			return;
		end;
		if Y == "Soru" and Q then
			for Y, R in next, getgc() do
				if d.Character.Soru then
					if typeof(R) == "function" and (getfenv(R)).script == d.Character.Soru then
						for Y, R in next, getupvalues(R) do
							if typeof(R) == "table" then
								repeat
									wait(T);
									R.LastUse = 0;
								until not Q or d.Character.Humanoid.Health <= 0;
							end;
						end;
					end;
				end;
			end;
		elseif Y == "Energy" and Q then
			d.Character.Energy.Changed:connect(function()
				if Q then
					d.Character.Energy.Value = D;
				end;
			end);
		elseif Y == "Observation" and Q then
			local Y = d.VisionRadius;
			Y.Value = math.huge;
		end;
	end;
Hop = function()
		pcall(function()
			for Y = math.random(1, math.random(40, 75)), 100, 1 do
				local d = Q.__ServerBrowser:InvokeServer(Y);
				for Y, d in next, d do
					if tonumber(d.Count) < 12 then
						a:TeleportToPlaceInstance(game.PlaceId, Y);
					end;
				end;
			end;
		end);
	end;
local J = Instance.new("Part", workspace);
J.Size = Vector3.new(1, 1, 1);
J.Name = "Rip_Indra";
J.Anchored = true;
J.CanCollide = false;
J.CanTouch = false;
J.Transparency = 1;
local Yz = workspace:FindFirstChild(J.Name);
if Yz and Yz ~= J then
	Yz:Destroy();
end;
task.spawn(function()
	while task.wait() do
		if J and J.Parent == workspace then
			if y then
				(getgenv()).OnFarm = true;
			else
				(getgenv()).OnFarm = false;
			end;
		else
			(getgenv()).OnFarm = false;
		end;
	end;
end);
task.spawn(function()
	local Y = game.Players.LocalPlayer;
	repeat
		task.wait();
	until Y.Character and Y.Character.PrimaryPart;
	J.CFrame = Y.Character.PrimaryPart.CFrame;
	while task.wait() do
		pcall(function()
			if (getgenv()).OnFarm then
				if J and J.Parent == workspace then
					local d = Y.Character and Y.Character.PrimaryPart;
					if d and (d.Position - J.Position).Magnitude <= 200 then
						d.CFrame = J.CFrame;
					else
						J.CFrame = d.CFrame;
					end;
				end;
				local d = Y.Character;
				if d then
					for Y, d in pairs(d:GetChildren()) do
						if d:IsA("BasePart") then
							d.CanCollide = false;
						end;
					end;
				end;
			else
				local d = Y.Character;
				if d then
					for Y, d in pairs(d:GetChildren()) do
						if d:IsA("BasePart") then
							d.CanCollide = true;
						end;
					end;
				end;
			end;
		end);
	end;
end);
_tp = function(Y)
		local R = d.Character;
		if not R or not R:FindFirstChild("HumanoidRootPart") then
			return;
		end;
		local Q = R.HumanoidRootPart;
		local r = (Y.Position - Q.Position).Magnitude;
		local a = TweenInfo.new(r / 300, Enum.EasingStyle.Linear);
		local w = (game:GetService("TweenService")):Create(J, a, { CFrame = Y });
		if d.Character.Humanoid.Sit == true then
			J.CFrame = CFrame.new(J.Position.X, Y.Y, J.Position.Z);
		end;
		w:Play();
		task.spawn(function()
			while w.PlaybackState == Enum.PlaybackState.Playing do
				if not y then
					w:Cancel();
					break;
				end;
				task.wait(.1);
			end;
		end);
	end;
	notween = function(Y)
		local d = d.Character;
		if d and d:FindFirstChild("HumanoidRootPart") then
			d.HumanoidRootPart.CFrame = Y;
		end;
	end;
GetConnectionEnemies2 = function(Y)
		for d, R in pairs(workspace.Enemies:GetChildren()) do
			if R:IsA("Model") and (R.Name == Y and (R:FindFirstChild("Humanoid") and R.Humanoid.Health > 0)) then
				return R;
			end;
		end;
		for d, R in pairs(Q:GetChildren()) do
			if R:IsA("Model") and (R.Name == Y and (R:FindFirstChild("Humanoid") and R.Humanoid.Health > 0)) then
				return R;
			end;
		end;
	end;
	TeleportToTarget = function(Y)
		if (Y.Position - d.Character.HumanoidRootPart.Position).Magnitude > 1000 then
			_tp(Y);
		else
			_tp(Y);
		end;
	end;
function BTP(Y)
	local d = game.Players.LocalPlayer;
	local R = d.Character.HumanoidRootPart;
	local Q = d.Character.Humanoid;
	local r = d.PlayerGui.Main;
	local a = Y.Position;
	local w = R.Position;
	repeat
		Q.Health = 0;
		R.CFrame = Y;
		r.Quest.Visible = false;
		if (R.Position - w).Magnitude > 1 then
			w = R.Position;
			R.CFrame = Y;
		end;
		task.wait(.5);
	until (Y.Position - R.Position).Magnitude <= 2000;
end;
spawn(function()
	while task.wait() do
		pcall(function()
			if _G.SailBoat_Hydra or _G.WardenBoss or _G.AutoFactory or _G.HighestMirage or _G.HCM or _G.PGB or _G.Leviathan1 or _G.UPGDrago or _G.Complete_Trials or _G.TpDrago_Prehis or _G.BuyDrago or _G.AutoFireFlowers or _G.DT_Uzoth or _G.AutoBerry or _G.Prehis_Find or _G.Prehis_Skills or _G.Prehis_DB or _G.Prehis_DE or _G.FarmBlazeEM or _G.Dojoo or _G.Level or _G.FarmEliteHunt or _G.Auto_Tushita or _G.AutoPole or _G.Shark or _G.TerrorShark or _G.Piranha or _G.FishCrew or _G.HauntedCrew or _G.SeaBeast1 or _G.AutoMatSoul or _G.FarmMastery_G or _G.FarmMastery_Dev or _G.FruitSpawn or _G.Chest or _G.Bone or _G.CakePrint or _G.Ectoplasm or _G.RaidBoss or _G.Bounty1 or _G.Bounty2 or _G.Doughv2 or _G.Praying or _G.AutoKenVTWO then
				y = true;
			else
				y = false;
			end;
		end);
	end;
end);
	AttackNoCoolDown = function()
		local Y = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool");
		if Y and Y:FindFirstChild("ClickRemote", true) then
			Y.ClickRemote:GetAttribute("OriginalName");
			(Y:FindFirstChild("ClickRemote", true)):InvokeServer();
		end;
	end;
GetPosTarget = function()
		for Y, R in pairs(workspace.Enemies:GetChildren()) do
			local Q = R:FindFirstChild("UpperTorso") or R:FindFirstChild("Head");
			if R:FindFirstChild("HumanoidRootPart", true) and Q then
				if (R.Head.Position - d.Character.HumanoidRootPart.Position).Magnitude <= 50 then
					return true, Q.Position;
				end;
			end;
		end;
		for Y, d in pairs(workspace.SeaBeasts:GetChildren()) do
			if d:FindFirstChild("HumanoidRootPart") and (d:FindFirstChild("Health") and d.Health.Value > 0) then
				return true, d.HumanoidRootPart.Position;
			end;
		end;
		for Y, d in pairs(workspace.Enemies:GetChildren()) do
			if d:FindFirstChild("Health") and (d.Health.Value > 0 and d:FindFirstChild("VehicleSeat")) then
				return true, d.Engine.Position;
			end;
		end;
	end;
Actived = function()
		local Y = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool");
		for Y, d in next, getconnections(Y.Activated) do
			if typeof(d.Function) == "function" then
				getupvalues(d.Function);
			end;
		end;
	end;
task.spawn(function()
	W.Heartbeat:Connect(function()
		pcall(function()
			if not _G.Seriality then
				return;
			end;
			AttackNoCoolDown();
			local Y = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool");
			if Y then
				Actived();
			end;
		end);
	end);
end);
