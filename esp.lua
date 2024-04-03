local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
	Name = "Sun Hub",
	LoadingTitle = "Universal Scripts",
	LoadingSubtitle = "by Kotori and Majora",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = nil,
		FileName = "Sun Hub"
	},
	Discord = {
		Enabled = false,
		Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
		RememberJoins = true -- Set this to false to make them join the discord every time they load it up
	},
	KeySystem = true, -- Set this to true to use our key system
	KeySettings = {
		Title = "Key | Sun Hub",
		Subtitle = "Key System",
		Note = "Key In Link",
		FileName = "SunHub", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
		SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = {"https://pastebin.com/raw/EpE43JLu"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
	}
})

Rayfield:Notify({
	Title = "Succesfully Injected",
	Content = "Thank you for using Sun Hub",
	Duration = 6.5,
	Image = 4483362458,
	Actions = { -- Notification Buttons
		Ignore = {
			Name = "Okay",
			Callback = function()
				print("The user tapped Okay!")
			end
		},
	},
})

local ESPTab = Window:CreateTab("ESP", 4483362458) -- Title, Image


local function ESPMAIN()
	local holder = game.CoreGui:FindFirstChild("ESPHolder") or Instance.new("Folder")
	if enabled == false then
		holder:Destroy()
	end

	if holder.Name == "Folder" then
		holder.Name = "ESPHolder"
		holder.Parent = game.CoreGui
	end

	if uselocalplayer == false and holder:FindFirstChild(game.Players.LocalPlayer.Name) then
		holder:FindFirstChild(game.Players.LocalPlayer.Name):Destroy()
	end

	if getgenv().enabled == true then 
		getgenv().enabled = false
		getgenv().enabled = true
	end
	while getgenv().enabled do
		task.wait()
		for _,v in pairs(game.Players:GetChildren()) do
			local chr = v.Character
			if chr ~= nil then
				local esp = holder:FindFirstChild(v.Name) or Instance.new("Highlight")
				esp.Name = v.Name
				if uselocalplayer == false and esp.Name == game.Players.LocalPlayer.Name then
				else
					esp.Parent = holder
					if filluseteamcolor then
						esp.FillColor = v.TeamColor.Color
					else
						esp.FillColor = fillcolor 
					end
					if outlineuseteamcolor then
						esp.OutlineColor = v.TeamColor.Color
					else
						esp.OutlineColor = outlinecolor    
					end
					esp.FillTransparency = filltrans
					esp.OutlineTransparency = outlinetrans
					esp.Adornee = chr
					esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				end
			end
		end
	end
end






	local ESPToggle = ESPTab:CreateToggle({
		Name = "Toggle ESP",
		CurrentValue = false,
		Flag = "Toggle1",
		Callback = function(Value)
			getgenv().enabled = Value
			loadstring(game:HttpGet("https://raw.githubusercontent.com/zntly/highlight-esp/main/esp.lua"))()
		end,

	})

	local TeamESPToggle = ESPTab:CreateToggle({
		Name = "Toggle Team Color ESP",
		CurrentValue = false,
		Flag = "Toggle1",
		Callback = function(Value)
			getgenv().filluseteamcolor = Value
		end,
	})

	local outlineCololorESPToggle = ESPTab:CreateToggle({
		Name = "Toggle OutlineTeamColor ESP",
		CurrentValue = false,
		Flag = "Toggle1",
		Callback = function(Value)
			getgenv().outlineuseteamcolor = Value
		end,
	})

	local ColorPicker = ESPTab:CreateColorPicker({
		Name = "FillColor ESP",
		Color = Color3.fromRGB(255,255,255),
		Flag = "ColorPicker1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = function(Value)
			getgenv.fillcolor = Color3.new(Value)
			print(Value)
		end
	})

	local ColorPicker2 = ESPTab:CreateColorPicker({
		Name = "Outlinecolor ESP",
		Color = Color3.fromRGB(255,255,255),
		Flag = "ColorPicker1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = function(Value)
			getgenv.outlinecolor = Color3.fromRGB(Value)
		end
	})

	local Slider1 = ESPTab:CreateSlider({
		Name = "Fill Transparancy",
		Range = {0, 1},
		Increment = 0.01,
		Suffix = "",
		CurrentValue = 0,
		Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = function(Value)
			getgenv().filltrans = Value
		end,
	})

	local Slider2 = ESPTab:CreateSlider({
		Name = "Outline Transparancy",
		Range = {0, 1},
		Increment = 0.01,
		Suffix = "",
		CurrentValue = 0.5,
		Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = function(Value)
			getgenv().outlinetrans = Value
		end,
	})

