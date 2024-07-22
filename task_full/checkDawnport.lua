function checkDawnport()
    local leaveDawnport = false    
    if Player.getLevel() >= 8 and Game.getItemCount(3031) then
        leaveDawnport = true    
    end
    if leaveDawnport then
        CaveBot.GoTo('leaveDawnport')
        Client.showMessage("Saindo da hunt para refillar.")
        wait(1000)
    else
        CaveBot.GoTo('HuntDawnport')        
        Client.showMessage("Level inferior ao 8 ou saldo de gold coin inferior a 10gp.")
        wait(1000)
    end
end
checkDawnport()