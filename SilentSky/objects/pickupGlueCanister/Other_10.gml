var sound = sound_play_at(x,y,sndHitMetal);
playerInventory.canister_glue = true;
playerInventory.ammo_glue += 75;

if (!iexists(playerGun))
    inew(playerGun);
playerGun.isHeld = true;

var tutorial = inew(tutorialModes);
    if (iexists(tutorial)) tutorial.active = true;

