Game.useItem(16277)
wait(2000)
print(JSON.encode(Map.getCameraPosition()))
print("X: " .. Map.getCameraPosition().x )
print("Y: " .. Map.getCameraPosition().y )
print("Z: " .. Map.getCameraPosition().z )

-- Adventurer's stone 1
if ((Map.getCameraPosition().x == 31605)and(Map.getCameraPosition().y == 32413)and(Map.getCameraPosition().z == 7)) then
    result = "Adventurer's stone 1"
    CaveBot.GoTo('Adventurer1')
--ok
-- Adventurer's stone 2
elseif ((Map.getCameraPosition().x == 31605)and(Map.getCameraPosition().y == 32484)and(Map.getCameraPosition().z == 7)) then
    result = "Adventurer's stone 2"
    CaveBot.GoTo('Adventurer2')
--ok
-- Adventurer's stone 3
elseif ((Map.getCameraPosition().x == 31692)and(Map.getCameraPosition().y == 32413)and(Map.getCameraPosition().z == 7)) then
    result = "Adventurer's stone 3"
    CaveBot.GoTo('Adventurer3')
--ok
-- Adventurer's stone 4
elseif ((Map.getCameraPosition().x == 31692)and(Map.getCameraPosition().y == 32484)and(Map.getCameraPosition().z == 7)) then
    result = "Adventurer's stone 4"
    CaveBot.GoTo('Adventurer4')

-- Adventurer's stone 5
elseif ((Map.getCameraPosition().x == 31779)and(Map.getCameraPosition().y == 32413)and(Map.getCameraPosition().z == 7)) then
    result = "Adventurer's stone 5"
    CaveBot.GoTo('Adventurer5')
--ok
-- Adventurer's stone 6
elseif ((Map.getCameraPosition().x == 31779)and(Map.getCameraPosition().y == 32484)and(Map.getCameraPosition().z == 7)) then
    result = "Adventurer's stone 6"
    CaveBot.GoTo('Adventurer6')
--ok    
-- Adventurer's stone 7
elseif ((Map.getCameraPosition().x == 32200)and(Map.getCameraPosition().y == 32296)and(Map.getCameraPosition().z == 7)) then
    result = "Adventurer's stone 7"
    CaveBot.GoTo('Adventurer7')
--ok
else
    result = "other"
end
print(result)