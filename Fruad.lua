-- 1. KHỞI TẠO GUI CHÍNH
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

if CoreGui:FindFirstChild("FraudMenuSystem") then
    CoreGui.HamsterMenuSystem:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FraudMenuSystem"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- 2. TẠO LOGO LƠ LỬNG (FLOATING BUTTON) - GIỮ NGUYÊN ẢNH CỦA BẠN
local LogoButton = Instance.new("ImageButton")
LogoButton.Name = "LogoButton"
LogoButton.Parent = ScreenGui
LogoButton.Position = UDim2.new(0.05, 0, 0.2, 0)
LogoButton.Size = UDim2.new(0, 65, 0, 65)
LogoButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
LogoButton.Image = "rbxthumb://type=Asset&id=129752335101046&w=150&h=150"
LogoButton.AnchorPoint = Vector2.new(0.5, 0.5)

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(1, 0)
LogoCorner.Parent = LogoButton

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = Color3.fromRGB(0, 170, 255)
LogoStroke.Thickness = 2
LogoStroke.Parent = LogoButton

-- KÉO THẢ LOGO
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
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then update(input) end
end)


-- 3. TẠO KHUNG MENU CHÍNH (THEO MẪU ẢNH)
local MainMenu = Instance.new("Frame")
MainMenu.Name = "MainMenu"
MainMenu.Parent = ScreenGui
MainMenu.Position = UDim2.new(0.5, 0, 0.5, 0)
MainMenu.Size = UDim2.new(0, 0, 0, 0) -- Thu nhỏ lúc đầu
MainMenu.BackgroundColor3 = Color3.fromRGB(11,20 ,16 )
MainMenu.AnchorPoint = Vector2.new(0.5, 0.5)
MainMenu.ClipsDescendants = true
MainMenu.Visible = false

local MenuCorner = Instance.new("UICorner")
MenuCorner.CornerRadius = UDim.new(0, 16)
MenuCorner.Parent = MainMenu

local MenuStroke = Instance.new("UIStroke")
MenuStroke.Color = Color3.fromRGB(0, 200, 80)
MenuStroke.Thickness = 2
MenuStroke.Parent = MainMenu

-- Tiêu đề Menu
local MenuTitle = Instance.new("TextLabel")
MenuTitle.Parent = MainMenu
MenuTitle.Position = UDim2.new(0, 140, 0, 12)
MenuTitle.Size = UDim2.new(0, 200, 0, 25)
MenuTitle.BackgroundTransparency = 1
MenuTitle.Text = "Fraud time"
MenuTitle.TextColor3 = Color3.fromRGB(0, 215, 100)
MenuTitle.TextSize = 18
MenuTitle.Font = Enum.Font.GothamBold
MenuTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Nút X tắt menu
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = MainMenu
CloseButton.Position = UDim2.new(1, -35, 0, 12)
CloseButton.Size = UDim2.new(0, 22, 0, 22)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
CloseButton.Text = "x"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.Font = Enum.Font.GothamBold
local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseButton


-- 4. THANH DANH MỤC BÊN TRÁI (SIDEBAR)
local Sidebar = Instance.new("Frame")
Sidebar.Parent = MainMenu
Sidebar.Position = UDim2.new(0, 10, 0, 10)
Sidebar.Size = UDim2.new(0, 110, 1, -20)
Sidebar.BackgroundColor3 = Color3.fromRGB(8, 12, 21)
local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 12)
SidebarCorner.Parent = Sidebar
local SidebarStroke = Instance.new("UIStroke")
SidebarStroke.Color = Color3.fromRGB(0, 70, 150)
SidebarStroke.Thickness = 1
SidebarStroke.Parent = Sidebar

-- Nút Tab MAIN
local TabMainBtn = Instance.new("TextButton")
TabMainBtn.Parent = Sidebar
TabMainBtn.Position = UDim2.new(0, 8, 0, 15)
TabMainBtn.Size = UDim2.new(1, -16, 0, 40)
TabMainBtn.BackgroundColor3 = Color3.fromRGB(0, 70, 150) -- Đang chọn
TabMainBtn.Text = "Main"
TabMainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TabMainBtn.TextSize = 14
TabMainBtn.Font = Enum.Font.GothamBold
local MainBtnCorner = Instance.new("UICorner")
MainBtnCorner.CornerRadius = UDim.new(0, 8)
MainBtnCorner.Parent = TabMainBtn

-- Nút Tab SETTING
local TabSettingBtn = Instance.new("TextButton")
TabSettingBtn.Parent = Sidebar
TabSettingBtn.Position = UDim2.new(0, 8, 0, 65)
TabSettingBtn.Size = UDim2.new(1, -16, 0, 40)
TabSettingBtn.BackgroundColor3 = Color3.fromRGB(15, 22, 36) -- Chưa chọn
TabSettingBtn.Text = "Setting"
TabSettingBtn.TextColor3 = Color3.fromRGB(120, 180, 140)
TabSettingBtn.TextSize = 14
TabSettingBtn.Font = Enum.Font.GothamBold
local SettingBtnCorner = Instance.new("UICorner")
SettingBtnCorner.CornerRadius = UDim.new(0, 8)
SettingBtnCorner.Parent = TabSettingBtn


-- 5. KHU VỰC CHỨA CHỨC NĂNG (PAGES)
local Container = Instance.new("Frame")
Container.Parent = MainMenu
Container.Position = UDim2.new(0, 130, 0, 50)
Container.Size = UDim2.new(1, -140, 1, -60)
Container.BackgroundTransparency = 1

-- Giao diện trang Main
local MainPage = Instance.new("ScrollingFrame")
MainPage.Parent = Container
MainPage.Size = UDim2.new(1, 0, 1, 0)
MainPage.BackgroundTransparency = 1
MainPage.CanvasSize = UDim2.new(0, 0, 0, 400)
MainPage.ScrollBarThickness = 2

-- Giao diện trang Setting (Mặc định ẩn)
local SettingPage = Instance.new("Frame")
SettingPage.Parent = Container
SettingPage.Size = UDim2.new(1, 0, 1, 0)
SettingPage.BackgroundTransparency = 1
SettingPage.Visible = false

-- Hàm tạo hàng chức năng bật/tắt (Toggle Row giống ảnh mẫu)
local function CreateToggle(parent, text, order, callback)
    local Row = Instance.new("Frame")
    Row.Parent = parent
    Row.Size = UDim2.new(1, 0, 0, 55)
    Row.Position = UDim2.new(0, 0, 0, (order - 1) * 65)
    Row.BackgroundColor3 = Color3.fromRGB(13, 20, 32)
    local RowCorner = Instance.new("UICorner")
    RowCorner.CornerRadius = UDim.new(0, 8)
    RowCorner.Parent = Row

    local Label = Instance.new("TextLabel")
    Label.Parent = Row
    Label.Position = UDim2.new(0, 15, 0, 0)
    Label.Size = UDim2.new(0.6, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(200, 225, 255)
    Label.TextSize = 14
    Label.Font = Enum.Font.GothamBold
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Parent = Row
    ToggleBtn.Position = UDim2.new(1, -85, 0, 12)
    ToggleBtn.Size = UDim2.new(0, 70, 0, 32)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(24, 28, 38) -- Trạng thái OFF
    ToggleBtn.Text = "OFF"
    ToggleBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
    ToggleBtn.TextSize = 12
    ToggleBtn.Font = Enum.Font.GothamBold
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 6)
    ToggleCorner.Parent = ToggleBtn

    local enabled = false
    ToggleBtn.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 130, 255) -- Màu ON xanh biển giống ảnh
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

-- TẠO CÁC CHỨC NĂNG THEO ẢNH MẪU CỦA BẠN



-- 6. CHUYỂN ĐỔI QUA LẠI GIỮA CÁC TÁB (MAIN / SETTING)
TabMainBtn.MouseButton1Click:Connect(function()
    TabMainBtn.BackgroundColor3 = Color3.fromRGB(0, 70, 150)
    TabMainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabSettingBtn.BackgroundColor3 = Color3.fromRGB(15, 22, 36)
    TabSettingBtn.TextColor3 = Color3.fromRGB(120, 160, 220)
    MainPage.Visible = true
    SettingPage.Visible = false
end)

TabSettingBtn.MouseButton1Click:Connect(function()
    TabSettingBtn.BackgroundColor3 = Color3.fromRGB(0, 70, 150)
    TabSettingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabMainBtn.BackgroundColor3 = Color3.fromRGB(15, 22, 36)
    TabMainBtn.TextColor3 = Color3.fromRGB(120, 160, 220)
    MainPage.Visible = false
    SettingPage.Visible = true
end)


-- 7. HIỆU ỨNG ĐÓNG / MỞ MENU
local menuOpen = false
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local function toggleMenu()
    menuOpen = not menuOpen
    if menuOpen then
        MainMenu.Visible = true
        LogoButton.Visible = false
        TweenService:Create(MainMenu, tweenInfo, {Size = UDim2.new(0, 520, 0, 340)}):Play()
    else
        local closeTween = TweenService:Create(MainMenu, tweenInfo, {Size = UDim2.new(0, 0, 0, 0)})
        closeTween:Play()
        closeTween.Completed:Connect(function()
            if not menuOpen then
                MainMenu.Visible = false
                LogoButton.Visible = true
            end
        end)
    end
end

LogoButton.MouseButton1Click:Connect(toggleMenu)
CloseButton.MouseButton1Click:Connect(toggleMenu)
