  function onKill(cid, target, lastHit)
                local SKULL = {[SKULL_WHITE] = 15, [SKULL_RED] = 30, [SKULL_BLACK] = 45, [SKULL_NONE] = -30}
                        if (isPlayer(cid)) and (isPlayer(target)) and isInArray({0,3,4,5}, getCreatureSkullType(target)) then
                                if getPlayerLevel(target) > 30 then
                                        doSendAnimatedText(getPlayerPosition(cid), "-REP", TEXTCOLOR_RED)
                                        setPlayerRep(cid, getRepPoints(cid)+SKULL[getPlayerSkullType(target)])
                                end
                        end
                        if (isPlayer(cid)) and (isPlayer(target)) then
                                if getRepPoints(target) == 0 then
                                        return true
                                elseif getRepPoints(target) > 0 then
                                        removePlayerRep(target, 5, TEXTCOLOR_RED)
                                else
                                        addPlayerRep(target, 5, TEXTCOLOR_RED)
                                end
                        end
                        return true
                end 