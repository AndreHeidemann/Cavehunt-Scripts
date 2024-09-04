local scriptsDirectory = Engine.getScriptsDirectory()
local currentFilePath = debug.getinfo(1).source
local currentFileName = currentFilePath:match("([^/]+)$")
local balance = nil

local bankNames = {
    "Atur",
    "Ebenizer",
    "Eighty",
    "Eva",
    "Ferks",
    "Finarfin",
    "Gnomillion",
    "Jefrey",
    "Jessica",
    "Kaya",
    "Kepar",
    "Lokur",
    "Murim",
    "Muzir",
    "Naji",
    "Paulie",
    "Plunderpurse",
    "Raffael",
    "Rokyn",
    "Siestaar",
    "Sissek",
    "Suzy",
    "Tesha",
    "Virgil",
    "Wentworth",
    "Znozel"
}
local makers = {
<<<<<<< HEAD
    -- { maker = "Keriel",        main = "Non Pvp Hell",  minAmount = 500000 },  --exilium
    -- { maker = "Simps Simples", main = "Non Pvp Hell",  minAmount = 2000000 }, --exilium
    -- { maker = "Father Hbstnk", main = "Non Pvp Again", minAmount = 2000000 }, --Arcadian
    -- { maker = "Pfcity",        main = "Non Pvp Again", minAmount = 2000000 }, --Arcadian
    -- { maker = "Arthion",       main = "Non Pvp Again", minAmount = 2000000 }, --Arcadian
    -- { maker = "Dvneta",        main = "Non Pvp Again", minAmount = 2000000 }, --Arcadian
    -- { maker = "Dread Reaper",  main = "Non Pvp Again", minAmount = 2000000 }, --Arcadian
    -- { maker = "Graund",        main = "Non Pvp Again", minAmount = 2000000 }  --Arcadian
=======
    { maker = "Keriel",        main = "Non Pvp Hell",  minAmount = 500000 },  --exilium
    { maker = "Simps Simples", main = "Non Pvp Hell",  minAmount = 2000000 }, --exilium
    { maker = "Father Hbstnk", main = "Non Pvp Again", minAmount = 2000000 }, --Arcadian
    { maker = "Pfcity",        main = "Non Pvp Again", minAmount = 2000000 }, --Arcadian
    { maker = "Arthion",       main = "Non Pvp Again", minAmount = 2000000 }, --Arcadian
    { maker = "Dvneta",        main = "Non Pvp Again", minAmount = 2000000 }, --Arcadian
    { maker = "Dread Reaper",  main = "Non Pvp Again", minAmount = 2000000 }, --Arcadian
    { maker = "Graund",        main = "Non Pvp Again", minAmount = 2000000 }  --Arcadian
>>>>>>> 28dbaa24eb0f7d8ba284ec42cb14dabf72b42081

}

local function getMainForPlayer(playerName)
    for _, record in ipairs(makers) do
        if string.lower(playerName) == string.lower(record.maker) then
            return string.lower(record.main)
        end
    end
    return nil -- Retorna nil se não encontrar uma correspondência
end

local function getMinBalanceAmountForMaker(playerName)
    for _, record in ipairs(makers) do
        if string.lower(playerName) == string.lower(record.maker) then
            return record.minAmount
        end
    end
    return nil -- Retorna nil se não encontrar uma correspondência
end

local function isNameInTable(name, table)
    for _, value in ipairs(table) do
        if value == name then
            return true
        end
    end
    return false
end

local function sayBalance()
    Game.talk("hi", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
    wait(1000) -- Aguarda 1 segundo
    Game.talk("balance", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
    wait(1000) -- Aguarda 1 segundo
end

-- Função de verificação da mensagem de texto
local function checkBalance(authorName, authorLevel, messageType, x, y, z, text)
    if (string.match(text, "balance is (%d+) gold.")) then
        if isNameInTable(authorName, bankNames) then
            -- Verifica se a mensagem contém o saldo da conta
            local tempBalance = string.match(text, "balance is (%d+) gold.")
            local tempBalance = tonumber(tempBalance)
            balance = tempBalance
            local charName = Player.getName()
            local limite_minimo = getMinBalanceAmountForMaker(charName)
            -- Verifique se o saldo menos o valor a ser enviado é menor que o limite mínimo
            local valorEnviar = balance - limite_minimo
            if valorEnviar <= 0 then
                valorEnviar = 0
            end

            if balance then
                if valorEnviar > 0 then
                    Game.talk("transfer", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
                    wait(2000) -- Aguarda 1 segundo
                    Game.talk(valorEnviar, Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
                    wait(2000) -- Aguarda 1 segundo
                    Game.talk(getMainForPlayer(charName), Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
                    wait(2000) -- Aguarda 1 segundo
                    Game.talk("yes", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
                    wait(2000) -- Aguarda 1 segundo
                end
            end
        end
    end
    CaveBot.selectWaypoint(CaveBot.getSelectedWaypointId() + 1)
    Engine.enableCaveBot(true)
    wait(5000)
    Engine.unloadScript(currentFileName)
end

-- Check if the current file starts with Scripts/
if currentFilePath:match("Scripts/") then
    if (getMainForPlayer(Player.getName()) ~= nil) then
        Game.registerEvent(Game.Events.TALK, checkBalance)
        sayBalance()
    else
        CaveBot.selectWaypoint(CaveBot.getSelectedWaypointId() + 1)
        Engine.enableCaveBot(true)
        Engine.unloadScript(currentFileName)
    end
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
    Engine.enableCaveBot(false)
end
