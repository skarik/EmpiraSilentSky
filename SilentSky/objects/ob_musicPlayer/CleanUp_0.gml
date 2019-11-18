/// @description cleanup streams

for (var i = 0; i < m_trackCount; ++i)
{
	if (audio_is_playing(m_track[i])) {
		audio_stop_sound(m_track[i]);
	}
	audio_destroy_stream(m_trackStream[i]);
}