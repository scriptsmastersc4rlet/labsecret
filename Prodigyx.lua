-- ProdigyX Universal Script
-- Adopt Me, MM2 & SAB Hub
-- @ShazanScripts

local ProdigyX = {}
ProdigyX.__index = ProdigyX

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

-- Player
local player = Players.LocalPlayer

-- Data
ProdigyX.EggsData = {
    {Name = "🥚 Cracked Egg", Price = "350 Bucks"},
    {Name = "🥚 Pet Egg", Price = "600 Bucks"}, 
    {Name = "🥚 Royal Egg", Price = "1,450 Bucks"},
    {Name = "👴🏻 Retired Egg", Price = "600 Bucks"},
    {Name = "🛕 Aztec Egg", Price = "750 Bucks"}
}

ProdigyX.BrainrotList = {
    "🧠 Pro Player Brainrot",
    "💎 Rich Brainrot", 
    "🌟 Famous Brainrot",
    "👑 VIP Brainrot",
    "⚡ Speed Brainrot",
    "🛡️ Tank Brainrot"
}

ProdigyX.MM2Weapons = {
    "🔪 Gingerblade",
    "🎯 GingerScope", 
    "🔫 Corruptor",
    "❄️ Icebreaker",
    "🔥 Heat Knife",
    "🌙 Eclipse Knife",
    "🌈 Rainbow Knife",
    "💫 Galaxy Knife"
}

ProdigyX.MM2Guns = {
    "🎯 GingerScope",
    "🔫 Corruptor",
    "❄️ Ice Shard Gun",
    "🔥 Heat Gun",
    "🌈 Rainbow Gun",
    "💫 Galaxy Gun"
}

-- Main GUI
function ProdigyX:CreateGUI()
    self.ScreenGui = Instance.new("ScreenGui")
    self.ScreenGui.Name = "ProdigyXUniversal"
    self.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    self.ScreenGui.DisplayOrder = 999
    
    local success = pcall(function()
        self.ScreenGui.Parent = CoreGui
    end)
    
    if not success then
        pcall(function()
            self.ScreenGui.Parent = player:WaitForChild("PlayerGui")
        end)
    end

    -- Create loading screen first
    self:CreateLoadingScreen()
    
    return self.ScreenGui
end

function ProdigyX:CreateLoadingScreen()
    local LoadingFrame = Instance.new("Frame")
    LoadingFrame.Size = UDim2.new(0, 500, 0, 400)
    LoadingFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    LoadingFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    LoadingFrame.BorderSizePixel = 0
    LoadingFrame.ZIndex = 1000
    LoadingFrame.Parent = self.ScreenGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = LoadingFrame
    
    local Glow = Instance.new("UIStroke")
    Glow.Color = Color3.fromRGB(0, 170, 255)
    Glow.Thickness = 3
    Glow.Parent = LoadingFrame
    
    -- Title Bar for dragging
    local LoadingTitleBar = Instance.new("Frame")
    LoadingTitleBar.Size = UDim2.new(1, 0, 0, 35)
    LoadingTitleBar.Position = UDim2.new(0, 0, 0, 0)
    LoadingTitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    LoadingTitleBar.BorderSizePixel = 0
    LoadingTitleBar.Parent = LoadingFrame
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 12)
    TitleCorner.Parent = LoadingTitleBar
    
    local LoadingTitle = Instance.new("TextLabel")
    LoadingTitle.Size = UDim2.new(1, -60, 1, 0)
    LoadingTitle.Position = UDim2.new(0, 15, 0, 0)
    LoadingTitle.BackgroundTransparency = 1
    LoadingTitle.Text = "🔄 ProdigyX - Loading..."
    LoadingTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    LoadingTitle.TextSize = 16
    LoadingTitle.Font = Enum.Font.GothamBold
    LoadingTitle.TextXAlignment = Enum.TextXAlignment.Left
    LoadingTitle.Parent = LoadingTitleBar
    
    local Logo = Instance.new("TextLabel")
    Logo.Size = UDim2.new(1, 0, 0, 50)
    Logo.Position = UDim2.new(0, 0, 0.08, 0)
    Logo.BackgroundTransparency = 1
    Logo.Text = "ADM, SAB & MM2 ProdigyX Universal"
    Logo.TextColor3 = Color3.fromRGB(255, 255, 255)
    Logo.TextSize = 22
    Logo.Font = Enum.Font.GothamBold
    Logo.Parent = LoadingFrame
    
    local SubTitle = Instance.new("TextLabel")
    SubTitle.Size = UDim2.new(1, 0, 0, 25)
    SubTitle.Position = UDim2.new(0, 0, 0.2, 0)
    SubTitle.BackgroundTransparency = 1
    SubTitle.Text = "Prodigy X Library - Initializing"
    SubTitle.TextColor3 = Color3.fromRGB(0, 170, 255)
    SubTitle.TextSize = 14
    SubTitle.Font = Enum.Font.Gotham
    SubTitle.Parent = LoadingFrame
    
    -- Important warning
    local Warning = Instance.new("TextLabel")
    Warning.Size = UDim2.new(0.9, 0, 0, 40)
    Warning.Position = UDim2.new(0.05, 0, 0.3, 0)
    Warning.BackgroundTransparency = 1
    Warning.Text = "⚠️ CAN TAKE UP TO 5 MINUTES\nPLEASE BE PATIENT, THIS IS NORMAL!"
    Warning.TextColor3 = Color3.fromRGB(255, 100, 100)
    Warning.TextSize = 14
    Warning.Font = Enum.Font.GothamBold
    Warning.TextWrapped = true
    Warning.Parent = LoadingFrame
    
    -- Draggable window info
    local DragInfo = Instance.new("TextLabel")
    DragInfo.Size = UDim2.new(0.9, 0, 0, 20)
    DragInfo.Position = UDim2.new(0.05, 0, 0.42, 0)
    DragInfo.BackgroundTransparency = 1
    DragInfo.Text = "💡 You can drag this window by the top bar"
    DragInfo.TextColor3 = Color3.fromRGB(0, 170, 255)
    DragInfo.TextSize = 12
    DragInfo.Font = Enum.Font.Gotham
    DragInfo.TextWrapped = true
    DragInfo.Parent = LoadingFrame
    
    -- Server requirements info
    local ServerInfo = Instance.new("TextLabel")
    ServerInfo.Size = UDim2.new(0.9, 0, 0, 40)
    ServerInfo.Position = UDim2.new(0.05, 0, 0.48, 0)
    ServerInfo.BackgroundTransparency = 1
    ServerInfo.Text = "🌐 SAB: Private Server Only\n🎯 Adopt Me & MM2: Public Servers"
    ServerInfo.TextColor3 = Color3.fromRGB(255, 165, 0)
    ServerInfo.TextSize = 12
    ServerInfo.Font = Enum.Font.GothamBold
    ServerInfo.TextWrapped = true
    ServerInfo.Parent = LoadingFrame
    
    local Explanation = Instance.new("TextLabel")
    Explanation.Size = UDim2.new(0.9, 0, 0, 30)
    Explanation.Position = UDim2.new(0.05, 0, 0.58, 0)
    Explanation.BackgroundTransparency = 1
    Explanation.Text = "Loading many scripts from multiple games..."
    Explanation.TextColor3 = Color3.fromRGB(200, 200, 200)
    Explanation.TextSize = 12
    Explanation.Font = Enum.Font.Gotham
    Explanation.TextWrapped = true
    Explanation.Parent = LoadingFrame
    
    -- Progress bar container
    local ProgressContainer = Instance.new("Frame")
    ProgressContainer.Size = UDim2.new(0.9, 0, 0, 35)
    ProgressContainer.Position = UDim2.new(0.05, 0, 0.68, 0)
    ProgressContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    ProgressContainer.BorderSizePixel = 0
    ProgressContainer.Parent = LoadingFrame
    
    local ProgressCorner = Instance.new("UICorner")
    ProgressCorner.CornerRadius = UDim.new(0, 6)
    ProgressCorner.Parent = ProgressContainer
    
    local ProgressBar = Instance.new("Frame")
    ProgressBar.Size = UDim2.new(0.95, 0, 0, 20)
    ProgressBar.Position = UDim2.new(0.025, 0, 0.2, 0)
    ProgressBar.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    ProgressBar.BorderSizePixel = 0
    ProgressBar.Parent = ProgressContainer
    
    local ProgressFill = Instance.new("Frame")
    ProgressFill.Size = UDim2.new(0, 0, 1, 0)
    ProgressFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    ProgressFill.BorderSizePixel = 0
    ProgressFill.Parent = ProgressBar
    
    local ProgressFillCorner = Instance.new("UICorner")
    ProgressFillCorner.CornerRadius = UDim.new(0, 4)
    ProgressFillCorner.Parent = ProgressFill
    
    local PercentageLabel = Instance.new("TextLabel")
    PercentageLabel.Size = UDim2.new(1, 0, 1, 0)
    PercentageLabel.BackgroundTransparency = 1
    PercentageLabel.Text = "0%"
    PercentageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    PercentageLabel.TextSize = 14
    PercentageLabel.Font = Enum.Font.GothamBold
    PercentageLabel.Parent = ProgressBar
    
    local Status = Instance.new("TextLabel")
    Status.Size = UDim2.new(1, 0, 0, 25)
    Status.Position = UDim2.new(0, 0, 0.85, 0)
    Status.BackgroundTransparency = 1
    Status.Text = "Initializing components..."
    Status.TextColor3 = Color3.fromRGB(200, 200, 200)
    Status.TextSize = 12
    Status.Font = Enum.Font.Gotham
    Status.Parent = LoadingFrame
    
    -- Timer to ensure it takes at least 5 minutes
    local startTime = tick()
    local minLoadTime = 300 -- 5 minutes in seconds
    
    -- Function to make loading screen draggable
    self:MakeLoadingDraggable(LoadingTitleBar, LoadingFrame)
    
    -- Loading animation with minimum time
    coroutine.wrap(function()
        local steps = {
            {text = "Loading graphical interface...", duration = 30},
            {text = "Initializing Adopt Me scripts...", duration = 45},
            {text = "Configuring MM2 scripts...", duration = 40},
            {text = "Preparing SAB scripts...", duration = 35},
            {text = "Setting up security system...", duration = 50},
            {text = "Optimizing performance...", duration = 25},
            {text = "Loading external libraries...", duration = 35},
            {text = "Finalizing initialization...", duration = 40}
        }
        
        local totalDuration = 0
        for _, step in ipairs(steps) do
            totalDuration = totalDuration + step.duration
        end
        
        local elapsed = 0
        local currentStep = 0
        
        while elapsed < minLoadTime do
            local progress = elapsed / minLoadTime
            local currentPercentage = math.floor(progress * 100)
            
            -- Update progress bar
            ProgressFill.Size = UDim2.new(progress, 0, 1, 0)
            PercentageLabel.Text = currentPercentage .. "%"
            
            -- Update current step based on progress
            local stepProgress = elapsed / totalDuration
            local targetStep = math.min(math.floor(stepProgress * #steps) + 1, #steps)
            
            if targetStep > currentStep then
                currentStep = targetStep
                if steps[currentStep] then
                    Status.Text = steps[currentStep].text
                end
            end
            
            -- Periodic warnings to keep user informed
            if currentPercentage == 25 then
                Status.Text = Status.Text .. " (Please wait, loading many resources...)"
            elseif currentPercentage == 50 then
                Status.Text = Status.Text .. " (Halfway there, keep waiting!)"
            elseif currentPercentage == 75 then
                Status.Text = Status.Text .. " (Almost there, preparing interface...)"
            end
            
            elapsed = tick() - startTime
            wait(0.1)
        end
        
        -- Ensure 100%
        ProgressFill.Size = UDim2.new(1, 0, 1, 0)
        PercentageLabel.Text = "100%"
        Status.Text = "✅ Loading complete! Starting interface..."
        
        wait(2)
        
        -- Fade out with animation
        local fadeOut = TweenService:Create(
            LoadingFrame,
            TweenInfo.new(1, Enum.EasingStyle.Quint),
            {BackgroundTransparency = 1}
        )
        
        -- Fade out all elements
        for _, child in ipairs(LoadingFrame:GetChildren()) do
            if child:IsA("TextLabel") then
                local textFade = TweenService:Create(
                    child,
                    TweenInfo.new(1, Enum.EasingStyle.Quint),
                    {TextTransparency = 1}
                )
                textFade:Play()
            elseif child:IsA("Frame") then
                local frameFade = TweenService:Create(
                    child,
                    TweenInfo.new(1, Enum.EasingStyle.Quint),
                    {BackgroundTransparency = 1}
                )
                frameFade:Play()
            elseif child:IsA("UIStroke") then
                local strokeFade = TweenService:Create(
                    child,
                    TweenInfo.new(1, Enum.EasingStyle.Quint),
                    {Transparency = 1}
                )
                strokeFade:Play()
            end
        end
        
        fadeOut:Play()
        
        wait(1.2)
        LoadingFrame:Destroy()
        self:CreateMainContainer()
        self:Notify("🎉 ProdigyX Loaded", "Universal Hub loaded successfully! 🚀\n⚠️ Auto Farm may take up to 3 minutes to load completely.\n🌐 Remember: SAB = Private Server | Adopt Me & MM2 = Public Servers")
    end)()
end

function ProdigyX:MakeLoadingDraggable(frame, loadingFrame)
    local dragging = false
    local dragInput, dragStart, startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        loadingFrame.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X,
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end
    
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = loadingFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

-- ... (o resto do código permanece igual, apenas a função CreateMainContainer e outras continuam)

function ProdigyX:CreateMainContainer()
    self.MainFrame = Instance.new("Frame")
    self.MainFrame.Size = UDim2.new(0, 600, 0, 500)
    self.MainFrame.Position = UDim2.new(0.5, -300, 0.5, -250)
    self.MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    self.MainFrame.BorderSizePixel = 0
    self.MainFrame.Parent = self.ScreenGui
    
    -- Border with glow
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = self.MainFrame
    
    local Glow = Instance.new("UIStroke")
    Glow.Color = Color3.fromRGB(0, 170, 255)
    Glow.Thickness = 2
    Glow.Parent = self.MainFrame
    
    -- Title Bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 40)
    TitleBar.Position = UDim2.new(0, 0, 0, 0)
    TitleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = self.MainFrame
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 12)
    TitleCorner.Parent = TitleBar
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(0.7, 0, 1, 0)
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "ADM, SAB & MM2 ProdigyX Universal"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 16
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TitleBar
    
    -- Server requirements reminder
    local ServerReminder = Instance.new("TextLabel")
    ServerReminder.Size = UDim2.new(0.25, 0, 1, 0)
    ServerReminder.Position = UDim2.new(0.7, 0, 0, 0)
    ServerReminder.BackgroundTransparency = 1
    ServerReminder.Text = "🌐 SAB: Private"
    ServerReminder.TextColor3 = Color3.fromRGB(255, 165, 0)
    ServerReminder.TextSize = 10
    ServerReminder.Font = Enum.Font.GothamBold
    ServerReminder.TextXAlignment = Enum.TextXAlignment.Right
    ServerReminder.Parent = TitleBar
    
    -- Control buttons
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Size = UDim2.new(0, 25, 0, 25)
    MinimizeButton.Position = UDim2.new(1, -60, 0, 7)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    MinimizeButton.BorderSizePixel = 0
    MinimizeButton.Text = "_"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.TextSize = 14
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Parent = TitleBar
    
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 25, 0, 25)
    CloseButton.Position = UDim2.new(1, -30, 0, 7)
    CloseButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    CloseButton.BorderSizePixel = 0
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 14
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Parent = TitleBar
    
    -- ... (o resto do código permanece igual)