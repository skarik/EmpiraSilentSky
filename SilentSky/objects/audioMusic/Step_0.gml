// Select the proper track to play
var wanted_track = ambientTrack;
var wanted_gain = ambientGain;
if ( targetTrack != null && targetGain > 0 )
{   // If the target track is valid, swap to that
    wanted_track = targetTrack;
    wanted_gain = targetGain;
}

// Main sure player is alive
var pl = objPlayerMain;
if ( pl.chHealth < 0 )
{
    wanted_track = null;
    wanted_gain = null;
}

// Fade out and blend to the wanted track
if ( curTrack != wanted_track )
{
    // Lerp the gain to zero
    curGain -= Time.dt;
	// If completely faded out, go to next track
    if ( curGain <= 0.0 )
    {
        curGain = 0.0;
        curTrack = wanted_track;
        // Play the track now
        if ( curInst != null )
		{
			if (instance_exists(curInst))
				idelete(curInst);
			else if (audio_exists(curInst))
				audio_stop_sound(curInst);
			curInst = null;
		}
        if ( curTrack != null )
        {
			if (object_exists(curTrack))
				curInst = inew(curTrack);
			else if (audio_exists(curTrack))
				curInst = audio_play_sound(curTrack, 80, true);
				
            // Randomize track position so things are little different
            /*audio_sound_set_track_position(
                curInst,
                random_range(0, audio_sound_length(curTrack) * choose(0,0.25,0.5))
                );*/
        }
    }
}
// We're on the right track, we gotta do the cool stuff with it.
else
{
    // Move gain up to the target gain
    var delta = wanted_gain - curGain;
    var deltaSpeed = Time.dt;
    if ( abs(delta) < deltaSpeed )
        curGain += delta;
    else
        curGain += sign(delta) * deltaSpeed;
}

// If there's an instance playing, change its gain
if ( curInst != null )
{
	if (instance_exists(curInst))
		curInst.m_gain = curGain;
	else if (audio_exists(curInst))
		audio_sound_gain(curInst, curGain, 0.0);
}
