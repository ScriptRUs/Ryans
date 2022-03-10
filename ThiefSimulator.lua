while _G.Settings.AutoRobNpc do wait()
for i,v in pairs(workspace:GetChildren()) do
    if string.match(v.Name,"Base") and v.HumanoidRootPart then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
        fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
    end
end
end
while _G.Settings.AutoSell do wait()
    for _,v in pairs(game:GetService("Workspace").Sells.World1.Sell:GetDescendants()) do
        if v:IsA("TouchTransmitter") then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            wait()
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
            wait()
        end
    end
end
while _G.Settings.AtmRob do wait()
    for i,v in pairs(game:GetService("Workspace").Map.ATMs:GetDescendants()) do
        if v.Name == "Healthbar" then
            game:GetService("ReplicatedStorage").FrameworkReplicated.DataStreams:FindFirstChild("GameTaskCompleted_Functionv.07"):InvokeServer(v.Parent)
        end
    end
end
while _G.Settings.AutoClaimQuest do wait(2)
    for i,v in pairs(workspace:GetChildren()) do
        if string.match(v.Name,"Base") and v.HumanoidRootPart then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Jobs.World1.Jobs.CFrame
            fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
        end
    end
end
