print("Esp working");
local Players = game:GetService("Players")
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
			part.Color = Color3.fromRGB(128, 0, 128) -- Purple
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
end

local function tryColorTarget(player)
	if targetNames[player.Name] then
		player.CharacterAdded:Connect(function(character)
			colorCharacter(character)
		end)
		if player.Character then
			colorCharacter(player.Character)
		end
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
