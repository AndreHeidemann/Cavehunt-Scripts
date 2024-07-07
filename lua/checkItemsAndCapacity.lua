-- -- Configurações
-- local MinCapacityConfig = 1200 -- Quantidade mínima de CAP para continuar a hunt

-- -- Lista de itens para verificar
-- refillItems = {
--     {id = 3161, minQuantity = 200, name = "Avalanche Rune"},
--     {id = 23373, minQuantity = 100, name = "Ultimate Mana Potion"},
--     {id = 23374, minQuantity = 350, name = "Ultimate Spirit Potion"},
--     {id = 238, minQuantity = 250, name = "Great Mana Potion"},
--     {id = 35901, minQuantity = 650, name = "Diamond Arrow"},
--     -- Adicione mais itens aqui conforme necessário
-- }

function showMessage(message)
    print(message)
    Client.showMessage(message)
end

-- Função para verificar a quantidade de itens e capacidade
function checkItemsAndCapacity(refillItems,MinCapacityConfig)
    local needsRefill = false
    local cap = Player.getCapacity()
    
    if cap < MinCapacityConfig * 100 then
        needsRefill = true
    else
        for _, item in ipairs(refillItems) do
            local itemCount = Game.getItemCount(item.id)
            if itemCount < item.minQuantity then
                needsRefill = true
                break
            end
        end
    end
    
    if needsRefill then
        CaveBot.GoTo('LeaveHunt')
        showMessage("Saindo da hunt para refillar.")
    else
        CaveBot.GoTo('Hunt')
        showMessage("Supply suficiente para continuar hunt.")
    end
end

-- Chamada da função
-- checkItemsAndCapacity(refillItems,MinCapacityConfig)


