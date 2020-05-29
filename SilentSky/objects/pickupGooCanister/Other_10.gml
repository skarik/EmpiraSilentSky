var sound = sound_play_at(x,y,sndHitMetal);
playerInventory.canister_goo = true;
playerInventory.ammo_goo += 50;

if (!iexists(playerGun))
    inew(playerGun);
playerGun.isHeld = true;

var tutorial = inew(tutorialModes);
    if (iexists(tutorial)) tutorial.active = true;

