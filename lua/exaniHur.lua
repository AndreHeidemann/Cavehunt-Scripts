local player = Creature(Player.getId())
local initialPlayerPos = player:getPosition()
function exaniHurDirection(direction, upOrDown)
    direction = string.lower(direction)
    upOrDown = string.lower(upOrDown)

    local directions = {
        ["north"] = 0,
        ["east"] = 1,
        ["south"] = 2,
        ["west"] = 3,
        ["up"] = 4,
        ["down"] = 5,
    }

    local turnDirection = directions[direction]
    if not turnDirection then
        print("Direção inválida.")
        return
    end

    while true do
        Game.turn(turnDirection)
        wait(500)
        if upOrDown == "up" then
            Game.talk("exani hur up", Enums.TalkTypes.TALKTYPE_SAY)
        elseif upOrDown == "down" then
            Game.talk("exani hur down", Enums.TalkTypes.TALKTYPE_SAY)
        else
            print("Direção 'up' ou 'down' inválida.")
            return
        end

        wait(500)
        local currentPlayerPos = player:getPosition()
        if currentPlayerPos ~= initialPlayerPos then
            break
        end
    end
end
