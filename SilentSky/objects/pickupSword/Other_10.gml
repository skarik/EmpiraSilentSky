var sound = sound_play_at(x,y,sndPickupSword);
playerInventory.sword = true;

var junk = instance_create(x,y,junkDoodad);
    junk.sprite_index = sprPickupSwordEmpty;
    
// Create tutorial
var tutorial = new(tutorialUse);
    if (exists(tutorial)) tutorial.active = true;

