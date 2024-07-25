local depotIds = { 3500, 3499, 3498, 3497, 49894, 49895 }

local function moveBackpackToStash(BP_LOOT_ID)
    local containers = Player.getContainers()
    local stashContainer, stashSlot
    local backpackContainer, backpackSlot
    local foundStash = false

    if containers then
        for _, containerIndex in ipairs(containers) do
            local container = Container.new(containerIndex)
            local containerItems = container:getItems()
            if containerItems then
                for slot, item in ipairs(containerItems) do
                    if item.id == 28750 then
                        stashContainer = container
                        stashSlot = slot
                        foundStash = true
                    elseif item.id == BP_LOOT_ID then
                        backpackContainer = container
                        backpackSlot = slot
                    end
                end
            end
        end
    end
    if foundStash and backpackContainer and stashContainer then
        backpackContainer:moveItemToContainer(backpackSlot - 1, 1, stashContainer:getIndex(), stashSlot - 1)
    end
end
local function checkDepotId(value)
    for _, v in ipairs(depotIds) do
        if v == value then
            return true
        end
    end
    return false
end
local function findFreeDepots()
    local tiles = Map.getTiles()
    local position = Map.getCameraPosition()
    local freeDepot = {}
    local isTileWalkableOptions = {
        ignoreBlockPath = false,
        ignoreMagicField = false,
        ignoreFloorChange = false,
        ignoreMonsters = false,
    }
    for i = 1, #tiles do
        if tiles[i].things then
            if tiles[i].pos.z == position.z then
                local things = tiles[i].things
                for j = 1, #things do
                    if checkDepotId(things[j].id) then
                        for x = -1, 1 do
                            for y = -1, 1 do
                                if Map.isTileWalkable(tiles[i].pos.x + x, tiles[i].pos.y + y, tiles[i].pos.z, isTileWalkableOptions) then
                                    local tilesWalkables = {
                                        x = tiles[i].pos.x + x,
                                        y = tiles[i].pos.y + y,
                                        z = tiles[i].pos.z
                                    }
                                    table.insert(freeDepot, tilesWalkables)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return freeDepot
end
local function goToDepot()
    local freeDepot = findFreeDepots()
    local position = Map.getCameraPosition()
    local k = 1
    while k <= #freeDepot and (freeDepot[k].x ~= position.x or freeDepot[k].y ~= position.y or freeDepot[k].z ~= position.z) do
        Map.goTo(freeDepot[k].x, freeDepot[k].y, freeDepot[k].z)
        wait(3000)
        position = Map.getCameraPosition()
        if (freeDepot[k].x == position.x and freeDepot[k].y == position.y and freeDepot[k].z == position.z) then
            break
        end
        k = k + 1
    end
end
local function browseFieldOpenDepot(cordDepotDirection)
    Map.browseField(cordDepotDirection.x, cordDepotDirection.y, cordDepotDirection.z)
    wait(400)
    local containers = Player.getContainers()
    for i = 1, #containers do
        local container = Container.new(containers[i])
        local items = container:getItems()
        for j = 1, #items do
            if checkDepotId(items[j].id) then
                container:useItem(j - 1, false)
                wait(400)
                return true
            end
        end
    end
    return false
end
local function openDepot(bpToStash)
    local cordDepotDirection = nil
    local position = Map.getCameraPosition()
    for x = -1, 1 do
        for y = -1, 1 do
            local things = Map.getThings(position.x + x, position.y + y, position.z)
            for j = 1, #things do
                if checkDepotId(things[j].id) then
                    cordDepotDirection = {
                        x = position.x + x,
                        y = position.y + y,
                        z = position.z
                    }
                    break
                end
                j = j + 1
            end
            if cordDepotDirection then
                break
            end
        end
    end
    if cordDepotDirection and browseFieldOpenDepot(cordDepotDirection) then
        moveBackpackToStash(bpToStash)
    end
end
local function findDepotNearby()
    local position = Map.getCameraPosition()
    for x = -1, 1 do
        for y = -1, 1 do
            local things = Map.getThings(position.x + x, position.y + y, position.z)
            for i = 1, #things do
                if (checkDepotId(things[i].id)) then
                    return true
                end
            end
        end
    end
    return false
end
function runDepotStash(bpToStash)
    repeat
        goToDepot()
        wait(1000)
    until findDepotNearby()
    openDepot(bpToStash)
end

-- para testar
-- local bp_pra_stash = 49700
-- runDepotStash(bp_pra_stash)
