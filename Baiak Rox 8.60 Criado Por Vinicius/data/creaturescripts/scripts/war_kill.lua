dofile("./GuildWar.lua")

local PZ = createConditionObject(CONDITION_INFIGHT)
setConditionParam(PZ, CONDITION_PARAM_TICKS, getConfigInfo('whiteSkullTime'))

function onKill(cid, target)
        if isPlayer(cid) == TRUE and isPlayer(target) == TRUE then
                local myGuild = getPlayerGuildId(cid)
                local enemyGuild = getPlayerGuildId(target)
                if myGuild ~= 0 and enemyGuild ~= 0 then
                        if enemyGuild == getGuildWarInfo(myGuild).With then
                                doAddCondition(cid, PZ)
                                registerDeath(myGuild, enemyGuild, cid, target)
                                doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "This frag will not count!")

                        end
                end
        end
        return TRUE
end