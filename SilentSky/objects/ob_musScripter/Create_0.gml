/// @description Init defaults

if (instance_number(object_index) > 1)
{
	idelete(this);
	exit;
}

m_music = null;
m_gain = 1.0;
m_allowIntroOverride = true;

m_tracks = array_create(0);
m_tracks_isIntro = array_create(0);
m_trackVolume = array_create(0);
