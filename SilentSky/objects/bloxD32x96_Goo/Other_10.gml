// Make the destroy animation
var junk = instance_create(x,y,junkDoodadAnimate);
    junk.sprite_index = sprGooWall;
    junk.animSpeed = 30;
    junk.image_index = 3.0;
    junk.animFrame = 3.0;
    
// Make a goo pickup
if ( playerInventory.canister_goo )
{
    var pickup = instance_create(x+random_range(-16,16),y+96,pickupGoo);
}

