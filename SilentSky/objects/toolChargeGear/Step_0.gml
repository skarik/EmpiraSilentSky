if (PowerFlag_Get(target))
{
    image_angle += 30 * Time.dt * dir;
    
    var ex = false;
    with (object_index) {
        if (sfx_geartock != null) ex = true;
    }
    if (!ex)
    {
        sfx_geartock = sound_play_at( room_width/2,room_height + 500, sndGeartockLoop );
        sfx_geartock.loop = true;
        sfx_geartock.falloff_end = 5000;
        sfx_geartock.falloff_start = 700;
        sfx_geartock.gain = 0.7;
        sfx_geartock.pitch = 0.8;
    }
}

