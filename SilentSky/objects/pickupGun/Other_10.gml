var sound = sound_play_at(x,y,sndPickupGun);
playerInventory.gun = true;

if (!exists(playerGun))
    new(playerGun);
playerGun.visible = true;
playerGun.isHeld = true;

// Create tutorial
var tutorial = new(tutorialGun);
    if (exists(tutorial)) tutorial.active = true;

