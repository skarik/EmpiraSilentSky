
x = __view_get( e__VW.XView, 0 );
y = __view_get( e__VW.YView, 0 );

// Update controls
if ( image_alpha > 0.95 )
    controlUpdate(1);
else
    controlUpdate(0);

if (fade)
{
    image_alpha -= Time.dt * 2.0;
    if (image_alpha < 0)
    {
        delete(this);
    }
}
else
{
    // Fade in
    image_alpha = min( image_alpha + Time.dt * 2.0, 1.0 );

    // Do menu sleection change
    if ( menu_isAskingForNewControl == false )
    {
        if ( abs(yAxis) > 0.8 && abs(yAxisPrev) <= 0.8 )
        {
            menu_selection += sign(yAxis);
            menu_selection = clamp(menu_selection, -3,9);
            audio_play_sound(sndUiMenuChange,30,false);
        }
        // Do button press
        if ( xButton.pressed || zButton.pressed )
        {
            var i = menu_selection;
            if ( i == -3 )
            {   // Accept. Save the settings, and continue
                Settings_ControlSave();
                audio_play_sound(sndUiMenuSelect, 90, false);
                
                // Fade out everything
                if (exists(floaterLogo))
                    floaterLogo.fadeout = true;
                fade = true; // Fade out now
            }
            else if ( i == -2 )
            {
                // Reset controls
                Settings_ControlDefaults();
                audio_play_sound(sndUiFail1, 90, false);
            }
            else if ( i == -1 )
            {
                // Reset controls
                Settings_ControlDefaults();
                Settings.ctDodge         = ord("C");
                Settings.ctSpecial       = ord("V");
                audio_play_sound(sndUiFail1, 90, false);
            }
            else
            {   // Set a new control input
                menu_isAskingForNewControl = true;
                // Clear the input
                keyboard_lastkey = -1;
            }
        }
    }
    else
    {   // Check new keyboard input, use that to set the new control value
        var i = menu_selection;
        if ( keyboard_lastkey != -1 )
        {
            if ( keyboard_lastkey == vk_escape )
            {
                audio_play_sound(sndUiFail1, 90, false);
            }
            else
            {
                // Set the new key we use
                switch (i)
                {
                    case 0: Settings.ctMoveLeft = keyboard_lastkey; break;
                    case 1: Settings.ctMoveRight = keyboard_lastkey; break;
                    case 2: Settings.ctMoveUp = keyboard_lastkey; break;
                    case 3: Settings.ctMoveDown = keyboard_lastkey; break;
                    case 4: Settings.ctJump = keyboard_lastkey; break;
                    case 5: Settings.ctMeleeInteract = keyboard_lastkey; break;
                    case 6: Settings.ctDodge = keyboard_lastkey; break;
                    case 7: Settings.ctSpecial = keyboard_lastkey; break;
                    case 8: Settings.ctSwapLeft = keyboard_lastkey; break;
                    case 9: Settings.ctSwapRight = keyboard_lastkey; break;
                }
                audio_play_sound(sndUiMsgBlip, 90, false);
            }
            // Leave the mode
            menu_isAskingForNewControl = false;
        }
    }
}

