function enchantItems()
    -- Remover amuleto
    inventoryMoveItemToContainer(Enums.InventorySlot.CONST_SLOT_NECKLACE, 1,
                                 Player.getContainers()[1], 0)
    wait(200)
    -- Remover anel
    inventoryMoveItemToContainer(Enums.InventorySlot.CONST_SLOT_RING, 1,
                                 Player.getContainers()[1], 0)
    wait(200)
    Client.showMessage("Iniciando verificação para enchantItems")
    local items = {
        {id = 30401, name = "theurgic amulet", silver = 2},
        {id = 39182, name = "alicorn ring", silver = 4},
        {id = 39235, name = "turtle amulet", silver = 2},
        {id = 39179, name = "charged spiritthorn ring", silver = 4},
        {id = 39188, name = "arboreal ring", silver = 4},
        {id = 39185, name = "arcanomancer sigil", silver = 4},
        {id = 29429, name = "pendulet", silver = 2},
        {id = 29428, name = "sleep shawl", silver = 2}
    }
    for _, item in ipairs(items) do
        -- para cada registro de itens encantáveis 
        local count = Game.getItemCount(item.id)
        -- verifica se existe o item encantável na bp    
        while count ~= 0 do
            Client.showMessage(string.format(
                                   "ID: %d, Name: %s, Silver: %d, Count: %d",
                                   item.id, item.name, item.silver, count))
            -- verifica se existe silver suficiente para recarregar o item:
            -- ID do Silver: 22516
            -- local silverCount = Game.getItemCount(22516)            
            if Game.getItemCount(22516) >= item.silver then
                Client.showMessage("Quantidade de Silver Tokens: " ..
                                       Game.getItemCount(22516) ..
                                       "\nRefillando o " .. item.name)
                Game.talk("Hi", 12)
                wait(350)
                Game.talk("enchant", 12)
                wait(350)
                Game.talk(item.name, 12)
                wait(350)
                Game.talk("yes", 12)
                wait(350)
                Game.talk("bye", 12)
                wait(1000)
            else
                Client.showMessage("Quantidade de Silver Tokens: " ..
                                       Game.getItemCount(22516) ..
                                       "\nNão possui Silver Tokens suficiente para refillar " ..
                                       item.name)
                break
            end
            count = Game.getItemCount(item.id)
        end
    end
    Client.showMessage("Finalizando enchantItems")
end
enchantItems()
