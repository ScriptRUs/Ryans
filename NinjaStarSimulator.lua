--[[
Scripting By: Ryans#3857
Cash App: $ScriptRUs
]]--
while _G.Toggle do wait(0)
for i,v in pairs(game:GetService("Workspace").MonsterSpawners.Japan[_G.Map]:GetDescendants()) do
    if v.Name == "HumanoidRootPart" then
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(1, Enum.EasingStyle.Linear)
        tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(v.Position)})
        tween:Play()
    end
end
end
while _G.AutoCollect do wait(0)
for _,v in pairs(game:GetService("Workspace").Coin:GetDescendants()) do
    if v:IsA("TouchTransmitter") then
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0) --0 is touch
        wait()
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1) -- 1 is untouch
    end
end
end