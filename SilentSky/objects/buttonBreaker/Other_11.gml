if (!PowerFlag_Get(target))
{
    // Play the open sound
    sound_play_at(x+sprite_width/2,y+sprite_height/2, sndSwitch);
    // Enable the power
    PowerFlag_Set(target, true);
}
image_index = 0;

