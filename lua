--// SERVICIOS

local Players = game:GetService("Players")

local Workspace = game:GetService("Workspace")

local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

local PlayerGui = player:WaitForChild("PlayerGui")

--// FUNCIONES DE LIMPIEZA

local function cleanCharacter(char)

if not char then return end

for _, obj in ipairs(char:GetChildren()) do

if obj:IsA("Accessory")  

or obj:IsA("Shirt")  

or obj:IsA("Pants")  

or obj:IsA("ShirtGraphic")  

or obj:IsA("BodyColors")  

or obj:IsA("CharacterMesh")  

or obj:IsA("Hat") then  

	obj:Destroy()  

end

end

end

local function cleanAll()

for _, hum in ipairs(Workspace:GetDescendants()) do

if hum:IsA("Humanoid") and hum.Parent then  

	cleanCharacter(hum.Parent)  

end

end

end

local function fastCleanAsync()

task.spawn(function()

local startTime = os.clock()  

while os.clock() - startTime < 2 do  

	cleanAll()  

	task.wait(0.3)  

end

end)

end

--// FPS KILLER

local function executeFpsKiller()

fastCleanAsync()

local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")

local backpack = player:WaitForChild("Backpack")

local qc = backpack:FindFirstChild("Quantum Cloner")

if qc then

humanoid:EquipTool(qc)  



for _, tool in ipairs(backpack:GetChildren()) do  

	if tool:IsA("Tool") and tool ~= qc then  

		tool.Parent = character  

	end  

end  



task.wait(0.05)  

qc:Activate()  

task.wait(0.1)  

humanoid:UnequipTools()

end

end

--// SONIDO

local function playSound()

local sound = Instance.new("Sound")

sound.SoundId = "rbxassetid://2888333253"

sound.Volume = 1

sound.Parent = PlayerGui

sound:Play()

end

playSound()

--// GUI

local gui = Instance.new("ScreenGui")

gui.Name = "FpsKillerGui"

gui.ResetOnSpawn = false

gui.Parent = PlayerGui

local frame = Instance.new("Frame")

frame.Size = UDim2.fromOffset(260, 130)

frame.Position = UDim2.new(1, -280, 0, 40)

frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

frame.BorderSizePixel = 0

frame.Active = true

frame.Draggable = true

frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 18)

local frameStroke = Instance.new("UIStroke", frame)

frameStroke.Color = Color3.fromRGB(120, 20, 20)

frameStroke.Thickness = 2

--// TITULO

local title = Instance.new("TextLabel")

title.Size = UDim2.new(1, 0, 0, 40)

title.BackgroundTransparency = 1

title.Text = "LYNOX X MACABROS"

title.TextColor3 = Color3.fromRGB(220, 40, 40)

title.Font = Enum.Font.GothamBlack

title.TextSize = 20

title.Parent = frame

TweenService:Create(

title,

TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),

{TextStrokeTransparency = 0.75}

):Play()

--// BOTÓN

local btn = Instance.new("TextButton")

btn.Size = UDim2.fromOffset(220, 55)

btn.Position = UDim2.new(0.5, -110, 0, 55)

btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

btn.BorderSizePixel = 0

btn.Text = "🔥 FPS KILLER"

btn.TextColor3 = Color3.fromRGB(200, 30, 30)

btn.Font = Enum.Font.GothamBlack

btn.TextSize = 18

btn.Parent = frame

Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 14)

local btnStroke = Instance.new("UIStroke", btn)

btnStroke.Color = Color3.fromRGB(120, 20, 20)

btnStroke.Thickness = 2

btn.MouseButton1Click:Connect(function()

executeFpsKiller()

end)

--// LIMPIEZA PASIVA

task.spawn(function()

while true do

cleanAll()  

task.wait(5)

end

end)
