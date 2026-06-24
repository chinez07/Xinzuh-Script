local TweenService = game:GetService("TweenService") -- Corrigido aqui!
local Debris = game:GetService("Debris")

----------------------------------------------------------------
-- ⚙️ CENTRAL DE CONFIGURAÇÃO (MODIFIQUE AQUI SEU SCRIPT)
----------------------------------------------------------------
local CONFIG = {
    NomeDoScript = "XINZUH SCRIPT",
    TituloPrincipal = "USE COM MODERAÇÃO",
    Descricao = "Seja bem-vindo! Junte-se ao nosso Discord para atualizações, novidades e suporte.",
    LinkDiscord = "https://discord.gg/VXwjAQYkxJ",
    
    -- Cores em RGB (Vermelho, Verde, Azul)
    CorDetalhes = Color3.fromRGB(255, 255, 255),    -- Branco
    CorBotaoPadrao = Color3.fromRGB(0, 102, 204),   -- Azul Escuro (Visual Inicial)
    CorBotaoHover = Color3.fromRGB(0, 128, 255),    -- Azul Claro (Ao passar o mouse)
    CorBotaoSucesso = Color3.fromRGB(40, 180, 80)   -- Verde (Ao copiar o link)
}
----------------------------------------------------------------

local CoreGui = (gethui and gethui()) or game:GetService("CoreGui")

if CoreGui:FindFirstChild("XinzuhScriptAlert") then
    CoreGui.XinzuhScriptAlert:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "XinzuhScriptAlert"
ScreenGui.IgnoreGuiInset = true
Debris:AddItem(ScreenGui, 120)

local Overlay = Instance.new("Frame", ScreenGui)
Overlay.Size = UDim2.fromScale(1, 1)
Overlay.BackgroundColor3 = Color3.fromRGB(5, 3, 6)
Overlay.BackgroundTransparency = 1

local AlertCard = Instance.new("Frame", Overlay)
AlertCard.Size = UDim2.new(0, 480, 0, 260)
AlertCard.Position = UDim2.new(0.5, 0, 0.5, 40)
AlertCard.AnchorPoint = Vector2.new(0.5, 0.5)
AlertCard.BackgroundColor3 = Color3.fromRGB(14, 12, 16)
AlertCard.BackgroundTransparency = 1

local CardCorner = Instance.new("UICorner", AlertCard)
CardCorner.CornerRadius = UDim.new(0, 8)

local CardStroke = Instance.new("UIStroke", AlertCard)
CardStroke.Color = Color3.fromRGB(40, 35, 45)
CardStroke.Thickness = 1.5
CardStroke.Transparency = 1

local LeftAccent = Instance.new("Frame", AlertCard)
LeftAccent.Size = UDim2.new(0, 4, 1, -24)
LeftAccent.Position = UDim2.new(0, 12, 0.5, 0)
LeftAccent.AnchorPoint = Vector2.new(0, 0.5)
LeftAccent.BackgroundColor3 = CONFIG.CorDetalhes
LeftAccent.BackgroundTransparency = 1
LeftAccent.BorderSizePixel = 0

local AccentCorner = Instance.new("UICorner", LeftAccent)
AccentCorner.CornerRadius = UDim.new(1, 0)

local TopBrand = Instance.new("TextLabel", AlertCard)
TopBrand.Size = UDim2.new(1, -60, 0, 20)
TopBrand.Position = UDim2.new(0, 30, 0, 20)
TopBrand.BackgroundTransparency = 1
TopBrand.Font = Enum.Font.GothamBold
TopBrand.Text = CONFIG.NomeDoScript
TopBrand.TextColor3 = Color3.fromRGB(255, 255, 255)
TopBrand.TextSize = 11
TopBrand.TextXAlignment = Enum.TextXAlignment.Left
TopBrand.TextTransparency = 1

local BrandGradient = Instance.new("UIGradient", TopBrand)
BrandGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(150, 150, 150))
})

local MainTitle = Instance.new("TextLabel", AlertCard)
MainTitle.Size = UDim2.new(1, -60, 0, 35)
MainTitle.Position = UDim2.new(0, 30, 0, 45)
MainTitle.BackgroundTransparency = 1
MainTitle.Font = Enum.Font.GothamBlack
MainTitle.Text = CONFIG.TituloPrincipal
MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTitle.TextSize = 28
MainTitle.TextXAlignment = Enum.TextXAlignment.Left
MainTitle.TextTransparency = 1

local Description = Instance.new("TextLabel", AlertCard)
Description.Size = UDim2.new(1, -60, 0, 70)
Description.Position = UDim2.new(0, 30, 0, 90)
Description.BackgroundTransparency = 1
Description.Font = Enum.Font.GothamMedium
Description.Text = CONFIG.Descricao
Description.TextColor3 = Color3.fromRGB(170, 170, 175)
Description.TextSize = 13
Description.TextWrapped = true
Description.TextXAlignment = Enum.TextXAlignment.Left
Description.TextYAlignment = Enum.TextYAlignment.Top
Description.TextTransparency = 1

local DiscordBtn = Instance.new("TextButton", AlertCard)
DiscordBtn.Size = UDim2.new(0, 180, 0, 40)
DiscordBtn.Position = UDim2.new(0, 30, 1, -60)
DiscordBtn.BackgroundColor3 = CONFIG.CorBotaoPadrao
DiscordBtn.BackgroundTransparency = 1
DiscordBtn.Font = Enum.Font.GothamBold
DiscordBtn.Text = "ENTRAR NO DISCORD"
DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordBtn.TextSize = 13
DiscordBtn.AutoButtonColor = false
DiscordBtn.TextTransparency = 1

local DiscordCorner = Instance.new("UICorner", DiscordBtn)
DiscordCorner.CornerRadius = UDim.new(0, 6)

local BtnGradient = Instance.new("UIGradient", DiscordBtn)
BtnGradient.Rotation = 90
BtnGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(200, 200, 200))
})

local CloseBtn = Instance.new("TextButton", AlertCard)
CloseBtn.Size = UDim2.new(0, 120, 0, 40)
CloseBtn.Position = UDim2.new(0, 220, 1, -60)
CloseBtn.BackgroundColor3 = Color3.fromRGB(25, 23, 30)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "DESCARTAR"
CloseBtn.TextColor3 = Color3.fromRGB(150, 150, 155)
CloseBtn.TextSize = 13
CloseBtn.AutoButtonColor = false
CloseBtn.TextTransparency = 1

local CloseCorner = Instance.new("UICorner", CloseBtn)
CloseCorner.CornerRadius = UDim.new(0, 6)

local CloseStroke = Instance.new("UIStroke", CloseBtn)
CloseStroke.Color = Color3.fromRGB(45, 40, 50)
CloseStroke.Thickness = 1
CloseStroke.Transparency = 1

local animIn = TweenInfo.new(0.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
local fadeIn = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

TweenService:Create(Overlay, fadeIn, {BackgroundTransparency = 0.2}):Play()
task.wait(0.1)

TweenService:Create(AlertCard, animIn, {Position = UDim2.new(0.5, 0, 0.5, 0), BackgroundTransparency = 0}):Play()
TweenService:Create(CardStroke, fadeIn, {Transparency = 0}):Play()
task.wait(0.1)

TweenService:Create(LeftAccent, fadeIn, {BackgroundTransparency = 0}):Play()
TweenService:Create(TopBrand, fadeIn, {TextTransparency = 0.3}):Play()
task.wait(0.05)

TweenService:Create(MainTitle, fadeIn, {TextTransparency = 0}):Play()
task.wait(0.05)

TweenService:Create(Description, fadeIn, {TextTransparency = 0}):Play()
task.wait(0.1)

TweenService:Create(DiscordBtn, fadeIn, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
TweenService:Create(CloseBtn, fadeIn, {BackgroundTransparency = 0.5, TextTransparency = 0}):Play()
TweenService:Create(CloseStroke, fadeIn, {Transparency = 0}):Play()

DiscordBtn.MouseEnter:Connect(function()
    TweenService:Create(DiscordBtn, TweenInfo.new(0.25), {BackgroundColor3 = CONFIG.CorBotaoHover}):Play()
end)

DiscordBtn.MouseLeave:Connect(function()
    TweenService:Create(DiscordBtn, TweenInfo.new(0.25), {BackgroundColor3 = CONFIG.CorBotaoPadrao}):Play()
end)

DiscordBtn.Activated:Connect(function()
    local link = CONFIG.LinkDiscord
    if setclipboard then
        setclipboard(link)
    elseif toclipboard then
        toclipboard(link)
    end
    
    DiscordBtn.Text = "COPIADO!"
    TweenService:Create(DiscordBtn, TweenInfo.new(0.2), {BackgroundColor3 = CONFIG.CorBotaoSucesso}):Play()
    
    task.wait(2)
    DiscordBtn.Text = "ENTRAR NO DISCORD"
    TweenService:Create(DiscordBtn, TweenInfo.new(0.3), {BackgroundColor3 = CONFIG.CorBotaoPadrao}):Play()
end)

CloseBtn.MouseEnter:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(35, 30, 40), TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    TweenService:Create(CloseStroke, TweenInfo.new(0.25), {Color = Color3.fromRGB(70, 60, 80)}):Play()
end)

CloseBtn.MouseLeave:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(25, 23, 30), TextColor3 = Color3.fromRGB(150, 150, 155)}):Play()
    TweenService:Create(CloseStroke, TweenInfo.new(0.25), {Color = Color3.fromRGB(45, 40, 50)}):Play()
end)

CloseBtn.Activated:Connect(function()
    local animOut = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
    local fadeOut = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    
    TweenService:Create(DiscordBtn, fadeOut, {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    TweenService:Create(CloseBtn, fadeOut, {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    TweenService:Create(CloseStroke, fadeOut, {Transparency = 1}):Play()
    task.wait(0.05)
    
    TweenService:Create(Description, fadeOut, {TextTransparency = 1}):Play()
    task.wait(0.05)
    
    TweenService:Create(MainTitle, fadeOut, {TextTransparency = 1}):Play()
    TweenService:Create(TopBrand, fadeOut, {TextTransparency = 1}):Play()
    TweenService:Create(LeftAccent, fadeOut, {BackgroundTransparency = 1}):Play()
    task.wait(0.1)
    
    TweenService:Create(CardStroke, fadeOut, {Transparency = 1}):Play()
    TweenService:Create(AlertCard, animOut, {Position = UDim2.new(0.5, 0, 0.5, -40), BackgroundTransparency = 1}):Play()
    TweenService:Create(Overlay, animOut, {BackgroundTransparency = 1}):Play()
    
    task.wait(0.5)
    ScreenGui:Destroy()
end)
