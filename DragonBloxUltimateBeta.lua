
-- Globals
Enabled = false
GodMode = false
transform = false
energy = false
rebirth = false
Terminate = false

--Variable
local player = game:GetService("Players").LocalPlayer
local events = game:GetService("ReplicatedStorage").Package.Events

-- Variables
local player = game.Players.LocalPlayer
local rs = game:GetService("RunService")
local data = game.ReplicatedStorage.Datas[player.UserId]
local skills = game.ReplicatedStorage.Package.Skills
local events = game.ReplicatedStorage.Package.Events
local market = game:GetService("MarketplaceService")


local Quest = {
    "Top X Fighter",
    "SSJB Wukong",
    "Citizen",
    "Kid Nohag",
    "Chilly",
    "X Fighter Trainer",
    "Super Vegetable",
    "Klirin",
    "SSJ2 Wukong",
    "Perfect Atom",
    "Radish",
    "Mapa",
    "Broccoli",
    "SSJG Kakata",
    "Kai-fist Master",
    "Kaio Student",
    "Turtle Student"
}
-- Shitty Tabels
local MobTable = {}
for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
    table.insert(MobTable, v.Name)
end
local repl = sv.ReplicatedStorage
local a = require(repl.Aero.Shared.GameSettings.ModeData)
a = getupvalue(a,1)

local rmt = {}
for i,v in pairs(repl.Aero.AeroRemoteServices:GetDescendants()) do
    if v.Parent.Name ~= 'FusionService' then
        if v:IsA('RemoteEvent') then
            rmt[v.Name] = function(...)v:FireServer(...) end
        elseif v:IsA('RemoteFunction') then
            rmt[v.Name] = function(...)v:InvokeServer(...) end
        end
    end
end
-- Ui Lib Section
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("DBU") -- Creates the window

local farm = w:CreateFolder("Autofarm") -- Creates the folder(U will put here your buttons,etc)
local transforms = w:CreateFolder("Transforma")
local info = w:CreateFolder("Information")

farm:Toggle("On/Off Toggle", function(Val)
    Autofarm = Val
end)
farm:Dropdown("Select Mob", MobTable ,true, function(Value)
    SelectedMob = Value
end)
farm:Dropdown("Select Quest",Quest, true, function(Value)
    SelectedQuest = Value
end)
farm:Slider("Tp Distance",{
    min = 0; -- min value of the slider
    max = 10; -- max value of the slider
    precise = true; -- max 2 decimals
},function(value)
    TpDistance = value
end)

transforms:Toggle("Auto Transform", function(Val)
    transform  = Val
end)

--NoClip
Stepped = game:GetService('RunService').Stepped:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then 
        player.Character.Humanoid:ChangeState(11)
    end
    if Autofarm == false then 
        Stepped:Disconnect()
    end
end)

--Function
local function quest()
    if game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value ~= SelectedQuest then
        player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Others.NPCs[SelectedQuest].HumanoidRootPart.CFrame
		repeat
			wait()
			events.Qaction:InvokeServer(game:GetService("Workspace").Others.NPCs[SelectedQuest])
		until game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value == SelectedQuest
	end
end



--Loop
spawn(function()
    while true do wait()
        if Autofarm and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
    for i, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
        if v.Name:lower() == SelectedMob:lower() and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            repeat
                quest()
                player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + v.HumanoidRootPart.CFrame.lookVector * TpDistance
                wait()
                local ohString1 = "Blacknwhite27"
                local ohNumber2 = 1
                game:GetService("ReplicatedStorage").Package.Events.p:FireServer(ohString1, ohNumber2)
            until Autofarm == false or v == nil or v.Humanoid.Health <= 0
			
        end
    end
        end
end
end)

spawn(function()
    while true do wait()
        if transform and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            rmt.Transformation(a:GetBestMode(game.Players.LocalPlayer).Name)
        end
    end
end)
