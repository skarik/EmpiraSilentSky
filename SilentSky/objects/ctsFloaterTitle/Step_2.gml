x = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2;
y = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2;

gain = min(1.0, gain + Time.dt * 0.1);
audio_sound_gain(music, gain, 0);

if (image_alpha > 0.75 && controlUpdateAndCheckAny())
{
    if (!fadeout)
    {
        fadeout = true;
        //audio_play_sound(sndUiFail2, 50, false);
    }
}

if (!fadeout)
{
    image_alpha += Time.dt;
    if ( image_alpha >= 1.0 )
    {
        fade_delay += Time.dt * 0.2;
    }
}
else
{
    image_alpha -= Time.dt;
    if (image_alpha <= 0.0) 
    {
		if (room_next(room) != rm_menu && room_next(room) != rm_librarian_0)
		{
			audio_stop_sound(music);
		}
        room_goto_next();
    }
}
image_alpha = clamp(image_alpha, 0, 1);

