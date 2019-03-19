var sound = sound_play_at(x,y,sndHitMetal);
playerInventory.canister_glue = true;
playerInventory.ammo_glue += 75;

if (!exists(playerGun))
    new(playerGun);
playerGun.isHeld = true;

var tutorial = new(tutorialModes);
    if (exists(tutorial)) tutorial.active = true;

