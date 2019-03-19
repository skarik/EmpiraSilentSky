if (SingletonObject()) exit; // Make this object a singleton
// This motherfucker best be alive at all times
persistent = true;

tuShowPickup = true;
tuShowAttack = true;
tuShowJump = true;
tuShowGun = true;
tuShowModes = true;

muEncounterTrack = musEnemyVar0;

// Seed the world
randomize();

// Create the world:
// Fade in
new(fxScreenFadeIn);
// Create introduction cutscene
new(ctsIntro);
// create the goddamn lighting
new(Lighting);
// Create music
new(audioMusic);

// Create the title
//instance_create(view_xview[0],view_yview[0],floaterLogo);

// Create audio effect updaters
faUpdateTime = 0;
faFireLoop = sound_play_at(0,0, sndFireLoop);
faFireLoop.loop = true;
faFireLoop.gain = 0;
faFireLoopObject = null;

// Set up flags info
Flags_Init();
// Set up transition 
global._transition_source = null;
global._cutscene_main = null;
