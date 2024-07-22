-- Função para iniciar a conversa com o NPC
local function startConversationWithNpc()
    Game.talk("hi", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
    wait(1000) -- Aguarda 1 segundo
    Game.talk("deposit all", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
    wait(1000) -- Aguarda 1 segundo
    Game.talk("yes", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
    wait(1000) -- Aguarda 1 segundo    
end
-- Função principal para interação com o NPC
function interactWithBanker()
    startConversationWithNpc()
end
interactWithBanker()