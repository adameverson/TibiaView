local bless = {1, 2, 3, 4, 5}
local cost = 80000
function onSay(cid, words, param)
for i = 1, table.maxn(bless) do
if(getPlayerBlessing(cid, bless[i])) then
doPlayerSendCancel(cid, "Voceja tem todas as bless.")
return TRUE
end
end

if(doPlayerRemoveMoney(cid, cost) == TRUE) then
for i = 1, table.maxn(bless) do
doPlayerAddBlessing(cid, bless[i])
end
doCreatureSay(cid, "You are now blessed by the [GOD] Bryaan!" ,19)
doSendMagicEffect(getPlayerPosition(cid), 49)
else
doPlayerSendCancel(cid, "Voce precisa de 80k para a bless.")
end
return TRUE
end 