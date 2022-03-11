--[[
Scripting By: Ryans#3857
Cash App: $ScriptRUs
]]--
if _G.Toggle == true then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-302.18402099609375, 954.5215454101562, -462.1951904296875)
elseif _G.Toggle == false then
    wait()
end
while _G.Toggle do wait(2)
if _G.Toggle == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
for i,v in pairs(game:GetService("Workspace").MonsterSpawners.Japan[_G.Map]:GetDescendants()) do
    if v.Name == "HumanoidRootPart" then
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(1, Enum.EasingStyle.Linear)
        tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(v.Position)})
        tween:Play()
    end
end
elseif _G.Toggle == false then
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
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
