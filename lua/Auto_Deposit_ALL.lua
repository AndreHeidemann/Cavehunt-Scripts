function Game.talk(message, type) gameTalk(message, type) end

Enums.TalkTypes = {
    TALKTYPE_PRIVATE_PN = 12 -- talk to NPC
}

-- Função para iniciar a conversa com o NPC
local function startConversationWithNpc()
    Game.talk("hi", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
    wait(1000) -- Aguarda 1 segundo
    Game.talk("deposit all", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
    wait(1000) -- Aguarda 1 segundo
    Game.talk("yes", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
end

-- Função principal para interação com o NPC
function interactWithBanker() startConversationWithNpc() end

-- Chama a função principal para iniciar a interação
-- interactWithBanker()

