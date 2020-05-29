// This object performs all the loading horseshit.

// Need to create the Screen before anything
inew(Screen);
// Now, need to create the timer
inew(Time);
// Create the debug helper
inew(Debug);
// Add the resources manager
inew(Resources);
// Load settings
inew(Settings);
// Set up the input manager
inew(Input);
// Set up new random state
mt19937_init();

// Setup is now complete.

// Try to load a game
//if (Debug.reset || !gameLoad())
{
    // If not, we just continue normally.
    room_goto_next();
}

