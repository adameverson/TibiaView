  -- >>> THE Players'REP++System CryingDamson Edition by Cybermaster <<< --
-- >>> Credits to Sync in this script <<< --
-- >>> Scripted IN and ONLY for TFS 0.3 <<< --

function onSay(cid, words, param, channel)

local config =
{       newTime = 6 * 60 * 60, -- This is [6] hours, in seconds. Time between rep.
        oldTime = getPlayerStorageValue(cid, 23232),
        level = 20,      
        target = getPlayerByName(param)
}
        if config.oldTime == -1 then
                setPlayerStorageValue(cid, 23232, os.time())
        end
                       
        local nextTime = config.oldTime - os.time()
        local nextDate = os.date("%d %B %Y %X", config.oldTime + config.newTime)
               
    if getPlayerLevel(cid) < config.level then
        doPlayerSendCancel(cid,"You may fuck from level "..config.level.." and above.")
    return TRUE
    end
       
    if (os.time() - config.oldTime) < config.newTime then
        doPlayerSendCancel(cid, "You may fuck in " .. repTime(nextTime) .. ", (".. nextDate..").")
        return TRUE
    end
       
        if(param == "") then
        doPlayerSendCancel(cid,"You have to type a player name.")
    return TRUE
    end
       
        if isPlayer(config.target) == false then
        doPlayerSendCancel(cid,"That player doesn't exist or is offline.")
    return TRUE
    end
       
        if getPlayerIp(cid) == getPlayerIp(config.target) then
        doPlayerSendCancel(cid,"You may not fuck yourself or your same IP.")  
    return TRUE
    end

        removePlayerRep(config.target, 5, TEXTCOLOR_RED)
        setPlayerStorageValue(cid, 23232, os.time())
        doPlayerSendCancel(cid,'You just fucked '.. getPlayerName(config.target) ..'.')      
    end 