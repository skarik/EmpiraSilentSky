var door = instance_nearest(x,y,doorBase);
with (door)
{
    open = !open;
    if ( open )
    {
        // Play the open sound
        sound_play_at(x+sprite_width/2,y+sprite_height/2,sndDoor0_Open);
    }
    else
    {
        // Play the open sound
        sound_play_at(x+sprite_width/2,y+sprite_height/2,sndDoor0_Close);
    }
}
if (exists(door))
{
    image_index = door.open;
}


