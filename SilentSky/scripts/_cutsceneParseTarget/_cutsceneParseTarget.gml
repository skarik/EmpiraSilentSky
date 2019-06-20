var target = argument0;
if (is_undefined(target))
    target = null;
else if (target == "imp")
    target = objPlayerImp;
else if (target == "paladin")
    target = objPlayerPaladin;
else if (target == "princess" || target == "kyin")
    target = objPlayerPrincess;
else if (target == "tinkerer" || target == "buzzbrain")
    target = objPlayerTinkerer;
else if (target == "rebel")
    target = npcRebel;
else if (target == "guard")
    target = npcGuard;
else
    target = null;
	
return target;
