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
Frame.Size = UDim2.new(0, 350, 0, 475) -- Altura ajustada para 475
Frame.Position = UDim2.new(0.5, -175, 0.5, -237)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Visible = true -- Começa aberto por padrão

local FrameCorner = Instance.new("UICorner", Frame)
FrameCorner.CornerRadius = UDim.new(0, 10)

local FrameStroke = Instance.new("UIStroke", Frame)
FrameStroke.Color = Color3.fromRGB(55, 55, 60)
FrameStroke.Thickness = 1.5

-- ==================== BOTÃO FLUTUANTE (ABRIR / MINIMIZAR) ====================
local OpenBtn = Instance.new("TextButton")
OpenBtn.Parent = ScreenGui
OpenBtn.Size = UDim2.new(0, 60, 0, 60)
OpenBtn.Position = UDim2.new(0, 20, 0.5, -30) -- Fica no canto esquerdo central da tela
OpenBtn.BackgroundColor3 = Color3.fromRGB(230, 50, 60)
OpenBtn.Text = "Xinzuh"
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.TextSize = 12

local OpenCorner = Instance.new("UICorner", OpenBtn)
OpenCorner.CornerRadius = UDim.new(1, 0) -- Deixa o botão redondo

local OpenStroke = Instance.new("UIStroke", OpenBtn)
OpenStroke.Color = Color3.fromRGB(255, 255, 255)
OpenStroke.Thickness = 1.5

OpenBtn.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)

-- ==================== TEXTO DO CRIADOR ====================
local CreatorLabel = Instance.new("TextLabel")
CreatorLabel.Parent = Frame
CreatorLabel.Size = UDim2.new(1, -70, 0, 40)
CreatorLabel.Position = UDim2.new(0, 20, 0, 10)
CreatorLabel.BackgroundTransparency = 1
CreatorLabel.Text = "Creator: XinzuhScript"
CreatorLabel.TextColor3 = Color3.fromRGB(230, 50, 60)
CreatorLabel.Font = Enum.Font.GothamBold
CreatorLabel.TextSize = 16
CreatorLabel.TextXAlignment = Enum.TextXAlignment.Left

-- ==================== BOTÃO DE FECHAR 1 (X NO TOPO) ====================
local CloseBtn1 = Instance.new("TextButton")
CloseBtn1.Parent = Frame
CloseBtn1.Size = UDim2.new(0, 30, 0, 30)
CloseBtn1.Position = UDim2.new(1, -45, 0, 15)
CloseBtn1.Text = "X"
CloseBtn1.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn1.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
CloseBtn1.Font = Enum.Font.GothamBold
CloseBtn1.TextSize = 14

local Close1Corner = Instance.new("UICorner", CloseBtn1)
Close1Corner.CornerRadius = UDim.new(0, 6)

CloseBtn1.MouseButton1Click:Connect(function()
    Frame.Visible = false
end)

-- Funções base para criação dos botões de comandos
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

-- ==================== FUNÇÕES DO MENU ====================

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

createToggleButton("Auto Haki", 260, "AutoHaki", function()
    local Vim = game:GetService("VirtualInputManager")
    while getgenv().AutoHaki do
        Vim:SendKeyEvent(true, Enum.KeyCode.J, false, game)
        Vim:SendKeyEvent(false, Enum.KeyCode.J, false, game)
        task.wait(5)
    end
end)

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

-- ==================== BOTÃO DE FECHAR 2 (BOTÃO INFERIOR) ====================
local CloseBtn2 = Instance.new("TextButton")
CloseBtn2.Parent = Frame
CloseBtn2.Size = UDim2.new(0, 300, 0, 35)
CloseBtn2.Position = UDim2.new(0, 25, 0, 425) -- Alinhado perfeitamente no fim da lista
CloseBtn2.Text = "FECHAR PAINEL"
CloseBtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn2.BackgroundColor3 = Color3.fromRGB(160, 40, 50) -- Vermelho escuro diferenciado
CloseBtn2.Font = Enum.Font.GothamBold
CloseBtn2.TextSize = 13

local Close2Corner = Instance.new("UICorner", CloseBtn2)
Close2Corner.CornerRadius = UDim.new(0, 6)

CloseBtn2.MouseButton1Click:Connect(function()
    Frame.Visible = false
end)
