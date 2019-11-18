/// @description  sound_play_at(x,y,sound)
/// @param x
/// @param y
/// @param sound
// Play sound at given x,y. Returns sound obj
/*
Options: 

    loop = false;
    priority = 5;
    
    falloff_start = 100;
    falloff_end = 1000;
    falloff_factor = 1;
    
    gain = 1.0;
    pitch = 1.0;
*/

var snd = instance_create(argument0, argument1, audioSoundPlayer);
snd.sound = argument2;
snd.emitter = audio_emitter_create();

// Return the sound
return snd;
