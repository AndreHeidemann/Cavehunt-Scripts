-- Função para abrir a janela de negociação com o NPC
function openTradeWindow()
    Game.talk("hi", 12) -- Fala com o NPC para abrir a janela de negociação
    wait(1000) -- Aguarda um tempo para a janela abrir
    Game.talk("trade", 12) -- Abre a janela de negociação
    wait(3000) -- Aguarda um tempo para a janela abrir
end

-- Função para comprar itens
function buyItems(item)
    local currentCount = Game.getItemCount(item.id)
    local neededCount = item.amount - currentCount

    if neededCount > 0 then
        openTradeWindow()
        local success = Npc.buy(item.id, neededCount, false, false) -- Utiliza Shopping Bag para a compra
        if success then
            Client.showMessage("Compradas: " .. neededCount .. " " .. item.name ..
                            " (ID " .. item.id .. ")")
        else
            Client.showMessage(
                "Erro ao comprar: " .. neededCount .. " " .. item.name ..
                    " (ID " .. item.id .. ")")
            return -- Retorna para evitar a mensagem "Compra de suprimentos concluída"
        end
    else
        Client.showMessage("Quantidade suficiente de " .. item.name .. " (ID " ..
                        item.id .. ")")
    end
end

-- Função principal que executa a compra de itens
function buySuppliesIntern(itemsToBuy)
    Client.showMessage("Iniciando compra de suprimentos.")
    for _, item in ipairs(itemsToBuy) do buyItems(item) end
    -- Mensagem de conclusão
    Client.showMessage("Compra de suprimentos concluída.")
end

-- Verifica se supply foi comprado
function checkSuppliesBought(itemsToBuy)
    local needsRefill = false
    for _, item in ipairs(itemsToBuy) do
        local itemCount = Game.getItemCount(item.id)
        if itemCount < item.amount then
            needsRefill = true
            break
        end
    end
    if needsRefill then
        Client.showMessage("Precisa comprar supply.")
        return true
    else
        Client.showMessage("Supply refillado.")
        return false
    end
end

-- Função que verifica e compra supply em loop com delay de 2 segundos
function buySupplies(itemsToBuy)
    while checkSuppliesBought(itemsToBuy) do
        buySuppliesIntern(itemsToBuy)
        wait(2000) -- Atraso de 2 segundos
    end
    Client.showMessage("Supply suficiente, parando compras.")
end

-- Execute a função principal para compra de suprimentos ao carregar o script
-- buySupplies()