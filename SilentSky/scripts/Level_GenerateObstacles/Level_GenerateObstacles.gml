/// @description  Level_GenerateObstacles(width,height,cel_width,cel_height)
/// @param width
/// @param height
/// @param cel_width
/// @param cel_height

var w = argument0;
var h = argument1;
var subroom_w = argument2;
var subroom_h = argument3;

// First pass obstacles (need damage dealing)
if ( playerInventory.sword || playerInventory.gun )
{
    // Loop through each room and kick ass
    for (var cx = 0; cx < w; ++cx)
    {
        for (var cy = 0; cy < h; ++cy)
        {
            var ofx = x + cx * subroom_w;
            var ofy = y + cy * subroom_h;
            
            var room_type = lvTypes[cx + cy*w];
            // Place goo walls in hallways
            if ( room_type & ROOM_HALLWAY && !(room_type & ROOM_CLIMB_UP) && !(room_type & ROOM_CLIMB_DOWN) && choose(0,0,0,0,1) )
            {
                place_unique( ofx + 32*4, ofy + 32*2, blox32x );
                place_unique( ofx + 32*4, ofy + 32*3, bloxD32x96_Goo );
            }
            
            // Place enemies in hallways
            if ( room_type & ROOM_HALLWAY && !(room_type & ROOM_ENTRANCE) && !(room_type & ROOM_CLIMB_DOWN) )
            {
                // Start at 25%
                var spawn_chance = 0.25;
                // lvGenerosity is 0, then we want to keep spawn chance the same.
                // Positive generasity decreases the spawn chance. Negative increases the spawn chance.
                spawn_chance *= clamp(1 - lvGenerosity * 0.5,0,3.5);
                if (random(1.0) < spawn_chance)
                {
                    var tx = ofx + 32*choose(1,2,3) + 16;
                    var ty = ofy + 32*5;
                    if ( !position_meeting(tx,ty,bloxBase) )
                    {
                        Level_MakeEnemy( tx, ty );
                    }
                }
            }
            
            // Place one-way doors
            if ( room_type & ROOM_EXIT && (random(1.0) < clamp((levelManager.lvAreaSize-1.0)/4.0,0,1)) )
            {
                // Open up the placement area
                for (var tx = 32*5; tx <= 32*7; tx += 32)
                {
                    for (var ty = 32*3; ty <= 32*5; ty += 32)
                    {
                        var inst = null;
                        do
                        {   // Do it via checking position at each piece of the loop
                            inst = instance_position( ofx + tx + 16, ofy + ty + 16, bloxBase );
                            idelete(inst);
                        }
                        until (inst == null);
                    }
                }
                
                // Create the door
                place_unique( ofx + 32*7 + 16, ofy + 32*3, doorOnewayLevel );
            }
        }
    }
}

