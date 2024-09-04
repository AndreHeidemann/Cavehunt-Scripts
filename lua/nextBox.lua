-- Game.talk("bora", 1)

local function sendHotkey(combination)
    local success, modifiers, key = HotkeyManager.parseKeyCombination(combination)
    if success then
        Client.sendHotkey(key, modifiers)
    else
        print("Erro ao interpretar a combinação de teclas:", combination)
    end
end

sendHotkey("F11")
