// Is tilde pressed?
if ( keyboard_check_pressed(192) )
{
    // Toggle the menu when it is pressed down.
    if ( !iexists(menuDebug) ) {
        inew( menuDebug );
        on = true;
    }
    else {
        idelete( menuDebug );
        on = false;
    }
}

