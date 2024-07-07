local function getDistance(pos1, pos2)
    local x = math.abs(pos1.x - pos2.x)
    local y = math.abs(pos1.y - pos2.y)
    return math.max(x, y)
end

local function shouldIgnoreMonster(list, name)
    name = name:lower()
    for i = 1, #list do if list[i]:lower() == name then return true end end
    return false
end

function checkCaitBox(settings, label)
    if not settings or settings.caitBox.enabled == false then return end

    local creatures = Map.getCreatureIds(true, false) or {}
    local playerPos = Map.getCameraPosition()
    if not playerPos then return end

    local monstersOnRange = 0

    for i = 1, #creatures do
        local cid = creatures[i]
        local creature = Creature(cid)
        if creature then
            local name = creature:getName()
            if name then
                local creaturePos = creature:getPosition()
                local creatureType = creature:getType()
                if creatureType == Enums.CreatureTypes.CREATURETYPE_MONSTER and
                    not shouldIgnoreMonster(settings.caitBox.ignoreMonsters,
                                            name) and
                    getDistance(creaturePos, playerPos) <=
                    settings.caitBox.maxAreaDistance then
                    monstersOnRange = monstersOnRange + 1
                end
            end
        end
    end

    if monstersOnRange > settings.caitBox.monsterCountToContinue then
        CaveBot.GoTo(label)
        wait(1000)
    end
end
