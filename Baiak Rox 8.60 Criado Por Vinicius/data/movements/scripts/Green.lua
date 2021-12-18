local look = {lookType = 134, lookHead = 100, lookBody = 100, lookLegs = 100, lookFeet = 100, lookTypeEx = 0, lookAddons = 3}

function onStepIn(cid, item, pos)
doCreatureChangeOutfit(cid, look)
end