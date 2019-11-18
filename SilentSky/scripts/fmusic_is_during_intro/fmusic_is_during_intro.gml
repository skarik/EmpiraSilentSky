/// @description fmusic_play_introtrack(music_instance)
/// @param music_instance

var music_instance = argument0;

if (music_instance.m_trackMasterId != null)
{
	if (music_instance.m_trackIntroToLoop[music_instance.m_trackMasterId] != null)
	{
		// Get the position against the loop. Use that to check if in the loop.
		
		// Grab time & length with intro:
		var current_lead_time_intro = audio_sound_get_track_position(music_instance.m_track[music_instance.m_trackMasterId]);
		var current_lead_length_intro = audio_sound_length(music_instance.m_trackStream[music_instance.m_trackMasterId]);
	
		// Grab time & length of the looped variant (we subtract length of intro)
		var current_lead_length = audio_sound_length(music_instance.m_trackStream[music_instance.m_trackIntroToLoop[music_instance.m_trackMasterId]]);
		var intro_length = current_lead_length_intro - current_lead_length;
		
		if (current_lead_time_intro < intro_length)
		{
			return true;
		}
	}
}

return false;