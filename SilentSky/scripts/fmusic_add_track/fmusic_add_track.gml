/// @description fmusic_add_track(music_instance, filename)
/// @param music_instance
/// @param filename

var music_player = argument0;
var filename = argument1;

if (is_undefined(filename))
{
	return null;
}

if (!file_exists(filename))
{
	show_error("Could not find the audio '" + filename + "' for open.", true);
    return null;
}

//music_player.m_track[music_player.m_trackCount] = audio_create_stream(filename);
//audio_play_in_sync_group(music_player.m_syncGroup, music_player.m_track[music_player.m_trackCount]);

// Create the stream (TODO: cache music)
music_player.m_trackStream[music_player.m_trackCount] = faudio_create_stream(filename);
music_player.m_track[music_player.m_trackCount] = audio_play_sound(music_player.m_trackStream[music_player.m_trackCount], 100, true);
audio_sound_gain(music_player.m_track[music_player.m_trackCount], 0.0, 0);
//audio_pause_sound(music_player.m_track[music_player.m_trackCount]);

// Set up initial volume
music_player.m_trackVolume[music_player.m_trackCount] = 0.0;
music_player.m_trackCurrentVolume[music_player.m_trackCount] = 0.0;

// Set up other information
music_player.m_trackIntroToLoop[music_player.m_trackCount] = null;

music_player.m_trackCount += 1;

return music_player;