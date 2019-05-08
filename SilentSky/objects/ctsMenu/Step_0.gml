Controls_Update(1);

// Fade in over time
gain = min(1.0, gain + Time.dt * 0.1);

// If anything is pressed...
if (true || zButton || xButton || aButton || sButton || lButton || rButton || tabButton || escButton)
{
    //if (exists(floaterLogo))
    //    floaterLogo.fadeout = true;
    if ( !exists(menuOptions) && exists(floaterLogo) && !floaterLogo.fadeout )
        new(menuOptions);
}

// Fade out the music
if (exists(floaterLogo) && floaterLogo.fadeout)
{
    audio_sound_gain(music, floaterLogo.image_alpha*gain, 0);
}
else
{
    audio_sound_gain(music, gain, 0);
}

// Stop music, go to next room
if (!exists(floaterLogo))
{
    audio_stop_sound(music);
    room_goto_next();
}

