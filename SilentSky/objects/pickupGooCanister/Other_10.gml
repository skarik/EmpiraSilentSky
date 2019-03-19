var sound = sound_play_at(x,y,sndHitMetal);
playerInventory.canister_goo = true;
playerInventory.ammo_goo += 50;

if (!exists(playerGun))
    new(playerGun);
playerGun.isHeld = true;

var tutorial = new(tutorialModes);
    if (exists(tutorial)) tutorial.active = true;

