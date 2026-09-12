-- ============================================
-- 挽脚本 WindUI 移植版 (完整)
-- 作者: 无名氏
-- 功能内容全部保留，仅替换UI库为WindUI
-- ============================================

local WindUI = loadstring(game:HttpGet(
    "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")

-- 时间标签
local LBLG = Instance.new("ScreenGui")
LBLG.Name = "LBLG_Wan"
LBLG.Parent = CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true

local LBL = Instance.new("TextLabel")
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundTransparency = 1
LBL.Position = UDim2.new(0, 5, 0, 10)
LBL.Size = UDim2.new(0, 250, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "时间:加载中..."
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextSize = 18
LBL.TextXAlignment = Enum.TextXAlignment.Left
LBL.ZIndex = 10

local PlayerLabel = Instance.new("TextLabel")
PlayerLabel.Name = "PlayerLabel"
PlayerLabel.Parent = LBLG
PlayerLabel.BackgroundTransparency = 1
PlayerLabel.Position = UDim2.new(1, -255, 0, 10)
PlayerLabel.Size = UDim2.new(0, 250, 0, 30)
PlayerLabel.Font = Enum.Font.GothamSemibold
PlayerLabel.Text = "玩家:" .. LocalPlayer.Name
PlayerLabel.TextColor3 = Color3.new(1, 1, 1)
PlayerLabel.TextSize = 18
PlayerLabel.TextXAlignment = Enum.TextXAlignment.Right
PlayerLabel.ZIndex = 10

local Heartbeat = RunService.Heartbeat
local LastIteration, Start = 0, tick()
local FrameUpdateTable = {}
Heartbeat:Connect(function()
    LastIteration = tick()
    for i = #FrameUpdateTable, 1, -1 do
        FrameUpdateTable[i + 1] = (FrameUpdateTable[i] >= LastIteration - 1) and FrameUpdateTable[i] or nil
    end
    FrameUpdateTable[1] = LastIteration
    local hue = tick() % 5 / 5
    local r = math.sin(hue * 6.28) * 127 + 128
    local g = math.sin(hue * 6.28 + 2) * 127 + 128
    local b = math.sin(hue * 6.28 + 4) * 127 + 128
    local color = Color3.fromRGB(r, g, b)
    LBL.Text = ("北京时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
    LBL.TextColor3 = color
    PlayerLabel.TextColor3 = color
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "提示",
    Text = "挽脚本通用源码ovo\n请等待1-12秒喵",
    Icon = "rbxassetid://114514",
    Duration = 3,
})

local Window = WindUI:CreateWindow({
    Title = "挽脚本通用源码脚本",
    Icon = "rbxassetid://4483362748",
    IconThemed = true,
    Author = "作者: 无名氏",
    Folder = "WanScript",
    Size = UDim2.fromOffset(550, 340),
    Transparent = true,
    Theme = "Dark",
    User = { Enabled = true, Anonymous = false },
    SideBarWidth = 190,
    ScrollBarEnabled = true,
    HideSearchBar = false,
})

Window:EditOpenButton({
    Title = "挽脚本",
    Icon = "monitor",
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 3,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("FF0000")),
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("00FF00")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("0000FF")),
    }),
    Draggable = true,
})

Window:Tag({ Title = "挽脚本", Color = Color3.fromHex("#30ff6a") })
Window:Tag({ Title = "作者: 无名氏", Color = Color3.fromHex("#315dff") })

local UITab1  = Window:Tab({ Title = "『公告』",        Icon = "megaphone" })
local UITab2  = Window:Tab({ Title = "『通用』",        Icon = "settings" })
local UITab3  = Window:Tab({ Title = "『范围+自瞄』",   Icon = "crosshair" })
local UITab4  = Window:Tab({ Title = "『传送+甩飞』",   Icon = "map-pin" })
local UITab5  = Window:Tab({ Title = "『FE』",          Icon = "user" })
local UITab6  = Window:Tab({ Title = "『ESP』",         Icon = "eye" })
local UITab7  = Window:Tab({ Title = "『旋转』",        Icon = "refresh-cw" })
local UITab8  = Window:Tab({ Title = "『自然灾害』",    Icon = "cloud-lightning" })
local UITab9  = Window:Tab({ Title = "『力量传奇』",    Icon = "dumbbell" })
local UITab10 = Window:Tab({ Title = "『极速传奇』",    Icon = "car" })
local UITab11 = Window:Tab({ Title = "『忍者传奇』",    Icon = "sword" })
local UITab12 = Window:Tab({ Title = "『战争大亨』",    Icon = "bomb" })
local UITab13 = Window:Tab({ Title = "『刀球刃』",      Icon = "circle" })

-- ==========================================
-- 公告 / 用户信息 / 脚本介绍
-- ==========================================
local about = UITab1:Section({ Title = "『脚本介绍』" })
about:Paragraph({ Title = "脚本名称", Desc = "挽脚本通用源码" })
about:Paragraph({ Title = "版本", Desc = "v1.0.2 WindUI版" })
about:Paragraph({ Title = "作者", Desc = "无名氏" })
about:Paragraph({ Title = "联系方式", Desc = "QQ 略" })
about:Paragraph({ Title = "声明", Desc = "请勿倒卖，仅供学习交流" })
about:Paragraph({ Title = "备注", Desc = "请勿拿别的缝合来对比" })

about:Button({
    Title = "复制作者QQ",
    Callback = function()
        setclipboard("略")
        WindUI:Notify({ Title = "挽脚本通用源码", Content = "作者QQ已复制喵", Duration = 3 })
    end,
})

about:Button({
    Title = "复制脚本学习+制作交流群",
    Callback = function()
        setclipboard("574149379")
        WindUI:Notify({ Title = "挽脚本通用源码", Content = "群号已复制喵", Duration = 3 })
    end,
})

about = UITab1:Section({ Title = "『用户信息』" })
local function safeIdentify()
    local s, r = pcall(identifyexecutor)
    return s and r or "未知"
end
about:Paragraph({ Title = "用户名", Desc = tostring(LocalPlayer.Name) })
about:Paragraph({ Title = "显示名", Desc = tostring(LocalPlayer.DisplayName) })
about:Paragraph({ Title = "用户ID", Desc = tostring(LocalPlayer.UserId) })
about:Paragraph({ Title = "账号年龄", Desc = tostring(LocalPlayer.AccountAge) .. "天" })
about:Paragraph({ Title = "会员状态", Desc = (LocalPlayer.MembershipType == Enum.MembershipType.Premium) and "有会员" or "没有会员" })
about:Paragraph({ Title = "语言", Desc = tostring(LocalPlayer.LocaleId) })
about:Paragraph({ Title = "注入器", Desc = tostring(safeIdentify()) })

local deviceType = "未知设备"
if UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled then
    deviceType = "移动设备"
elseif not UIS.TouchEnabled and UIS.KeyboardEnabled and UIS.MouseEnabled then
    deviceType = "电脑"
elseif UIS.TouchEnabled and UIS.KeyboardEnabled and UIS.MouseEnabled then
    deviceType = "带触摸屏的电脑"
end
about:Paragraph({ Title = "设备类型", Desc = deviceType })

about = UITab1:Section({ Title = "『服务器信息』" })
local serverName = "未知"
pcall(function()
    serverName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
end)
about:Paragraph({ Title = "服务器名称", Desc = tostring(serverName) })
about:Paragraph({ Title = "PlaceId", Desc = tostring(game.PlaceId) })
about:Paragraph({ Title = "JobId", Desc = tostring(game.JobId) })
about:Paragraph({ Title = "客户端ID", Desc = tostring(game:GetService("RbxAnalyticsService"):GetClientId()) })

about = UITab1:Section({ Title = "『其他』" })

about:Toggle({
    Title = "缩小UI",
    Default = false,
    Callback = function(state)
        WindUI:Notify({ Title = "挽脚本", Content = "UI缩放功能请自行调整", Duration = 3 })
    end,
})

about:Button({
    Title = "重新加入服务器",
    Callback = function()
        pcall(function()
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
        end)
    end,
})

about:Button({
    Title = "关闭UI",
    Callback = function()
        Window:Destroy()
    end,
})

about:Button({
    Title = "复制服务器名称",
    Callback = function()
        setclipboard(tostring(serverName))
        WindUI:Notify({ Title = "挽脚本通用源码", Content = "服务器名称已复制喵", Duration = 3 })
    end,
})

about:Button({
    Title = "复制用户ID",
    Callback = function()
        setclipboard(tostring(LocalPlayer.UserId))
        WindUI:Notify({ Title = "挽脚本通用源码", Content = "用户ID已复制喵", Duration = 3 })
    end,
})

-- ==========================================
-- 通用
-- ==========================================
local about = UITab2:Section({ Title = "『玩家属性』" })

about:Slider({
    Title = "视野",
    Value = { Min = 10, Max = 180, Default = 70 },
    Callback = function(FOV) workspace.CurrentCamera.FieldOfView = FOV end,
})

about:Slider({
    Title = "视角缩放距离",
    Value = { Min = 1, Max = 1000000, Default = 100 },
    Callback = function(Distance)
        LocalPlayer.CameraMaxZoomDistance = Distance
        LocalPlayer.CameraMinZoomDistance = 0.5
    end,
})

about:Slider({
    Title = "步行速度",
    Value = { Min = 1, Max = 400, Default = 16 },
    Callback = function(Speed)
        local char = LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid").WalkSpeed = Speed
        end
    end,
})

about:Slider({
    Title = "跳跃高度",
    Value = { Min = 0, Max = 2000, Default = 50 },
    Callback = function(Jump)
        local char = LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            local hum = char:FindFirstChildOfClass("Humanoid")
            hum.JumpPower = Jump
            hum.JumpHeight = Jump / 7
        end
    end,
})

about:Slider({
    Title = "重力设置（默认196.2 高起不了身）",
    Value = { Min = 1, Max = 2000, Default = 196.2 },
    Callback = function(GravityValue) workspace.Gravity = GravityValue end,
})

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1)
    if _G.MaxHealthValue then char:WaitForChild("Humanoid").MaxHealth = _G.MaxHealthValue end
    if _G.HealthValue then char:WaitForChild("Humanoid").Health = _G.HealthValue end
end)

about:Button({
    Title = "重置重力",
    Callback = function() workspace.Gravity = 196.2 end,
})

about = UITab2:Section({ Title = "『功能』" })

about:Button({ Title = "飞行v3", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XxwanhexxX/321/refs/heads/main/fly"))()
end })

about:Button({ Title = "FPS显示", Callback = function()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FPSDisplay"
    screenGui.Parent = CoreGui
    screenGui.ResetOnSpawn = false
    local textLabel = Instance.new("TextLabel")
    textLabel.Text = "FPS: 0"
    textLabel.TextSize = 22
    textLabel.Font = Enum.Font.GothamBold
    textLabel.BackgroundTransparency = 1
    textLabel.Size = UDim2.new(0, 200, 0, 35)
    textLabel.Position = UDim2.new(0, 10, 0, 10)
    textLabel.TextColor3 = Color3.new(1,1,1)
    textLabel.Parent = screenGui
    local fc, lu = 0, tick()
    RunService.RenderStepped:Connect(function()
        fc = fc + 1
        if tick() - lu >= 0.15 then
            textLabel.Text = "FPS: " .. math.floor(fc / (tick() - lu))
            fc = 0; lu = tick()
        end
    end)
end })

about:Button({ Title = "动态模糊", Callback = function()
    local blur = Instance.new("BlurEffect")
    blur.Name = "DynamicMotionBlur"
    blur.Size = 10
    blur.Parent = game.Lighting
    RunService.RenderStepped:Connect(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            blur.Size = math.clamp(char.HumanoidRootPart.Velocity.Magnitude / 20, 0, 15)
        end
    end)
end })

about:Button({ Title = "玩家加入游戏提示", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
end })

about:Button({ Title = "反挂机", Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()
end })

about:Toggle({ Title = "通用防摔伤", Default = false, Callback = function(Value) end })
about:Toggle({ Title = "悬空锁高度", Default = false, Callback = function(Value) end })
about:Toggle({ Title = "无敌", Default = false, Callback = function(Value) end })

about:Toggle({ Title = "夜视", Default = false, Callback = function(Value)
    game.Lighting.Ambient = Value and Color3.new(1,1,1) or Color3.new(0,0,0)
end })

about:Toggle({ Title = "自动互动", Default = false, Callback = function(state)
    if state then
        _G.WanAutoInteract = true
        task.spawn(function()
            while _G.WanAutoInteract do
                for _, d in pairs(workspace:GetDescendants()) do
                    if d:IsA("ProximityPrompt") then pcall(fireproximityprompt, d) end
                end
                task.wait(0.25)
            end
        end)
    else
        _G.WanAutoInteract = false
    end
end })

about:Toggle({ Title = "无限跳", Default = false, Callback = function(Value)
    _G.WanJump = Value
    if Value then
        UIS.JumpRequest:Connect(function()
            if _G.WanJump then
                local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum:ChangeState("Jumping") end
            end
        end)
    end
end })

about:Toggle({ Title = "循环恢复血量", Default = false, Callback = function(Value)
    if Value then
        _G.WanHeal = true
        task.spawn(function()
            while _G.WanHeal do
                task.wait(0.01)
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("Humanoid") then
                    char.Humanoid.Health = char.Humanoid.MaxHealth
                end
            end
        end)
    else
        _G.WanHeal = false
    end
end })

about:Button({ Title = "汉化穿墙", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TtmScripter/OtherScript/main/Noclip"))()
end })

about:Button({ Title = "踏空ui", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float", true))()
end })

about:Button({ Title = "强制杀死玩家", Callback = function()
    if LocalPlayer.Character then LocalPlayer.Character:BreakJoints() end
end })

about:Button({ Title = "飞车", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/vb/main/%E9%A3%9E%E8%BD%A6.lua", true))()
end })

about:Button({ Title = "旋转", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/%E6%97%8B%E8%BD%AC.lua", true))()
end })

about:Paragraph({ Title = "境头", Desc = "" })

about:Button({ Title = "第一人称", Callback = function()
    LocalPlayer.CameraMaxZoomDistance = 0.5
    LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
end })

about:Button({ Title = "第三人称", Callback = function()
    LocalPlayer.CameraMaxZoomDistance = 50
    LocalPlayer.CameraMode = Enum.CameraMode.Classic
end })

about = UITab2:Section({ Title = "『工具』" })

about:Button({ Title = "点击传送", Callback = function()
    local mouse = LocalPlayer:GetMouse()
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "挽脚本通用源码点击传送"
    tool.Activated:Connect(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
            char.HumanoidRootPart.CFrame = CFrame.new(pos.X, pos.Y, pos.Z)
        end
    end)
    tool.Parent = LocalPlayer.Backpack
end })

about:Button({ Title = "控制台", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/3345179204-sudo/-/refs/heads/main/%E6%8E%A7%E5%88%B6tai"))()
end })

about:Button({ Title = "汉化dex", Callback = function()
    loadstring(game:HttpGet("https://gitee.com/cmbhbh/cmbh/raw/master/Bex.lua"))()
end })

about:Button({ Title = "工具挂", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/StandAwekening.lua", true))()
end })

about:Button({ Title = "iw指令", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
end })

about:Button({ Title = "电脑键盘", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end })

about = UITab2:Section({ Title = "『光影』" })
about:Button({ Title = "普通光影", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))() end })
about:Button({ Title = "光影滤镜", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))() end })
about:Button({ Title = "超高画质", Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))() end })
about:Button({ Title = "光影V4", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))() end })
about:Button({ Title = "RTX高仿", Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/Bkf0BJb3"))() end })
about:Button({ Title = "光影深", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))() end })
about:Button({ Title = "光影浅", Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))() end })

-- ==========================================
-- 范围+自瞄
-- ==========================================
local about = UITab3:Section({ Title = "『范围』" })

about:Input({
    Title = "自定义范围",
    Placeholder = "输入",
    Callback = function(Value)
        _G.HeadSize = tonumber(Value)
        _G.Disabled = true
        if _G.HeadSize then
            for _, v in pairs(Players:GetPlayers()) do
                if v.Name ~= LocalPlayer.Name and v.Character then
                    pcall(function()
                        v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        v.Character.HumanoidRootPart.Transparency = 0.7
                        v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
                        v.Character.HumanoidRootPart.Material = "Neon"
                        v.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
            WindUI:Notify({ Title = "挽脚本通用源码", Content = "范围已设置喵", Duration = 3 })
        else
            WindUI:Notify({ Title = "挽脚本通用源码", Content = "请输入数字喵", Duration = 3 })
        end
    end,
})

about:Button({ Title = "关闭范围", Callback = function()
    _G.Disabled = false
    for _, v in pairs(Players:GetPlayers()) do
        if v.Name ~= LocalPlayer.Name and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            pcall(function()
                v.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                v.Character.HumanoidRootPart.Transparency = 1
                v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Medium stone grey")
                v.Character.HumanoidRootPart.Material = "Plastic"
                v.Character.HumanoidRootPart.CanCollide = true
            end)
        end
    end
    WindUI:Notify({ Title = "挽脚本通用源码", Content = "范围关闭了喵", Duration = 3 })
end })

about:Button({ Title = "彩虹", Callback = function()
    _G.HeadSize = 20
    _G.Disabled = true
    RunService.RenderStepped:Connect(function()
        if _G.Disabled then
            local hue = tick() % 5 / 5
            local r = math.sin(hue * 6.28) * 127 + 128
            local g = math.sin(hue * 6.28 + 2) * 127 + 128
            local b = math.sin(hue * 6.28 + 4) * 127 + 128
            for _, v in pairs(Players:GetPlayers()) do
                if v.Name ~= LocalPlayer.Name and v.Character then
                    pcall(function()
                        v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                        v.Character.HumanoidRootPart.Transparency = 0.7
                        v.Character.HumanoidRootPart.Color = Color3.fromRGB(r,g,b)
                        v.Character.HumanoidRootPart.Material = "Neon"
                        v.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
    WindUI:Notify({ Title = "挽脚本通用源码", Content = "彩虹已启用喵", Duration = 3 })
end })

about = UITab3:Section({ Title = "『快速调』" })
local function quickRange(size)
    _G.HeadSize = size
    _G.Disabled = true
    for _, v in pairs(Players:GetPlayers()) do
        if v.Name ~= LocalPlayer.Name and v.Character then
            pcall(function()
                v.Character.HumanoidRootPart.Size = Vector3.new(size,size,size)
                v.Character.HumanoidRootPart.Transparency = 0.7
                v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                v.Character.HumanoidRootPart.Material = "Neon"
                v.Character.HumanoidRootPart.CanCollide = false
            end)
        end
    end
end
about:Button({ Title = "普通范围", Callback = function() quickRange(15) end })
about:Button({ Title = "中等范围", Callback = function() quickRange(50) end })
about:Button({ Title = "超大范围", Callback = function() quickRange(100) end })
about:Button({ Title = "终极范围", Callback = function() quickRange(200) end })
about:Button({ Title = "全图范围", Callback = function() quickRange(400) end })

about = UITab3:Section({ Title = "『自定义』" })
for _, size in ipairs({15, 50, 100, 150, 200, 250, 300, 400, 500}) do
    about:Button({ Title = "范围"..size, Callback = function() quickRange(size) end })
end

about = UITab3:Section({ Title = "『自瞄』" })

local currentAimbotConnection, currentFOVring, currentInputConnection
local rainbowHue = 0

local function cleanupCurrentAimbot()
    if currentAimbotConnection then currentAimbotConnection:Disconnect() currentAimbotConnection = nil end
    if currentFOVring then currentFOVring:Remove() currentFOVring = nil end
    if currentInputConnection then currentInputConnection:Disconnect() currentInputConnection = nil end
end

about:Button({ Title = "关闭自瞄", Callback = function()
cleanupCurrentAimbot()
打印("自瞄已关闭")
结束 })

当地的 功能createAimbot(fov)
cleanupCurrentAimbot()
    当地的Cam=workspace.CurrentCamera
currentFOVring=绘图.新的("圆圈")
currentFOVring.Visible=正确
currentFOVring.Thickness=1
currentFOVring.NumSides=64
currentFOVring.Filled=假的
currentFOVring.Radius=fov
currentFOVring.Position=Cam.ViewportSize/2

当地的功能updateDrawings()
currentFOVring.Position=Cam.ViewportSize/2
rainbowHue=(rainbowHue+0.02) %1
currentFOVring。color=Color3.FromHSV(rainbowHue，1, 1)
    结束

currentInputConnection=UIS.InputBegan:Connect(功能(输入)
如果input.KeyCode==Enum.KeyCode.Delete然后
cleanupCurrentAimbot()
        结束
    结束)

当地的功能看(目标)
当地的lookVector=(目标-凸轮.车架.位置).单元
凸轮。cframe=cframe.New(Cam.cframe.位置、凸轮、C框架、位置+外观矢量)
    结束

当地的功能getClosestPlayerInFOV(trg_part)
当地的最近，最后=零，数学.很大
当地的playerMousePos=Cam.ViewportSize/2
为_，播放器在……内ipairs(播放器：GetPlayers())做
如果player~=LocalPlayer然后
当地的part=player.Character和player.字符：FindFirstChild(trg_part)
如果部分然后
当地的EPOS，isVisible=Cam:WorldToViewportPoint(零件位置)
当地的距离=(Vector2.new(ePos.x，ePos.y)-playMousePos)。幅度
                    如果距离<上次和is可见和距离<fov然后
最后的=距离
最近的=播放器
                    结束
                结束
            结束
        结束
返回最近的
    结束

currentAimbotConnection=RunService。RenderSteed:Connect(功能()
updateDrawings()
当地的closest=getClosestPlayerInFOV("头")
如果最靠近的和最接近.字符和closest.Character:FindFirstChild("头") 然后
注视(最近.字符.头部.位置)
        结束
    结束)
结束

关于：按钮({Title="自瞄10"，回调=功能()createAimbot(15) 结束 })
关于：按钮({Title="自瞄30"，回调=功能()createAimbot(30) 结束 })
关于：按钮({Title="自瞄50"，回调=功能()createAimbot(50) 结束 })
关于：按钮({Title="自瞄100"，回调=功能()createAimbot(100) 结束 })
关于：按钮({Title="自瞄200"，回调=功能()createAimbot(200) 结束 })
关于：按钮({Title="自瞄300"，回调=功能()createAimbot(300) 结束 })
关于：按钮({Title="自瞄400"，回调=功能()createAimbot(400) 结束 })
关于：按钮({Title="自瞄全屏"，回调=功能()createAimbot(1600) 结束 })

--==========================================
-- 传送+甩飞
--==========================================
getgenv().LockTPEnabled=假的
getgenv().LoopTPEnabled=假的
getgenv().LoopFrontTPEnabled=假的
getgenv().LoopHeadHeightEnabled=假的
getgenv().LoopHeadTPEnabled=假的
getgenv().LoopBackTPEnabled=假的
getgenv().LoopThrowEnabled=假的
getgenv().FrontDistance=5
getgenv().BackDistance=5

当地的关于=UITab4：节({Title="『玩家选择』" })
当地的selectedPlayer=零
当地的playerlist={}
当地的playerDropdown

当地的功能refreshPlayers()
table.clear(playerlist)
为_，p在...内对(玩家：GetPlayers())做
如果P~=LocalPlayer然后table.insert(playerlist，p.Name)结束
    结束
结束
refreshPlayers()

playerDropdown=about:Dropdown({
title="选择玩家的名称",
values=playerlist，
回调=功能(已选择)
        selectedPlayer = Players:FindFirstChild(selected)
    end,
})

about:Button({
    Title = "刷新列表",
    Callback = function()
        local newList = {}
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then table.insert(newList, p.Name) end
        end
        playerDropdown:Refresh(newList)
        WindUI:Notify({ Title = "挽脚本通用源码", Content = "列表刷新成功喵", Duration = 3 })
    end,
})

about:Button({
    Title = "查看玩家",
回调=功能()
        如果selectedPlayer和selectedPlayer.Character然后
workspace.CurrentCamera.CameraSubject=selectedPlayer.Character.Humanoid
        结束
    结束,
})

关于：按钮({
title="停止查看",
回调=功能()
        如果LocalPlayer.Character和LocalPlayer.Character:FindFirstChild("类人") 然后
workspace.CurrentCamera.CameraSubject=LocalPlayer.Character.Humanoid
        结束
    结束,
})

关于=UITab4：节({Title="『传送功能』" })

关于：按钮({
标题="传递到玩家旁边"，
回调=功能()
如果selectedPlayer和selectedPlayer.Character和selectedPlayer.Character:FindFirstChild("HumanoidRootPart")然后
当地的targetPos=selectedPlayer。性格。HumanoidRootPart。位置
LocalPlayer。性格。HumanoidRootPart。cframe=cframe.New(targetPos+Vector3.新的(3，0，3))
        结束
    结束,
})

关于：切换({
标题="锁定传送",
默认值=假的,
回调=功能(州)
getgenv().LockTPEnabled=state
如果状态和selectedPlayer然后
_G.WanLockTPConn=RunService.Heartbeat：连接(功能()
如果不getgenv().LockTPEnabled或不selectedPlayer或不selectedPlayer.Character然后返回结束
当地的T=selectedPlayer。字符：FindFirstChild("HumanoidRootPart")
当地的M=LocalPlayer.Character和LocalPlayer。字符：FindFirstChild("HumanoidRootPart")
如果t和米然后m.cframe=cframe.new(t.position+Vector3.new(3，0，3))结束
            结束)
        其他
如果_G.WanLockTPConn然后_G.WanLockTPonn：断开()结束
        结束
    结束,
})

关于：按钮({
标题="把玩家传送过来",
回调=功能()
如果selectedPlayer和selectedPlayer.Character和selectedPlayer.Character:FindFirstChild("HumanoidRootPart")然后
当地的M=LocalPlayer.Character和LocalPlayer。字符：FindFirstChild("HumanoidRootPart")
如果米然后
selectedPlayer。性格。HumanoidRootPart.cframe=cframe.New(m.位置+矢量3。新的(3，0，3))
            结束
        结束
    结束,
})

关于：切换({
标题="循环把玩家传送过来",
默认值=假的,
回调=功能(州)
getgenv().LoopTPEnabled=state
如果状态和selectedPlayer然后
_G.WanLoopTPConn=RunService.Heartbeat：连接(功能()
如果不是getgenv().LoopTPEnabled或不selectedPlayer或不selectedPlayer.Character，则返回返回消息(当地的结束
当地的M=LocalPlayer.Character和LocalPlayer。字符：FindFirstChild(返回消息()M=LocalPlayer.Character和LocalPlayer。角色：FindFirstChild("HumanoidRootPart")"HumanoidRootPart")M=LocalPlayer.Character和LocalPlayer.角色：FindFirstChild("HumanoidRootPart")
局部t=选择的玩家。字符：FindFirstChild("HumanoidRootPart")"HumanoidRootPart")"HumanoidRootPart")"HumanoidRootPart")
如果m和t，则t.cframe=cframe.new(m.Position+Vector3.新的(3，0，3))结束3，0，3))结束
结束)
其他
如果_G.WanLoopTPConn，则_G.WanLoopTPConn：断开连接()结束
结束
结束，
})

关于=uitab4：节({title="'吸人+飘飞'"})"'吸人+飘飞'"})
关于：切换({Title="吸附所有人"，默认值=假的，回调=函数(状态)结束})"吸附所有人"，默认值=假的，回调=函数(状态)结束})
关于：段落({Title="甩飞"，DESC=""})"甩飞"，DESC=""})

关于：按钮({
标题="甩飞一次选中的人"，"甩飞一次选中的人"，
回调=函数()
本地播放器=本地播放器
本地TargetPlayer=selectedPlayer
如果不是TargetPlayer或TargetPlayer==Player，则
WindUI：通知({Title="挽脚本通用源码"，内容="无玩家可甩飞"，持续时间=2})"挽脚本通用源码"，内容="无玩家可甩飞"，持续时间=2})"挽脚本通用源码"，内容="无玩家可甩飞"，持续时间=2})"挽脚本通用源码"，内容="无玩家可甩飞"，持续时间=2})
返回
结束
本地消息=功能(t，txt，d)
WindUI：通知({Title=t，Content=txt，Duration=d})
结束
局部skidfling=函数(目标)
本地字符=玩家.字符
局部类人字符=字符和字符：FindFirstChildOfClass("类人字符")"类人字符")"类人字符")"类人字符")
局部根部件=类人和类人根部件
本地TCharacter=Target.Character
局部THumanoid=TCharacter和TCharacter:FindFirstChildOfClass("类人")"类人")"类人")"类人")
局部TRootPart=THumanid和THumanid.rootPart
本地thead=TCharacter和TCharacter:FindFirstChild("头")"头")"头")"头")
本地附件=TCharacter和TCharacter:FindFirstChildOfClass("附件")"附件")"附件")"附件")
本地句柄=附件和附件：FindFirstChild(“句柄”)"句柄")"句柄")
如果不是(字符和类人和根部分和TCharacter和类人)，则
返回消息("挽脚本通用源码"，"玩家已趋势"，2)"挽脚本通用源码"，"玩家已趋势"，2)"挽脚本通用源码"，"玩家已趋势"，2)"挽脚本通用源码"，"玩家已趋势"，2)
结束
如果类人。坐
