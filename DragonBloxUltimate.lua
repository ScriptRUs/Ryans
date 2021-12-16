
local MobTable = {}
for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
    table.insert(MobTable, v.Name)
end


local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("DBU") -- Creates the window

local farm = w:CreateFolder("Autofarm") -- Creates the folder(U will put here your buttons,etc)
local info = w:CreateFolder("Information")

farm:Toggle("Autofarm", function(Val)
    FarmToggle = Val
end)
farm:Dropdown("Mob Selection", MobTable, true, function(Value)
    MobSelected = Value
end)

info:Label("The Mob Tabels Are Shitty",{
    TextSize = 17; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
}) 
info:Label("Better Shit Coming Soon",{
    TextSize = 18; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
}) 

spawn(function()
    while true do wait()
        if FarmToggle then
            wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Living[MobSelected].HumanoidRootPart.CFrame
            wait()
            local ohString1 = "Blacknwhite27"
            local ohNumber2 = 1
            game:GetService("ReplicatedStorage").Package.Events.p:FireServer(ohString1, ohNumber2)
        end
    end
end)
