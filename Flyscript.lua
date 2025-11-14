-- Fly Script con menú básico
-- Ejecutable en KRNL, Delta, etc.

-- Crear GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local FlyButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Position = UDim2.new(0.5, -100, 0.5, -50)
Frame.Size = UDim2.new(0, 200, 0, 100)

FlyButton.Parent = Frame
FlyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
FlyButton.Position = UDim2.new(0.5, -50, 0.5, -20)
FlyButton.Size = UDim2.new(0, 100, 0, 40)
FlyButton.Text = "Activar Fly"
FlyButton.TextColor3 = Color3.new(1, 1, 1)

-- Función de vuelo
local flying = false
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local bodyGyro = Instance.new("BodyGyro")
local bodyVelocity = Instance.new("BodyVelocity")

function toggleFly()
    flying = not flying
    if flying then
        bodyGyro.Parent = humanoidRootPart
        bodyVelocity.Parent = humanoidRootPart
        bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        bodyGyro.P = 9e4
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        FlyButton.Text = "Desactivar Fly"

        game:GetService("RunService").RenderStepped:Connect(function()
            if flying then
                bodyGyro.CFrame = workspace.CurrentCamera.CFrame
                bodyVelocity.Velocity = workspace.CurrentCamera.CFrame.lookVector * 50
            end
        end)
    else
        bodyGyro:Destroy()
        bodyVelocity:Destroy()
        FlyButton.Text = "Activar Fly"
    end
end

FlyButton.MouseButton1Click:Connect(toggleFly)
