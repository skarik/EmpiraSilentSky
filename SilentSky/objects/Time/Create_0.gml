if (SingletonObject()) exit; // Make this object a singleton

// This motherfucker best be alive at all times
persistent = true;

// Set up local variables
unscaled_dt = 0;
dt = 0;
scale = 1.0;

// aliases
deltaTime = 0;