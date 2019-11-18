if (singleton_this()) exit; // Make this object a singleton
persistent = true;

fontsLoad();

// Create the all-caps font
fontAlphabet1 = font_add_sprite(suiAlphabet1, 32, true, 1);

