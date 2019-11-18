if (singleton_this()) exit; // Make this object a singleton

// This motherfucker best be alive at all times
persistent = true;

// We need to set the resolution of the entire game properly from here
Setup_GameViews();


// Local variables
surf_game = -1;

// Variables for other storage
maxx = 0;
maxy = 0;
minx = 0;
miny = 0;

offsetx = 0;
offsety = 0;

view_offsetx = 0;
view_offsety = 0;

// Variables for keeping track of auto-screenshots
screenshot_auto_enabled = false;
screenshot_timer = 0;
screenshot_count = 0;

