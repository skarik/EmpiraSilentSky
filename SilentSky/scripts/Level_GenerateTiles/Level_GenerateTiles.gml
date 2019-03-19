/// @description  Level_GenerateTiles(width,height,block_width,block_height,cel_block_width,cel_block_height)
/// @param width
/// @param height
/// @param block_width
/// @param block_height
/// @param cel_block_width
/// @param cel_block_height

var w = argument0;
var h = argument1;
var bw = argument2;
var bh = argument3;
var cb_w = argument4;
var cb_h = argument5;
var subroom_w = bw * cb_w;
var subroom_h = bh * cb_h;

// Loop through each room and kick ass
for (var cx = 0; cx < w; ++cx)
{
    for (var cy = 0; cy < h; ++cy)
    {
        var ofx = x + cx * subroom_w;
        var ofy = y + cy * subroom_h;
        
        var cel_bitmap;
        for (var i = 0; i < cb_w*cb_h; ++i ) cel_bitmap[i] = COL_FILLED;
        
        var room_type = lvTypes[cx + cy*w];
        // For filled rooms, we don't do anything
        if (room_type & ROOM_FILLED)
        {
        
        }
        // For surface rooms, we start in the corner and keep tracing down to clear
        else if (room_type & ROOM_SURFACE)
        {
        
        }
        // For any other type of room...
        else
        {
            // Now we go to a spot that we know will be open (4,4) and flood fill from it
            var flood_pen_x = 4;
            var flood_pen_y = 4;
            // But it may not actually be open because it's a vertical room
            if (room_type & ROOM_CLIMB_UP) flood_pen_y = 0;
            if (room_type & ROOM_CLIMB_DOWN) flood_pen_y = 7;
            // But it may not be open, so we move until it is open
            while (position_meeting(ofx + flood_pen_x*32, ofy + flood_pen_y*32, bloxBase)) ++flood_pen_x;
            
            // Set first pixel to open
            cel_bitmap[flood_pen_x + flood_pen_y*cb_w] = COL_EMPTY;
            
            // Now we begin the floodfill
            var flood_list_x;
            var flood_list_y;
            flood_list_x[0] = flood_pen_x;
            flood_list_y[0] = flood_pen_y;
            var flood_list_size = 1;
            var flood_list_current = 0;
            // Floodfill runs until there's nothing in the list to fill in
            while (flood_list_current != flood_list_size)
            {
                // Update pen
                flood_pen_x = flood_list_x[flood_list_current];
                flood_pen_y = flood_list_y[flood_list_current];
            
                // Look at each direction and add them
                for (var dir = 0; dir < 4; ++dir)
                {
                    var tx, ty, tunique;
                    tunique = true;
                    // Generate directional check
                    tx = flood_pen_x;
                    ty = flood_pen_y;
                         if (dir == 0) tx += 1;
                    else if (dir == 1) tx -= 1;
                    else if (dir == 2) ty += 1;
                    else if (dir == 3) ty -= 1;
                    // Check the range of coordinate, skip if out of range
                    if (tx < 0 || tx >= cb_w || ty < 0 || ty >= cb_h ) continue;
                    // Search the list to make sure it's not already in it   
                    for (var i = 0; i < flood_list_size; ++i )
                    {
                        if (tx == flood_list_x[i] && ty == flood_list_y[i]) 
                        {
                            tunique = false;
                            break;
                        }
                    }
                    // If it's still unique, then we add it to the list to check spread from next
                    if ( tunique )
                    {
                        // Perform collision check
                        if ( position_meeting(ofx + tx*32, ofy + ty*32, blox32x) )
                        {
                            // If it's a collision, then we don't to color it, or use it for the floodfille
                        }
                        else
                        {
                            // Color this pixel
                            cel_bitmap[tx + ty*cb_w] = COL_EMPTY;
                        
                            // Add it to the floodfill check
                            flood_list_x[flood_list_size] = tx;
                            flood_list_y[flood_list_size] = ty;
                            flood_list_size += 1;
                        }
                    }
                }
            
                // Go to the next one
                flood_list_current += 1;
            }
            
            // The open area is now properly filled
        }
        
        // Loop through the result bitmap and add collisions based on that
        for ( var tx = 0; tx < cb_w; ++tx )
        {
            for ( var ty = 0; ty < cb_h; ++ty )
            {
                // Layout is:
                // 0 1 2
                // 3 4 5
                // 6 7 8
                
                // Grabe center cell
                var cel4 = cel_bitmap[tx + ty*cb_w];
                
                // Sample edges
                var cel1 = cel4;
                if ( ty > 0 )
                    cel1 = cel_bitmap[tx + (ty-1)*cb_w];
                var cel3 = cel4;
                if ( tx > 0 )
                    cel3 = cel_bitmap[(tx-1) + ty*cb_w];
                var cel5 = cel4;
                if ( tx < cb_w-1 )
                    cel5 = cel_bitmap[(tx+1) + ty*cb_w];
                var cel7 = cel4;
                if ( ty < cb_h-1 )
                    cel7 = cel_bitmap[tx + (ty+1)*cb_w];
                
                // Build autotiles
                if ( cel4 )
                {
                    // Top row of tiles
                         if ( !cel1 && !cel3 &&  cel5 &&  cel7 )
                        tile_add(tilesetMetal, 32,0, 32,32, ofx+tx*32,ofy+ty*32, 10);
                    else if ( !cel1 &&  cel3 &&  cel5 &&  cel7 )
                        tile_add(tilesetMetal, choose(64,96),0, 32,32, ofx+tx*32,ofy+ty*32, 10);
                    else if ( !cel1 &&  cel3 && !cel5 &&  cel7 )
                        tile_add(tilesetMetal, 128,0, 32,32, ofx+tx*32,ofy+ty*32, 10);
                    else if ( !cel1 && !cel3 && !cel5 &&  cel7 ) {
                        if ( choose(0,1) ) { // Sometimes replace it with the crate sprite
                            tile_add(tilesetMetal, 32,0,  16,32, ofx+tx*32,ofy+ty*32, 10);
                            tile_add(tilesetMetal, 144,0, 16,32, ofx+tx*32+16,ofy+ty*32, 10);
                        }
                        else
                            tile_add(tilesetMetal, 0,96, 32,32, ofx+tx*32,ofy+ty*32, 10);
                    }
                    // Middle row of tiles
                    else if (  cel1 && !cel3 &&  cel5 &&  cel7 )
                        tile_add(tilesetMetal, 32,choose(32,64), 32,32, ofx+tx*32,ofy+ty*32, 10);
                    else if (  cel1 &&  cel3 && !cel5 &&  cel7 )
                        tile_add(tilesetMetal, 128,choose(32,64), 32,32, ofx+tx*32,ofy+ty*32, 10);
                    // Open middle row
                    else if ( !cel1 && !cel3 &&  cel5 && !cel7 ) {
                        tile_add(tilesetMetal, 32,0,   32,16, ofx+tx*32,ofy+ty*32, 10);
                        tile_add(tilesetMetal, 32,112, 32,16, ofx+tx*32,ofy+ty*32+16, 10);
                    }
                    else if ( !cel1 &&  cel3 && !cel5 && !cel7 ) {
                        tile_add(tilesetMetal, 128,0,   32,16, ofx+tx*32,ofy+ty*32, 10);
                        tile_add(tilesetMetal, 128,112, 32,16, ofx+tx*32,ofy+ty*32+16, 10);
                    }
                    // Bottom row of tiles
                    else if (  cel1 && !cel3 &&  cel5 && !cel7 )
                        tile_add(tilesetMetal, 32,96, 32,32, ofx+tx*32,ofy+ty*32, 10);
                    else if (  cel1 &&  cel3 &&  cel5 && !cel7 )
                        tile_add(tilesetMetal, choose(64,96),96, 32,32, ofx+tx*32,ofy+ty*32, 10);
                    else if (  cel1 &&  cel3 && !cel5 && !cel7 )
                        tile_add(tilesetMetal, 128,96, 32,32, ofx+tx*32,ofy+ty*32, 10);
                    else if (  cel1 && !cel3 && !cel5 && !cel7 ) {
                        tile_add(tilesetMetal, 32,96,  16,32, ofx+tx*32,ofy+ty*32, 10);
                        tile_add(tilesetMetal, 144,96, 16,32, ofx+tx*32+16,ofy+ty*32, 10);
                    }
                    // Internal tiles
                    else if (  cel1 &&  cel3 &&  cel5 &&  cel7 )
                    {
                        // Sample edges
                        var cel0 = cel4;
                        if ( tx > 0 && ty > 0 )
                            cel0 = cel_bitmap[(tx-1) + (ty-1)*cb_w];
                        var cel2 = cel4;
                        if ( tx < cb_w-1 && ty > 0 )
                            cel2 = cel_bitmap[(tx+1) + (ty-1)*cb_w];
                        var cel6 = cel4;
                        if ( tx > 0 && ty < cb_h-1 )
                            cel6 = cel_bitmap[(tx-1) + (ty+1)*cb_w];
                        var cel8 = cel4;
                        if ( tx < cb_w-1 && ty < cb_h-1 )
                            cel8 = cel_bitmap[(tx+1) + (ty+1)*cb_w];
                    
                        // Check each corner to see if should add
                         if ( !cel0 )
                            if ( cel2 && cel6 && cel8 )
                                tile_add(tilesetMetal, 96,64, 32,32, ofx+tx*32,ofy+ty*32, 9);
                            else
                                tile_add(tilesetMetal, 96,64, 16,16, ofx+tx*32,ofy+ty*32, 9);
                         if ( !cel2 )
                            if ( cel0 && cel6 && cel8 )
                                tile_add(tilesetMetal, 64,64, 32,32, ofx+tx*32,ofy+ty*32, 9);
                            else
                                tile_add(tilesetMetal, 80,64, 16,16, ofx+tx*32+16,ofy+ty*32, 9);
                         if ( !cel6 )
                            if ( cel0 && cel2 && cel8 )
                                tile_add(tilesetMetal, 96,32, 32,32, ofx+tx*32,ofy+ty*32, 9);
                            else
                                tile_add(tilesetMetal, 96,48, 16,16, ofx+tx*32,ofy+ty*32+16, 9);
                         if ( !cel8 )
                            if ( cel0 && cel2 && cel6 )
                                tile_add(tilesetMetal, 64,32, 32,32, ofx+tx*32,ofy+ty*32, 9);
                            else
                                tile_add(tilesetMetal, 80,48, 16,16, ofx+tx*32+16,ofy+ty*32+16, 9);
                        // Catch-all result
                        tile_add(tilesetMetal, 0,choose(32,32,32,64), 32,32, ofx+tx*32,ofy+ty*32, 10);
                    }
                    // Catch-all result
                    else
                        tile_add(tilesetMetal, 0,choose(32,32,32,64), 32,32, ofx+tx*32,ofy+ty*32, 10);
                }
            }
        }
        
        // Loop through the bitmap, find floors, and add stuff on top
        for ( var tx = 0; tx < cb_w; ++tx )
        {
            // Start with bottom Y, and move up until we hit the floor
            for ( var ty = cb_h - 1; ty >= 0; --ty )
            {
                // Grabe center cell
                var cel4 = cel_bitmap[tx + ty*cb_w];
                // The floor has been found
                if ( cel4 == COL_EMPTY )
                {
                    if ( ty == cb_h - 1 ) break; // Invalid floor type
                
                    // Place junk
                    var choice = choose(0,1,2,3,4,5,6,7,8,9);
                    if ( choice == 1 )
                    {   // Large loopable junk
                        for ( ; ty > 0 && cel_bitmap[tx + ty*cb_w] != COL_FILLED; --ty )
                        {   // Add stuff going up to the ceiling
                            tile_add(tilesetMetal, 160,choose(0,32), 32,32, ofx+tx*32,ofy+ty*32, 12);
                        }
                    }
                    else if ( choice == 2 )
                    {
                        // Large loopable junk again, but darker
                        for ( ; ty > 0 && cel_bitmap[tx + ty*cb_w] != COL_FILLED; --ty )
                        {   // Add stuff going up to the ceiling
                            tile_add(tilesetMetal, 160,choose(64,96), 32,32, ofx+tx*32,ofy+ty*32, 12);
                        }
                    }
                    else if ( choice == 3 )
                    {
                        // Large 1x1 junk
                        tile_add(tilesetMetal, 192,0, 32,32, ofx+tx*32,ofy+ty*32, 12);
                    }
                    else if ( choice == 4 )
                    {
                        // Small 1x1 junk
                        tile_add(tilesetMetal, 224,0, 32,32, ofx+tx*32,ofy+ty*32, 12);
                    }
                    else if ( choice == 5 && choose(0,0,1) )
                    {
                        // Large 2x2 junk (rare)
                        tile_add(tilesetMetal, 0,192, 64,64, ofx+tx*32-32,ofy+ty*32-32, 12);
                    }
                    
                    // We're done here w/ this loop
                    break;
                }
            }
        }
        
        // Loop through the bitmap, find walls, and add shit to them
        for ( var tx = 0; tx < cb_w; ++tx )
        {
            // Start with bottom Y, and move up until we hit the floor
            for ( var ty = 0; ty < cb_h; ++ty )
            {
                // Grabe center cell
                var cel4 = cel_bitmap[tx + ty*cb_w];
                // The floor has been found
                if ( cel4 == COL_EMPTY )
                {
                    // Place junk
                    var choice = choose(0,1,2,3,4,5,6,7,8,9);
                    if ( choice == 0 )
                    {
                        // Wall panel 0
                        tile_add(tilesetMetal, 192,64, 32,32, ofx+tx*32,ofy+ty*32, 14);
                    }
                    else if ( choice == 1 )
                    {
                        while ( ty < cb_h && cel_bitmap[tx + ty*cb_w] == COL_EMPTY )
                        {
                            // Wall panel 0 column
                            tile_add(tilesetMetal, 192,64, 32,32, ofx+tx*32,ofy+ty*32, 14);
                            ty += 1;
                        }
                    }
                    else if ( choice == 2 )
                    {
                        // Wall panel 1
                        tile_add(tilesetMetal, 192,96, 32,32, ofx+tx*32,ofy+ty*32, 14);
                    }
                    else if ( choice == 3 )
                    {
                        while ( ty < cb_h && cel_bitmap[tx + ty*cb_w] == COL_EMPTY )
                        {
                            // Wall panel 1 column
                            tile_add(tilesetMetal, 192,96, 32,32, ofx+tx*32,ofy+ty*32, 14);
                            ty += 1;
                        }
                    }
                    else if ( choice == 4 )
                    {
                        while ( tx < cb_w && cel_bitmap[tx + ty*cb_w] == COL_EMPTY )
                        {
                            // Wall panel 1 row
                            tile_add(tilesetMetal, 192,96, 32,32, ofx+tx*32,ofy+ty*32, 14);
                            tx += 1;
                        }
                        break;
                    }
                    else if ( choice == 5 )
                    {
                        // Wall panel 2
                        tile_add(tilesetMetal, 224,96, 32,32, ofx+tx*32,ofy+ty*32, 14);
                    }
                    else if ( choice == 6 )
                    {
                        while ( tx < cb_w && cel_bitmap[tx + ty*cb_w] == COL_EMPTY )
                        {
                            // Wall panel 2 row
                            tile_add(tilesetMetal, 224,96, 32,32, ofx+tx*32,ofy+ty*32, 14);
                            tx += 1;
                        }
                        break;
                    }
                    else if ( choice == 7 && choose(0,1) )
                    {
                        // Wall panel 3 (rare)
                        tile_add(tilesetMetal, 224,64, 32,32, ofx+tx*32,ofy+ty*32, 14);
                    }
                    else if ( choice == 8 && choose(0,0,0,1) )
                    {
                        // Signage 2x1
                        tile_add(tilesetMetal, 0,128, 64,32, ofx+tx*32,ofy+ty*32, 13);
                    }
                }
            }
        }
        
        // Loop through the bitmap, find ceilings, and add shit to them
        for ( var tx = 0; tx < cb_w; ++tx )
        {
            // Start with top Y, and move down until we hit the floor
            for ( var ty = 0; ty < cb_h; ++ty )
            {
                // Grabe center cell
                var cel4 = cel_bitmap[tx + ty*cb_w];
                // The floor has been found
                if ( cel4 == COL_EMPTY )
                {
                    if ( ty == 0 ) break; // Invalid ceiling type
                    
                    // Place junk
                    var choice = choose(0,1,2,3,4,5,6,7,8,9);
                    if ( choice == 0 )
                    {
                        // Ceiling item 0
                        tile_add(tilesetMetal, 0,160, 32,32, ofx+tx*32,ofy+ty*32, 12);
                    }
                    else if ( choice == 1 && choose(0,1) )
                    {
                        // Ceiling item 1 (rare)
                        tile_add(tilesetMetal, 32,160, 32,32, ofx+tx*32,ofy+ty*32, 12);
                    }
                    
                    // We're done here w/ this loop
                    break;
                }
            }
        }
        
    }
}

