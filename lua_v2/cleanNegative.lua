function cleanNegative()
    local vocation = Creature(Player.getId()):getVocation()
    local poisonState = Player.getState(Enums.States.STATE_POISON) and 1 or 0
    local bleedingState = Player.getState(Enums.States.STATE_BLEEDING) and 1 or
                              0
    local energyState = Player.getState(Enums.States.STATE_ENERGY) and 1 or 0
    local burnState = Player.getState(Enums.States.STATE_BURN) and 1 or 0
    local curseState = Player.getState(Enums.States.STATE_CURSED) and 1 or 0
    local cleanList
    Client.showMessage(vocation)
    if vocation == Enums.Vocations.KNIGHT then
        Client.showMessage("KNIGHT")
        wait(500)
        -- exana kor e pox
        cleanList = {
            {name = "exana pox", status = poisonState},
            {name = "exana kor", status = bleedingState}
        }
    elseif vocation == Enums.Vocations.PALADIN then
        -- exana mort e pox
        Client.showMessage("PALADIN")
        wait(500)
        cleanList = {
            {name = "exana pox", status = poisonState},
            {name = "exana mort", status = curseState}
        }
    elseif vocation == Enums.Vocations.SORCERER then
        -- exana pox
        Client.showMessage("SORCERER")
        wait(500)
        cleanList = {{name = "exana pox", status = poisonState}}
    elseif vocation == Enums.Vocations.DRUID then
        -- exana pox, vis, flam, kor
        Client.showMessage("DRUID")
        wait(500)
        cleanList = {
            {name = "exana pox", status = poisonState},
            {name = "exana kor", status = bleedingState},
            {name = "exana vis", status = energyState},
            {name = "exana flam", status = burnState}
        }
    else
        Client.showMessage("NONE")
        cleanList = {}
    end
    for _, spell in ipairs(cleanList) do
        if spell.status == 1 then
            print(spell.name)
            while CanCast(spell.name) do
                Game.talk(spell.name, 1)
                wait(100)
            end

        end
    end
    -- print(JSON.encode(cleanList))
end

function CanCast(spell)
    local spellId = Spells.getIdByWords(spell)
    local groupCooldown = Enums.SpellGroups.SPELLGROUP_SUPPORT
    if Spells.groupIsInCooldown(groupCooldown) or Spells.isInCooldown(spellId) then
        return false
    end
    return true
end
cleanNegative()

