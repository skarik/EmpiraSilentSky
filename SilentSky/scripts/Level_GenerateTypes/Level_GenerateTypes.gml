/// @description  Level_GenerateTypes(width,height)
/// @param width
/// @param height

var w = argument0;
var h = argument1;

// Set up generation effects
var cannot_use_vertical = false;
cannot_use_vertical = ( !playerInventory.canister_glue || !playerInventory.gun || playerInventory.ammo_glue <= 20 );

// Create the entrance
var cx, cy, rmh, reh;
cx = 0;
cy = entranceHeight;
lvEntranceCel = cy;
lvTypes[cx + cy*w] = ROOM_ENTRANCE | ROOM_HALLWAY;

// Count all the selections
var c_hallways = 0;
var c_climbs = 0;
var c_ramps = 0;
var c_storage = 0;

// Now, move across the room to make the exit
var move_choice = GEN_HALLWAY;
while (true)
{
    // Begin selection:
    while (true)
    {
        // If the player has no glue gun, then we only gen hallway or down
        if ( cannot_use_vertical )
        {
            if ( move_choice == GEN_DOWN )
                move_choice = GEN_HALLWAY; // If previous move was a pit, then do a hallway next.
            else
                move_choice = choose(GEN_HALLWAY,GEN_HALLWAY,GEN_HALLWAY,GEN_DOWN,GEN_RAMP_UP,GEN_RAMP_DOWN,GEN_STORAGE);
        }
        // Otherwise, bets are fuckin off bois.
        else
        {
            move_choice = choose(GEN_HALLWAY,GEN_UP,GEN_DOWN);
        }
        
        // Check selection
        if (move_choice == GEN_UP || move_choice == GEN_DOWN)
        {
            // If in the range of climbs, we're still okay
            if ((c_climbs < maxClimbs && !cannot_use_vertical) || (c_climbs < maxClimbsNoVert && cannot_use_vertical))
            {
                c_climbs++;
                break; // Selection made
            }
        }
        else if (move_choice == GEN_RAMP_UP || move_choice == GEN_RAMP_DOWN)
        {
            // Check we're not at max count for ramps and not out of range
            if (c_ramps < maxRamps && cx <= w-2)
            {   
                if ((move_choice == GEN_RAMP_UP && cy >= 1) || (move_choice == GEN_RAMP_DOWN && cy <= h-2))
                {
                    c_ramps++;
                    break; // Selection made
                }
            }
        }
        else if (move_choice == GEN_STORAGE)
        {
            // Not too high, close to the edge, or out of storage rooms
            if (c_storage < maxStorage && cx <= w-2 && cy >= 1)
            {
                c_storage++;
                break; // Selection made
            }
        }
        else if (move_choice == GEN_HALLWAY)
        {
            c_hallways++;
            break; // Selection made
        }
    }
    // End movement selection.
    
    
    // Moving to the left
    if (move_choice == GEN_HALLWAY)
    {
        if ( cx < w-1 )
        {   // If not on the far wall, make it a hallway
            lvTypes[cx + cy*w] |= ROOM_HALLWAY | ROOM_MAIN_PATH;
            cx += 1; // Move right
            lvTypes[cx + cy*w] |= ROOM_HALLWAY | ROOM_MAIN_PATH;
        }
        else
        {   // Otherwise, make it an exit, and we're done w/ this loop
            lvTypes[cx + cy*w] |= ROOM_HALLWAY | ROOM_MAIN_PATH;
            lvTypes[cx + cy*w] |= ROOM_EXIT | ROOM_MAIN_PATH;
            lvExitCel = cy;
            break; // We're done with this stage
        }
    }
    // Moving up
    else if (move_choice == GEN_UP)
    {
        if ( cy > 0 )
        {
            // Set previous room to a climb as well
            lvTypes[cx + cy*w] |= ROOM_CLIMB_UP | ROOM_MAIN_PATH;
            cy -= 1; // Move up
            lvTypes[cx + cy*w] |= ROOM_CLIMB_DOWN | ROOM_MAIN_PATH;
        }
    }
    // Moving down
    else if (move_choice == GEN_DOWN)
    {
        if ( cy < h-1 )
        {
            // Set previous room to a climb as well
            lvTypes[cx + cy*w] |= ROOM_CLIMB_DOWN | ROOM_MAIN_PATH;
            cy += 1; // Move down
            lvTypes[cx + cy*w] |= ROOM_CLIMB_UP | ROOM_MAIN_PATH;
        }
    }
    // Making ramps
    else if (move_choice == GEN_RAMP_UP)
    {
        if ( cy > 0 )
        {
            // Set previous room to a climb as well
            lvTypes[(cx+0) + (cy+0)*w] |= ROOM_RAMP_UP | ROOM_HALLWAY;
            lvTypes[(cx+1) + (cy+0)*w] |= ROOM_RAMP_UP;
            lvTypes[(cx+0) + (cy-1)*w] |= ROOM_RAMP_UP;
            lvTypes[(cx+1) + (cy-1)*w] |= ROOM_RAMP_UP | ROOM_HALLWAY;
            cx += 1; cy -= 1; // Move to the ending the ramp
            if ( cx < w-1 )
            {   // If not on the far wall, make it a hallway
                lvTypes[cx + cy*w] |= ROOM_HALLWAY | ROOM_MAIN_PATH;
                cx += 1; // Move right
                lvTypes[cx + cy*w] |= ROOM_HALLWAY | ROOM_MAIN_PATH;
            }
            else
            {   // Otherwise, make it an exit, and we're done w/ this loop
                lvTypes[cx + cy*w] |= ROOM_HALLWAY | ROOM_MAIN_PATH;
                lvTypes[cx + cy*w] |= ROOM_EXIT | ROOM_MAIN_PATH;
                lvExitCel = cy;
                break; // We're done with this stage
            }
        }
    }
    else if (move_choice == GEN_RAMP_DOWN)
    {
        if ( cy < h-1 )
        {
            // Set previous room to a climb as well
            lvTypes[(cx+0) + (cy+0)*w] |= ROOM_RAMP_DOWN | ROOM_HALLWAY;
            lvTypes[(cx+1) + (cy+0)*w] |= ROOM_RAMP_DOWN;
            lvTypes[(cx+0) + (cy+1)*w] |= ROOM_RAMP_DOWN;
            lvTypes[(cx+1) + (cy+1)*w] |= ROOM_RAMP_DOWN | ROOM_HALLWAY;
            cx += 1; cy += 1; // Move to the ending the ramp
            if ( cx < w-1 )
            {   // If not on the far wall, make it a hallway
                lvTypes[cx + cy*w] |= ROOM_HALLWAY | ROOM_MAIN_PATH;
                cx += 1; // Move right
                lvTypes[cx + cy*w] |= ROOM_HALLWAY | ROOM_MAIN_PATH;
            }
            else
            {   // Otherwise, make it an exit, and we're done w/ this loop
                lvTypes[cx + cy*w] |= ROOM_HALLWAY | ROOM_MAIN_PATH;
                lvTypes[cx + cy*w] |= ROOM_EXIT | ROOM_MAIN_PATH;
                lvExitCel = cy;
                break; // We're done with this stage
            }
        }
    }
}

// For the ruins tileset, make special generations
if ( tileset == TILESET_RUINS )
{
    var gen = choose(0,1,2,3,4,5,6);
    if ( gen == 0 )
    {   // Long hallways
        cx = 0;
        cy = floor(random(h));
        for (cx = 0; cx < w; ++cx)
        { 
            lvTypes[cx + cy*w] |= ROOM_HALLWAY;
        }
    }
    else if ( gen == 1 && !cannot_use_vertical )
    {   // Long tubes
        cx = floor(random(w));
        cy = 1;
        for (cy = 1; cy < h-1; ++cy)
        { 
            lvTypes[cx + cy*w] |= ROOM_CLIMB_UP | ROOM_CLIMB_DOWN;
        }
        lvTypes[cx] |= ROOM_CLIMB_DOWN;
        lvTypes[cx + (h-1)*w] |= ROOM_CLIMB_UP;
    }
    else if ( gen == 2&& !cannot_use_vertical )
    {   // Both of the above:
        // Long hallways
        cx = 0;
        cy = floor(random(h));
        for (cx = 0; cx < w; ++cx)
        { 
            lvTypes[cx + cy*w] |= ROOM_HALLWAY;
        }
        // Long tubes
        cx = floor(random(w));
        cy = 1;
        for (cy = 1; cy < h-1; ++cy)
        { 
            lvTypes[cx + cy*w] |= ROOM_CLIMB_UP | ROOM_CLIMB_DOWN;
        }
        lvTypes[cx] |= ROOM_CLIMB_DOWN;
        lvTypes[cx + (h-1)*w] |= ROOM_CLIMB_UP;
    }
}
// Add offshoot rooms if we can
for (cy = 0; cy < h; ++cy)
{
    for (cx = 0; cx < w; ++cx)
    {
        if ( choose(0,0,1) )
        {
            // Is this room unset?
            if ( lvTypes[cx + cy*w] == ROOM_UNSET )
            {
                // Choose a random direction
                var dx = cx + choose(-1,1);
                if (dx < 0) dx = cx + 1;
                if (dx >= w) dx = cx - 1;
                
                // Is that room a valid room?
                var other_room = lvTypes[dx + cy*w];
                if (other_room & ROOM_HALLWAY || other_room & ROOM_CLIMB_DOWN || other_room & ROOM_CLIMB_UP )
                {   // Make both this and the other room a hallway
                    lvTypes[cx + cy*w] |= ROOM_HALLWAY;
                    lvTypes[dx + cy*w] |= ROOM_HALLWAY;
                }
                
                // Room created, let's go to next row
                break;
            }
        }
    }
}

// Finally, go through all the unset room and fill them
for (cx = 0; cx < w; ++cx)
{
    for (cy = 0; cy < h; ++cy)
    {
        if ( lvTypes[cx + cy*w] == ROOM_UNSET )
        {
            lvTypes[cx + cy*w] = ROOM_FILLED;
        }
    }
}

