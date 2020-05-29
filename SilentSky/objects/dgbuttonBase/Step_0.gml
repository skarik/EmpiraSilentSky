if ( !iexists(menuDebug) )
{
    // Hide
    visible = false;
    // Delete self
    idelete(this);
}
else
{
    // Set as visible when debug menu is up.
    visible = true;
    uiMouseX = menuDebug.uiMouseX;
    uiMouseY = menuDebug.uiMouseY;
    depth = -11;
    
    // Update hover states
    if ( uiMouseX > x && uiMouseX < x+uiWidth && uiMouseY > y && uiMouseY < y+uiHeight )
    {
        uiHovering = true;
    }
    else
    {
        uiHovering = false;
    }

    // We fading?
    if ( uiHovering )
    {
        // Check click
        if ( mouse_check_button_pressed(mb_left) )
        {   // Perform user-defined event
            event_user(0);
            // Play sound for confirmation
            audio_play_sound(sndUiChargeLoop, 90, false);
        }
    }
}

