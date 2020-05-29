
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
        idelete(this);
    }
}
else
{
    // Fade in
    image_alpha = min( image_alpha + Time.dt * 2.0, 1.0 );

    // Do menu sleection change
    if ( menu_isAskingForNewControl == false )
    {
        if ( abs(yAxis.value) > 0.8 && abs(yAxis.previous) <= 0.8 )
        {
            menu_selection += sign(yAxis.value);
            menu_selection = clamp(menu_selection, -3,9);
            audio_play_sound(sndUiMenuChange,30,false);
        }
        // Do button press
        if ( atkButton.pressed || jumpButton.pressed )
        {
            var i = menu_selection;
            if ( i == -3 )
            {   // Accept. Save the settings, and continue
                settingsControlSave();
                audio_play_sound(sndUiMenuSelect, 90, false);
                
                // Fade out everything
                if (iexists(floaterLogo))
                    floaterLogo.fadeout = true;
                fade = true; // Fade out now
            }
            else if ( i == -2 )
            {
                // Reset controls
                settingsControlDefaults();
                audio_play_sound(sndUiFail1, 90, false);
            }
            else if ( i == -1 )
            {
                // Reset controls
                settingsControlDefaults();
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
                    case 8: Settings.ctSwapPrev = keyboard_lastkey; break;
                    case 9: Settings.ctSwapNext = keyboard_lastkey; break;
                }
                audio_play_sound(sndUiMsgBlip, 90, false);
            }
            // Leave the mode
            menu_isAskingForNewControl = false;
        }
    }
}

