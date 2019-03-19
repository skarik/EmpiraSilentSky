/// @description  Level_GeneratePickups(width,height,cel_width,cel_height)
/// @param width
/// @param height
/// @param cel_width
/// @param cel_height

var w = argument0;
var h = argument1;
var subroom_w = argument2;
var subroom_h = argument3;

// Generate the sword
if ( playerInventory.sword == false )
{
    // Loop through each room and kick ass
    for (var cx = 0; cx < w; ++cx)
    {
        for (var cy = 0; cy < h; ++cy)
        {
            var ofx = x + cx * subroom_w;
            var ofy = y + cy * subroom_h;
            
            var room_type = lvTypes[cx + cy*w];
            // Only place the sword in a hallway, so we can place a goo wall after
            if ( room_type & ROOM_HALLWAY && !(room_type & ROOM_CLIMB_UP) && !(room_type & ROOM_CLIMB_DOWN) && choose(0,0,1) )
            {
                if (!instance_exists(pickupSword))
                    instance_create( ofx + 32*3, ofy + 32*6, pickupSword );
                place_unique( ofx + 32*7, ofy + 32*2, blox32x );
                place_unique( ofx + 32*7, ofy + 32*3, bloxD32x96 );
                break;
            }
        }
    }
}
// Generate the gun & canisters
if ( !playerInventory.gun || !playerInventory.canister_goo || !playerInventory.canister_glue )
{
    // Loop through each room and kick ass
    placed_gun = playerInventory.gun;
    placed_goo = playerInventory.canister_goo;
    placed_glue = playerInventory.canister_glue;
    for (var cx = 0; cx < w; ++cx)
    {
        for (var cy = 0; cy < h; ++cy)
        {
            var ofx = x + cx * subroom_w;
            var ofy = y + cy * subroom_h;
            
            var room_type = lvTypes[cx + cy*w];
            // Place the items in any hallway that's not an entrance
            if ( room_type & ROOM_MAIN_PATH && room_type & ROOM_HALLWAY && !(room_type & ROOM_ENTRANCE) && choose(0,0,1) )
            {
                if (choose(0,1) && !placed_gun) {
                    instance_create( ofx + 32*choose(1,6) + 16, ofy + 32*6, pickupGun );
                    placed_gun = true;
                    continue; // Skip to next room!
                }
                if (choose(0,1) && !placed_goo) {
                    instance_create( ofx + 32*choose(1,6) + 16, ofy + 32*6, pickupGooCanister );
                    placed_goo = true;
                    continue; // Skip to next room!
                }
                if (choose(0,1) && !placed_glue) {
                    instance_create( ofx + 32*choose(1,6) + 16, ofy + 32*6, pickupGlueCanister );
                    placed_glue = true;
                    continue; // Skip to next room!
                }
            }
        }
    }
}
// Generate ammo
if ( playerInventory.canister_goo || playerInventory.canister_glue )
{
    // Set pass count based on level generosity
    var item_pass_count = 1;
    if (lvGenerosity > 0)
    {   // Add item rooms
        item_pass_count += ceil(lvGenerosity/2);
    }
    // Perform the item pass that many times
    for ( var pass = 0; pass < item_pass_count; ++pass )
    {
        // Loop through each room and kick ass
        for (var cx = 0; cx < w; ++cx)
        {
            for (var cy = 0; cy < h; ++cy)
            {
                var ofx = x + cx * subroom_w;
                var ofy = y + cy * subroom_h;
                
                var room_type = lvTypes[cx + cy*w];
                // Place the items in any hallway that's not an entrance
                if ( room_type & ROOM_HALLWAY && !(room_type & ROOM_ENTRANCE) && choose(0,0,0,1) )
                {
                    if (choose(0,0,0,1,1)) {
                        if (playerInventory.canister_goo)
                            instance_create( ofx + 32*choose(1,6) + 16, ofy + 32*6, pickupGoo );
                        continue; // Skip to next room!
                    }
                    else {
                        if (playerInventory.canister_glue)
                            instance_create( ofx + 32*choose(1,6) + 16, ofy + 32*6, pickupGlue );
                        continue; // Skip to next room!
                    }
                }
            }
        }
    }
}
// Generate upgrade stations
if ( playerInventory.sword && playerInventory.gun )
{
    // Loop through each room and kick ass
    for (var cx = 0; cx < w; ++cx)
    {
        for (var cy = 0; cy < h; ++cy)
        {
            var ofx = x + cx * subroom_w;
            var ofy = y + cy * subroom_h;
            
            var room_type = lvTypes[cx + cy*w];
            // Place the upgrade station in any hallway
            var chance = 0;
            if ( room_type & ROOM_HALLWAY )
                chance += 0.25;
            if ( room_type & ROOM_ENTRANCE || room_type & ROOM_EXIT )
                chance += 0.5;
            if ( room_type & ROOM_CLIMB_DOWN )
                chance -= 0.25;
            // Decrease spawn chances if already exists
            chance /= (instance_number(buttonUpgradeStation)+1);
                
            // If there's a chance...
            if ( random(1.0) < chance )
            {
                instance_create( ofx + 32*2, ofy + 32*5, buttonUpgradeStation );
                break;
            }
        }
    }
}

