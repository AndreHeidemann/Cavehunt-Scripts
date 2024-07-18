local function sendHotkey(combination)
    local success, modifiers, key = HotkeyManager.parseKeyCombination(combination)
    if success then
        clientSendHotkey(key, modifiers)
    end
end
function deliveryDust(settings)
    if settings.forgeIncreaseLimit then 
        while Player.getDusts() > Player.getDustsMaximum() - 75 do
            Game.forgeIncreaseLimit()
            wait(1000)    
        end    
    end
    if settings.forgeConvertDust then     
        while Player.getDusts() >= 60 do
            Game.forgeConvertDust()
            wait(1000) 
        end    
    end
    if settings.forgeConvertSlivers then 
        while Game.getItemCount(37109) >= 50 do
            Game.forgeConvertSlivers()
            wait(1000)    
        end    
    end
    sendHotkey("escape")
end