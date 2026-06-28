local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = (gethui and gethui()) or game:GetService("CoreGui")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

player.CharacterAdded:Connect(function(newChar)
    char = newChar
end)

-- Interface Principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CoreGui
ScreenGui.Name = "MysticMenuV2"
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 350, 0, 440) -- Altura aumentada para 440
Frame.Position = UDim2.new(0.5, -175, 0.5, -220)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

local FrameCorner = Instance.new("UICorner", Frame)
FrameCorner.CornerRadius = UDim.new(0, 10)

local FrameStroke = Instance.new("UIStroke", Frame)
FrameStroke.Color = Color3.fromRGB(55, 55, 60)
FrameStroke.Thickness = 1.5

-- ==================== TEXTO DO CRIADOR ====================
local CreatorLabel = Instance.new("TextLabel")
CreatorLabel.Parent = Frame
CreatorLabel.Size = UDim2.new(1, 0, 0, 40)
CreatorLabel.Position = UDim2.new(0, 0, 0, 10)
CreatorLabel.BackgroundTransparency = 1
CreatorLabel.Text = "Creator: XinzuhScript"
CreatorLabel.TextColor3 = Color3.fromRGB(230, 50, 60) -- Cor vermelha em destaque
CreatorLabel.Font = Enum.Font.GothamBold
CreatorLabel.TextSize = 16
CreatorLabel.TextAlignment = Enum.TextXAlignment.Center

-- Funções de criação de botões
local function createToggleButton(name, pos, globalVar, callback)
    local b = Instance.new("TextButton")
    b.Parent = Frame
    b.Size = UDim2.new(0, 300, 0, 35)
    b.Position = UDim2.new(0, 25, 0, pos)
    b.Text = name .. " [OFF]"
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
    b.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13

    local btnCorner = Instance.new("UICorner", b)
    btnCorner.CornerRadius = UDim.new(0, 6)

    getgenv()[globalVar] = false

    b.MouseButton1Click:Connect(function()
        getgenv()[globalVar] = not getgenv()[globalVar]
        
        if getgenv()[globalVar] then
            b.Text = name .. " [ON]"
            b.TextColor3 = Color3.fromRGB(255, 255, 255)
            b.BackgroundColor3 = Color3.fromRGB(35, 150, 80)
            task.spawn(callback)
        else
            b.Text = name .. " [OFF]"
            b.TextColor3 = Color3.fromRGB(200, 200, 200)
            b.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        end
    end)
end

local function createRegularButton(name, pos, callback)
    local b = Instance.new("TextButton")
    b.Parent = Frame
    b.Size = UDim2.new(0, 300, 0, 35)
    b.Position = UDim2.new(0, 25, 0, pos)
    b.Text = name
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13

    local btnCorner = Instance.new("UICorner", b)
    btnCorner.CornerRadius = UDim.new(0, 6)

    b.MouseButton1Click:Connect(callback)
end

-- ==================== FUNÇÕES DO MENU (Posições Ajustadas) ====================

-- AUTO FARM (Posição inicial mudou para 60)
createToggleButton("Auto Farm", 60, "AutoFarm", function()
    while getgenv().AutoFarm do
        task.wait()
        if workspace:FindFirstChild("Enemies") then
            for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                if getgenv().AutoFarm and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                    while getgenv().AutoFarm and enemy.Parent and enemy.Humanoid.Health > 0 do
                        task.wait()
                        if char and char:FindFirstChild("HumanoidRootPart") then
                            char.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                        end
                    end
                end
            end
        end
    end
end)

-- AUTO LEVEL
createToggleButton("Auto Level", 110, "AutoLevel", function()
    while getgenv().AutoLevel do
        task.wait()
        if workspace:FindFirstChild("Enemies") then
            for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                if getgenv().AutoLevel and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                    while getgenv().AutoLevel and enemy.Parent and enemy.Humanoid.Health > 0 do
                        task.wait()
                        if char and char:FindFirstChild("HumanoidRootPart") then
                            char.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
                        end
                    end
                end
            end
        end
    end
end)

-- FRUIT SNIPER
createToggleButton("Fruit Sniper", 160, "FruitSniper", function()
    while getgenv().FruitSniper do
        task.wait(1)
        for _, v in pairs(workspace:GetChildren()) do
            if getgenv().FruitSniper and string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
                if char and char:FindFirstChild("HumanoidRootPart") then
                    char.HumanoidRootPart.CFrame = v.Handle.CFrame
                    task.wait(0.5)
                end
            end
        end
    end
end)

-- AUTO BOSS
createToggleButton("Auto Boss", 210, "AutoBoss", function()
    while getgenv().AutoBoss do
        task.wait()
        if workspace:FindFirstChild("Enemies") then
            for _, boss in pairs(workspace.Enemies:GetChildren()) do
                if getgenv().AutoBoss and string.find(boss.Name, "Boss") and boss:FindFirstChild("HumanoidRootPart") and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                    while getgenv().AutoBoss and boss.Parent and boss.Humanoid.Health > 0 do
                        task.wait()
                        if char and char:FindFirstChild("HumanoidRootPart") then
                            char.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame
                        end
                    end
                end
            end
        end
    end
end)

-- AUTO HAKI
createToggleButton("Auto Haki", 260, "AutoHaki", function()
    local Vim = game:GetService("VirtualInputManager")
    while getgenv().AutoHaki do
        Vim:SendKeyEvent(true, Enum.KeyCode.J, false, game)
        Vim:SendKeyEvent(false, Enum.KeyCode.J, false, game)
        task.wait(5)
    end
end)

-- TELEPORTES
createRegularButton("Teleport Starter Island", 320, function()
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(1050, 16, 1500)
    end
end)

createRegularButton("Teleport Jungle", 370, function()
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(-1600, 36, 150)
    end
end)
