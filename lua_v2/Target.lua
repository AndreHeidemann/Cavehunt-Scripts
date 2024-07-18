-- Função para exibir uma mensagem na tela
function showMessage(message)
    -- Esta função deve ser implementada de acordo com o ambiente em que o código está sendo executado
    print(message) -- Aqui, estamos apenas imprimindo a mensagem no console
end

-- Variáveis para rastrear o estado dos sistemas
local targetingEnabled = false
local magicShooterEnabled = false

--- Habilita ou desabilita o sistema de ATK.
-- Esta função é um invólucro para a função externa engineTargetingEnable.
-- @param enable (boolean) - Uma flag indicando se deve habilitar (true) ou desabilitar (false) o sistema de ATK.
function Engine.enableTargeting(enable)
    engineTargetingEnable(enable)
    targetingEnabled = enable
    if enable then
        showMessage("ATK Ligado.")
    else
        showMessage("ATK Desligado.")
    end
end

--- Habilita ou desabilita o MagicShooter.
-- Esta função é um invólucro para a função externa engineMagicShooterEnable.
-- @param enable (boolean) - Uma flag indicando se deve habilitar (true) ou desabilitar (false) o sistema.
function Engine.enableMagicShooter(enable)
    engineMagicShooterEnable(enable)
    magicShooterEnabled = enable
    if enable then
        showMessage("Magic Ligado.")
    else
        showMessage("Magic Desligado.")
    end
end

-- Altere aqui:
-- Engine.enableTargeting(false) -- AutoATK
-- Engine.enableMagicShooter(false) -- Magias
