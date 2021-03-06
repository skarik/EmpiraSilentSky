switch (state)
{
case 0:	// Fade in is over...
    if (!iexists(ctsFadeInLongBlack))
    {
        state = 1;
        timer = 0;
    }
    break;
case 1: // Play music, continue.
    audio = audio_play_sound(musIntroductory,100,false);
    state = 2;
    break;
    
case 2:
    // Show logo
    inew(ctsLogoPopup); // Deletes self in Step, so is effectively skipped.
    state = 3;
    break;
case 3:
    if (!iexists(ctsLogoPopup)) {
        state = 4; // Logo doesn't exist, we go to a delay
        timer = 0;
    }
    break;
    
    
case 4: // Delay for 1 second
    timer += Time.dt;
    if ( timer > 1.0 ) {
        state = 5;
        // Show game title
        inew(ctsVAPopup);
    }
    break;
case 5:
    if (!iexists(ctsVAPopup)) {
        state = 6;
        timer = 0;
    }
    break;
    
case 6: // Delay for 1 second
    timer += Time.dt;
    if ( timer > 1.0 ) {
        state = 7;
        // Show game title
        inew(ctsTitlePopup);
    }
    break;
case 7:
    if (!iexists(ctsTitlePopup)) {
        state = 8;
        timer = 0;
    }
    break;
    
case 8:
    if (audio != null && audio_is_playing(audio))
    {
        audio_sound_gain(audio, 0.0, 1000);
    }
    state = 9;
    break;
case 9: // Delay for 1 second
    timer += Time.dt;
    if ( timer > 1.0 ) {
        state = 10;
    }
    break;
    
case 10:
    idelete(this);
    inew(ctsLibrary1);
    audio_stop_sound(audio);
    
    state = 11;
    break;
    
}

if (controlUpdateAndCheckAny() && state != 7)
{
    idelete(ctsLogoPopup);
    state = 8;
}

