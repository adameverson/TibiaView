local look = {lookType = 134, lookHead = 94, lookBody = 94, lookLegs = 94, lookFeet = 94, lookTypeEx = 0, lookAddons = 3}

function onStepIn(cid, item, pos)
doCreatureChangeOutfit(cid, look)
end