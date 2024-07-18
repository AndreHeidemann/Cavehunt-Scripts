-- local doorID = 6900 -- ID of the door you want to open
-- local searchSize = 1 -- Size of the search area around the player
function openDoor(doorID, searchSize)
    searchSize = searchSize or 1
    local connected = Client.isConnected()
    if not connected then
        print("Client is not connected.")
        return
    end

    local player = Creature(Player.getId())
    local playerPos = player:getPosition()

    local doorX, doorY, doorZ

    -- Loop to check positions in the square
    for x = -searchSize, searchSize do
        for y = -searchSize, searchSize do
            local tileItems = Map.getThings(playerPos.x + x, playerPos.y + y,
                                            playerPos.z)
            if tileItems then
                for _, item in ipairs(tileItems) do
                    if item.id == doorID then
                        doorX, doorY, doorZ = playerPos.x + x, playerPos.y + y,
                                              playerPos.z
                        print("Door with ID " .. doorID .. " found on screen.")
                        print("Position - X: " .. doorX .. ", Y: " .. doorY ..
                                  ", Z: " .. doorZ)
                        break
                    end
                end
            end
            if doorX then break end -- Exit the outer loop if the door is found
        end
        if doorX then break end -- Exit the main loop if the door is found
    end

    if doorX then
        -- Use the item directly on the door at the found position
        Game.useItemFromGround(doorX, doorY, doorZ)
        print(
            "Opening the door at position - X: " .. doorX .. ", Y: " .. doorY ..
                ", Z: " .. doorZ)
    else
        print("Door with ID " .. doorID .. " not found in the search area.")
    end
end

-- Execute the openDoor function once
-- openDoor()
