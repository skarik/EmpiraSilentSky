var sound = sound_play_at(x,y,sndPickupSword);
playerInventory.sword = true;

var junk = instance_create(x,y,junkDoodad);
    junk.sprite_index = sprPickupSwordEmpty;
    
// Create tutorial
var tutorial = inew(tutorialUse);
    if (iexists(tutorial)) tutorial.active = true;

