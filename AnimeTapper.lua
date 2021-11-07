do
	local ui = game:GetService("CoreGui"):FindFirstChild("Library")
	if ui then
		ui:Destroy()
	end
end

_G.MobChosen = "Kosogi"
local table1 = {}

for _,Egg in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
    table.insert(table1, Egg.Name)
end

local VLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/vep1032/VepStuff/main/Rgb%20Ui"))()
MAINTTL = "Ghost Scripts!" 

local win = VLib:Window("Anime Shitter Sim", Color3.fromRGB(196, 40, 28))
local Farm = win:Tab("Autofarms")
local Buy = win:Tab("Autobuy")
local Egg = win:Tab("Eggs")
local Credit = win:Tab("Credits")

Farm:Toggle("Auto Click", function(Val)
	Click = Val
end)
Farm:Toggle("Auto Rebirth", function(Val)
	Rebirth = Val
end)
Farm:Slider("Rebirth Amount", 0, 30, 0, function(Value) -- This was just easier for me than finding stuff for tables
	AmountRebirth = Value
end) 
Farm:Toggle("Claim Normal Chest", function(Val)
	Normal = Val
end)
Farm:Toggle("Claim Group Chest", function(Val)
	Group = Val
end)


Buy:Toggle("Taps Upgrade", function(Val)
	Tap = Val
end)
Buy:Toggle("Speed Upgrade", function(Val)
	Speed = Val
end)
Buy:Toggle("Yen Upgrade", function(Val)
	Yen = Val
end)
Buy:Toggle("Hatch Speed Upgrade", function(Val)
	HatchSpeed = Val
end)
Buy:Toggle("Luck Upgrade", function(Val)
	Luck = Val
end)
Buy:Toggle("Vault Upgrade", function(Val)
	Vault = Val
end)



spawn(function()
	while true do wait(1)
		if Tap then
			game:GetService("ReplicatedStorage").Remotes.Events.RequestUpgrade:FireServer("Taps")
		elseif Speed then
			game:GetService("ReplicatedStorage").Remotes.Events.RequestUpgrade:FireServer("Speed")
		elseif Yen then
			game:GetService("ReplicatedStorage").Remotes.Events.RequestUpgrade:FireServer("Yen")
		elseif HatchSpeed then
			game:GetService("ReplicatedStorage").Remotes.Events.RequestUpgrade:FireServer("Hatch Speed")
		elseif Vault then
			game:GetService("ReplicatedStorage").Remotes.Events.RequestUpgrade:FireServer("Vault")
	end
end
end)
spawn(function()
	while true do wait(0)
		if Click then 
			game:GetService("ReplicatedStorage").Remotes.Events.Tap:FireServer()
		end
	end
end)
spawn(function()
	while true do wait(0.9)
		if Rebirth then
			game:GetService("ReplicatedStorage").Remotes.Events.Rebirth:FireServer(AmountRebirth)
		end
	end
end)
spawn(function()
	while true do wait(1)
		if Normal then
			game:GetService("ReplicatedStorage").Remotes.Events.ClaimChest:FireServer("GroupChest")
		end
	end
end)
spawn(function()
	while true do wait(2)
		if Group then
			game:GetService("ReplicatedStorage").Remotes.Events.ClaimChest:FireServer("GroupChest")
		end
	end
end)
Egg:Toggle("Hatch Egg", function(Val)
	if Val == true then
		while true do wait(0.2)
			local ohString1 = _G.MobChosen
			local ohNumber2 = 1
			local ohBoolean3 = true

			game:GetService("ReplicatedStorage").Remotes.Events.PurchaseEgg:FireServer(ohString1, ohNumber2, ohBoolean3)
	end
	elseif Val == false then
			local ohString1 = _G.MobChosen
			local ohNumber2 = 1
			local ohBoolean3 = false

			game:GetService("ReplicatedStorage").Remotes.Events.PurchaseEgg:FireServer(ohString1, ohNumber2, ohBoolean3)
end
end)
		

Egg:Dropdown("Choose Egg", table1, function(ChooseEgg)
	_G.MobChosen = ChooseEgg
end)
Egg:Toggle("Equip Best", function(Val)
	if Val == true then
		while wait() do
			local ohBoolean1 = true
		game:GetService("ReplicatedStorage").Remotes.Events.EquipBest:FireServer(ohBoolean1)
	end
	elseif Val == false then
		local ohBoolean1 = false
		game:GetService("ReplicatedStorage").Remotes.Events.EquipBest:FireServer(ohBoolean1)
	end
end)
Egg:Toggle("Auto Craft", function(Val)
	if Val == true then
		while wait() do
			local ohBoolean1 = true
			game:GetService("ReplicatedStorage").Remotes.Events.CraftAll:FireServer(ohBoolean1)
	end
	elseif Val == false then
		local ohBoolean1 = false
		game:GetService("ReplicatedStorage").Remotes.Events.CraftAll:FireServer(ohBoolean1)
end
end)

Credit:Label("Scripting By RyanRenolds#3857")
Credit:Button("Discord Copy Link", function()
	setclipboard("https://discord.gg/CxQMfJjn")
end)
