local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "bluehacks",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "bluehacks",
    LoadingSubtitle = "by anti_cheat95",
    Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
 
    Discord = {
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "BLUEhacks",
       Subtitle = "Key System",
       Note = "get the key on discord", -- Use this to tell the user how to get a key
       FileName = "key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"b5tzutblu2sfhh429ddfrgww_key"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local Tab = Window:CreateTab("main", 4483362458) -- Title, Image

 Rayfield:Notify({
    Title = "bluehacks",
    Content = "still in progress",
    Duration = 6.5,
    Image = 4483362458,
 })

 local ColorPicker = Tab:CreateColorPicker({
    Name = "Color Picker",
    Color = Color3.fromRGB(255,255,255),
    Flag = "ColorPicker1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        -- The function that takes place every time the color picker is moved/changed
        -- The variable (Value) is a Color3fromRGB value based on which color is selected
    end
})

local Slider = Tab:CreateSlider({
    Name = "walk speed",
    Range = {0, 100},
    Increment = 10,
    Suffix = "aimbot",
    CurrentValue = 10,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(s)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    -- The function that takes place when the slider changes
    -- The variable (Value) is a number which correlates to the value the slider is currently at
    end,
 })

 local Keybind = Tab:CreateKeybind({
    Name = "Keybind",
    CurrentKeybind = "Q",
    HoldToInteract = false,
    Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Keybind)
    -- The function that takes place when the keybind is pressed
    -- The variable (Keybind) is a boolean for whether the keybind is being held or not (HoldToInteract needs to be true)
    end,
 })

Section = Information:CreateSection("Auto Farm")
local Paragraph = Information:CreateParagraph({Title = "Information", Content = "let me know if you've ever seen an auto farm more powerful than this one in terms of gold per hour, you can use a webhook to follow the auto farm stats when you're not in front of your screen.\n\n - With no boost: 20K/hour\n - With x1.25: 25K/hour\n - With x2: 40K/hour\n - With Both: 50k/hour"})
Section = Information:CreateSection("Image Loader")
local Paragraph = Information:CreateParagraph({Title = "Requirement", Content = "Paste the image URL in the textbox and let the server convert the image, the server can't access certain images (it's not a coding problem) OR you can convert the image yourself: (more images are supported) Images are created from files that contain special data (RGB), to have these files or to create your own files from an image that you have chosen you must join the discord, you need an external script (open source) that converts the image into a file suitable for this script to be used, a tutorial is in the Discord Server.\n\n - Build Speed: You can choose the speed at which the image is built. If you have a slow internet connection, set the speed to low. Do not set it to max for large images\n\n- Preview: Displays a preview of the image, making it easier to use modifiers or to see how the image will look. It is also required to build the image.\n\n- Change Speed: Stop the current process by opening your inventory and checking if no more blocks are being placed. Change the speed and press 'Load Image' again. It should automatically resume from where it stopped.\n\n- Optimize Mode: Allows even the weakest PCs or those without a good connection to load images."})
local Button = Information:CreateButton({
    Name = "copy the list of working sites",
    Callback = function()
        setclipboard("https://www.pythonanywhere.com/whitelist/")
        Rayfield:Notify({
            Title = "Copied!",
            Content = "past the link in your browser to see which sites work",
            Duration = 6.5,
            Image = 124144713366592,
         })
    end,
 })
Section = Information:CreateSection("Auto Build")
local Paragraph = Information:CreateParagraph({Title = "Information - [AUTO BUILD IS IN WORK IN PROGRESS]", Content = "this feature does not require any external requirement, if you save a build with a name that already existed, it will overwrite it. You can download and shares files in the Discord Server.\n\n - Safe Mode: prevents crashes during loading if you have a poor internet connection, this toggle slows down build speed.\n\n - Preview: displays a preview of the build."})

local player = game.Players.LocalPlayer
local Nplayer = game.Players.LocalPlayer.Name

local characterConnection
local connection

local function enableAntiAFK()
    if not connection then
        Rayfield:Notify({
            Title = "Anti-Afk | ON",
            Content = "you won't get kicked after 20 minutes of inactivity",
            Duration = 6.5,
            Image = 124144713366592,
         })
        connection = player.Idled:Connect(function()
            if getgenv().afk6464 then
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end
        end)
    end
end

local function disableAntiAFK()
    if connection then
        connection:Disconnect()
        connection = nil
        Rayfield:Notify({
            Title = "Anti-Afk | OFF",
            Content = "you will be kicked after 20 minutes of inactivity",
            Duration = 6.5,
            Image = 124144713366592,
         })
    end
end

local function loop()
    while true do
        if getgenv().afk6464 then
            enableAntiAFK()
        else
            disableAntiAFK()
        end
        wait(1)
    end
end

spawn(loop)

Section = Global:CreateSection("Utilities")
local AFKToggle = Global:CreateToggle({
    Name = "Anti-Afk",
    CurrentValue = false,
    Flag = "",
    Callback = function(Value)
        getgenv().afk6464 = Value
    end,
})

if getgenv().afk6464 == true then
    AFKToggle:Set(true)
end

local Button = Global:CreateButton({
    Name = "Load Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
})



