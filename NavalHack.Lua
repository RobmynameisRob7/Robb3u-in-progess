-- Made by Rob Béo - Naval Warfare Hack GUI
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local GuiLib = loadstring(game:HttpGet("https://github.com/RobmynameisRob7/Robb3u-in-progess"))()
local Window = GuiLib:CreateWindow("Naval Hack", "Made by Rob Béo", 350, 250)

-- HITBOX TO
Window:AddToggle("To Hitbox", function(state)
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            for _, part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Size = state and Vector3.new(10, 10, 10) or Vector3.new(2, 2, 1)
                    part.Transparency = state and 0.5 or 0
                end
            end
        end
    end
end)

-- GOD MODE
Window:AddButton("God Mode", function()
    local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Name = "1"
        local clone = humanoid:Clone()
        clone.Parent = LocalPlayer.Character
        clone.Name = "Humanoid"
        wait(0.1)
        LocalPlayer.Character:FindFirstChild("1"):Destroy()
        workspace.CurrentCamera.CameraSubject = clone
    end
end)

-- BAY
Window:AddToggle("Bay", function(state)
    if state then
        _G.Fly = true
        while _G.Fly and task.wait() do
            LocalPlayer.Character:TranslateBy(Vector3.new(0, 1.5, 0))
        end
    else
        _G.Fly = false
    end
end)

-- INFINITE AMMO
Window:AddButton("Infinite Ammo", function()
    for _, v in pairs(getgc(true)) do
        if type(v) == "function" and getfenv(v).script and getfenv(v).script.Name == "GunScript" then
            setupvalue(v, 5, math.huge) -- Tuỳ theo cấu trúc game, có thể cần chỉnh số 5
        end
    end
end)
