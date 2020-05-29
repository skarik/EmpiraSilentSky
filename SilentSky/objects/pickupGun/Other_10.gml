var sound = sound_play_at(x,y,sndPickupGun);
playerInventory.gun = true;

if (!iexists(playerGun))
    inew(playerGun);
playerGun.visible = true;
playerGun.isHeld = true;

// Create tutorial
var tutorial = inew(tutorialGun);
    if (iexists(tutorial)) tutorial.active = true;

