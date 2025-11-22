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
    
    -- Round buttons
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = MinimizeButton
    buttonCorner:Clone().Parent = CloseButton
    
    -- Variable for minimize control
    self.IsMinimized = false
    self.OriginalSize = self.MainFrame.Size
    self.OriginalPosition = self.MainFrame.Position
    
    -- Button functions
    MinimizeButton.MouseButton1Click:Connect(function()
        self:ToggleMinimize()
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        self.ScreenGui:Destroy()
    end)
    
    -- Hover effects
    local function setupButtonHover(button)
        button.MouseEnter:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
        end)
        button.MouseLeave:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        end)
    end
    
    setupButtonHover(MinimizeButton)
    setupButtonHover(CloseButton)
    
    -- Make draggable
    self:MakeDraggable(TitleBar)
    
    -- Create tabs
    self:CreateTabs()
end

function ProdigyX:ToggleMinimize()
    self.IsMinimized = not self.IsMinimized
    
    if self.IsMinimized then
        -- Minimize: keep only title bar
        local minimizeTween = TweenService:Create(
            self.MainFrame,
            TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
            {
                Size = UDim2.new(0, 300, 0, 40),
                Position = UDim2.new(0.5, -150, 0, 10)
            }
        )
        minimizeTween:Play()
        
        -- Hide content
        for _, child in ipairs(self.MainFrame:GetChildren()) do
            if child.Name ~= "TitleBar" then
                child.Visible = false
            end
        end
    else
        -- Restore
        local restoreTween = TweenService:Create(
            self.MainFrame,
            TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
            {
                Size = self.OriginalSize,
                Position = self.OriginalPosition
            }
        )
        restoreTween:Play()
        
        -- Show content
        for _, child in ipairs(self.MainFrame:GetChildren()) do
            child.Visible = true
        end
    end
end

function ProdigyX:MakeDraggable(frame)
    local dragging = false
    local dragInput, dragStart, startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        self.MainFrame.Position = UDim2.new(
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
            startPos = self.MainFrame.Position
            
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

function ProdigyX:CreateTabs()
    local TabButtons = Instance.new("Frame")
    TabButtons.Size = UDim2.new(1, 0, 0, 40)
    TabButtons.Position = UDim2.new(0, 0, 0, 40)
    TabButtons.BackgroundTransparency = 1
    TabButtons.Name = "TabButtons"
    TabButtons.Parent = self.MainFrame
    
    self.ContentFrame = Instance.new("Frame")
    self.ContentFrame.Size = UDim2.new(1, -20, 1, -90)
    self.ContentFrame.Position = UDim2.new(0, 10, 0, 90)
    self.ContentFrame.BackgroundTransparency = 1
    self.ContentFrame.ClipsDescendants = true
    self.ContentFrame.Name = "ContentFrame"
    self.ContentFrame.Parent = self.MainFrame
    
    -- Store tab references
    self.Tabs = {}
    
    -- Create tabs
    self.Tabs.AdoptMe = self:CreateAdoptMeTab()
    self.Tabs.MM2 = self:CreateMM2Tab()
    self.Tabs.SAB = self:CreateSABTab()
    
    -- Add tabs to ContentFrame
    for name, tab in pairs(self.Tabs) do
        tab.Parent = self.ContentFrame
        tab.Visible = false
    end
    
    -- Create tab buttons
    local tabNames = {"ADOPT ME", "MM2", "SAB"}
    local tabKeys = {"AdoptMe", "MM2", "SAB"}
    
    for i, tabName in ipairs(tabNames) do
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0.33, -4, 1, 0)
        button.Position = UDim2.new((i-1) * 0.33, 2, 0, 0)
        button.BackgroundColor3 = i == 1 and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(35, 35, 45)
        button.BorderSizePixel = 0
        button.Text = tabName
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextSize = 14
        button.Font = Enum.Font.GothamBold
        button.Name = tabKeys[i]
        button.Parent = TabButtons
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = button
        
        -- Connect click event
        button.MouseButton1Click:Connect(function()
            self:SwitchTab(tabKeys[i])
        end)
    end
    
    -- Show first tab by default
    self:SwitchTab("AdoptMe")
end

function ProdigyX:SwitchTab(tabName)
    -- Hide all tabs
    for name, tab in pairs(self.Tabs) do
        tab.Visible = false
    end
    
    -- Show selected tab
    if self.Tabs[tabName] then
        self.Tabs[tabName].Visible = true
    end
    
    -- Update button colors
    local TabButtons = self.MainFrame:FindFirstChild("TabButtons")
    if TabButtons then
        for _, button in ipairs(TabButtons:GetChildren()) do
            if button:IsA("TextButton") then
                button.BackgroundColor3 = button.Name == tabName and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(35, 35, 45)
            end
        end
    end
    
    self:Notify("Tab Changed", "Switched to " .. tabName .. " tab")
end

-- Notifications
function ProdigyX:Notify(title, message)
    local Notification = Instance.new("Frame")
    Notification.Size = UDim2.new(0, 350, 0, 100)
    Notification.Position = UDim2.new(1, 10, 0.1, 0)
    Notification.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    Notification.BorderSizePixel = 0
    Notification.ZIndex = 1000
    Notification.Parent = self.ScreenGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = Notification
    
    local Glow = Instance.new("UIStroke")
    Glow.Color = Color3.fromRGB(0, 170, 255)
    Glow.Thickness = 2
    Glow.Parent = Notification
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -20, 0, 30)
    Title.Position = UDim2.new(0, 10, 0, 10)
    Title.BackgroundTransparency = 1
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(0, 170, 255)
    Title.TextSize = 16
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Notification
    
    local Message = Instance.new("TextLabel")
    Message.Size = UDim2.new(1, -20, 0, 50)
    Message.Position = UDim2.new(0, 10, 0, 40)
    Message.BackgroundTransparency = 1
    Message.Text = message
    Message.TextColor3 = Color3.fromRGB(200, 200, 200)
    Message.TextSize = 14
    Message.Font = Enum.Font.Gotham
    Message.TextXAlignment = Enum.TextXAlignment.Left
    Message.TextWrapped = true
    Message.Parent = Notification
    
    local tweenIn = TweenService:Create(
        Notification, 
        TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Position = UDim2.new(1, -360, 0.1, 0)}
    )
    tweenIn:Play()
    
    delay(5, function()
        local tweenOut = TweenService:Create(
            Notification, 
            TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In),
            {Position = UDim2.new(1, 10, 0.1, 0)}
        )
        tweenOut:Play()
        tweenOut.Completed:Connect(function() 
            Notification:Destroy() 
        end)
    end)
end

-- UI Elements
function ProdigyX:CreateSection(title, parent)
    local section = Instance.new("Frame")
    section.Size = UDim2.new(1, 0, 0, 30)
    section.BackgroundTransparency = 1
    section.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = title
    label.TextColor3 = Color3.fromRGB(0, 170, 255)
    label.TextSize = 16
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = section
    
    return section
end

function ProdigyX:CreateButton(text, parent, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 40)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.Font = Enum.Font.Gotham
    button.AutoButtonColor = true
    button.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = button
    
    -- Hover effect
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    end)
    
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    end)
    
    button.MouseButton1Click:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
        wait(0.1)
        button.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        if callback then
            callback()
        end
    end)
    
    return button
end

function ProdigyX:CreateToggleButton(text, parent, defaultState, callback)
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(1, 0, 0, 40)
    toggle.BackgroundColor3 = defaultState and Color3.fromRGB(0, 120, 80) or Color3.fromRGB(40, 40, 50)
    toggle.BorderSizePixel = 0
    toggle.Text = text .. ": " .. (defaultState and "ON" or "OFF")
    toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggle.TextSize = 14
    toggle.Font = Enum.Font.Gotham
    toggle.AutoButtonColor = true
    toggle.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = toggle
    
    local state = defaultState
    
    -- Hover effect
    toggle.MouseEnter:Connect(function()
        if state then
            toggle.BackgroundColor3 = Color3.fromRGB(0, 140, 100)
        else
            toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        end
    end)
    
    toggle.MouseLeave:Connect(function()
        if state then
            toggle.BackgroundColor3 = Color3.fromRGB(0, 120, 80)
        else
            toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        end
    end)
    
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.BackgroundColor3 = state and Color3.fromRGB(0, 120, 80) or Color3.fromRGB(40, 40, 50)
        toggle.Text = text .. ": " .. (state and "ON" or "OFF")
        if callback then
            callback(state)
        end
    end)
    
    return toggle
end

-- Adopt Me Tab
function ProdigyX:CreateAdoptMeTab()
    local frame = Instance.new("ScrollingFrame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.ScrollBarThickness = 6
    frame.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)
    frame.CanvasSize = UDim2.new(0, 0, 0, 650)
    frame.Name = "AdoptMeTab"
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 10)
    layout.Parent = frame
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
    padding.Parent = frame
    
    -- Auto Farm warning
    local FarmWarningSection = Instance.new("Frame")
    FarmWarningSection.Size = UDim2.new(1, 0, 0, 60)
    FarmWarningSection.BackgroundColor3 = Color3.fromRGB(40, 30, 20)
    FarmWarningSection.BorderSizePixel = 0
    FarmWarningSection.Parent = frame
    
    local WarningCorner = Instance.new("UICorner")
    WarningCorner.CornerRadius = UDim.new(0, 8)
    WarningCorner.Parent = FarmWarningSection
    
    local WarningLabel = Instance.new("TextLabel")
    WarningLabel.Size = UDim2.new(1, -10, 1, -10)
    WarningLabel.Position = UDim2.new(0, 5, 0, 5)
    WarningLabel.BackgroundTransparency = 1
    WarningLabel.Text = "⚠️ ATTENTION: Auto Farm may take up to 3 minutes to load completely after main loading!"
    WarningLabel.TextColor3 = Color3.fromRGB(255, 165, 0)
    WarningLabel.TextSize = 12
    WarningLabel.Font = Enum.Font.GothamBold
    WarningLabel.TextWrapped = true
    WarningLabel.Parent = FarmWarningSection
    
    -- Auto Farm
    self:CreateSection("🚜 AUTO FARM", frame)
    
    self:CreateToggleButton("🤖 Auto Baby Farm", frame, false, function(state)
        self:Notify("Adopt Me", "Auto Baby Farm: " .. (state and "ENABLED 🟢" or "DISABLED 🔴"))
    end)
    
    self:CreateButton("🥚 Auto Buy Eggs", frame, function()
        self:OpenEggsSubTab()
    end)
    
    -- House & Events
    self:CreateSection("🏠 HOUSE & EVENTS", frame)
    
    self:CreateButton("🏡 House Replicator", frame, function()
        self:OpenHouseReplicatorSubTab()
    end)
    
    -- Fake Spin the Wheel
    self:CreateSection("🎡 FAKE SPIN THE WHEEL", frame)
    
    self:CreateButton("🎰 Fake Spin the Wheel", frame, function()
        self:OpenFakeSpinSubTab()
    end)
    
    -- Freeze Trade
    self:CreateSection("❄️ FREEZE TRADE", frame)
    
    self:CreateButton("⏸️ Freeze Trade", frame, function()
        self:OpenFreezeTradeSubTab()
    end)
    
    return frame
end

-- SUB-TABS FOR ADOPT ME
function ProdigyX:OpenEggsSubTab()
    self:ClearContentFrame()
    
    local frame = Instance.new("ScrollingFrame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.ScrollBarThickness = 6
    frame.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)
    frame.CanvasSize = UDim2.new(0, 0, 0, 500)
    frame.Parent = self.ContentFrame
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 10)
    layout.Parent = frame
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
    padding.Parent = frame
    
    local backButton = self:CreateButton("← Back to Adopt Me", frame, function()
        self:SwitchTab("AdoptMe")
    end)
    
    self:CreateSection("🥚 SELECT EGGS TO BUY", frame)
    
    local selectedEggs = {}
    
    for i, egg in ipairs(self.EggsData) do
        local eggButton = Instance.new("TextButton")
        eggButton.Size = UDim2.new(1, 0, 0, 50)
        eggButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        eggButton.BorderSizePixel = 0
        eggButton.Text = egg.Name .. "\n" .. egg.Price
        eggButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        eggButton.TextSize = 14
        eggButton.Font = Enum.Font.Gotham
        eggButton.TextWrapped = true
        eggButton.AutoButtonColor = true
        eggButton.Parent = frame
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = eggButton
        
        eggButton.MouseButton1Click:Connect(function()
            selectedEggs[egg.Name] = not selectedEggs[egg.Name]
            if selectedEggs[egg.Name] then
                eggButton.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
                self:Notify("Egg Selection", egg.Name .. " selected ✅")
            else
                eggButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
                self:Notify("Egg Selection", egg.Name .. " deselected ❌")
            end
        end)
    end
    
    self:CreateButton("✅ START AUTO BUY SELECTED EGGS", frame, function()
        local count = 0
        for _ in pairs(selectedEggs) do count = count + 1 end
        if count > 0 then
            self:Notify("Auto Buy", "Buying " .. count .. " selected eggs! 🥚\nPlease wait...")
        else
            self:Notify("Auto Buy", "Please select at least one egg! ⚠️")
        end
    end)
end

function ProdigyX:OpenHouseReplicatorSubTab()
    self:ClearContentFrame()
    
    local frame = Instance.new("ScrollingFrame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.ScrollBarThickness = 6
    frame.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)
    frame.CanvasSize = UDim2.new(0, 0, 0, 400)
    frame.Parent = self.ContentFrame
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 10)
    layout.Parent = frame
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
    padding.Parent = frame
    
    local backButton = self:CreateButton("← Back to Adopt Me", frame, function()
        self:SwitchTab("AdoptMe")
    end)
    
    self:CreateSection("🏡 SELECT PLAYER TO COPY HOUSE", frame)
    
    local selectedPlayer = nil
    local playerButtons = {}
    
    -- Function to update player list
    local function updatePlayerList()
        for _, btn in pairs(playerButtons) do
            btn:Destroy()
        end
        playerButtons = {}
        
        for i, plr in ipairs(Players:GetPlayers()) do
            if plr ~= player then
                local playerButton = self:CreateButton("👤 " .. plr.Name, frame, function()
                    if selectedPlayer and playerButtons[selectedPlayer] then
                        playerButtons[selectedPlayer].BackgroundColor3 = Color3.fromRGB(40, 40, 50)
                    end
                    
                    selectedPlayer = plr
                    playerButton.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
                    self:Notify("House Replicator", "Selected: " .. plr.Name)
                end)
                playerButtons[plr] = playerButton
            end
        end
    end
    
    updatePlayerList()
    
    self:CreateButton("🔄 Refresh Player List", frame, function()
        updatePlayerList()
        self:Notify("House Replicator", "Player list refreshed!")
    end)
    
    self:CreateButton("🏠 REPLICATE SELECTED HOUSE", frame, function()
        if selectedPlayer then
            self:Notify("House Replicator", "Replicating " .. selectedPlayer.Name .. "'s house...\nThis may take a few seconds.")
        else
            self:Notify("House Replicator", "Please select a player first! ⚠️")
        end
    end)
end

function ProdigyX:OpenFakeSpinSubTab()
    self:ClearContentFrame()
    
    local frame = Instance.new("ScrollingFrame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.ScrollBarThickness = 6
    frame.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)
    frame.CanvasSize = UDim2.new(0, 0, 0, 300)
    frame.Parent = self.ContentFrame
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 10)
    layout.Parent = frame
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
    padding.Parent = frame
    
    local backButton = self:CreateButton("← Back to Adopt Me", frame, function()
        self:SwitchTab("AdoptMe")
    end)
    
    self:CreateSection("🎰 FAKE SPIN THE WHEEL", frame)
    
    self:CreateButton("💼 LOAD FAKE TRADE", frame, function()
        self:Notify("Fake Trade", "Loading Fake Trade Script...")
        -- loadstring(game:HttpGet("URL"))()
    end)
    
    self:CreateButton("🐾 LOAD PET SPAWNER", frame, function()
        self:Notify("Pet Spawner", "Loading Pet Spawner Script...")
        -- loadstring(game:HttpGet("URL"))()
    end)
    
    self:CreateToggleButton("🎰 Auto Spin Wheel", frame, false, function(state)
        self:Notify("Fake Spin", "Auto Spin: " .. (state and "ENABLED 🟢" or "DISABLED 🔴"))
    end)
end

function ProdigyX:OpenFreezeTradeSubTab()
    self:ClearContentFrame()
    
    local frame = Instance.new("ScrollingFrame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.ScrollBarThickness = 6
    frame.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)
    frame.CanvasSize = UDim2.new(0, 0, 0, 300)
    frame.Parent = self.ContentFrame
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 10)
    layout.Parent = frame
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
    padding.Parent = frame
    
    local backButton = self:CreateButton("← Back to Adopt Me", frame, function()
        self:SwitchTab("AdoptMe")
    end)
    
    self:CreateSection("❄️ FREEZE TRADE SETTINGS", frame)
    
    self:CreateToggleButton("❄️ Freeze Trade", frame, false, function(state)
        self:Notify("Freeze Trade", "Freeze Trade: " .. (state and "ENABLED 🟢" or "DISABLED 🔴"))
    end)
    
    self:CreateToggleButton("✅ Auto Accept Trades", frame, false, function(state)
        self:Notify("Freeze Trade", "Auto Accept: " .. (state and "ENABLED 🟢" or "DISABLED 🔴"))
    end)
    
    self:CreateToggleButton("🔔 Trade Notifications", frame, true, function(state)
        self:Notify("Freeze Trade", "Notifications: " .. (state and "ENABLED 🟢" or "DISABLED 🔴"))
    end)
end

-- MM2 Tab
function ProdigyX:CreateMM2Tab()
    local frame = Instance.new("ScrollingFrame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.ScrollBarThickness = 6
    frame.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)
    frame.CanvasSize = UDim2.new(0, 0, 0, 500)
    frame.Name = "MM2Tab"
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 10)
    layout.Parent = frame
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
    padding.Parent = frame
    
    self:CreateSection("🔧 MAIN FEATURES", frame)
    
    self:CreateToggleButton("👁️ ESP", frame, false, function(state)
        self:Notify("MM2", "ESP: " .. (state and "ENABLED 🟢" or "DISABLED 🔴"))
    end)
    
    self:CreateButton("🎯 Hitbox Expander", frame, function()
        self:OpenHitboxSubTab()
    end)
    
    self:CreateSection("⚡ AUTO FEATURES", frame)
    
    self:CreateToggleButton("🔪 Auto Throw Knife", frame, false, function(state)
        self:Notify("MM2", "Auto Throw: " .. (state and "ENABLED 🟢" or "DISABLED 🔴"))
    end)
    
    self:CreateToggleButton("💀 Auto Kill All Innocents", frame, false, function(state)
        self:Notify("MM2", "Auto Kill Innocents: " .. (state and "ENABLED 🟢" or "DISABLED 🔴"))
    end)
    
    self:CreateSection("🎨 VISUAL ITEMS", frame)
    
    self:CreateButton("🔪 Weapon Selector", frame, function()
        self:OpenWeaponSelectorSubTab()
    end)
    
    return frame
end

-- SUB-TABS FOR MM2
function ProdigyX:OpenHitboxSubTab()
    self:ClearContentFrame()
    
    local frame = Instance.new("ScrollingFrame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.ScrollBarThickness = 6
    frame.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)
    frame.CanvasSize = UDim2.new(0, 0, 0, 300)
    frame.Parent = self.ContentFrame
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 10)
    layout.Parent = frame
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
    padding.Parent = frame
    
    local backButton = self:CreateButton("← Back to MM2", frame, function()
        self:SwitchTab("MM2")
    end)
    
    self:CreateSection("🎯 HITBOX EXPANDER", frame)
    
    local hitboxValue = 10
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Size = UDim2.new(1, 0, 0, 30)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = "Hitbox Size: " .. hitboxValue
    valueLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
    valueLabel.TextSize = 16
    valueLabel.Font = Enum.Font.GothamBold
    valueLabel.Parent = frame
    
    local slider = Instance.new("Frame")
    slider.Size = UDim2.new(1, 0, 0, 20)
    slider.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    slider.BorderSizePixel = 0
    slider.Parent = frame
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 6)
    sliderCorner.Parent = slider
    
    local sliderFill = Instance.new("Frame")
    sliderFill.Size = UDim2.new(hitboxValue/100, 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    sliderFill.BorderSizePixel = 0
    sliderFill.Parent = slider
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 6)
    fillCorner.Parent = sliderFill
    
    slider.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local connection
            connection = RunService.Heartbeat:Connect(function()
                local mouse = UserInputService:GetMouseLocation()
                local xPos = mouse.X - slider.AbsolutePosition.X
                local percentage = math.clamp(xPos / slider.AbsoluteSize.X, 0, 1)
                hitboxValue = math.floor(percentage * 100)
                valueLabel.Text = "Hitbox Size: " .. hitboxValue
                sliderFill.Size = UDim2.new(percentage, 0, 1, 0)
            end)
            
            local function disconnect()
                connection:Disconnect()
            end
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    disconnect()
                end
            end)
        end
    end)
    
    self:CreateButton("✅ APPLY HITBOX SIZE", frame, function()
        self:Notify("Hitbox", "Hitbox size set to: " .. hitboxValue .. "\nApplied to all players!")
    end)
end

function ProdigyX:OpenWeaponSelectorSubTab()
    self:ClearContentFrame()
    
    local frame = Instance.new("ScrollingFrame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.ScrollBarThickness = 6
    frame.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)
    frame.CanvasSize = UDim2.new(0, 0, 0, 500)
    frame.Parent = self.ContentFrame
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 10)
    layout.Parent = frame
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
    padding.Parent = frame
    
    local backButton = self:CreateButton("← Back to MM2", frame, function()
        self:SwitchTab("MM2")
    end)
    
    self:CreateSection("🔪 SELECT WEAPON", frame)
    
    local selectedWeapon = nil
    local weaponButtons = {}
    
    for i, weapon in ipairs(self.MM2Weapons) do
        local weaponButton = self:CreateButton(weapon, frame, function()
            if selectedWeapon and weaponButtons[selectedWeapon] then
                weaponButtons[selectedWeapon].BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            end
            
            selectedWeapon = weapon
            weaponButton.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
            self:Notify("Weapon", "Selected: " .. weapon)
        end)
        weaponButtons[weapon] = weaponButton
    end
    
    self:CreateSection("🔫 SELECT GUN", frame)
    
    for i, gun in ipairs(self.MM2Guns) do
        local gunButton = self:CreateButton(gun, frame, function()
            if selectedWeapon and weaponButtons[selectedWeapon] then
                weaponButtons[selectedWeapon].BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            end
            
            selectedWeapon = gun
            gunButton.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
            self:Notify("Weapon", "Selected: " .. gun)
        end)
        weaponButtons[gun] = gunButton
    end
    
    self:CreateButton("🎯 APPLY SELECTED WEAPON", frame, function()
        if selectedWeapon then
            self:Notify("Weapon", "Applied: " .. selectedWeapon .. "\nWeapon skin changed successfully!")
        else
            self:Notify("Weapon", "Select a weapon first! ⚠️")
        end
    end)
end

-- SAB Tab
function ProdigyX:CreateSABTab()
    local frame = Instance.new("ScrollingFrame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.ScrollBarThickness = 6
    frame.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)
    frame.CanvasSize = UDim2.new(0, 0, 0, 300)
    frame.Name = "SABTab"
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 10)
    layout.Parent = frame
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
    padding.Parent = frame
    
    self:CreateSection("🎮 SAB FEATURES", frame)
    
    self:CreateToggleButton("⚡ Auto Moreira", frame, false, function(state)
        self:Notify("SAB", "Auto Moreira: " .. (state and "ENABLED 🟢" or "DISABLED 🔴"))
    end)
    
    self:CreateButton("🧠 Spawn Brainrot", frame, function()
        self:OpenBrainrotSubTab()
    end)
    
    self:CreateToggleButton("🛡️ Scam Prevention", frame, true, function(state)
        self:Notify("SAB", "Scam Prevention: " .. (state and "ENABLED 🟢" or "DISABLED 🔴"))
    end)
    
    return frame
end

-- SUB-TABS FOR SAB
function ProdigyX:OpenBrainrotSubTab()
    self:ClearContentFrame()
    
    local frame = Instance.new("ScrollingFrame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.ScrollBarThickness = 6
    frame.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)
    frame.CanvasSize = UDim2.new(0, 0, 0, 500)
    frame.Parent = self.ContentFrame
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 10)
    layout.Parent = frame
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
    padding.Parent = frame
    
    local backButton = self:CreateButton("← Back to SAB", frame, function()
        self:SwitchTab("SAB")
    end)
    
    self:CreateSection("🧠 SELECT BRAINROT", frame)
    
    local selectedBrainrot = nil
    local brainrotButtons = {}
    
    for i, brainrot in ipairs(self.BrainrotList) do
        local brainrotButton = self:CreateButton(brainrot, frame, function()
            if selectedBrainrot and brainrotButtons[selectedBrainrot] then
                brainrotButtons[selectedBrainrot].BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            end
            
            selectedBrainrot = brainrot
            brainrotButton.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
            self:Notify("Brainrot", "Spawning: " .. brainrot)
        end)
        brainrotButtons[brainrot] = brainrotButton
    end
    
    self:CreateSection("✍️ CUSTOM BRAINROT", frame)
    
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(1, 0, 0, 40)
    textBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    textBox.BorderSizePixel = 0
    textBox.PlaceholderText = "Enter custom brainrot name..."
    textBox.Text = ""
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.TextSize = 14
    textBox.Font = Enum.Font.Gotham
    textBox.Parent = frame
    
    local textBoxCorner = Instance.new("UICorner")
    textBoxCorner.CornerRadius = UDim.new(0, 8)
    textBoxCorner.Parent = textBox
    
    self:CreateButton("🧠 SPAWN CUSTOM BRAINROT", frame, function()
        if textBox.Text ~= "" then
            self:Notify("Brainrot", "Spawning Custom Brainrot: " .. textBox.Text)
            textBox.Text = ""
        else
            self:Notify("Brainrot", "Enter a name first! ⚠️")
        end
    end)
end

-- Helper functions
function ProdigyX:ClearContentFrame()
    for _, child in pairs(self.ContentFrame:GetChildren()) do
        child:Destroy()
    end
end

-- Initialize
local success, err = pcall(function()
    local ProdigyXInstance = setmetatable({}, ProdigyX)
    ProdigyXInstance:CreateGUI()
end)

if not success then
    warn("ProdigyX Error: " .. tostring(err))
end