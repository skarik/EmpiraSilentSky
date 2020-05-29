/// @description update track volumes

// if fading out, set all targets to 0.0
if (m_fadeOut)
{
	var can_delete = true;
	for (var i = 0; i < m_trackCount; ++i)
	{
		m_trackVolume[i] = 0.0;
		if (m_trackCurrentVolume[i] > 0.0) {
			can_delete = false;
		}
	}
	if (can_delete)
	{
		idelete(this);
		exit;
	}
}


// update all track volumes
var delta_step = kTrackFadeSpeed * Time.deltaTime;
for (var i = 0; i < m_trackCount; ++i)
{
	// create delta to target track
	var delta = m_trackVolume[i] - m_trackCurrentVolume[i];
	delta = sign(delta) * min(abs(delta), delta_step);
	
	// Update volume if there's a change
	if (abs(delta) > 0)
	{
		m_trackCurrentVolume[i] += delta;
		audio_sound_gain(m_track[i], m_trackCurrentVolume[i], 0.0);
	}
}

// Sync up all track positions.
event_user(0);