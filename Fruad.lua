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
LogoButton.Visible = false
local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(1, 0)
LogoCorner.Parent = LogoButton

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = Color3.fromRGB(0, 200, 80)
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
-- ==========================================
-- HỆ THỐNG GET KEY (ĐẶT Ở ĐẦU SCRIPT CŨ)
-- ==========================================
local CorrectKey = "fraudontoday" -- Đổi chữ này thành Key bạn muốn đặt
local GetKeyLink = "https://sub2unlock.io/0wrv6" -- Link trang web lấy key của bạn

-- BẢNG GET KEY
local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeyFrame"
KeyFrame.Parent = ScreenGui
KeyFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
KeyFrame.Size = UDim2.new(0, 360, 0, 220) 
KeyFrame.BackgroundColor3 = Color3.fromRGB(11, 20, 16) -- Màu nền tối ánh xanh lá
KeyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
KeyFrame.ClipsDescendants = true

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 14)
KeyCorner.Parent = KeyFrame

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Color = Color3.fromRGB(0, 200, 80) -- Viền xanh lá
KeyStroke.Thickness = 2
KeyStroke.Parent = KeyFrame

-- Tiêu đề bảng Get Key
local KeyTitle = Instance.new("TextLabel")
KeyTitle.Parent = KeyFrame
KeyTitle.Position = UDim2.new(0, 20, 0, 15)
KeyTitle.Size = UDim2.new(0, 200, 0, 25)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "fraud time | Key System"
KeyTitle.TextColor3 = Color3.fromRGB(0, 215, 100) -- Chữ màu xanh lá sáng
KeyTitle.TextSize = 18
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Nút tắt nhanh bảng Get Key
local CloseKeyBtn = Instance.new("TextButton")
CloseKeyBtn.Parent = KeyFrame
CloseKeyBtn.Position = UDim2.new(1, -35, 0, 15)
CloseKeyBtn.Size = UDim2.new(0, 22, 0, 22)
CloseKeyBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
CloseKeyBtn.Text = "x"
CloseKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseKeyBtn.TextSize = 14
CloseKeyBtn.Font = Enum.Font.GothamBold
local CloseKeyCorner = Instance.new("UICorner")
CloseKeyCorner.CornerRadius = UDim.new(1, 0)
CloseKeyCorner.Parent = CloseKeyBtn

CloseKeyBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy() -- Tắt hoàn toàn menu khi đóng bảng key
end)

-- Ô NHẬP KEY (TextBox)
local KeyInput = Instance.new("TextBox")
KeyInput.Parent = KeyFrame
KeyInput.Position = UDim2.new(0, 20, 0, 65)
KeyInput.Size = UDim2.new(1, -40, 0, 45)
KeyInput.BackgroundColor3 = Color3.fromRGB(8, 15, 12)
KeyInput.PlaceholderText = "Nhập Key vào đây..."
KeyInput.PlaceholderColor3 = Color3.fromRGB(80, 110, 90)
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 14
KeyInput.Font = Enum.Font.GothamSemibold

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = KeyInput

local InputStroke = Instance.new("UIStroke")
InputStroke.Color = Color3.fromRGB(0, 120, 50) -- Viền ô nhập xanh lá tối
InputStroke.Thickness = 1
InputStroke.Parent = KeyInput

-- NÚT BẤM "GET KEY"
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Parent = KeyFrame
GetKeyBtn.Position = UDim2.new(0, 20, 0, 130)
GetKeyBtn.Size = UDim2.new(0.45, -10, 0, 45)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(15, 26, 20)
GetKeyBtn.Text = "Get Key"
GetKeyBtn.TextColor3 = Color3.fromRGB(120, 180, 140)
GetKeyBtn.TextSize = 14
GetKeyBtn.Font = Enum.Font.GothamBold

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 8)
GetKeyCorner.Parent = GetKeyBtn

local GetKeyStroke = Instance.new("UIStroke")
GetKeyStroke.Color = Color3.fromRGB(0, 120, 50)
GetKeyStroke.Thickness = 1
GetKeyStroke.Parent = GetKeyBtn

-- NÚT BẤM "CHECK KEY"
local CheckKeyBtn = Instance.new("TextButton")
CheckKeyBtn.Parent = KeyFrame
CheckKeyBtn.Position = UDim2.new(0.55, -10, 0, 130)
CheckKeyBtn.Size = UDim2.new(0.45, 10, 0, 45)
CheckKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 60) -- Màu xanh lá cây sáng
CheckKeyBtn.Text = "Check Key"
CheckKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckKeyBtn.TextSize = 14
CheckKeyBtn.Font = Enum.Font.GothamBold

local CheckKeyCorner = Instance.new("UICorner")
CheckKeyCorner.CornerRadius = UDim.new(0, 8)
CheckKeyCorner.Parent = CheckKeyBtn

-- SỰ KIỆN KHI BẤM NÚT
GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(GetKeyLink) -- Sao chép link vào máy
    KeyTitle.Text = "Đã sao chép link Get Key!"
    task.wait(2)
    KeyTitle.Text = "fraud time | Key System"
end)

CheckKeyBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == CorrectKey then
        KeyTitle.Text = "Key Đúng! Đang mở..."
        KeyTitle.TextColor3 = Color3.fromRGB(0, 255, 0)
        task.wait(1)
        
        -- Xóa bảng Get Key đi
        KeyFrame:Destroy()
        
        -- Kích hoạt hiện nút Logo để người dùng bắt đầu mở Menu
        LogoButton.Visible = true
    else
        KeyTitle.Text = "Sai Key! Hãy thử lại"
        KeyTitle.TextColor3 = Color3.fromRGB(255, 50, 50)
        KeyInput.Text = ""
        task.wait(2)
        KeyTitle.Text = "fraud time | Key System"
        KeyTitle.TextColor3 = Color3.fromRGB(0, 215, 100)
    end
end)

-- Cho phép di chuyển bảng Get Key
local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    KeyFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
KeyFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = KeyFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
KeyFrame.InputChanged:Connect(function(input)
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
SidebarStroke.Color = Color3.fromRGB(0, 120, 50)
SidebarStroke.Thickness = 1
SidebarStroke.Parent = Sidebar

-- Nút Tab MAIN
local TabMainBtn = Instance.new("TextButton")
TabMainBtn.Parent = Sidebar
TabMainBtn.Position = UDim2.new(0, 8, 0, 15)
TabMainBtn.Size = UDim2.new(1, -16, 0, 40)
TabMainBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 60) -- Đang chọn
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
TabSettingBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 60) -- Chưa chọn
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
    TabMainBtn.BackgroundColor3 = Color3.fromRGB(0,140, 60)
    TabMainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabSettingBtn.BackgroundColor3 = Color3.fromRGB(15, 22, 36)
    TabSettingBtn.TextColor3 = Color3.fromRGB(120, 180, 140)
    MainPage.Visible = false
    SettingPage.Visible = true
end)

TabSettingBtn.MouseButton1Click:Connect(function()
    TabSettingBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 60)
    TabSettingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabMainBtn.BackgroundColor3 = Color3.fromRGB(15, 22, 36)
    TabMainBtn.TextColor3 = Color3.fromRGB(120, 180, 140)
    MainPage.Visible = true
    SettingPage.Visible = false
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
