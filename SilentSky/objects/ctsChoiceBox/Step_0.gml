if ( !input_fadeout )
{
    image_alpha += Time.dt * 3.0;
    if (image_alpha > 1) image_alpha = 1;
}
else
{
    image_alpha -= Time.dt * 3.0;
    if ( image_alpha <= 0.0 ) {
        delete(this);
        exit;
    }
}

if ( image_alpha > 0.5 )
{
    current_display_count += Time.dt * 60;
}

// If the done button showing?
if ( image_alpha >= 1.0 )
{
    Controls_Update(true);
    
    // Do selection changes
    if (!input_fadeout)
    {
        if ( yAxis > 0.8 && yAxisPrev < 0.8 )
        {
            display_choice += 1;
            audio_play_sound(sndUiMenuChange, 50, false);
        }
        else if ( yAxis < -0.8 && yAxisPrev > -0.8 )
        {
            display_choice -= 1;
            audio_play_sound(sndUiMenuChange, 50, false);
        }
    }
    display_choice = clamp(display_choice, 0, input_choice_count-1);
    
    // Do confirm selection
    if ( xButton > 0.8 && xButtonPrev < 0.8 )
    {
        if (!input_fadeout)
        {
            input_fadeout = true;
            audio_play_sound(sndUiMenuSelect, 50, false);
        }
    }  
}
else
{
    Controls_Update(false);
}   
