var pl = GetActivePlayer();
if (exists(pl) && place_meeting(x,y,pl))
{
    // Check for player outside of room
    if (pl.x > room_width || pl.x < 0)
    {
        global._transition_source = room;
        global._transition_dy = pl.y - (y+96);
        
        // Then we go to the next room:
        transition_to(target);
    }
}

