local look = {lookType = 152, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookTypeEx = 0, lookAddons = 3}

function onStepIn(cid, item, pos)
doCreatureChangeOutfit(cid, look)
end