-- =============================================
-- XinzuhScript | Blox Fruits - Delta Executor
-- Completo com Todas as Funções Aparecendo
-- =============================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local CoreGui = (gethui and gethui()) or game:GetService("CoreGui")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

player.CharacterAdded:Connect(function(newChar)
    char = newChar
end)

-- ==================== CONFIG ====================
local SaveFolder = "MysticMenuV2"
local function saveData(key, value)
    if writefile then pcall(function() writefile(SaveFolder .. "/" .. key .. ".json", game:GetService("HttpService"):JSONEncode(value)) end) end
    getgenv()["MysticSave_" .. key] = value
end

local function loadData(key, default)
    if readfile and isfile(SaveFolder .. "/" .. key .. ".json") then
        pcall(function() return game:GetService("HttpService"):JSONDecode(readfile(SaveFolder .. "/" .. key .. ".json")) end)
    end
    return getgenv()["MysticSave_" .. key] or default
end

if makefolder and not isfolder(SaveFolder) then makefolder(SaveFolder) end

-- ==================== GUI ====================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MysticMenuV2"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

local FloatBtn = Instance.new("TextButton")
FloatBtn.Parent = ScreenGui
FloatBtn.Size = UDim2.new(0, 65, 0, 65)
FloatBtn.Position = loadData("FloatPos", UDim2.new(0.05, 0, 0.5, -32))
FloatBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 40)
FloatBtn.Text = "Xinzuh"
FloatBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FloatBtn.Font = Enum.Font.GothamBold
FloatBtn.TextSize = 14
FloatBtn.Active = true
FloatBtn.Draggable = true
FloatBtn.ZIndex = 10000

Instance.new("UICorner", FloatBtn).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", FloatBtn).Thickness = 2

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 420, 0, 620)
MainFrame.Position = loadData("PanelPos", UDim2.new(0.5, -210, 0.5, -260))
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(200, 40, 50)

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = MainFrame
TitleLabel.Size = UDim2.new(1, 0, 0, 60)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "XinzuhScript"
TitleLabel.TextColor3 = Color3.fromRGB(230, 50, 60)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 24

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Parent = MainFrame
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Position = UDim2.new(1, -75, 0, 15)
MinimizeBtn.Text = "−"
MinimizeBtn.TextColor3 = Color3.fromRGB(255,255,255)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(40,40,45)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 20
Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(0,6)

MinimizeBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false end)
FloatBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

-- ==================== TOGGLE FUNCTION ====================
local function CreateToggle(parent, name, var, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 50)
    btn.BackgroundColor3 = Color3.fromRGB(35,35,40)
    btn.Text = name .. "   ○"
    btn.TextColor3 = Color3.fromRGB(200,200,200)
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 16
    btn.Parent = parent
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

    getgenv()[var] = getgenv()[var] or false

    local function UpdateVisual()
        btn.Text = name .. (getgenv()[var] and "   ●" or "   ○")
        btn.TextColor3 = getgenv()[var] and Color3.fromRGB(80,255,100) or Color3.fromRGB(200,200,200)
        btn.BackgroundColor3 = getgenv()[var] and Color3.fromRGB(40,60,45) or Color3.fromRGB(35,35,40)
    end
    UpdateVisual()

    btn.MouseButton1Click:Connect(function()
        getgenv()[var] = not getgenv()[var]
        UpdateVisual()
        if getgenv()[var] and callback then task.spawn(callback) end
    end)
end

-- ==================== SCROLL ====================
local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -20, 1, -100)
Scroll.Position = UDim2.new(0, 10, 0, 80)
Scroll.BackgroundTransparency = 1
Scroll.ScrollBarThickness = 6
Scroll.CanvasSize = UDim2.new(0, 0, 0, 700)
Scroll.Parent = MainFrame

-- ==================== TODAS AS FUNÇÕES ====================
CreateToggle(Scroll, "Auto Farm", "AutoFarm", function()
    while getgenv().AutoFarm do task.wait(0.1)
        if workspace.Enemies then
            local closest, minDist = nil, math.huge
            for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
                    local dist = (char.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude
                    if dist < minDist then minDist = dist; closest = enemy end
                end
            end
            if closest then
                char.HumanoidRootPart.CFrame = closest.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3.5)
            end
        end
    end
end)

CreateToggle(Scroll, "Auto Quest", "AutoQuest", function()
    while getgenv().AutoQuest do
        task.wait(3)
        pcall(function()
            for _, npc in pairs(workspace.NPCs:GetChildren()) do
                local click = npc:FindFirstChildWhichIsA("ClickDetector")
                if click then fireclickdetector(click) end
            end
        end)
    end
end)

CreateToggle(Scroll, "Auto Spin Fruit", "AutoSpinFruit", function()
    while getgenv().AutoSpinFruit do
        task.wait(8)
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SpinFruit")
        end)
    end
end)

CreateToggle(Scroll, "Auto Haki", "AutoHaki", function()
    while getgenv().AutoHaki do
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.J, false, game)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.J, false, game)
        task.wait(5)
    end
end)

CreateToggle(Scroll, "Auto Boss", "AutoBoss", function()
    while getgenv().AutoBoss do
        task.wait(0.5)
        if workspace.Enemies then
            for _, boss in pairs(workspace.Enemies:GetChildren()) do
                if string.find(boss.Name:lower(), "boss") and boss.Humanoid.Health > 0 then
                    char.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4)
                end
            end
        end
    end
end)

-- ==================== SALVAR POSIÇÕES ====================
FloatBtn:GetPropertyChangedSignal("Position"):Connect(function() saveData("FloatPos", FloatBtn.Position) end)
MainFrame:GetPropertyChangedSignal("Position"):Connect(function() saveData("PanelPos", MainFrame.Position) end)

print("✅ XinzuhScript Completo carregado com todas as funções!")
