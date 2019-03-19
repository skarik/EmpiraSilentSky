// Is tilde pressed?
if ( keyboard_check_pressed(192) )
{
    // Toggle the menu when it is pressed down.
    if ( !exists(menuDebug) ) {
        new( menuDebug );
        on = true;
    }
    else {
        delete( menuDebug );
        on = false;
    }
}

