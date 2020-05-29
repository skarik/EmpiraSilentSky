var sound = sound_play_at(x,y,sndPickupCloth);
playerInventory.cloak = true;

// Create the basic hud as well
if (!iexists(playerHudStatus))
    inew(playerHudStatus);
    
var junk = instance_create(x,y,junkDoodad);
    junk.sprite_index = sprPickupCoatEmpty;

