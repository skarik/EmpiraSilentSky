

switch (state)
{
case 0:
    if (!exists(ctsFadeInLongBlack))
    {
        state = 1;
        timer = 0;
    }
    break;
case 1:
    audio = audio_play_sound(musIntroductory,100,false);
    state = 2;
    break;
    
case 2:
    // Show logo
    new(ctsLogoPopup);
    state = 3;
    break;
case 3:
    if (!exists(ctsLogoPopup)) {
        state = 4; // Logo doesn't exist, we go to a delay
        timer = 0;
    }
    break;
    
    
case 4: // Delay for 1 second
    timer += Time.dt;
    if ( timer > 1.0 ) {
        state = 5;
        // Show game title
        new(ctsVAPopup);
    }
    break;
case 5:
    if (!exists(ctsVAPopup)) {
        state = 6;
        timer = 0;
    }
    break;
    
case 6: // Delay for 1 second
    timer += Time.dt;
    if ( timer > 1.0 ) {
        state = 7;
        // Show game title
        new(ctsTitlePopup);
    }
    break;
case 7:
    if (!exists(ctsTitlePopup)) {
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
    delete(this);
    new(ctsLibrary1);
    audio_stop_sound(audio);
    
    state = 11;
    break;
    
}

if (Controls_UpdateAndCheckAny())
{
    delete(ctsLogoPopup);
    state = 8;
}

