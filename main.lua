print("Esp working")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local targetNames = {
	["JokiTablet"] = true,
	["7xc_ls"] = true,
	["LD1SWAY"] = true,
	["RLOA_i"] = true,
	["Aimbot36022"] = true,
	["ajdin8405"] = true,
	["Makalyxz"] = true
}

local function colorCharacter(character)
	for _, part in ipairs(character:GetChildren()) do
		if part:IsA("BasePart") then
			part.Color = Color3.fromRGB(128, 0, 128)
		end
	end

	if not character:FindFirstChild("FriendHighlight") then
		local highlight = Instance.new("Highlight")
		highlight.Name = "FriendHighlight"
		highlight.FillColor = Color3.fromRGB(170, 0, 255)
		highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
		highlight.FillTransparency = 0.5
		highlight.OutlineTransparency = 0
		highlight.Parent = character
	end

	if not character:FindFirstChild("NovaLabel") then
		local head = character:FindFirstChild("Head")
		if head then
			local billboard = Instance.new("BillboardGui")
			billboard.Name = "NovaLabel"
			billboard.Size = UDim2.new(0, 100, 0, 20)
			billboard.StudsOffset = Vector3.new(0, 2.5, 0)
			billboard.AlwaysOnTop = true
			billboard.Parent = head

			local text = Instance.new("TextLabel")
			text.Size = UDim2.new(1, 0, 1, 0)
			text.BackgroundTransparency = 1
			text.Text = "Nova Buyer"
			text.TextColor3 = Color3.fromRGB(255, 0, 255)
			text.TextStrokeTransparency = 0
			text.TextScaled = true
			text.Font = Enum.Font.GothamBold
			text.Parent = billboard
		end
	end
end

local function tryColorTarget(player)
	if not targetNames[player.Name] then return end
	player.CharacterAdded:Connect(colorCharacter)
	if player.Character then
		colorCharacter(player.Character)
	end
end

for _, player in ipairs(Players:GetPlayers()) do
	if player ~= LocalPlayer then
		tryColorTarget(player)
	end
end

Players.PlayerAdded:Connect(function(player)
	if player ~= LocalPlayer then
		tryColorTarget(player)
	end
end)

RunService.Heartbeat:Connect(function()
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and targetNames[player.Name] then
			local char = player.Character
			if char and (not char:FindFirstChild("FriendHighlight") or not char:FindFirstChild("NovaLabel")) then
				colorCharacter(char)
				break
			end
		end
	end
end)
