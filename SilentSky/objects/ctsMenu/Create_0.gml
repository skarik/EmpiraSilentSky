Controls_Init();
Controls_Update(1);

gain = 0;
if (audio_is_playing(musMenu))
{
    music = musMenu;
    gain = audio_sound_get_gain(music);
}
else
{
    music = audio_play_sound(musMenu, 90, true);
    audio_sound_gain(music, 0, 0);
}

