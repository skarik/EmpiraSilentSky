// Music is a persistent singleton
if (SingletonObject()) exit;
persistent = true;

// Public vars to set elsewhere
targetTrack = null;
targetGain = 0.0;

ambientTrack = musJail0;
ambientGain = 0.75;

// Local vars
curTrack = null;
curGain = 0.0;
curInst = null;

