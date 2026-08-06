local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

if CoreGui:FindFirstChild("FraudMenuSystem") then
    CoreGui.FraudMenuSystem:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FraudMenuSystem"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local LogoButton = Instance.new("ImageButton")
LogoButton.Name = "LogoButton"
LogoButton.Parent = ScreenGui
LogoButton.Position = UDim2.new(0.05, 0, 0.2, 0)
LogoButton.Size = UDim2.new(0, 65, 0, 65)
LogoButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
LogoButton.Image = "rbxthumb://type=Asset&id=129752335101046&w=150&h=150"
LogoButton.AnchorPoint = Vector2.new(0.5, 0.5)
LogoButton.Visible = true

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(1, 0)
LogoCorner.Parent = LogoButton

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = Color3.fromRGB(0, 200, 80)
LogoStroke.Thickness = 2
LogoStroke.Parent = LogoButton

local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    LogoButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

LogoButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = LogoButton.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

LogoButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then update(input) end
end)

local MainMenu = Instance.new("Frame")
MainMenu.Name = "MainMenu"
MainMenu.Parent = ScreenGui
MainMenu.AnchorPoint = Vector2.new(0.5, 0.5)
MainMenu.Position = UDim2.new(0.5, 0, 0.5, 0)
MainMenu.Size = UDim2.new(0, 500, 0, 320)
MainMenu.BackgroundColor3 = Color3.fromRGB(15, 22, 36)
MainMenu.Visible = true

local MenuCorner = Instance.new("UICorner")
MenuCorner.CornerRadius = Instance.new("UICorner").CornerRadius or UDim.new(0, 12)
MenuCorner.Parent = MainMenu

local MenuStroke = Instance.new("UIStroke")
MenuStroke.Color = Color3.fromRGB(0, 170, 255)
MenuStroke.Thickness = 2
MenuStroke.Parent = MainMenu

local Sidebar = Instance.new("Frame")
Sidebar.Parent = MainMenu
Sidebar.Position = UDim2.new(0, 10, 0, 10)
Sidebar.Size = UDim2.new(0, 110, 1, -20)
Sidebar.BackgroundColor3 = Color3.fromRGB(8, 12, 21)

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 12)
SidebarCorner.Parent = Sidebar

local TabMainBtn = Instance.new("TextButton")
TabMainBtn.Parent = Sidebar
TabMainBtn.Position = UDim2.new(0, 8, 0, 15)
TabMainBtn.Size = UDim2.new(1, -16, 0, 40)
TabMainBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 60)
TabMainBtn.Text = "Main"
TabMainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TabMainBtn.TextSize = 14
TabMainBtn.Font = Enum.Font.GothamBold
local MainBtnCorner = Instance.new("UICorner")
MainBtnCorner.CornerRadius = UDim.new(0, 8)
MainBtnCorner.Parent = TabMainBtn

local TabFunBtn = Instance.new("TextButton")
TabFunBtn.Parent = Sidebar
TabFunBtn.Position = UDim2.new(0, 8, 0, 65)
TabFunBtn.Size = UDim2.new(1, -16, 0, 40)
TabFunBtn.BackgroundColor3 = Color3.fromRGB(15, 22, 36)
TabFunBtn.Text = "Fun"
TabFunBtn.TextColor3 = Color3.fromRGB(120, 180, 140)
TabFunBtn.TextSize = 14
TabFunBtn.Font = Enum.Font.GothamBold
local FunBtnCorner = Instance.new("UICorner")
FunBtnCorner.CornerRadius = UDim.new(0, 8)
FunBtnCorner.Parent = TabFunBtn

local TabSettingBtn = Instance.new("TextButton")
TabSettingBtn.Parent = Sidebar
TabSettingBtn.Position = UDim2.new(0, 8, 0, 115)
TabSettingBtn.Size = UDim2.new(1, -16, 0, 40)
TabSettingBtn.BackgroundColor3 = Color3.fromRGB(15, 22, 36)
TabSettingBtn.Text = "Setting"
TabSettingBtn.TextColor3 = Color3.fromRGB(120, 180, 140)
TabSettingBtn.TextSize = 14
TabSettingBtn.Font = Enum.Font.GothamBold
local SettingBtnCorner = Instance.new("UICorner")
SettingBtnCorner.CornerRadius = UDim.new(0, 8)
SettingBtnCorner.Parent = TabSettingBtn

local Container = Instance.new("Frame")
Container.Parent = MainMenu
Container.Position = UDim2.new(0, 130, 0, 10)
Container.Size = UDim2.new(1, -140, 1, -20)
Container.BackgroundTransparency = 1

local MainPage = Instance.new("ScrollingFrame")
MainPage.Name = "MainPage"
MainPage.Parent = Container
MainPage.Size = UDim2.new(1, 0, 1, 0)
MainPage.BackgroundTransparency = 1
MainPage.BorderSizePixel = 0
MainPage.CanvasSize = UDim2.new(0, 0, 2, 0)
MainPage.ScrollBarThickness = 2
MainPage.Visible = true

local FunPage = Instance.new("ScrollingFrame")
FunPage.Name = "FunPage"
FunPage.Parent = Container
FunPage.Size = UDim2.new(1, 0, 1, 0)
FunPage.BackgroundTransparency = 1
FunPage.BorderSizePixel = 0
FunPage.CanvasSize = UDim2.new(0, 0, 2, 0)
FunPage.ScrollBarThickness = 2
FunPage.Visible = false

local SettingPage = Instance.new("ScrollingFrame")
SettingPage.Name = "SettingPage"
SettingPage.Parent = Container
SettingPage.Size = UDim2.new(1, 0, 1, 0)
SettingPage.BackgroundTransparency = 1
SettingPage.BorderSizePixel = 0
SettingPage.CanvasSize = UDim2.new(0, 0, 2, 0)
SettingPage.ScrollBarThickness = 2
SettingPage.Visible = false

local FunImage = Instance.new("ImageLabel")
FunImage.Name = "FunImage"
FunImage.Parent = FunPage
FunImage.AnchorPoint = Vector2.new(1, 0)
FunImage.Position = UDim2.new(1, -10, 0, 10)
FunImage.Size = UDim2.new(0, 80, 0, 80)
FunImage.BackgroundTransparency = 1
FunImage.Image = "rbxthumb://type=Asset&id=3611711264&w=150&h=150"
FunImage.Visible = false 

local ImageCorner = Instance.new("UICorner")
ImageCorner.CornerRadius = UDim.new(0, 8)
ImageCorner.Parent = FunImage

local function CreateMainToggle(text, callback)
    local Row = Instance.new("Frame")
    Row.Parent = MainPage
    Row.Size = UDim2.new(1, 0, 0, 55)
    Row.Position = UDim2.new(0, 0, 0, (#MainPage:GetChildren() - 1) * 60)
    Row.BackgroundTransparency = 1

    local Label = Instance.new("TextLabel")
    Label.Parent = Row
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.Size = UDim2.new(0.6, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(200, 225, 255)
    Label.TextSize = 14
    Label.Font = Enum.Font.GothamBold
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Parent = Row
    ToggleBtn.Position = UDim2.new(1, -80, 0, 10)
    ToggleBtn.Size = UDim2.new(0, 70, 0, 32)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(24, 28, 38)
    ToggleBtn.Text = "OFF"
    ToggleBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
    ToggleBtn.TextSize = 12
    ToggleBtn.Font = Enum.Font.GothamBold

    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(1, 0)
    ToggleCorner.Parent = ToggleBtn

    local enabled = false
    ToggleBtn.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 60)
            ToggleBtn.Text = "ON"
            ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(24, 28, 38)
            ToggleBtn.Text = "OFF"
            ToggleBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
        end
        callback(enabled)
    end)
end

local function CreateFunToggle(text, callback)
    local Row = Instance.new("Frame")
    Row.Parent = FunPage
    Row.Size = UDim2.new(1, 0, 0, 55)
    Row.Position = UDim2.new(0, 0, 0, (#FunPage:GetChildren() - 2) * 60)
    Row.BackgroundTransparency = 1

    local Label = Instance.new("TextLabel")
    Label.Parent = Row
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.Size = UDim2.new(0.6, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(200, 225, 255)
    Label.TextSize = 14
    Label.Font = Enum.Font.GothamBold
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Parent = Row
    ToggleBtn.Position = UDim2.new(1, -80, 0, 10)
    ToggleBtn.Size = UDim2.new(0, 70, 0, 32)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(24, 28, 38)
    ToggleBtn.Text = "OFF"
    ToggleBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
    ToggleBtn.TextSize = 12
    ToggleBtn.Font = Enum.Font.GothamBold

    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(1, 0)
    ToggleCorner.Parent = ToggleBtn

    local enabled = false
    ToggleBtn.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 60)
            ToggleBtn.Text = "ON"
            ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(24, 28, 38)
            ToggleBtn.Text = "OFF"
            ToggleBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
        end
        callback(enabled)
    end)
end

CreateMainToggle("Auto Shoot Target", function(state)
    getgenv().AutoShoot = state
end)

CreateMainToggle("Anti Enemy Projectile", function(state)
    getgenv().AutoRemoveProjectile = state
end)

CreateMainToggle("Auto Gamek1d / Minigame", function(state)
    getgenv().AutoGamekid = state
end)

CreateFunToggle("Show Corner Image", function(state)
    FunImage.Visible = state
end)

TabMainBtn.MouseButton1Click:Connect(function()
    TabMainBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 60)
    TabMainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabFunBtn.BackgroundColor3 = Color3.fromRGB(15, 22, 36)
    TabFunBtn.TextColor3 = Color3.fromRGB(120, 180, 140)
    TabSettingBtn.BackgroundColor3 = Color3.fromRGB(15, 22, 36)
    TabSettingBtn.TextColor3 = Color3.fromRGB(120, 180, 140)
    
    MainPage.Visible = true
    FunPage.Visible = false
    SettingPage.Visible = false
end)

TabFunBtn.MouseButton1Click:Connect(function()
    TabFunBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 60)
    TabFunBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabMainBtn.BackgroundColor3 = Color3.fromRGB(15, 22, 36)
    TabMainBtn.TextColor3 = Color3.fromRGB(120, 180, 140)
    TabSettingBtn.BackgroundColor3 = Color3.fromRGB(15, 22, 36)
    TabSettingBtn.TextColor3 = Color3.fromRGB(120, 180, 140)
    
    MainPage.Visible = false
    FunPage.Visible = true
    SettingPage.Visible = false
end)

TabSettingBtn.MouseButton1Click:Connect(function()
    TabSettingBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 60)
    TabSettingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabMainBtn.BackgroundColor3 = Color3.fromRGB(15, 22, 36)
    TabMainBtn.TextColor3 = Color3.fromRGB(120, 180, 140)
    TabFunBtn.BackgroundColor3 = Color3.fromRGB(15, 22, 36)
    TabFunBtn.TextColor3 = Color3.fromRGB(120, 180, 140)
    
    MainPage.Visible = false
    FunPage.Visible = false
    SettingPage.Visible = true
end)

LogoButton.MouseButton1Click:Connect(function()
    MainMenu.Visible = not MainMenu.Visible
end)

getgenv().AutoShoot = false
getgenv().AutoRemoveProjectile = false
getgenv().AutoGamekid = false

local QuizAnswers = {
    ["WHAT CHAPTER DOES THIS TAKE PLACE?"] = "CHAPTER FIVE",
    ["WHAT TRAIT AM I?"] = "ZOMBIE",
    ["UHHHH I FORGOT THE QUESTION."] = "PICK THIS ONE!",
}

local function AutoClick(uiElement)
    if not uiElement then return end
    for _, connection in pairs(getconnections(uiElement.MouseButton1Click)) do
        connection:Fire()
    end
    for _, connection in pairs(getconnections(uiElement.MouseButton1Down)) do
        connection:Fire()
    end
    for _, connection in pairs(getconnections(uiElement.Activated)) do
        connection:Fire()
    end
end

task.spawn(function()
    local cloneref = cloneref or function(a) return a end;
    local b = cloneref(game:GetService("Players"))
    local c = cloneref(game:GetService("ReplicatedStorage"))
    local d = cloneref(game:GetService("CollectionService"))
    local e = cloneref(game:GetService("RunService"))
    local f = b.LocalPlayer:WaitForChild("PlayerGui")
    local g = c:WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("ClientProjectile")
    local h = workspace:FindFirstChild("Shootable")
    
    workspace.ChildAdded:Connect(function(i)
        if i.Name == "Shootable" then h = i end
    end)
    
    local j = f:FindFirstChild("CrosshairUI")
    f.ChildAdded:Connect(function(k)
        if k.Name == "CrosshairUI" then j = k end
    end)
    
    g.OnClientEvent:Connect(function(l, m, n)
        if not getgenv().AutoRemoveProjectile then return end
        if not n or not n.Parent then return end;
        local o = m and d:HasTag(m, "Enemy")
        local p = m and d:HasTag(m, "Friendly")
        local q = string.lower(n.Name) == "superstar"
        if o and not q then
            n:Destroy()
            return
        end;
        if p then
            if n:IsA("BasePart") then
                n.AssemblyLinearVelocity = n.AssemblyLinearVelocity * 1.1;
                n.Size = n.Size * 1.1
            elseif n:IsA("Model") then
                for l, r in ipairs(n:GetDescendants()) do
                    if r:IsA("BasePart") then r.Size = r.Size * 1.1 end
                end;
                if n.PrimaryPart then
                    n.PrimaryPart.AssemblyLinearVelocity = n.PrimaryPart.AssemblyLinearVelocity * 1.1
                end
            end
        end
    end)
    
    e.RenderStepped:Connect(function()
        e.Heartbeat:Wait()
        if not getgenv().AutoShoot then return end
        if not h or not j then return end;
        local s = j:FindFirstChild("ShootEvent")
        if not s then return end;
        for l, t in ipairs(h:GetChildren()) do
            local u = string.lower(t.Name)
            if u == "bombk1d" or u == "cherrybomb" then continue end;
            if d:HasTag(t, "Target") then
                s:FireServer(t)
            end
        end
    end)
end)

task.spawn(function()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

    while task.wait(0.2) do
        if not getgenv().AutoGamekid then continue end
        
        local FunGui = PlayerGui:FindFirstChild("FunGui")
        if FunGui then
            local SuccessEvent = FunGui:FindFirstChild("SuccessEvent")
            if SuccessEvent and SuccessEvent:IsA("RemoteEvent") then
                SuccessEvent:FireServer(true)
                if FunGui:IsA("ScreenGui") then
                    FunGui.Enabled = false
                elseif FunGui:IsA("Frame") then
                    FunGui.Visible = false
                end
                task.wait(1)
            end
        end

        for _, gui in pairs(PlayerGui:GetChildren()) do
            if gui:IsA("ScreenGui") and string.find(string.lower(gui.Name), "gamek1d") then
                local PopUps = gui:FindFirstChild("PopUps")
                if PopUps then
                    for _, popup in pairs(PopUps:GetChildren()) do
                        if popup.Visible then
                            for _, btn in pairs(popup:GetDescendants()) do
                                if btn:IsA("GuiButton") and btn.Visible then
                                    AutoClick(btn)
                                end
                            end
                        end
                    end
                end

                local GamesFolder = gui:FindFirstChild("Games")
                if GamesFolder then
                    local Quiz = GamesFolder:FindFirstChild("ImpossibleQuiz")
                    if Quiz and Quiz.Visible then
                        local QuestionLabel = Quiz:FindFirstChild("Question")
                        local AnswersFolder = Quiz:FindFirstChild("Answers")
                        if QuestionLabel and AnswersFolder then
                            local rightA = QuizAnswers[QuestionLabel.Text]
                            if rightA then
                                for _, ansBtn in pairs(AnswersFolder:GetChildren()) do
                                    local textLabel = ansBtn:FindFirstChildOfClass("TextLabel")
                                    if (textLabel and textLabel.Text == rightA) or (ansBtn:IsA("TextButton") and ansBtn.Text == rightA) then
                                        AutoClick(ansBtn)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)
