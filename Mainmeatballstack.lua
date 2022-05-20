local function whitelisted()
	local users = game:HttpGet("https://raw.githubusercontent.com/noam2017/stacks/main/list", true):split("\n")
	for _, user in pairs(users) do
		if user == game.Players.LocalPlayer.Name then
			return true
		end
	end
end

if not whitelisted() then
	return game.Players.LocalPlayer:Kick("LeNoX on top 😍🔫")
end


wait(1)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local playerlist = {};
for i,v in pairs(game.Players:GetPlayers())do
	table.insert(playerlist,v.Name)
end

local Main = Library.CreateLib("Lenox's Meatball Stack", "DarkTheme")
local T1 = Main:NewTab("Script")
local S1 = T1:NewSection("Script")
S1:NewKeybind("Toggle UI", "", Enum.KeyCode.E, function()
	Library:ToggleUI()
end)

local PlayerChosen;
local drop = S1:NewDropdown("Target User", "", playerlist, function(new)
	PlayerChosen = new;
end)

game.Players.PlayerAdded:Connect(function(player)
	local name = player.Name
	table.insert(playerlist,name)
	drop:Refresh(playerlist)
end)

game.Players.PlayerRemoving:Connect(function(player)
	local name = player.Name
	for i,v in pairs(playerlist)do
		if v == name then  
			table.remove(playerlist,i)
		end
	end
end)

S1:NewToggle("Stack All User", "", function(state)
	tgo = state
	while tgo do
		task.wait()
		pcall (function()
			local Random = game.Players:GetPlayers()[math.random(1,#game.Players:GetPlayers())]
			if Random.PrivateStats.BodyToughness.Value <= game:GetService("Players").LocalPlayer.PrivateStats.FistStrength.Value * 2 then
				if Random.Character.Humanoid.Health ~= 0 then
					if not Random.Character:FindFirstChild("SafeZoneShield") then 
						local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
						local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z

						local x2 = Random.Character.HumanoidRootPart.Position.x
						local y = Random.Character.HumanoidRootPart.Position.y
						local z2 = Random.Character.HumanoidRootPart.Position.z
						local args = {[1] = {[1] = "Skill_SpherePunch",[2] = Vector3.new(x, 10000, z)}}
						game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
						for i, v in ipairs (game:GetService("Workspace").Storage:GetChildren()) do
							if v.Name == "EnergySphere9" then
								v.CFrame = CFrame.new(x2, y, z2)
							end 
						end
					end
				end
			end
		end)
	end
end)

S1:NewToggle("Stack One User", "Info", function(state)
	da = state
	while da do
		task.wait()
		pcall (function()
			if game.Players:FindFirstChild(PlayerChosen).Character.Humanoid.Health ~= 0 then
				if not game.Players:FindFirstChild(PlayerChosen).Character:FindFirstChild("SafeZoneShield") then 
					local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
					local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z

					local x2 = game.Players:FindFirstChild(PlayerChosen).Character.HumanoidRootPart.Position.x
					local y = game.Players:FindFirstChild(PlayerChosen).Character.HumanoidRootPart.Position.y
					local z2 = game.Players:FindFirstChild(PlayerChosen).Character.HumanoidRootPart.Position.z
					local args = {[1] = {[1] = "Skill_SpherePunch",[2] = Vector3.new(x, 10000, z)}}
					game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
					for i, v in ipairs (game:GetService("Workspace").Storage:GetChildren()) do
						if v.Name == "EnergySphere9" then
							v.CFrame = CFrame.new(x2, y, z2)
						end 
					end
				end
			end
		end)
	end
end)