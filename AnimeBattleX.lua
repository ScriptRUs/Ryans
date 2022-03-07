while _G.RebirthSettings.Toggle do wait(0.3)
    if _G.RebirthSettings.Rebirth == true then
        game:GetService("ReplicatedStorage").Remotes.Rebirth:InvokeServer()
    end
    if _G.RebirtSettings.Miscs == true then
        game:GetService("ReplicatedStorage").Remotes.SpendRebirthPoint:FireServer(_G.RebirthSettings.Point)
    end
end
local Player = game.Players.LocalPlayer
function EnemieFarm()
    game:GetService("ReplicatedStorage").Remotes.Melee:FireServer("Melee")
    for i,v in pairs(game:GetService("Workspace").WORLD[_G.Settings.Regions].Arenas[_G.Settings.Arenas].Enemies:GetDescendants()) do
        if v.Name == "HumanoidRootPart" then
            Player.Character.HumanoidRootPart.CFrame = v.CFrame
        end
    end
    local ohString1 = _G.Settings.Skill
    local ohVector32 = 2479.11669921875, 163.89158630371094, 2747.423095703125
    game:GetService("ReplicatedStorage").Remotes.UseAbility:FireServer(ohString1, ohVector32)
end

while _G.Settings.Toggle do wait()
if game:GetService("Workspace").WORLD[_G.Settings.Regions].Arenas[_G.Settings.Arenas].Enemies.DataCost < 100 then

Player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").WORLD[_G.Settings.Regions].Arenas[_G.Settings.Arenas].JoinSpawn.CFrame
wait(0.3)

local ohString1 = _G.Settings.Arenas
local ohBoolean2 = true

game:GetService("ReplicatedStorage").Remotes.JoinLeaveArena:FireServer(ohString1, ohBoolean2)

wait(2)

elseif game:GetService("Workspace").WORLD[_G.Settings.Regions].Arenas[_G.Settings.Arenas].Enemies.DataCost > 200  then
    local ohString1 =_G.Settings.FighterSpawn
    game:GetService("ReplicatedStorage").Remotes.SpawnFighter:InvokeServer(ohString1)
    wait()
    EnemieFarm()
end
end
while _G.Settings.Collect do wait(0.3)
    for i,v in pairs(game:GetService("Workspace").FX:GetChildren()) do
        local ohString1 = "Claim"
        local ohString2 = v.Name
        game:GetService("ReplicatedStorage").Remotes.Coins:FireServer(ohString1, ohString2)
    end
end
