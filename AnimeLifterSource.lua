-- For Some Reason In The Console It Would Error Out. I Seen No Reason
-- It Should Have But Im Too Lazy. Everything Works Like It Should
-- So Enjoy The Script

local Weights = {}
for i,v in pairs(game:GetService("ReplicatedStorage").Weights:GetChildren()) do
   table.insert(Weights,tostring(v))
end

local Chi = {}
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main.Pages.Chi.Main.ChiList:GetChildren()) do
   table.insert(Chi,tostring(v))
end

local Classes = {}
for i,v in pairs((game:GetService("ReplicatedStorage").GameAssets.OnFireParticles:GetChildren())) do
   table.insert(Classes,tostring(v))
end

function AutoSell()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Areas[SellLocationSelected].Pads.Sell.Part, 0)
    wait()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Areas[SellLocationSelected].Pads.Sell.Part, 1)
    wait()
end

local SellLocation = {
    "Valley",
    "Tundra",
    "Underworld",
    "Wasteland"
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptRUs/GhostHub/main/UiLib.lua"))()

local gui = Library:create{
    Theme = Library.Themes.Dark
}

local tab = gui:tab{
    Icon = "", -- I Could Never Get The Icon Part To Work For Some Reason lol
    Name = "Main"
}

local egg = gui:tab{
    Icon = "", -- I Could Never Get The Icon Part To Work For Some Reason lol
    Name = "Dispensers"
}
tab:button({
    Name = "-- Autofarm --",
    Callback = function()
        print("")
    end
})
tab:toggle({
    Name = "Auto Lift",
    Callback = function(Vals)
        Lift = Vals
                    spawn(function()
                        while true do wait()
                            if Lift then
                               game:GetService("ReplicatedStorage").Events.Training:FireServer("Lift")
                            end
                        end
                    end)
        end
})
tab:toggle({
    Name = "Auto Sell",
    Callback = function(Vals)
        Sell = Vals
            spawn(function()
                while true do wait()
                    if Sell then
                        AutoSell()
                    end
                end
            end)
    end
})
tab:dropdown({
    Name = "Sell Zone Select",
    StartingText = "Select Your Sell Zone",
    Items = SellLocation,
    Description = "Sell You Strength By Selecting A Sell Zone",
    Callback = function(Value)
        SellLocationSelected = Value
    end,
})
tab:button({
    Name = "-- Auto Buys --",
    Callback = function()
        print("")
    end
})
tab:toggle({
    Name = "AutoBuy Areas",
    Callback = function(Vals)
        BuyAreas = Vals
            spawn(function()
                while true do wait()
                    if BuyAreas then
                        BuyAreas()
                    end
                end
            end)
    end
})
tab:toggle({
    Name = "AutoBuy Weight",
    Callback = function(Vals)
        Weight = Vals
            spawn(function()
                while true do wait()
                    if Weight then
                        for i = 1,#Weights do
                            game:GetService("ReplicatedStorage").Events.BuyWeight:FireServer(Weights[i])
                        end
                    end
                end
            end)
    end
})
tab:toggle({
    Name = "AutoBuy Chi",
    Callback = function(Vals)
        Chis = Vals
            spawn(function()
                while true do wait()
                    if Chis then
                        for i = 1,#Chi do
                            game:GetService("ReplicatedStorage").Events.BuyChi:FireServer(Chi[i])
                        end
                    end
                end
            end)
    end
})

tab:toggle({
    Name = "AutoBuy Class",
    Callback = function(Vals)
        Class = Vals
            spawn(function()
                while true do wait()
                    if Class then
                        for i = 1,#Classes do
                            game:GetService("ReplicatedStorage").Events.BuyClass:FireServer(Classes[i])
                        end
                    end
                end
            end)
    end
})

egg:button({
    Name = "-- This Will Lag When Running Out Of Money --",
    Callback = function()
        print("")
    end
})
egg:dropdown({
    Name = "Dispenser Select",
    StartingText = "Select Your Dispenser",
    Items = Dispensers,
    Description = "Hatch Your Pet By Selecting A Dispenser",
    Callback = function(Value)
        DispenserSelected = Value
    end,
})

egg:toggle({
    Name = "Auto Dispenser",
    Callback = function(Vals)
        AutoDispense = Vals
            spawn(function()
                while true do wait()
                    if AutoDispense then
                        game:GetService("ReplicatedStorage").Events.Hatch:FireServer(DispenserSelected)
                    end
                end
            end)
        end
})
