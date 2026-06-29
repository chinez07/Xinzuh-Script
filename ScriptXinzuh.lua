-- =============================================
-- XinzuhScript | Blox Fruits - Delta Executor
-- Versão Premium Melhorada (UI + Funcionalidades)
-- =============================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local CoreGui = (gethui and gethui()) or game:GetService("CoreGui")

local player = Players.LocalPlayer
local character, root, hum

local function UpdateChar()
    character = player.Character or player.CharacterAdded:Wait()
    root = character:WaitForChild("HumanoidRootPart")
    hum = character:WaitForChild("Humanoid")
end
UpdateChar()
player.CharacterAdded:Connect(UpdateChar)

-- ==================== CONFIG ====================
local SaveFolder = "Xinzuh_BloxFruits"
local Config = {
    FloatPos = UDim2.new(0, 30, 0.5, -32),
    PanelPos = UDim2.new(0.5, -210, 0.5, -260),
    SelectedWeapon = "All",
    FarmHeight = 3.5,
    AutoFarm = false,
    AutoQuest = true,
    AutoBoss = false,
    AutoSpinFruit = false,
    AutoHaki = false,
}

local Teleports = {
    ["Starter Island"] = CFrame.new(1045, 16, 1435),
    ["Jungle"] = CFrame.new(-1600, 36, 150),
    ["Pirate Village"] = CFrame.new(-1150, 70, 3900),
    ["Marine Fortress"] = CFrame.new(-6430, 250, -2300),
    ["Midnight"] = CFrame.new(-6500, 250, -5500),
    ["Fountain City"] = CFrame.new(5200, 40, 4000),
    ["Dressrosa"] = CFrame.new(5200, 40, -1000),
    ["Baratie"] = CFrame.new(-1700, 80, -10500),
    ["Arlong Park"] = CFrame.new(-6500, 80, -1200),
}

local function SaveConfig() if writefile then pcall(function() writefile(SaveFolder.."/config.json", game:GetService("HttpService"):JSONEncode(Config)) end) end end
local function LoadConfig() if readfile and isfile(SaveFolder.."/config.json") then pcall(function() Config = game:GetService("HttpService"):JSONDecode(readfile(SaveFolder.."/config.json")) end) end end

if makefolder and not isfolder(SaveFolder) then makefolder(SaveFolder) end
LoadConfig()

-- ==================== GUI MELHORADA ====================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "XinzuhScript"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 480, 0, 680)
MainFrame.Position = Config.PanelPos
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 16)
Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(220, 40, 50)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,70)
Title.BackgroundTransparency = 1
Title.Text = "XinzuhScript"
Title.TextColor3 = Color3.fromRGB(235, 50, 60)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 28
Title.Parent = MainFrame

local FloatBtn = Instance.new("TextButton")
FloatBtn.Size = UDim2.new(0,70,0,70)
FloatBtn.Position = Config.FloatPos
FloatBtn.BackgroundColor3 = Color3.fromRGB(180,30,40)
FloatBtn.Text = "Xinzuh"
FloatBtn.TextColor3 = Color3.fromRGB(255,255,255)
FloatBtn.Font = Enum.Font.GothamBold
FloatBtn.TextSize = 14
FloatBtn.Draggable = true
FloatBtn.Parent = ScreenGui

Instance.new("UICorner", FloatBtn).CornerRadius = UDim.new(1,0)

FloatBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- ==================== FUNÇÕES DE UI ====================
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

    Config[var] = Config[var] or false

    local function UpdateVisual()
        btn.Text = name .. (Config[var] and "   ●" or "   ○")
        btn.TextColor3 = Config[var] and Color3.fromRGB(80,255,100) or Color3.fromRGB(200,200,200)
        btn.BackgroundColor3 = Config[var] and Color3.fromRGB(40,60,45) or Color3.fromRGB(35,35,40)
    end
    UpdateVisual()

    btn.MouseButton1Click:Connect(function()
        Config[var] = not Config[var]
        SaveConfig()
        UpdateVisual()
        if Config[var] and callback then task.spawn(callback) end
    end)
end

-- ==================== TELEPORTS DINÂMICOS ====================
local TeleportScroll = Instance.new("ScrollingFrame")
TeleportScroll.Size = UDim2.new(1, -20, 0, 320)
TeleportScroll.Position = UDim2.new(0, 10, 0, 100)
TeleportScroll.BackgroundTransparency = 1
TeleportScroll.ScrollBarThickness = 6
TeleportScroll.Parent = MainFrame

local function CreateTeleportButton(name, cf)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 45)
    btn.BackgroundColor3 = Color3.fromRGB(50,50,55)
    btn.Text = "→ " .. name
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 15
    btn.Parent = TeleportScroll
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

    btn.MouseButton1Click:Connect(function()
        if root then
            root.CFrame = cf
        end
    end)
end

for name, cf in pairs(Teleports) do
    CreateTeleportButton(name, cf)
end

-- ==================== AUTO FARM COM ALTURA AJUSTÁVEL ====================
local CurrentTarget = nil

local function SmartAutoFarm()
    while Config.AutoFarm do
        task.wait(0.1)

        if workspace.Enemies then
            local closest, minDist = nil, math.huge
            for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
                    local dist = (root.Position - enemy.HumanoidRootPart.Position).Magnitude
                    if dist < minDist then minDist = dist; closest = enemy end
                end
            end
            CurrentTarget = closest
        end

        if CurrentTarget then
            root.CFrame = CurrentTarget.HumanoidRootPart.CFrame * CFrame.new(0, 0, Config.FarmHeight)
        end
    end
end

-- ==================== OUTRAS FUNÇÕES ====================
local function AutoTakeQuest()
    while Config.AutoQuest do
        task.wait(3)
        pcall(function()
            for _, npc in pairs(workspace.NPCs:GetChildren()) do
                local click = npc:FindFirstChildWhichIsA("ClickDetector")
                if click then fireclickdetector(click) end
            end
        end)
    end
end

local function AutoSpinFruit()
    while Config.AutoSpinFruit do
        task.wait(6)
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SpinFruit")
        end)
    end
end

-- ==================== AUTO ATTACK ====================
local attackConn
local function StartAutoAttack()
    if attackConn then return end
    attackConn = RunService.Heartbeat:Connect(function()
        if not (Config.AutoFarm or Config.AutoBoss) or not CurrentTarget then return end

        VirtualInputManager:SendMouseButtonEvent(0,0,0,true,game,1)
        task.wait(0.07)
        VirtualInputManager:SendMouseButtonEvent(0,0,0,false,game,1)
    end)
end

-- ==================== SALVAR POSIÇÕES ====================
FloatBtn:GetPropertyChangedSignal("Position"):Connect(function() Config.FloatPos = FloatBtn.Position; SaveConfig() end)
MainFrame:GetPropertyChangedSignal("Position"):Connect(function() Config.PanelPos = MainFrame.Position; SaveConfig() end)

print("✅ XinzuhScript Premium carregado com sucesso!")
