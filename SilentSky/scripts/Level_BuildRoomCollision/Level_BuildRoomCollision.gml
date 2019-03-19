/// @description  Level_BuildRoomCollision(width,height,cel_width,cel_height)
/// @param width
/// @param height
/// @param cel_width
/// @param cel_height

var w = argument0;
var h = argument1;
var subroom_w = argument2;
var subroom_h = argument3;

// Loop through each room and kick ass
for (var cx = 0; cx < w; ++cx)
{
    for (var cy = 0; cy < h; ++cy)
    {
        var ofx = x + cx * subroom_w;
        var ofy = y + cy * subroom_h;
        
        // Sample the room types
        var room_type = lvTypes[cx + cy*w];
        var room_type_left = ROOM_UNSET;
        if ( cx > 0 ) room_type_left = lvTypes[cx-1 + cy*w];
        var room_type_right = ROOM_UNSET;
        if ( cx < w-1 ) room_type_right = lvTypes[cx+1 + cy*w];
        
        if ( room_type & ROOM_ENTRANCE )
        {
            // Entrance is always a simple doorway + hallway
            place_unique( ofx + 0, ofy + 32*0, blox32x );
            place_unique( ofx + 0, ofy + 32*1, blox32x );
            place_unique( ofx + 0, ofy + 32*2, blox32x );
            for (var fy = 32*6; fy < subroom_h; fy += 32 ) // Gap of 3 blocks
                place_unique( ofx + 0, ofy + fy, blox32x );
        }
        else if ( room_type & ROOM_EXIT )
        {
            // Exit always starts as a simple doorway
            place_unique( ofx + subroom_w - 32, ofy + 32*0, blox32x );
            place_unique( ofx + subroom_w - 32, ofy + 32*1, blox32x );
            place_unique( ofx + subroom_w - 32, ofy + 32*2, blox32x );
            for (var fy = 32*6; fy < subroom_h; fy += 32 ) // Gap of 3 blocks
                place_unique( ofx + subroom_w - 32, ofy + fy, blox32x );
        }
        if ( room_type & ROOM_FILLED )
        {
            // Filled rooms are simply blocks all around
            for (var fx = 0; fx < subroom_w; fx += 32 )
            {
                place_unique( ofx + fx, ofy + 0, blox32x );
                place_unique( ofx + fx, ofy + subroom_h - 32, blox32x );
            }
            for (var fy = 32; fy < subroom_h-32; fy += 32 )
            {
                place_unique( ofx + 0, ofy + fy, blox32x );
                place_unique( ofx + subroom_w - 32, ofy + fy, blox32x );
            }
        }
        if ( room_type & ROOM_HALLWAY )
        {
            // Hallways are pretty simple. Long stretch of blocks
            for (var fx = 0; fx < subroom_w; fx += 32 )
            {
                place_unique( ofx + fx, ofy + 32*1, blox32x );
                place_unique( ofx + fx, ofy + 32*6, blox32x );
            }
            // Remove blocks blocking the entrance and exit
            for (var fx = 16; fx <= subroom_w; fx += subroom_w-32)
            {
                if (fx == 16 && (room_type & ROOM_ENTRANCE)) continue;
                if (fx == subroom_w-16 && (room_type & ROOM_EXIT)) continue;
                for (var fy = 32*2; fy <= 32*5; fy += 32 )
                {
                    var inst = null;
                    do
                    {   // Do it via checking position at each piece of the loop
                        inst = instance_position( ofx + fx, ofy + 16 + fy, bloxBase );
                        delete(inst);
                    }
                    until (inst == null);
                }
            }
            // Add a wall to the left
            if ( !(room_type & ROOM_ENTRANCE) && !(room_type_left & ROOM_HALLWAY) )
            {
                // Need to build upwards
                for (var fy = 32*2; fy <= 32*5; fy += 32 )
                {
                    place_unique( ofx + 0, ofy + fy, blox32x );
                }
            }
            // Add a wall to the left
            if ( !(room_type & ROOM_EXIT) && !(room_type_right & ROOM_HALLWAY) )
            {
                // Need to build upwards
                for (var fy = 32*2; fy <= 32*5; fy += 32 )
                {
                    place_unique( ofx + subroom_w - 32, ofy + fy, blox32x );
                }
            }
        }
        if ( room_type & ROOM_CLIMB_UP )
        {
            // Need to build upwards
            for (var fy = 0; fy < 32*3; fy += 32 )
            {
                place_unique( ofx + 32*2, ofy + fy, blox32x );
                place_unique( ofx + 32*6, ofy + fy, blox32x );
            }
            // If it's a hallway, need to empty out the top ceiling and give a step
            if ( room_type & ROOM_HALLWAY )
            {
                for (var fx = 32*3; fx <= 32*5; fx += 32 )
                {
                    var inst = null;
                    do
                    {   // Do it via checking position at each piece of the loop
                        inst = instance_position( ofx + fx, ofy + 32*1, bloxBase );
                        delete(inst);
                    }
                    until (inst == null);
                }
                // Need to create one platform for the player to jump off of
                if ( room_type & ROOM_CLIMB_DOWN )
                {
                    // But we have to do it in the second pass (climb down)
                }
                // Don't block off the floor :)
                else
                {
                    // Create ground to jump off of
                    var width = choose(1,2,3);
                    var sx = choose(3,4,5);
                    for (var fx = sx; fx < sx+width; ++fx)
                    {
                        place_unique( ofx + 32*fx, ofy + 32 * 5, blox32x );
                    }
                }
            }
            // If we're a tube, need to extend the walls
            else if ( room_type & ROOM_CLIMB_DOWN )
            {
                for (var fy = 32*3; fy < 32*5; fy += 32 )
                {
                    place_unique( ofx + 32*2, ofy + fy, blox32x );
                    place_unique( ofx + 32*6, ofy + fy, blox32x );
                }
            }
            // If we're only a cap
            else
            {
                // Need to build the cap that blocks up
                for (var fx = 32*3; fx <= 32*5; fx += 32 )
                {
                    place_unique( ofx + fx, ofy + 32*3, blox32x );
                }
            }
        }
        if ( room_type & ROOM_CLIMB_DOWN )
        {
            // Need to build downards
            var sy = 32*5;
            if ( room_type & ROOM_HALLWAY ) sy = 32*6; // Push down one block if a hallway
            for (var fy = sy; fy < subroom_h; fy += 32 )
            {
                place_unique( ofx + 32*2, ofy + fy, blox32x );
                place_unique( ofx + 32*6, ofy + fy, blox32x );
            }
            // If it's a hallway, need to empty out the floor
            if ( room_type & ROOM_HALLWAY )
            {
                for (var fx = 32*3; fx <= 32*5; fx += 32 )
                {
                    var inst = null;
                    do
                    {   // Do it via checking position at each piece of the loop
                        inst = instance_position( ofx + fx, ofy + 32*6, bloxBase );
                        delete(inst);
                    }
                    until (inst == null);
                }
                // Need to create one platform for the player to jump off of
                if ( room_type & ROOM_CLIMB_UP )
                {
                    place_unique( ofx + 32*choose(3,5), ofy + 32 * 6, blox32x );
                }
            }
            // If we're only a cap
            else if ( !(room_type & ROOM_CLIMB_UP) )
            {
                // Need to build downards
                for (var fx = 32*3; fx <= 32*5; fx += 32 )
                {
                    place_unique( ofx + fx, ofy + 32*4, blox32x );
                }
            }
        }
        
    }
}

