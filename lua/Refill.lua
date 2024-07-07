-- Defina os nomes e quantidades dos itens
-- local itemsToBuy = {
--     -- Poções de vida
--   {id = 23375, name = "Supreme Health Potion", amount = 0},
--   {id = 7643, name = "Ultimate Health Potion", amount = 0},
--   {id = 239, name = "Great Health Potion", amount = 0},
--   {id = 236, name = "Strong Health Potion", amount = 0},
--   -- Poções de mana
--   {id = 23373, name = "Ultimate Mana Potion", amount = 0},
--   {id = 238, name = "Great Mana Potions", amount = 0},
--   {id = 237, name = "Strong Mana Potions", amount = 0},
--   -- Poções de espírito
--   {id = 23374, name = "Ultimate Spirit Potions", amount = 1000},
--   {id = 7642, name = "Great Spirit Potions", amount = 0},
--   -- Runas
--   {id = 3191, name = "Great Fireball Rune", amount = 0},
--   {id = 3161, name = "Avalanche Rune", amount = 1100},
--   {id = 3202, name = "ThunderStorm Rune", amount = 0},
--   {id = 3160, name = "Ultimate Healing Rune", amount = 0},
--   {id = 3155, name = "Sudden Death Rune", amount = 0},
-- }
-- Função para exibir mensagens
function showMessage(message)
    print(message)
    Client.showMessage(message)
end

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
            showMessage("Compradas: " .. neededCount .. " " .. item.name ..
                            " (ID " .. item.id .. ")")
        else
            showMessage(
                "Erro ao comprar: " .. neededCount .. " " .. item.name ..
                    " (ID " .. item.id .. ")")
            return -- Retorna para evitar a mensagem "Compra de suprimentos concluída"
        end
    else
        showMessage("Quantidade suficiente de " .. item.name .. " (ID " ..
                        item.id .. ")")
    end
end

-- Função principal que executa a compra de itens
function buySuppliesIntern(itemsToBuy)
    showMessage("Iniciando compra de suprimentos.")
    for _, item in ipairs(itemsToBuy) do buyItems(item) end
    -- Mensagem de conclusão
    showMessage("Compra de suprimentos concluída.")
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
        showMessage("Precisa comprar supply.")
        return true
    else
        showMessage("Supply refillado.")
        return false
    end
end

-- Função que verifica e compra supply em loop com delay de 2 segundos
function buySupplies(itemsToBuy)
    while checkSuppliesBought(itemsToBuy) do
        buySuppliesIntern(itemsToBuy)
        wait(2000) -- Atraso de 2 segundos
    end
    showMessage("Supply suficiente, parando compras.")
end

-- Execute a função principal para compra de suprimentos ao carregar o script
-- buySupplies()
