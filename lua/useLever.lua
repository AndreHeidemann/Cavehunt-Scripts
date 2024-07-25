function useLever(direction)
    direction = string.lower(tostring(direction))
    local x = 0
    local y = 0
    local player = Creature(Player.getId())
    local position = player:getPosition()
    local lastPosition = position    
    if(direction=="west") or (direction=="w") then
        x=x-1
    elseif(direction=="north") or (direction=="n") then
        y=y-1
    elseif(direction=="south") or (direction=="s") then
        y=y+1
    elseif(direction=="east") or (direction=="e") then
        x=x+1
    end
    while (position.x == lastPosition.x) and (position.y == lastPosition.y) and (position.z == lastPosition.z) do
        Game.useItemFromGround(position.x + x, position.y + y, position.z)        
        lastPlayer = Creature(Player.getId())
        lastPosition = lastPlayer:getPosition()
        wait(100)
    end
end