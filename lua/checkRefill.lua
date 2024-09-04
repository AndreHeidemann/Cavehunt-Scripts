-- Função para verificar a quantidade de itens e capacidade
function checkItemsAndCapacity(refillItems, MinCapacityConfig, labelToGo)
    labelToGo = labelToGo or "Hunt"
    local needsRefill = false
    local cap = Player.getCapacity()

    if cap < MinCapacityConfig * 100 then
        needsRefill = true
    else
        for _, item in ipairs(refillItems) do
            local itemCount = Game.getItemCount(item.id)
            if itemCount < item.minQuantity and item.check == true then
                needsRefill = true
                break
            end
        end
    end

    if needsRefill then
        CaveBot.GoTo('LeaveHunt')
        Client.showMessage("Saindo da hunt para refillar.")
        wait(200)
    else
        CaveBot.GoTo(labelToGo)
        Client.showMessage("Supply suficiente para continuar hunt.")
        wait(200)
    end
end

-- Chamada da função
-- checkItemsAndCapacity(refillItems,MinCapacityConfig)
