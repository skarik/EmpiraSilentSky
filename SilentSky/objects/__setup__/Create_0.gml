// This object performs all the loading horseshit.

// Need to create the Screen before anything
new(Screen);
// Now, need to create the timer
new(Time);
// Create the debug helper
new(Debug);
// Add the resources manager
new(Resources);
// Load settings
new(Settings);
// Set up the input manager
new(Input);

// Setup is now complete.

// Try to load a game
//if (Debug.reset || !Game_Load())
{
    // If not, we just continue normally.
    room_goto_next();
}

