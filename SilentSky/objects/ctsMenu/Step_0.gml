controlUpdate(1);

// Fade in over time
gain = min(1.0, gain + Time.dt * 0.1);

// If anything is pressed...
if (true)// || jumpButton || atkButton || dodgeButton || specialButton || prevCharButton || nextCharButton || tabButton || escButton)
{
    //if (iexists(floaterLogo))
    //    floaterLogo.fadeout = true;
    if ( !iexists(menuOptions) && iexists(floaterLogo) && !floaterLogo.fadeout )
        inew(menuOptions);
}

// Fade out the music
if (iexists(floaterLogo) && floaterLogo.fadeout)
{
    audio_sound_gain(music, floaterLogo.image_alpha*gain, 0);
}
else
{
    audio_sound_gain(music, gain, 0);
}

// Stop music, go to next room
if (!iexists(floaterLogo))
{
    audio_stop_sound(music);
    room_goto_next();
}

