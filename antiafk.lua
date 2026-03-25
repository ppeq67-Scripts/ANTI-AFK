-- Anti-AFK GUI Script (Made by ppeq67)

local VirtualUser = game:GetService("VirtualUser")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local antiAFKEnabled = false
local connection

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ToggleButton = Instance.new("TextButton")
local Label = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Position = UDim2.new(0.4, 0, 0.4, 0)
Frame.Size = UDim2.new(0, 200, 0, 120)
Frame.Active = true
Frame.Draggable = true

Label.Parent = Frame
Label.Size = UDim2.new(1, 0, 0, 30)
Label.BackgroundTransparency = 1
Label.Text = "made by ppeq67"
Label.TextColor3 = Color3.fromRGB(255,255,255)
Label.TextScaled = true

ToggleButton.Parent = Frame
ToggleButton.Position = UDim2.new(0.1, 0, 0.4, 0)
ToggleButton.Size = UDim2.new(0.8, 0, 0.4, 0)
ToggleButton.Text = "Enable Anti-AFK"
ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ToggleButton.TextColor3 = Color3.fromRGB(255,255,255)
ToggleButton.TextScaled = true

-- Toggle Function
local function enableAntiAFK()
    if connection then connection:Disconnect() end
    connection = player.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end

local function disableAntiAFK()
    if connection then
        connection:Disconnect()
        connection = nil
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    antiAFKEnabled = not antiAFKEnabled
    
    if antiAFKEnabled then
        enableAntiAFK()
        ToggleButton.Text = "Disable Anti-AFK"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    else
        disableAntiAFK()
        ToggleButton.Text = "Enable Anti-AFK"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end
end)
