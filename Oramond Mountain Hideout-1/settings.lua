local settings = {}
-- O que fazer com a dust
-- fazer sliver das dust
settings.forgeConvertDust = false
-- transformar sliver em exalted core
settings.forgeConvertSlivers = true
-- aumentar o limite de dust
settings.forgeIncreaseLimit = true

-- Supply a comprar
settings.itemsToBuy = {
    -- HP
    -- { name = "Supreme Health Potion",  id = 23375, vocation = { "knight" },                                 amount = 200,  type = 'potions' },
    -- { name = "Ultimate Health Potion", id = 7643,  vocation = { "knight" },                                 amount = 500,  type = 'potions' },
    { name = "Great Health Potion",    id = 239,   vocation = { "knight" },                                 amount = 0,    type = 'potions' },
    { name = "Strong Health Potion",   id = 236,   vocation = { "knight", "paladin" },                      amount = 0,    type = 'potions' },
    -- MANA
    { name = "Ultimate Mana Potion",   id = 23373, vocation = { "sorcerer", "druid" },                      amount = 0,    type = 'potions' },
    { name = "Great Mana Potion",      id = 238,   vocation = { "paladin", "sorcerer", "druid" },           amount = 300,  type = 'potions' },
    -- { name = "Strong Mana Potion",     id = 237,   vocation = { "knight", "paladin", "sorcerer", "druid" }, amount = 2000, type = 'potions' },
    -- SPIRIT
    { name = "Ultimate spirit Potion", id = 23374, vocation = { "paladin" },                                amount = 1000, type = 'potions' },
    { name = "Great Spirit Potion",    id = 7642,  vocation = { "paladin" },                                amount = 0,    type = 'potions' },
    -- RUNES
    { name = "Great Fireball Rune",    id = 3191,  vocation = { "knight", "paladin", "sorcerer", "druid" }, amount = 0,    type = 'runes' },
    { name = "Avalanche Rune",         id = 3161,  vocation = { "knight", "paladin", "sorcerer", "druid" }, amount = 0,    type = 'runes' },
    { name = "ThunderStorm Rune",      id = 3202,  vocation = { "knight", "paladin", "sorcerer", "druid" }, amount = 1200, type = 'runes' },
    { name = "Stone Shower Rune",      id = 3175,  vocation = { "paladin", "sorcerer", "druid" },           amount = 0,    type = 'runes' },
    { name = "Ultimate Healing Rune",  id = 3160,  vocation = { "knight", "paladin", "sorcerer", "druid" }, amount = 0,    type = 'runes' },
    { name = "Sudden Death Rune",      id = 3155,  vocation = { "paladin", "sorcerer", "druid" },           amount = 0,    type = 'runes' }
}

-- Quantidade mínima de CAP para continuar a hunt

settings.distanceToBuy = {
    -- DISTANCE
    { name = "Diamond Arrow",     amount = 2400, id = 35901, vocation = { "paladin" }, type = 'distance' },
    { name = "Spectral Bolt",     amount = 0,    id = 35902, vocation = { "paladin" }, type = 'distance' },
    { name = "Crystalline Arrow", amount = 0,    id = 15793, vocation = { "paladin" }, type = 'distance' },
}

-- Check to refill
settings.MinCapacityConfig = 800 -- Quantidade mínima de CAP para continuar a hunt

-- Lista de itens para verificar
settings.refillItems = {
    -- HP
    -- { name = "Supreme Health Potion",  id = 23375, minQuantity = 50,  check = true },
    -- { name = "Ultimate Health Potion", id = 7643,  minQuantity = 100, check = true },
    { name = "Great Health Potion",    id = 239,   minQuantity = 0,   check = false },

    -- MANA
    { name = "Ultimate Mana Potion",   id = 23373, minQuantity = 0,   check = false },
    { name = "Great Mana Potion",      id = 238,   minQuantity = 100, check = true },
    { name = "Strong Mana Potion",     id = 237,   minQuantity = 0,   check = false },
    -- SPIRIT
    { name = "Ultimate spirit Potion", id = 23374, minQuantity = 100, check = true },
    { name = "Great Spirit Potion",    id = 7642,  minQuantity = 0,   check = false },
    -- RUNES
    { name = "Great Fireball Rune",    id = 3191,  minQuantity = 0,   check = false },
    { name = "Avalanche Rune",         id = 3161,  minQuantity = 0,   check = false },
    { name = "ThunderStorm Rune",      id = 3202,  minQuantity = 150, check = true },
    { name = "Stone Shower Rune",      id = 3175,  minQuantity = 0,   check = false },
    { name = "Ultimate Healing Rune",  id = 3160,  minQuantity = 0,   check = false },
    { name = "Sudden Death Rune",      id = 3155,  minQuantity = 0,   check = false },
    -- DISTANCE
    { name = "Diamond Arrow",          id = 35901, minQuantity = 300, check = true },
    { name = "Spectral Bolt",          id = 35902, minQuantity = 0,   check = false },
    { name = "Crystalline Arrow",      id = 15793, minQuantity = 0,   check = false }
}
-- Configuração do caitbox
settings.caitBox = {
    enabled = true,
    maxAreaDistance = 8,        -- Distância máxima para contar os monstros
    monsterCountToContinue = 5, -- Quantidade de monstros minima para continuar para o proximo waypoint
    ignoreMonsters = {}         -- Lista de monstros para ignorar
}

-- BP para stashar no depot
settings.idBpToStash = 23721

return settings
