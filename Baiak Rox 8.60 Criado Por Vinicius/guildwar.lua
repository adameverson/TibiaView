DelayToCancel = 24 * 60 * 60 --minutes

Maps = {
        ["map 1"] = 
                {
                        Guild1Pos = {x=998, y=1006, z=7},
                        Guild2Pos = {x=1002, y=1006, z=7}
                },
        ["map 2"] =
                {
                        Guild1Pos = {x=994, y=1004, z=6},
                        Guild2Pos = {x=1000, y=1003, z=6}                       
                }
        }

TimeToTeleport = 1 --minutes, when star a challenge
StopBattle = TRUE --Stop battle after X time ? TRUE  /  FALSE
TimeToStop = 60 --Minutes Time to Stop if StopBattle = TRUE.

--Cancel messages~
CancelMessagesWar = {
        --Message when player try accept/reject/cancel a war but there is no a invitation.
        [1] = "Not pending invitations.",
        --Message when the player is not the guild leader.
        [2] = "Only Guild Leader can execute this command.",
        --Message when try Cancel the invitation but the war is already accepted.
        [3] = "The war is already accepted.",
        --MEssage when the invited guild name is not correct or does not exist.
        [4] = "Not correct guild name.",
        --Message when try invite any guild to a war but his guild already have a war or a pending invitation.
        [5] = "Your guild is already in war or have a pending invitation.",
        --Same of the cancel message 5 but the the enemy guild.
        [6] = "This guild is already in war or have a pending invitation.",
        --Message when use invite command but not write guild name.
        [7] = "Command needs param.",
        --Message when try invite his guild.
        [8] = "You can\´t invite you guild.",
        --Message when the map name is not correct.
        [9] = "Please write a correct name.",
        --Message when try go to any map but the guild is have no received/sent any war invitation
        [10] = "Your guild is not in any war.",
        --When try to cancel a war before the delay
        [11] = "You should wait ".. DelayToCancel .." minutes to cancel the war"
        }
        
--Broadcast messages when invite/accept/reject/cancel ~ Remember the Spaces.
BroadCast_Type = MESSAGE_EVENT_ADVANCE
BroadCast = {
        --Message when inviting
        [1] = 
                {
                        "Guild ",
                        --Here will be the guild name
                        " have invited guild ",
                        --Here will be the invited guild name
                        " to have a war."
                },
        --Message when accept.
        [2] = 
                {
                        "Guild ",
                        --Here will be the guild name
                        " have accepted the invitation of the guild " ,
                        --Here will be the name of the guild who have invited em.
                        " to have a war."
                },
        --Message when reject.
        [3] = 
                {
                        "Guild ",
                        --Here will be the guild name
                        " have rejected the invitation of the guild " ,
                        --Here will be the name of the guild who have invited em.
                        " to have a war."
                },
        --Message when cancel.
        [4] = 
                {
                        "Guild ",
                        --Here will be the guild name
                        " have canceled the invitation to the guild " ,
                        --Here will be the name of the guild who have invited em.
                        " to have a war."
                },
        --Message whenstar a battle..
        [5] = 
                {
                        "Guild ",
                        --Here will be the guild name
                        " and guild " ,
                        --Here will be the name of the guild who have invited em.
                        " will have a battle in the map :"
                },
        --message when a battle ends.
        [6] = 
                {
                        "The battle betwen guild ",
                        --Here will be the guild name
                        " and guild " ,
                        --Here will be the name of the guild who have invited em.
                        " its over."
                },
        }

--Functions ~.
function getGuildWarInfo(id)
        local Info = db.getResult("SELECT `invited_to`, `invited_by`, `in_war_with`,`war_time` FROM `guilds` WHERE `id` = " .. id .. "")
        if Info:getID() ~= LUA_ERROR then
                local invTo, invBy, warWith, Time = Info:getDataInt("invited_to"), Info:getDataInt("invited_by"), Info:getDataInt("in_war_with"), Info:getDataInt("war_time") 
                Info:free()
                return {To = invTo, By = invBy, With = warWith, T = Time}
        end
        return LUA_ERROR
end

function getGuildNameById(id)
        local Info = db.getResult("SELECT `name` FROM `guilds` WHERE `id` = " .. id .. "")
                if Info:getID() ~= LUA_ERROR then
                local Name = Info:getDataString("name")
                Info:free()
                return Name
        end
        return LUA_ERROR
end

function GuildIsInPEace(id)
        local Info = getGuildWarInfo(id)
        return (Info.To == 0 and Info.By == 0 and Info.With == 0)
end

function doInviteToWar(myGuild, enemyGuild)
        db.executeQuery("UPDATE `guilds` SET `invited_to` = ".. enemyGuild .." WHERE `id` = ".. myGuild .."")
        db.executeQuery("UPDATE `guilds` SET `invited_by` = ".. myGuild .." WHERE `id` = ".. enemyGuild .."")
end

function WarAccept(myGuild, enemyGuild)
        local StartTime = os.time()
        db.executeQuery("UPDATE `guilds` SET `invited_to` = 0, `invited_by` = 0, `war_time` = ".. StartTime ..", `in_war_with`  =  ".. myGuild ..", `kills` = 0, `show` = 1 WHERE `id` = ".. enemyGuild .."")
        db.executeQuery("UPDATE `guilds` SET `invited_to` = 0, `invited_by` = 0, `war_time` = ".. StartTime ..", `in_war_with`  =  ".. enemyGuild ..", `kills` = 0, `show` = 0 WHERE `id` = ".. myGuild .."")
end

function cleanInfo(myGuild)
        db.executeQuery("UPDATE `guilds` SET `invited_to` = 0, `invited_by` = 0, `war_time` = 0, `in_war_with`  =  0, `kills` = 0, `show` = 0 WHERE `id` = ".. myGuild .."")
end

function registerDeath(myGuild, enemyGuild, cid, target)
        db.executeQuery("INSERT INTO `deaths_in_wars` (`guild_id`, `player_id`, `killer_guild`, `killer`, `date`) VALUES ("..enemyGuild..", "..getPlayerGUID(target)..", "..myGuild..", "..getPlayerGUID(cid)..", " .. os.time() ..");")        
        db.executeQuery("UPDATE `guilds` SET `kills` = `kills` + 1 WHERE `id` = ".. myGuild .."")
end

function StopWar(myGuild, enemyGuild)
        cleanInfo(myGuild)
        cleanInfo(enemyGuild)
        removeDeaths(myGuild)
        removeDeaths(enemyGuild)
end

function removeDeaths(id)
        db.executeQuery("DELETE FROM `deaths_in_wars` WHERE `guild_id` = " ..id .. ";")
end

function WeAreInWar(myGuild, enemyGuild)
        local myGuildInfo = getGuildWarInfo(myGuild)
        local enemyGuildInfo = getGuildWarInfo(enemyGuild)
        if myGuild == enemyGuildInfo.With and enemyGuild ==  myGuildInfo.With then
                if enemyGuildInfo.ON == 1 and myGuildInfo.ON == 1 then
                        return TRUE
                end             
        end
        return FALSE
end

function getOnlineMembers(id)
        local PlayersOnline = getPlayersOnline()
        local MembersOnline = {}
        for i, pid in ipairs(PlayersOnline) do
                if id == getPlayerGuildId(PlayersOnline[i]) then
                        table.insert(MembersOnline, PlayersOnline[i])
                end
        end
        return MembersOnline
end

function teleportGuild(id, pos)
        local Members = getOnlineMembers(id)
        if #Members > 0 then
                for i = 1, #Members do
                        if getTilePzInfo(getCreaturePosition(Members[i])) == TRUE then
                                doTeleportThing(Members[i], pos, FALSE)
                                doSendMagicEffect(pos, CONST_ME_TELEPORT)
                                doSendMagicEffect(getCreaturePosition(Members[i]), CONST_ME_POFF)
                        end
                end
        end
end

function removeFrag(cid)
        local FragTime = getConfigInfo('timeToDecreaseFrags')
        local myFragTime = getPlayerRedSkullTicks(cid)
        local Remo = (myFragTime - FragTime)
        if Remo < 0 then
                Remo = 0
        end
        doPlayerSetRedSkullTicks(cid, Remo)
end

function getGuildsWithWar()
        local res = db.getResult("SELECT `id` FROM `guilds` WHERE `in_war_with` > 0")
        local GuildW = {}
        if res:getID() ~= LUA_ERROR then
                while true do
                        table.insert(GuildW, res:getDataInt "id")
                        if not res:next() then
                                break
                        end
                end
                res:free()
        end
        return GuildW
end

function guildExist(nom)
        local Get = db.getResult("SELECT `id` FROM `guilds` WHERE `name` = " .. db.escapeString(nom) .. ";")
        if Get:getID() ~= LUA_ERROR then
                local ret = Get:getDataInt("id")
                Get:free()
                return ret
        end
        return LUA_ERROR
end

function StarWar(x)
        teleportGuild(x.myGuild, Maps[x.map].Guild1Pos)
        teleportGuild(x.enemyGuild, Maps[x.map].Guild2Pos)
--[[    
        putWarOn(x.myGuild, x.enemyGuild)
        if StopBattle == TRUE then
                addEvent(StopWarNow, 60 * 1000, {myGuild = x.myGuild, enemyGuild = x.enemyGuild})
        end
]]
end     

--[[
function StopWarNow©
        StopWar(c.myGuild, c.enemyGuild)
        doBroadcastMessage(BroadCast[6][1] ..getGuildNameById(c.myGuild).. BroadCast[6][2] ..getGuildNameById(c.enemyGuild).. BroadCast[6][3], BroadCast_Type)
end

function putWarOn(myGuild, enemyGuild)
        db.executeQuery("UPDATE `guilds` SET `war_time`  = 1 WHERE `id` = ".. myGuild .."")
        db.executeQuery("UPDATE `guilds` SET `war_time`  = 1 WHERE `id` = ".. enemyGuild .."")
end
]]