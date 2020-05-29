/// @description create the music

// find the music that belongs to this object
if (!iexists(m_music))
{
	var caller_id = id;
	var caller = object_index;
	with (ob_musicPlayer)
	{
		if (music_caller == caller)
		{
			caller_id.m_music = id;
		}
	}
}

// if could not find music, create it
if (!iexists(m_music))
{
	var music = fmusic_create();
	var max_i = array_length_1d(m_tracks); //ds_map_find_value(entry, SEQI_MUSIC_TRACKCOUNT);
	
	// Create the tracks
	for (var i = 0; i < max_i; ++i)
	{
		// Add new track
		fmusic_add_track(music, m_tracks[i]);
		// Create the intro link (if any)
		if (i < array_length_1d(m_tracks_isIntro))
		{
			var intro_link = m_tracks_isIntro[i];
			if (intro_link != null && intro_link != 0)
			{
				fmusic_mark_as_intro(music, i, intro_link);
			}
		}
	}
	
	fmusic_start(music);
		
	// Set the volume
	for (var i = 0; i < music.m_trackCount; ++i)
	{
		music.m_trackVolume[i] = 0.0;//ds_map_find_value(entry, i + SEQI_MUSIC_OFFSET);
	}
	
	// Set the caller
	music.music_caller = object_index;
	
	// We have new music!
	m_music = music;
}