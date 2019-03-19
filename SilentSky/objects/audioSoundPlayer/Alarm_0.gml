audio_emitter_falloff(emitter, falloff_start, falloff_end, falloff_factor);
audio_emitter_pitch(emitter, pitch);
audio_emitter_gain(emitter, gain);
audio_emitter_position(emitter, x, y, 0);

instance = audio_play_sound_on(emitter, sound, loop, priority);

