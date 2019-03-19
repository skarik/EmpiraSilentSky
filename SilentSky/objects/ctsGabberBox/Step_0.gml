// Fade in and out
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

// Count time textbox was on screen
current_display_time += Time.dt;

// Step through string and display characters
if ( current_display_delay <= 0.0 )
{
    var previous_display_count = current_display_count;
    if ( image_alpha > 0.5 )
    {
        current_display_count += Time.dt * 60;
    }
    
    // Limit the count
    current_display_count = min( string_length(display_text), current_display_count );
    var index = floor(current_display_count);
    
    // We went to a new character?
    for (var i = previous_display_count; i < index; ++i)
    {
        // Do character-based updates
        if ( display_flags[ceil(i)] == ord("w") )
            current_display_delay = 0.5; // Wait for five seconds           
    }
}
else
{
    current_display_delay -= Time.dt;
}

// Has the counter hit the end?
if (current_display_count >= string_length(display_text))
{
    done_alpha += Time.dt * 4.0;
    if (done_alpha > 1) done_alpha = 1;
}

// If the done button showing?
if ( done_alpha > 0.5 )
{
    Controls_Update(true);
    if ( xButton > 0.8 && xButtonPrev < 0.8 )
    {
        if (!input_fadeout)
        {
            input_fadeout = true;
            audio_play_sound(sndUiMsgBlip, 50, false);
        }
    }   
}
else
{
    Controls_Update(false);
}   

// Fade automatically over time if the option is given
if ( input_disable || !input_priority )
{
    if ( current_display_time > max(1.0, string_length(display_text) / 15) )
    {
        input_fadeout = true;
    }
}
if ( input_autoclose )
{
    if ( current_display_count >= string_length(display_text) - 2 &&
         current_display_time > max(0.5, string_length(display_text) / 50) )
    {
        input_fadeout = true;
    }
}

