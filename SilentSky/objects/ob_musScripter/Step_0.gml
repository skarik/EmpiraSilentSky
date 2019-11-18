/// @description Update volume

if (!exists(m_music))
{
	event_user(0);
}

// initialize track volume array
var track_count = array_length_1d(m_tracks);
if (array_length_1d(m_trackVolume) != track_count)
{
	var new_track_volume = array_create(track_count);
	array_copy(new_track_volume, 0, m_trackVolume, 0, min(array_length_1d(m_trackVolume), track_count))
	m_trackVolume = new_track_volume;
}

// update volume:
if (exists(m_music))
{
	// If in intro, do special stuff
	if (m_allowIntroOverride
		&& m_music.m_trackMasterId != null
		&& m_music.m_trackIntroToLoop[m_music.m_trackMasterId] != null)
	{
		if (fmusic_is_during_intro(m_music))
		{
			for (var i = 0; i < track_count; ++i)
			{
				// Silence track on our side
				m_trackVolume[i] = 0.0;
				
				// Silence all tracks except the master track.
				if (i == m_music.m_trackMasterId) {
					continue;
				}
				m_music.m_trackVolume[i] = 0.0;
			}
		}
	}
	// Otherwise, we do normal behavior.
	else
	{
		// Still do special stuff for intros, but pull in the fade to loop
		if (m_allowIntroOverride)
		{
			if (fmusic_wants_volume_sync(m_music))
			{
				for (var i = 0; i < track_count; ++i)
				{
					// Sync track on our side
					m_trackVolume[i] = m_music.m_trackVolume[i];
				}
			}
		}
		
		for (var i = 0; i < track_count; ++i)
		{
			m_music.m_trackVolume[i] = m_trackVolume[i] * m_gain;
		}
	}
}