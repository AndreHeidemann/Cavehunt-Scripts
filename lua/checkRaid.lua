local scriptsDirectory = Engine.getScriptsDirectory()
local currentFilePath = debug.getinfo(1).source
local currentFileName = currentFilePath:match("([^/]+)$")

function checkRaid(authorName, authorLevel, messageType, x, y, z, text) 
    if(messageType==36 and x==34011 and y==31049 and z==9) then        
        if(tonumber(text)<=10) then
            Engine.enableCaveBot(true)
            CaveBot.GoTo("LeaveRaid")
            Engine.unloadScript(currentFileName)            
        end
    end
end
if currentFilePath:match("Scripts/") then    
    Game.registerEvent(Game.Events.TALK, checkRaid)
else
    -- We need to copy the current file to the scriptsDirectory and execute it
    local currentFile = io.open(scriptsDirectory:match("(.*)/") ..
                                    "/Cavehunt-Scripts/" .. currentFilePath, "r")

    if currentFile == nil then
        print("Error: Could not open file " .. currentFilePath)
        return
    end

    -- Read the contents of the file
    local fileContents = currentFile:read("*a")

    -- Close the file
    currentFile:close()

    -- Now write it to the scripts directory

    local newFile = io.open(scriptsDirectory .. "/" .. currentFileName, "w")

    if newFile == nil then
        print("Error: Could not open file " .. currentFileName)
        return
    end

    newFile:write(fileContents)

    newFile:close()

    Engine.unloadScript(currentFileName)

    wait(1000)

    Engine.loadScript(currentFileName)
end