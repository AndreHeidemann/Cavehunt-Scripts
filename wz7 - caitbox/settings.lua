local settings = {}
-- Supply a comprar
settings.itemsToBuy = {
    -- Poções de vida
    {id = 23375, name = "Supreme Health Potion", amount = 0},
    {id = 7643, name = "Ultimate Health Potion", amount = 0},
    {id = 239, name = "Great Health Potion", amount = 0},
    {id = 236, name = "Strong Health Potion", amount = 0}, -- Poções de mana
    {id = 23373, name = "Ultimate Mana Potion", amount = 250},
    {id = 238, name = "Great Mana Potions", amount = 0},
    {id = 237, name = "Strong Mana Potions", amount = 0},

    -- Poções de espírito
    {id = 23374, name = "Ultimate Spirit Potions", amount = 0},
    {id = 7642, name = "Great Spirit Potions", amount = 0}, -- Runas
    {id = 3191, name = "Great Fireball Rune", amount = 0},
    {id = 3161, name = "Avalanche Rune", amount = 700},
    {id = 3202, name = "ThunderStorm Rune", amount = 0},
    {id = 3160, name = "Ultimate Healing Rune", amount = 0},
    {id = 3155, name = "Sudden Death Rune", amount = 100}
}

-- Check to refill
settings.MinCapacityConfig = 1200 -- Quantidade mínima de CAP para continuar a hunt

-- Lista de itens para verificar
settings.refillItems = {
    {id = 3161, minQuantity = 200, name = "Avalanche Rune"},
    {id = 23373, minQuantity = 100, name = "Ultimate Mana Potion"}
    -- Adicione mais itens aqui conforme necessário
}

-- Configuração do caitbox
settings.caitBox = {
    enabled = true,
    maxAreaDistance = 8, -- Distância máxima para contar os monstros
    monsterCountToContinue = 5, -- Quantidade de monstros minima para continuar para o proximo waypoint
    ignoreMonsters = {} -- Lista de monstros para ignorar
}

return settings
