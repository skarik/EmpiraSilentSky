event_inherited();

// Door is closed
if ( !open )
{   
    // If player is to the left
    if ( objPlayerMain.x < x )
    {
        // Then we open when the player is in range
        if ( abs(objPlayerMain.x - x) < 70 && abs(objPlayerMain.y - (y + sprite_height/2)) < 70 )
        {
            open = true;
            // Play the open sound
            sound_play_at(x+sprite_width/2,y+sprite_height/2,sndDoor0_Open);
        }
    }
    else 
    {
        // If player is now to the right, then we clear the world
        if ( !worldCleared && __view_get( e__VW.XView, 0 ) > x )
        {
            worldCleared = true;
            Level_Clear(x+16);
        }
        // If world has been cleared, then we remove self from world when doors are closed
        if ( worldCleared && parta.y == ystart && partb.y == ystart )
        {
            instance_change(doorBase,false);
        }
    }
}
// Door is open
else
{
    // Close when the player walks off
    if ( abs(objPlayerMain.x - x) > 150 )
    {
        open = false;
        // Play the close sound
        sound_play_at(x+sprite_width/2,y+sprite_height/2,sndDoor0_Close);
    }
}

