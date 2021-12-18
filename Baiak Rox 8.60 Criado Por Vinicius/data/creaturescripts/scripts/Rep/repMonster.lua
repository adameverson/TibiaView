  -- >>> THE BestRepSystem by Cybermaster <<< --
 -- >>> Scripted IN and ONLY for TFS 0.3<<< --
 -- >>> To add a new monster, copy a line inside the 'monsters' table<<< --

function onKill(cid, target, lastHit)
        if not isPlayer(cid) or not isMonster(target) then
                return true
    end

        local monsters = {
        ["warlock"] = {rep = 1},
        ["behemoth"] = {rep = 3},
        ["hellfire fighter"] = {rep = 5},
        ["demon"] = {rep = 7},
        ["orshabaal"] = {rep = 10},
        ["ferumbras"] = {rep = 15},
        ["morgaroth"] = {rep = 20},
    }
        local name = getCreatureName(target)
        local monster = monsters[string.lower(name)]
       
        if monster then
                addPlayerRep(cid, monster.rep, TEXTCOLOR_LIGHTGREEN)                   
        end
    return true
end 