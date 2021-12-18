dofile("./GuildWar.lua")

function onSay(cid, words, param)
        if getPlayerGuildLevel(cid) == GUILDLEVEL_LEADER then
                local myGuild = getPlayerGuildId(cid)
                if words == "/war-invite" then
                        if GuildIsInPEace(myGuild) == true then
                                if param ~= "" then
                                        if guildExist(param) ~= LUA_ERROR then
                                                local invitedGuild = getGuildId(param)
                                                if invitedGuild ~= LUA_ERROR then
                                                        if invitedGuild ~= myGuild then
                                                                if GuildIsInPEace(invitedGuild) == true then
                                                                        doInviteToWar(myGuild, invitedGuild)
                                                                        doBroadcastMessage(BroadCast[1][1] ..getPlayerGuildName(cid).. BroadCast[1][2] ..getGuildNameById(invitedGuild).. BroadCast[1][3], BroadCast_Type)
                                                                else
                                                                        doPlayerSendCancel(cid, CancelMessagesWar[6])
                                                                end
                                                        else
                                                                doPlayerSendCancel(cid, CancelMessagesWar[8])
                                                        end
                                                else
                                                        doPlayerSendCancel(cid, CancelMessagesWar[4])
                                                end
                                        else
                                                doPlayerSendCancel(cid, CancelMessagesWar[4])
                                        end
                                else
                                        doPlayerSendCancel(cid, CancelMessagesWar[7])
                                end
                        else
                                doPlayerSendCancel(cid, CancelMessagesWar[5])
                        end
                elseif words == "/war-accept" then
                        if getGuildWarInfo(myGuild).By ~= 0 then
                                local enemyGuild = getGuildWarInfo(myGuild).By
                                doBroadcastMessage(BroadCast[2][1] ..getPlayerGuildName(cid).. BroadCast[2][2] ..getGuildNameById(enemyGuild).. BroadCast[2][3], BroadCast_Type)
                                WarAccept(myGuild, enemyGuild)
                        else
                                doPlayerSendCancel(cid, CancelMessagesWar[1])
                        end
                elseif words == "/war-reject" then
                        if getGuildWarInfo(myGuild).By ~= 0 then
                                doBroadcastMessage(BroadCast[3][1] ..getPlayerGuildName(cid).. BroadCast[3][2] ..getGuildNameById(getGuildWarInfo(myGuild).By).. BroadCast[3][3], BroadCast_Type)
                                cleanInfo(getGuildWarInfo(myGuild).By)
                                cleanInfo(myGuild)
                        else
                                doPlayerSendCancel(cid, CancelMessagesWar[1])   
                        end
                elseif words == "/war-cancel-invite" then
                        if getGuildWarInfo(myGuild).To ~= 0 then
                                if getGuildWarInfo(myGuild).With == 0 then
                                        doBroadcastMessage(BroadCast[4][1] ..getPlayerGuildName(cid).. BroadCast[4][2] ..getGuildNameById(getGuildWarInfo(myGuild).To).. BroadCast[4][3], BroadCast_Type)
                                        cleanInfo(getGuildWarInfo(myGuild).To)
                                        cleanInfo(myGuild)
                                else
                                        doPlayerSendCancel(cid, CancelMessagesWar[3])
                                end
                        else
                                doPlayerSendCancel(cid, CancelMessagesWar[1])   
                        end
                elseif words == "/war-challenge" then
                        local map = Maps[param]
                        if map then
                                if getGuildWarInfo(myGuild).With ~= 0 and getGuildWarInfo(myGuild).ON == 0 then
                                        local enemyGuild = getGuildWarInfo(myGuild).With
                                        addEvent(StarWar, 15 * 1000, {myGuild = myGuild, enemyGuild = enemyGuild, map = param})
                                        doBroadcastMessage(BroadCast[5][1] ..getPlayerGuildName(cid).. BroadCast[5][2] ..getGuildNameById(enemyGuild).. BroadCast[5][3] .. param ..".", BroadCast_Type)
                                else
                                        doPlayerSendCancel(cid, CancelMessagesWar[10])
                                end
                        else
                                doPlayerSendCancel(cid, CancelMessagesWar[9])
                        end
                elseif words == "/war-cancel" then
                        local enemy = getGuildWarInfo(myGuild).With
                        if enemy ~= 0 then
                                if (os.time() - getGuildWarInfo(myGuild).T) >= (60 * DelayToCancel) then
                                        StopWar(myGuild, enemy)
                                        doBroadcastMessage(BroadCast[6][1] ..getGuildNameById(myGuild).. BroadCast[6][2] ..getGuildNameById(enemy).. BroadCast[6][3], BroadCast_Type)
                                else
                                        doPlayerSendCancel(cid, CancelMessagesWar[11])
                                end
                        else
                                doPlayerSendCancel(cid, CancelMessagesWar[10])
                        end
                end
        else
                doPlayerSendCancel(cid, CancelMessagesWar[2])
        end
        local file = io.open("data/logs/Wars.txt", "a") 
        file:write("".. os.date("%d %B %Y %X ", os.time()) .." -->  "..getCreatureName(cid)..": "..words.." "..param.."\n") 
        file:close() 
        return TRUE
end