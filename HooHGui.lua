local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local GOLD = Color3.fromRGB(196, 154, 66)
local GOLD_TEXT = Color3.fromRGB(175, 150, 105)

local UPDATE_INTERVAL = 0.1
local SPEED_LIMIT = 32

local gui = Instance.new("ScreenGui")
gui.Name = "HooHGui"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui
local function makeDraggable(panel, handle)
    local dragging = false
    local dragStart
    local startPosition

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPosition = panel.Position
        end
    end)
  UserInputService.InputChanged:Connect(function(input)
        if dragging and (
            input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch
        ) then
            local delta = input.Position - dragStart

            panel.Position = UDim2.new(
                startPosition.X.Scale,
                startPosition.X.Offset + delta.X,
                startPosition.Y.Scale,
                startPosition.Y.Offset + delta.Y
            )
        end
    end)
  UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

local smallPanel = Instance.new("Frame")
smallPanel.Name = "SmallPanel"
smallPanel.Size = UDim2.new(0, 68, 0, 36)
smallPanel.Position = UDim2.new(0, 20, 0.5, -18)
smallPanel.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
smallPanel.BorderSizePixel = 1
smallPanel.BorderColor3 = Color3.fromRGB(0, 0, 0)
smallPanel.Parent = gui

local smallInnerBlack = Instance.new("Frame")
smallInnerBlack.Position = UDim2.new(0, 3, 0, 3)
smallInnerBlack.Size = UDim2.new(1, -6, 1, -6)
smallInnerBlack.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
smallInnerBlack.BorderSizePixel = 1
smallInnerBlack.BorderColor3 = Color3.fromRGB(0, 0, 0)
smallInnerBlack.Parent = smallPanel
local smallStroke = Instance.new("UIStroke")
smallStroke.Color = GOLD
smallStroke.Thickness = 1
smallStroke.Parent = smallInnerBlack

local smallText = Instance.new("TextButton")
smallText.Name = "OpenButton"
smallText.Size = UDim2.new(1, -6, 1, -6)
smallText.Position = UDim2.new(0, 3, 0, 3)
smallText.BackgroundTransparency = 1
smallText.BorderSizePixel = 0
smallText.Text = "HOOHGui"
smallText.TextColor3 = GOLD_TEXT
smallText.Font = Enum.Font.SourceSans
smallText.TextSize = 10
smallText.Parent = smallPanel

local bigPanel = Instance.new("Frame")
bigPanel.Name = "MainPanel"
bigPanel.Size = UDim2.new(0, 420, 0, 280)
bigPanel.Position = UDim2.new(0.5, -210, 0.5, -140)
bigPanel.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
bigPanel.BorderSizePixel = 3
bigPanel.BorderColor3 = Color3.fromRGB(0, 0, 0)
bigPanel.Visible = false
bigPanel.Parent = gui

local outerStroke = Instance.new("UIStroke")
outerStroke.Color = GOLD
outerStroke.Thickness = 1
outerStroke.Parent = bigPanel

local innerFrame = Instance.new("Frame")
innerFrame.Name = "InnerFrame"
innerFrame.Position = UDim2.new(0, 3, 0, 3)
innerFrame.Size = UDim2.new(1, -6, 1, -6)
innerFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
innerFrame.BorderSizePixel = 1
innerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
innerFrame.Parent = bigPanel

local innerStroke = Instance.new("UIStroke")
innerStroke.Color = GOLD
innerStroke.Thickness = 1
innerStroke.Parent = innerFrame
local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 38)
header.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
header.BorderSizePixel = 0
header.Parent = innerFrame

local headerLine = Instance.new("Frame")
headerLine.Size = UDim2.new(1, 0, 0, 1)
headerLine.Position = UDim2.new(0, 0, 1, -1)
headerLine.BackgroundColor3 = GOLD
headerLine.BorderSizePixel = 0
headerLine.Parent = header
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text = "HOOHGui v2"
title.TextColor3 = GOLD_TEXT
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16
title.Parent = header

local content = Instance.new("Frame")
content.Name = "Content"
content.Position = UDim2.new(0, 0, 0, 38)
content.Size = UDim2.new(1, 0, 1, -38)
content.BackgroundTransparency = 1
content.Parent = innerFrame
local verticalLine = Instance.new("Frame")
verticalLine.Size = UDim2.new(0, 1, 1, 0)
verticalLine.Position = UDim2.new(0.5, 0, 0, 0)
verticalLine.BackgroundColor3 = GOLD
verticalLine.BorderSizePixel = 0
verticalLine.Parent = content

local horizontalLine = Instance.new("Frame")
horizontalLine.Size = UDim2.new(1, 0, 0, 1)
horizontalLine.Position = UDim2.new(0, 0, 0, 33)
horizontalLine.BackgroundColor3 = GOLD
horizontalLine.BorderSizePixel = 0
horizontalLine.Parent = content
local left = Instance.new("Frame")
left.Name = "MiscFunctions"
left.Size = UDim2.new(0.5, 0, 1, 0)
left.BackgroundTransparency = 1
left.Parent = content

local leftTitle = Instance.new("TextLabel")
leftTitle.Size = UDim2.new(1, 0, 0, 33)
leftTitle.BackgroundTransparency = 1
leftTitle.Text = "Misc Functions"
leftTitle.TextColor3 = GOLD_TEXT
leftTitle.Font = Enum.Font.SourceSans
leftTitle.TextSize = 14
leftTitle.Parent = left
local right = Instance.new("Frame")
right.Name = "PlayerInfo"
right.Position = UDim2.new(0.5, 1, 0, 0)
right.Size = UDim2.new(0.5, -1, 1, 0)
right.BackgroundTransparency = 1
right.Parent = content

local rightTitle = Instance.new("TextLabel")
rightTitle.Size = UDim2.new(1, 0, 0, 33)
rightTitle.BackgroundTransparency = 1
rightTitle.Text = "Server Players"
rightTitle.TextColor3 = GOLD_TEXT
rightTitle.Font = Enum.Font.SourceSans
rightTitle.TextSize = 14
rightTitle.Parent = right
local playerList = Instance.new("ScrollingFrame")
playerList.Name = "PlayerList"
playerList.Position = UDim2.new(0, 5, 0, 38)
playerList.Size = UDim2.new(1, -10, 1, -43)
playerList.BackgroundTransparency = 1
playerList.BorderSizePixel = 0
playerList.ScrollBarThickness = 4
playerList.ScrollBarImageColor3 = GOLD
playerList.CanvasSize = UDim2.new(0, 0, 0, 0)
playerList.AutomaticCanvasSize = Enum.AutomaticSize.Y
playerList.Parent = right

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 0)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = playerList
local detail = Instance.new("Frame")
detail.Name = "PlayerDetails"
detail.Position = UDim2.new(0, 5, 0, 38)
detail.Size = UDim2.new(1, -10, 1, -43)
detail.BackgroundTransparency = 1
detail.Visible = false
detail.Parent = right

local backButton = Instance.new("TextButton")
backButton.Size = UDim2.new(0, 55, 0, 22)
backButton.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
backButton.BorderSizePixel = 1
backButton.BorderColor3 = GOLD
backButton.Text = "< Back"
backButton.TextColor3 = GOLD_TEXT
backButton.Font = Enum.Font.SourceSans
backButton.TextSize = 12
backButton.Parent = detail
local detailText = Instance.new("TextLabel")
detailText.Position = UDim2.new(0, 0, 0, 28)
detailText.Size = UDim2.new(1, 0, 1, -28)
detailText.BackgroundTransparency = 1
detailText.TextColor3 = GOLD_TEXT
detailText.Font = Enum.Font.SourceSans
detailText.TextSize = 13
detailText.TextXAlignment = Enum.TextXAlignment.Left
detailText.TextYAlignment = Enum.TextYAlignment.Top
detailText.TextWrapped = true
detailText.Parent = detail

local selectedPlayer = nil
local playerRows = {}
local accountDateCache = {}
local movementData = {}
local function getEstimatedDate(target)
    if accountDateCache[target] then
        return accountDateCache[target]
    end

    local timestamp = os.time() - target.AccountAge * 86400
    local dateInfo = os.date("*t", timestamp)

    local dateText = string.format(
        "%d/%d/%d",
        dateInfo.month,
        dateInfo.day,
        dateInfo.year
    )

    accountDateCache[target] = dateText
    return dateText
end

local function getPlayerStatus(target)
    local character = target.Character
    local humanoid = character
        and character:FindFirstChildOfClass("Humanoid")

    if not humanoid then
        return "Waiting", 0, 0, 0, "Unavailable"
    end

    local status = humanoid.Health > 0 and "Alive" or "Dead"
    local jumpValue

    if humanoid.UseJumpPower then
        jumpValue = "JumpPower: " .. humanoid.JumpPower
    else
        jumpValue = "JumpHeight: " .. humanoid.JumpHeight
    end

    return status, humanoid.Health, humanoid.MaxHealth,
        humanoid.WalkSpeed, jumpValue
end
local function updateMovement(target)
    local character = target.Character
    local humanoid = character
        and character:FindFirstChildOfClass("Humanoid")
    local root = character
        and character:FindFirstChild("HumanoidRootPart")

    if not humanoid or not root or humanoid.Health <= 0 then
        movementData[target] = nil
        return 0, 0, 0, "Waiting"
    end

    local now = os.clock()
    local position = root.Position
    local data = movementData[target]

    if not data or data.Character ~= character then
        movementData[target] = {
            Character = character,
            LastPosition = position,
            LastTime = now,
            ActualSpeed = 0,
            VerticalSpeed = 0,
            HeightOffset = 0,
            JumpStartY = position.Y,
            InJump = false
        }
        return 0, 0, 0, "Normal"
    end

    local elapsed = now - data.LastTime
    local actualSpeed = 0
    local verticalSpeed = 0

    if elapsed > 0 then
        local delta = position - data.LastPosition
        actualSpeed = Vector2.new(delta.X, delta.Z).Magnitude / elapsed
        verticalSpeed = delta.Y / elapsed
  end
  local isAirborne = humanoid.FloorMaterial == Enum.Material.Air

    if isAirborne and not data.InJump then
        data.InJump = true
        data.JumpStartY = data.LastPosition.Y
    end

    local heightOffset = 0

    if data.InJump then
        heightOffset = position.Y - data.JumpStartY

        if not isAirborne then
            data.InJump = false
            heightOffset = 0
            verticalSpeed = 0
        end
    else
        verticalSpeed = 0
    end

    data.ActualSpeed = actualSpeed
    data.VerticalSpeed = verticalSpeed
    data.HeightOffset = heightOffset
    data.LastPosition = position
    data.LastTime = now

    local movementStatus = actualSpeed > SPEED_LIMIT
        and "Suspicious" or "Normal"

    return actualSpeed, verticalSpeed, heightOffset, movementStatus
end

local function updateDetails()
    if not selectedPlayer or selectedPlayer.Parent ~= Players then
        return
    end

    local status, health, maxHealth, speed, jumpValue =
        getPlayerStatus(selectedPlayer)

    local data = movementData[selectedPlayer]
    local actualSpeed = data and data.ActualSpeed or 0
    local verticalSpeed = data and data.VerticalSpeed or 0
    local heightOffset = data and data.HeightOffset or 0

    local movementStatus = actualSpeed > SPEED_LIMIT
        and "Suspicious" or "Normal"
  detailText.Text =
        "Username: " .. selectedPlayer.Name ..
        "\nDisplay Name: " .. selectedPlayer.DisplayName ..
        "\nStatus: " .. status ..
        "\nHealth: " .. math.floor(health) ..
        " / " .. math.floor(maxHealth) ..
        "\nWalkSpeed Property: " .. speed ..
        "\n" .. jumpValue ..
        "\nActual Speed: " .. string.format("%.1f", actualSpeed) ..
        " studs/s" ..
        "\nVertical Speed: " .. string.format("%.2f", verticalSpeed) ..
        " studs/s" ..
        "\nHeight Offset: " .. string.format("%.2f", heightOffset) ..
        " studs" ..
        "\nMovement Status: " .. movementStatus ..
        "\nEstimated Created: " .. getEstimatedDate(selectedPlayer)
end

local function showDetails(target)
    selectedPlayer = target
    playerList.Visible = false
    detail.Visible = true
    updateDetails()
end

backButton.MouseButton1Click:Connect(function()
    selectedPlayer = nil
    detail.Visible = false
    playerList.Visible = true
end)

local function addPlayer(target)
    if playerRows[target] then return end

    local row = Instance.new("TextButton")
    row.Name = "Player_" .. target.UserId
    row.Size = UDim2.new(1, 0, 0, 43)
    row.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
    row.BorderSizePixel = 0
    row.Text = ""
    row.Parent = playerList

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Position = UDim2.new(0, 6, 0, 1)
    nameLabel.Size = UDim2.new(1, -12, 0, 18)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = target.Name
    nameLabel.TextColor3 = GOLD_TEXT
    nameLabel.Font = Enum.Font.SourceSans
    nameLabel.TextSize = 13
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.Parent = row

    local viewedLabel = Instance.new("TextLabel")
    viewedLabel.Position = UDim2.new(0, 6, 0, 18)
    viewedLabel.Size = UDim2.new(1, -12, 0, 12)
    viewedLabel.BackgroundTransparency = 1
    viewedLabel.Text = "viewed"
    viewedLabel.TextColor3 = GOLD
    viewedLabel.Font = Enum.Font.SourceSans
    viewedLabel.TextSize = 10
    viewedLabel.TextXAlignment = Enum.TextXAlignment.Left
    viewedLabel.Parent = row

    local statsLabel = Instance.new("TextLabel")
    statsLabel.Position = UDim2.new(0, 6, 0, 30)
    statsLabel.Size = UDim2.new(1, -12, 0, 12)
    statsLabel.BackgroundTransparency = 1
    statsLabel.Text = "Loading..."
    statsLabel.TextColor3 = GOLD_TEXT
    statsLabel.Font = Enum.Font.SourceSans
    statsLabel.TextSize = 9
    statsLabel.TextXAlignment = Enum.TextXAlignment.Left
    statsLabel.Parent = row

    local rowLine = Instance.new("Frame")
    rowLine.Size = UDim2.new(1, 0, 0, 1)
    rowLine.Position = UDim2.new(0, 0, 1, -1)
    rowLine.BackgroundColor3 = GOLD
    rowLine.BorderSizePixel = 0
    rowLine.Parent = row

    playerRows[target] = {
        Row = row,
        StatsLabel = statsLabel
    }

    getEstimatedDate(target)

    row.MouseButton1Click:Connect(function()
        showDetails(target)
    end)
end

local function removePlayer(target)
    local rowData = playerRows[target]

    if rowData then
        rowData.Row:Destroy()
        playerRows[target] = nil
    end

    accountDateCache[target] = nil
    movementData[target] = nil

    if selectedPlayer == target then
        selectedPlayer = nil
        detail.Visible = false
        playerList.Visible = true
    end
end

local function updateAllPlayers()
    for _, target in ipairs(Players:GetPlayers()) do
        local rowData = playerRows[target]
        local actualSpeed = updateMovement(target)

        if rowData then
            local status, health, maxHealth =
                getPlayerStatus(target)

            rowData.StatsLabel.Text = string.format(
                "%s | HP: %d/%d | Actual: %.1f",
                status,
                math.floor(health),
                math.floor(maxHealth),
                actualSpeed
            )
        end
    end

    if selectedPlayer then
        updateDetails()
    end
end

Players.PlayerAdded:Connect(addPlayer)
Players.PlayerRemoving:Connect(removePlayer)

for _, target in ipairs(Players:GetPlayers()) do
    addPlayer(target)
end

task.spawn(function()
    while gui.Parent do
        updateAllPlayers()
        task.wait(UPDATE_INTERVAL)
    end
end)

smallText.MouseButton1Click:Connect(function()
    bigPanel.Visible = not bigPanel.Visible
end)

makeDraggable(bigPanel, header)
